`ifndef EFB
`define EFB

`include "EFB_DEFINE.v"

module efb
(
    `ifdef EFB_TIMER
    input CLK,
    input RESET,
	//output tc_int
    output tc_oc
	`endif
	
	`ifdef EFB_CONFIG
	//output i2c1_irqo,
	input wb_clk_i,
    inout i2c1_scl,
    inout i2c1_sda
	`endif
	
	`ifdef EFB_TC_CONFIG
    input CLK,
    input RESET,
	input wb_clk_i,
	//output tc_int
    output tc_oc,
	//output i2c1_irqo,
    inout i2c1_scl,
    inout i2c1_sda
	`endif
 );

   `ifdef EFB_TIMER
   efb_timer_config efb_u
   (
      .tc_clki    (CLK),
      .tc_rstn    (RESET),
      //.tc_int     (tc_int),
      .tc_oc      (tc_oc)
   );
  `endif
	
   `ifdef EFB_CONFIG
   efb_timer_config efb_c
   (
      .wb_clk_i (wb_clk_i),
      .i2c1_scl (i2c1_scl),
	  .i2c1_sda (i2c1_sda)
	  //.i2c1_irqo (i2c1_irqo)
   );
   `endif

   `ifdef EFB_TC_CONFIG
   efb_timer_config efb_uc
   (
      .tc_clki    (CLK),
      .tc_rstn    (RESET),
	  .wb_clk_i   (wb_clk_i),
      //.tc_int     (tc_int),
      .tc_oc      (tc_oc),
      .i2c1_scl (i2c1_scl),
	  .i2c1_sda (i2c1_sda)
	  //.i2c1_irqo (i2c1_irqo)
   );
   `endif
   
endmodule

`endif