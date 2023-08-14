// --------------------------------------------------------------------
// >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
// --------------------------------------------------------------------
// Copyright (c) 2004~2009 by Lattice Semiconductor Corporation
// --------------------------------------------------------------------
//
// Permission:
//
//   Lattice Semiconductor grants permission to use this code for use
//   in synthesis for any Lattice programmable logic product.  Other
//   use of this code, including the selling or duplication of any
//   portion is strictly prohibited.
//
// Disclaimer:
//
//   This VHDL or Verilog source code is intended as a design reference
//   which illustrates how these types of functions can be implemented.
//   It is the user's responsibility to verify their design for
//   consistency and functionality through the use of formal
//   verification methods.  Lattice Semiconductor provides no warranty
//   regarding the use or functionality of this code.
//
// --------------------------------------------------------------------
//
//                     Lattice Semiconductor Corporation
//                     5555 NE Moore Court
//                     Hillsboro, OR 97214
//                     U.S.A
//
//                     TEL: 1-800-Lattice (USA and Canada)
//                          408-826-6000 (other locations)
//
//                     web: http://www.latticesemi.com/
//                     email: techsupport@latticesemi.com
//
// --------------------------------------------------------------------
//
// This is the top level module of the PWM Fan Controller reference
// design.
//
// --------------------------------------------------------------------
//
// Revision History :
// --------------------------------------------------------------------
//   Ver  :| Author            :| Mod. Date :| Changes Made:
//   V0.1 :|                   :| 07/24/09  :| Initial release
// --------------------------------------------------------------------


`define REG_SIZE 20 // Used to measure fan sense pulse width (Use 20 for HW, 8 for HW simulation so it runs faster)
`define SCALER 20 // Used to divide down the clock reduce for simulations (Use 20 for HW, 5 for HW simulation so it runs faster)
`define SENSE_REG_LEN 4
module fan_ctl(clk_i,rst_i, wb_dat_i, wb_dat_o, wb_stb_i, wb_we_i, wb_cyc_i, wb_ack_o,
                pwm_out, sense_in);
  parameter speed_max = 8;
  parameter speed_min = 2;
  input          clk_i;
  input          rst_i;
  input    [7:0] wb_dat_i;
  output   [7:0] wb_dat_o;
  input          wb_stb_i;
  input          wb_cyc_i;
  input          wb_we_i;
  output         wb_ack_o;
  output         pwm_out;
  input          sense_in;

  reg            pwm_reg;
  reg [7:0]      speed_reg;
  reg [19:0]     counterPWM;
  
  reg sense_detect;
  reg [7:0] speed_sense;
  reg [`REG_SIZE-1:0] sense_counter;
  reg [`SCALER-1:0] clk_cnt;
  wire clk_div;
  reg [`SENSE_REG_LEN-1:0]  sense_edge;
  reg read_done;
  reg read_done_dly;
  
  localparam MAX_COUNT = (2 ** `REG_SIZE) - 1;
  
	// Wishbone bus signals
  wire read = wb_stb_i && wb_cyc_i && !wb_we_i;
  assign wb_ack_o = (wb_we_i) ? wb_stb_i : read_done_dly;
  assign wb_dat_o = speed_sense;

  // Wishbone bus data read
  always@(posedge clk_i) begin
    if (rst_i) begin
      speed_reg <= 0;
    end
    else begin
      if (wb_stb_i && wb_cyc_i && wb_we_i) begin
        speed_reg <= wb_dat_i;
      end
    end
  end

  // Fan speed is controlled through PWMing its GND connection
  // In order to read the fan sense signal the GND must be connected
  assign pwm_out  = pwm_reg || read; 
  
  // Slow down the clock
  always@(posedge clk_i) begin
    if (rst_i) begin
      clk_cnt <= 0;
    end
    else begin
      clk_cnt <= clk_cnt + 1;
    end
  end
  assign clk_div = clk_cnt[`SCALER-1];
  
  reg [`REG_SIZE-1:0] timeout_counter;

  // Fan PWM output  
  always@(posedge clk_div or posedge rst_i) begin
    if (rst_i) begin
      pwm_reg <= 0;
      counterPWM <= 0;
    end
    else begin
      counterPWM <= counterPWM + 1;
      if (speed_reg < speed_min) begin
          pwm_reg <= 0; // Do not turn on the fan if the desired speed is too slow
      end
      else if (speed_reg <=speed_max) begin
        if (counterPWM < speed_reg) begin
          pwm_reg <= 1'b1; // PWM high signal
        end
        else if (counterPWM < (speed_max-1)) begin
          pwm_reg <= 0; // PWM low signal
        end
        else if (counterPWM >= (speed_max-1)) begin
          counterPWM <= 0; // Reset counter for next period
        end
      end
    end
  end

  // Determine the speed of the fan by monitoring the sense input  
  always@(posedge clk_i) begin
    if (rst_i) begin
      sense_detect <= 0;
      sense_edge <= 0;
      speed_sense <= 0;
      read_done <= 0;
      read_done_dly <= 0;
      timeout_counter <= 0;
    end
    else begin
        sense_edge <= {sense_in,sense_edge[`SENSE_REG_LEN-1:1]}; // Shift reg to detect sense signal edges
        read_done_dly <= read_done;
      if (timeout_counter < MAX_COUNT) begin
        timeout_counter <= timeout_counter + 1;
        if (read) begin
          if (sense_edge[1:0] == 4'b10 && !read_done) begin   // find rising edge of sense
            sense_detect <= 1'b1;
            read_done <= 1'b0;
            speed_sense <= 0;
            timeout_counter <= 0;
          end
          else if (sense_edge[1:0] == 4'b01 && sense_detect && !read_done) begin  // find falling edge of sense
            speed_sense <= sense_counter[`REG_SIZE-1:`REG_SIZE-8];
            sense_detect <= 1'b0;
            read_done <= 1'b1;
          end
        end
        else begin
          sense_detect <= 0;
          speed_sense <= 0;
          read_done <= 0;
        end
      end
      else begin
        // In case the fan is not running no edges will be detected
        read_done <= 1'b1;
        speed_sense <= 0;
        sense_detect <= 0;
        timeout_counter <= 0;
      end
    end
  end

  // When high, measure the duration of the fan output
  always@(posedge clk_i) begin
    if (rst_i) begin
      sense_counter <= 0;
    end
    else if (sense_detect && !read_done) begin
      sense_counter <= sense_counter + 1;
    end
    else begin
      sense_counter <= 0;
    end
  end

endmodule

