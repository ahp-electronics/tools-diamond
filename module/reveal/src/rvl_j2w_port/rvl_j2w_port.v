module rvl_j2w_port (
  CLK,
  RESET,
  J2W_CYC_O,
  J2W_STB_O,
  J2W_WE_O,
  J2W_LOCK_O,
  J2W_ADR_O,
  J2W_DAT_I,
  J2W_DAT_O,
  J2W_ACK_I,
  J2W_RTY_I,
  J2W_ERR_I,
  J2W_SEL_O,
  J2W_CTI_O,
  J2W_BTE_O) /* synthesis syn_hier="hard" */ ;

  parameter BIG_ENDIAN = 1;  
  parameter BUFFER_SIZE_BYTES = 32;  
  // ** NOTE: Modify ADR_WIDTH and DAT_WIDTH if your Wishbone Bus is not 32-bit
  // wide address and data
  parameter J2W_WB_ADR_WIDTH = 32;
  parameter J2W_WB_DAT_WIDTH = 32;
  parameter HUB_NO = 0;
  localparam SEL_sz = J2W_WB_DAT_WIDTH/8;

  input CLK;
  input RESET;
  input [J2W_WB_DAT_WIDTH-1:0] J2W_DAT_I;
  input J2W_ACK_I;
  input J2W_RTY_I;
  input J2W_ERR_I;
  output J2W_CYC_O;
  output J2W_STB_O;
  output J2W_WE_O;
  output J2W_LOCK_O;
  output [J2W_WB_ADR_WIDTH-1:0] J2W_ADR_O;
  output [J2W_WB_DAT_WIDTH-1:0] J2W_DAT_O;
  output [SEL_sz-1:0] J2W_SEL_O;
  output [2:0] J2W_CTI_O;
  output [1:0] J2W_BTE_O;

  rvl_j2w
    #(.BIG_ENDIAN (BIG_ENDIAN),
      .BUFFER_SIZE_BYTES (BUFFER_SIZE_BYTES),
      .J2W_WB_ADR_WIDTH (J2W_WB_ADR_WIDTH),
      .J2W_WB_DAT_WIDTH (J2W_WB_DAT_WIDTH),
      .HUB_NO (HUB_NO))
  rvl_j2w_inst
     (.CLK       (CLK),
      .RESET     (RESET),
      .J2W_CYC_O (J2W_CYC_O),
      .J2W_STB_O (J2W_STB_O),
      .J2W_CTI_O (J2W_CTI_O),
      .J2W_BTE_O (J2W_BTE_O),
      .J2W_ADR_O (J2W_ADR_O),
      .J2W_DAT_O (J2W_DAT_O),
      .J2W_SEL_O (J2W_SEL_O),
      .J2W_WE_O  (J2W_WE_O ),
      .J2W_LOCK_O (J2W_LOCK_O ),
      .J2W_ACK_I (J2W_ACK_I),
      .J2W_ERR_I (J2W_ERR_I),
      .J2W_RTY_I (J2W_RTY_I),
      .J2W_DAT_I (J2W_DAT_I));

endmodule
