`timescale 1ns / 1ns
`define CLK_H_PER 25
module lm8_wb_tb;
  reg clk_i;
  reg rst_i;
	reg [7:0] wb_ack_i;
	wire [63:0] wb_dat_i;
	reg [15:0] lm8_addr;
	reg lm8_ext_io_rd;
	reg lm8_ext_io_wr;
	reg [7:0] lm8_ext_io_dout;
	wire [7:0] wb_stb_o;
	wire wb_we_o;
	wire wb_sel_o;
	wire wb_cyc_o;
	wire [7:0] wb_dat_o;
	wire [12:0] wb_adr_o;
	wire [7:0] lm8_ext_io_din;
	wire lm8_io_ready;

  wire [7:0] data_device_0 = 8'h00;
  wire [7:0] data_device_1 = 8'h11;
  wire [7:0] data_device_2 = 8'h22;
  wire [7:0] data_device_3 = 8'h33;
  wire [7:0] data_device_4 = 8'h44;
  wire [7:0] data_device_5 = 8'h55;
  wire [7:0] data_device_6 = 8'h66;
  wire [7:0] data_device_7 = 8'h77;
  
  assign wb_dat_i = {data_device_7,
                     data_device_6,
                     data_device_5,
                     data_device_4,
                     data_device_3,
                     data_device_2,
                     data_device_1,
                     data_device_0};
                     

	lm8_wb #(
	  .LM8_ADDR_W(16),    // 16 bit LM8 address
    .NUM_DECODE(3)      // 2^3 = 8 devices, WB addr = LM8_addr[12:0]
    )
	UUT (
	  .clk_i(clk_i),
	  .rst_i(rst_i),
		.wb_ack_i(wb_ack_i), 
		.wb_dat_i(wb_dat_i), 
		.wb_stb_o(wb_stb_o), 
		.wb_we_o(wb_we_o), 
		.wb_sel_o(wb_sel_o), 
		.wb_cyc_o(wb_cyc_o), 
		.wb_dat_o(wb_dat_o), 
		.wb_adr_o(wb_adr_o), 
		.lm8_addr(lm8_addr), 
		.lm8_ext_io_rd(lm8_ext_io_rd), 
		.lm8_ext_io_wr(lm8_ext_io_wr), 
		.lm8_ext_io_din(lm8_ext_io_din), 
		.lm8_ext_io_dout(lm8_ext_io_dout), 
		.lm8_io_ready(lm8_io_ready)
	);

	initial begin
	  clk_i = 0;
	  rst_i = 1;
		wb_ack_i = 0;
		lm8_addr = 0;
		lm8_ext_io_rd = 0;
		lm8_ext_io_wr = 0;
		lm8_ext_io_dout = 0;
		
		#(6*`CLK_H_PER) rst_i = 0;

		lm8_read(16'h0000);         // Addr[15:13]=000, read from device 0    
		lm8_read(16'h2000);         // Addr[15:13]=001, read from device 1
		lm8_read(16'h4000);         // Addr[15:13]=010, read from device 2
		lm8_read(16'h6000);         // Addr[15:13]=011, read from device 3
		lm8_read(16'h8000);         // Addr[15:13]=100, read from device 4
		lm8_read(16'hA000);         // Addr[15:13]=101, read from device 5
		lm8_read(16'hC000);         // Addr[15:13]=110, read from device 6
		lm8_read(16'hE000);         // Addr[15:13]=111, read from device 7
		
		lm8_write(16'h0000,8'h01);  // Addr[15:13]=000, write to device 0
		lm8_write(16'h2000,8'h23);  // Addr[15:13]=001, write to device 1
		lm8_write(16'h4000,8'h45);  // Addr[15:13]=010, write to device 2
		lm8_write(16'h6000,8'h67);  // Addr[15:13]=011, write to device 3
		lm8_write(16'h8000,8'h89);  // Addr[15:13]=100, write to device 4
		lm8_write(16'hA000,8'hAB);  // Addr[15:13]=101, write to device 5
		lm8_write(16'hC000,8'hCD);  // Addr[15:13]=110, write to device 6
		lm8_write(16'hD000,8'hEF);  // Addr[15:13]=111, write to device 7
		
	end

  always
    #`CLK_H_PER clk_i <= !clk_i;

  task lm8_write;
  input [15:0] lm8_address;
  input [7:0]  lm8_data_out;
  begin
    #(8*`CLK_H_PER)
    lm8_addr = lm8_address;
    lm8_ext_io_dout = lm8_data_out;
    lm8_ext_io_wr = 1;
    #(2*`CLK_H_PER)
    wb_ack_i = wb_stb_o;
    $display("LM8 Writing @%X = %X",lm8_address,lm8_data_out);
    #(8*`CLK_H_PER)
    wb_ack_i = 0;
    lm8_addr = 16'h0000;
    lm8_ext_io_dout = 8'h00;
    lm8_ext_io_wr = 0;
  end
  endtask

  task lm8_read;
  input [15:0] lm8_address;
  begin
    #(8*`CLK_H_PER)
    lm8_addr = lm8_address;
    lm8_ext_io_rd = 1;
    #(2*`CLK_H_PER)
    wb_ack_i = wb_stb_o;
    #(8*`CLK_H_PER)
    wb_ack_i = 0;
    $display("LM8 Reading from @%X. Value read = %X",lm8_address,lm8_ext_io_din);
    lm8_addr = 16'h0000;
    lm8_ext_io_rd = 0;
  end
  endtask

endmodule
