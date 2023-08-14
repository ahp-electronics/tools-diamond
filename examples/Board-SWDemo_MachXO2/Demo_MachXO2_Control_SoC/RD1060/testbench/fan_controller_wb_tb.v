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
// This is the test bench module of the PWM Fan Controller reference
// design.
//
// --------------------------------------------------------------------
//
// Revision History :
// --------------------------------------------------------------------
//   Ver  :| Author            :| Mod. Date :| Changes Made:
//   V0.1 :|                   :| 07/24/09  :| Initial release
// --------------------------------------------------------------------


`timescale 1 ns / 1 ns
module fan_ctl_tf();
    reg clk_i;
    reg rst_i;
    reg [7:0] wb_dat_i;
    reg wb_stb_i;
    reg wb_we_i;
    reg wb_cyc_i;
    reg sense_in;
    wire [7:0] wb_dat_o;
    wire wb_ack_o;
    wire pwm_out;

		// Fan Sense input
    reg sense_in8;
    reg sense_in6;
    reg sense_in4;
    reg sense_in2;
    reg sense_in0;
    reg sense_en8;
    reg sense_en6;
    reg sense_en4;
    reg sense_en2;


    fan_ctl UUT (
        .clk_i(clk_i), 
        .rst_i(rst_i), 
        .wb_dat_i(wb_dat_i), 
        .wb_dat_o(wb_dat_o), 
        .wb_stb_i(wb_stb_i), 
        .wb_we_i(wb_we_i), 
        .wb_cyc_i(wb_cyc_i), 
        .wb_ack_o(wb_ack_o), 
        .pwm_out(pwm_out), 
        .sense_in(sense_in)
        );

    initial begin
            clk_i = 0;
            rst_i = 1;
            wb_dat_i = 0;
            wb_stb_i = 1;
            wb_we_i = 1;
            wb_cyc_i = 1;
            sense_in = sense_in0;

            sense_in8 = 0;
            sense_in6 = 0;
            sense_in4 = 0;
            sense_in2 = 0;
            sense_in0 = 0;
            sense_en8 = 0;
            sense_en6 = 0;
            sense_en4 = 0;
            sense_en2 = 0;

            // Reset logic
            #100 rst_i = 0;

            // Change fan speed
            wb_dat_i = 8;
            // Update fan sense signal
            sense_en8 = 1;
            sense_en6 = 0;
            sense_en4 = 0;
            sense_en2 = 0;
						// Read fan speed
            #1000 wb_we_i = 0;
            
            // Change fan speed
            #10000 wb_dat_i = 6;
            // Update fan sense signal
            sense_en8 = 0;
            sense_en6 = 1;
            sense_en4 = 0;
            sense_en2 = 0;
						// Read fan speed
            #1000 wb_we_i = 0;

            // Change fan speed
            #10000 wb_dat_i = 4;
            // Update fan sense signal
            sense_en8 = 0;
            sense_en6 = 0;
            sense_en4 = 1;
            sense_en2 = 0;
						// Read fan speed
            #1000 wb_we_i = 0;

            // Change fan speed
            #10000 wb_dat_i = 2;
            // Update fan sense signal
            sense_en8 = 0;
            sense_en6 = 0;
            sense_en4 = 0;
            sense_en2 = 1;
						// Read fan speed
            #1000 wb_we_i = 0;

            // Change fan speed
            #10000 wb_dat_i = 0;
            // Update fan sense signal
            sense_en8 = 0;
            sense_en6 = 0;
            sense_en4 = 0;
            sense_en2 = 0;
						// Read fan speed
            #1000 wb_we_i = 0;
    end

    // Clock Generation
    always #8 clk_i <= !clk_i;

    // Generate fan sense signal
    always@(sense_in8, sense_in6, sense_in4, sense_in2) begin
        sense_in <= sense_in8 || sense_in6 || sense_in4 || sense_in2;
    end
    always #100 sense_in8 <= !sense_in8 && sense_en8;
    always #200 sense_in6 <= !sense_in6 && sense_en6;
    always #300 sense_in4 <= !sense_in4 && sense_en4;
    always #400 sense_in2 <= !sense_in2 && sense_en2;

    // Wait for wb_ack to determine when read operation is complete
    always@(posedge wb_ack_o) begin
        wb_we_i <= 1;
    end

endmodule