// >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
// --------------------------------------------------------------------
// Copyright (c) 2005 by Lattice Semiconductor Corporation
// --------------------------------------------------------------------
//
//
//                     Lattice Semiconductor Corporation
//                     5555 NE Moore Court
//                     Hillsboro, OR 97214
//                     U.S.A.
//
//                     TEL: 1-800-Lattice  (USA and Canada)
//                          1-408-826-6000 (other locations)
//
//                     web: http://www.latticesemi.com/
//                     email: techsupport@latticesemi.com
//
// --------------------------------------------------------------------
//
// Simulation Library File for MACHXO2
//
// fpga\verilog\pkg\versclibs\data\machxo2\DP8KC.v 1.10 23-AUG-2010 12:32:18 IALMOHAN
//
`timescale 1ns / 1ps
module DP8KC (DIA8, DIA7, DIA6, DIA5, DIA4, DIA3, DIA2, DIA1, DIA0,
         ADA12, ADA11, ADA10, ADA9, ADA8, ADA7, ADA6, ADA5,
         ADA4,  ADA3,  ADA2, ADA1, ADA0,
         CEA, OCEA, CLKA, WEA, CSA2, CSA1, CSA0, RSTA,
         DIB8, DIB7, DIB6, DIB5, DIB4, DIB3, DIB2, DIB1, DIB0,
         ADB12, ADB11, ADB10, ADB9, ADB8, ADB7, ADB6, ADB5,
         ADB4,  ADB3,  ADB2, ADB1, ADB0,
         CEB, OCEB, CLKB, WEB, CSB2, CSB1, CSB0, RSTB,
         DOA8, DOA7, DOA6, DOA5, DOA4, DOA3, DOA2, DOA1, DOA0,
         DOB8, DOB7, DOB6, DOB5, DOB4, DOB3, DOB2, DOB1, DOB0);

   parameter  DATA_WIDTH_A = 9;            // 1, 2, 4, 9, 18
   parameter  DATA_WIDTH_B = 9;            // 1, 2, 4, 9, 18
   parameter  REGMODE_A = "NOREG";         // "NOREG", "OUTREG"
   parameter  REGMODE_B = "NOREG";         // "NOREG", "OUTREG"
   parameter  CSDECODE_A = "0b000";        // "0b000", "0b001", "0b010"......."0b111"
   parameter  CSDECODE_B = "0b000";        // "0b000", "0b001", "0b010"......."0b111"
   parameter  WRITEMODE_A = "NORMAL";      // "NORMAL", "READBEFOREWRITE", "WRITETHROUGH"
   parameter  WRITEMODE_B = "NORMAL";      // "NORMAL", "READBEFOREWRITE", "WRITETHROUGH"
   parameter  GSR = "ENABLED";            // "DISABLED", "ENABLED"
   parameter  RESETMODE = "SYNC";          // "SYNC", "ASYNC"
   parameter  ASYNC_RESET_RELEASE = "SYNC";          // "SYNC", "ASYNC"
   parameter  INIT_DATA = "STATIC";          // "STATIC", "DYNAMIC"

parameter INITVAL_00 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_01 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_02 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_03 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_04 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_05 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_06 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_07 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_08 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_09 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_0A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_0B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_0C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_0D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_0E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_0F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_10 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_11 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_12 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_13 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_14 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_15 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_16 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_17 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_18 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_19 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_1A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_1B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_1C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_1D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_1E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_1F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";

input    DIA8, DIA7, DIA6, DIA5, DIA4, DIA3, DIA2, DIA1, DIA0,
         ADA12, ADA11, ADA10, ADA9, ADA8, ADA7, ADA6, ADA5,
         ADA4,  ADA3,  ADA2, ADA1, ADA0,
         CEA, OCEA, CLKA, WEA, CSA2, CSA1, CSA0, RSTA,
         DIB8, DIB7, DIB6, DIB5, DIB4, DIB3, DIB2, DIB1, DIB0,
         ADB12, ADB11, ADB10, ADB9, ADB8, ADB7, ADB6, ADB5,
         ADB4,  ADB3,  ADB2, ADB1, ADB0,
         CEB, OCEB, CLKB, WEB, CSB2, CSB1, CSB0, RSTB;

output   DOA8, DOA7, DOA6, DOA5, DOA4, DOA3, DOA2, DOA1, DOA0,
         DOB8, DOB7, DOB6, DOB5, DOB4, DOB3, DOB2, DOB1, DOB0;

   localparam  ARRAY_SIZE = 9216;

   localparam ADDR_WIDTH_A = (DATA_WIDTH_A == 1) ? 13 : (DATA_WIDTH_A == 2) ? 12 :
                       (DATA_WIDTH_A == 4) ? 11 : (DATA_WIDTH_A == 9) ? 10 : 
                       (DATA_WIDTH_A == 18) ? 9 : 8 ;
   localparam ADDR_WIDTH_B = (DATA_WIDTH_B == 1) ? 13 : (DATA_WIDTH_B == 2) ? 12 :
                       (DATA_WIDTH_B == 4) ? 11 : (DATA_WIDTH_B == 9) ? 10 : 
                       (DATA_WIDTH_B == 18) ? 9 : 8;
   localparam data_width__a = (DATA_WIDTH_A == 1) ? 1 : (DATA_WIDTH_A == 2) ? 2 :
                       (DATA_WIDTH_A == 4) ? 4 : (DATA_WIDTH_A == 9) ? 9 : 9 ;
   localparam data_width__b = (DATA_WIDTH_B == 1) ? 1 : (DATA_WIDTH_B == 2) ? 2 :
                       (DATA_WIDTH_B == 4) ? 4 : (DATA_WIDTH_B == 9) ? 9 : 9;

   localparam div_a = (DATA_WIDTH_A == 1) ? 8 : (DATA_WIDTH_A == 2) ? 4 :
                       (DATA_WIDTH_A == 4) ? 2 : (DATA_WIDTH_A == 9) ? 9216 : 9216 ;
   localparam div_b = (DATA_WIDTH_B == 1) ? 8 : (DATA_WIDTH_B == 2) ? 4 :
                       (DATA_WIDTH_B == 4) ? 2 : (DATA_WIDTH_B == 9) ? 9216 : 9216;

tri1 GSR_sig = GSR_INST.GSRNET;
tri1 PUR_sig = PUR_INST.PURNET;

reg [10239:0] init_value;
reg [319:0] init_val_0, init_val_1, init_val_2, init_val_3, init_val_4, init_val_5, init_val_6, init_val_7,
   init_val_8, init_val_9, init_val_10, init_val_11, init_val_12, init_val_13, init_val_14, init_val_15,
   init_val_16, init_val_17, init_val_18, init_val_19, init_val_20, init_val_21, init_val_22, init_val_23,
   init_val_24, init_val_25, init_val_26, init_val_27, init_val_28, init_val_29, init_val_30, init_val_31;
reg v_MEM[ARRAY_SIZE - 1:0];
integer i, j;
wire [8:0] DIA;
wire [8:0] DIB;
wire [8:0] DIA_node;
wire [8:0] DIB_node;
wire [8:0] DIB_dob;
wire [8:0] DOA;
wire [8:0] DOB;
wire [12:0] ADA;
wire [12:0] ADB;
wire [2:0] CSA;
wire [2:0] CSB;
wire CEA_node;
wire OCEA_node;
wire CEB_node;
wire OCEB_node;
wire CLKA_node;
wire CLKB_node;
wire WREA_node;
wire WREB_node;
wire RSTA_node;
wire RSTB_node;
reg  SRN, SRN_pur;
reg [8:0] DOA_node;
reg [8:0] DOA_node_tr;
reg [8:0] DOA_node_wt;
reg [8:0] DOA_node_rbr;
reg [8:0] DOB_node;
reg [8:0] DOB_node_tr;
reg [8:0] DOB_node_wt;
reg [8:0] DOB_node_rbr;
reg [17:0] DO_node_tr;
reg [17:0] DO_node_wt;
reg [17:0] DO_node_rbr;
reg CSA_EN, CSA_EN_reg;
reg CSB_EN, CSB_EN_reg;
wire [ADDR_WIDTH_A-1:0] ADA_node;
wire [ADDR_WIDTH_B-1:0] ADB_node;
assign ADA_node = ADA[12:(13 - ADDR_WIDTH_A)];
assign ADB_node = ADB[12:(13 - ADDR_WIDTH_B)];
wire [17:0] DIAB_node;
reg [17:0] DIAB_reg;
reg [17:0] DIAB_reg_sync;
reg [data_width__a-1:0] DIA_reg;
reg [data_width__a-1:0] DIA_reg_sync;
reg [data_width__b-1:0] DIB_reg;
reg [data_width__b-1:0] DIB_reg_sync;
reg [data_width__b-1:0] DIB_dob_reg;
reg [ADDR_WIDTH_A-1:0] ADA_reg;
reg [ADDR_WIDTH_A-1:0] ADA_reg_sync;
reg [ADDR_WIDTH_B-1:0] ADB_reg;
reg [ADDR_WIDTH_B-1:0] ADB_reg_sync;
reg [ADDR_WIDTH_A-1:0] ADA_out;
reg [ADDR_WIDTH_B-1:0] ADB_out;
reg BWA0_reg;
reg BWA0_reg_sync;
reg BWA1_reg;
reg BWA1_reg_sync;
reg BWB_reg;
reg BWB_reg_sync;
wire BWA0_node;
wire BWA1_node;
wire BWB_node;
reg [8:0] DOAB_reg;
reg [8:0] DOAB_reg_sync, DOAB_reg_async;
reg [8:0] DOA_reg;
reg [8:0] DOA_reg_sync, DOA_reg_async;
reg [8:0] DOB_reg;
reg [8:0] DOB_reg_sync, DOB_reg_async;
reg [8:0] DOA_out;
reg [8:0] DOB_out;
reg WRENA_reg;
reg WRENA_reg_sync;
reg WRENB_reg;
reg WRENB_reg_sync;
reg [ADDR_WIDTH_B-1:0] ADB_read_reg;
reg RENA_reg;
reg RENA_reg_sync;
reg RENB_reg;
reg RENB_reg_sync;
reg CLKA_valid;
reg CLKA_valid_new1;
reg CLKA_valid_new2;
reg CLKA_valid_new3;
reg last_CLKA_valid;
reg last_CLKA_valid1;
reg CLKB_valid;
reg CLKB_valid_new1;
reg CLKB_valid_new2;
reg CLKB_valid_new3;
reg last_CLKB_valid;
reg last_CLKB_valid1;
reg memchg0;
reg memchg1;
reg memchga;
reg memchgb;
reg RSTA_sig, RSTA_node2, RSTB_sig, RSTB_node2;
reg RSTA_nogsr, RSTA_nogsr2, RSTB_nogsr, RSTB_nogsr2;
integer v_WADDR_A,v_RADDR_A,v_WADDR_B,v_RADDR_B, v_RADDR_RBR_A, v_RADDR_RBR_B;
integer ADDR_A, ADDR_B, DN_ADDR_A, UP_ADDR_A, DN_ADDR_B, UP_ADDR_B;
wire DIA_0, DIB_0;

reg wr_a_wr_b_coll, wr_a_rd_b_coll, rd_a_wr_b_coll; //write & read/write collision flags
integer dn_coll_addr, up_coll_addr; //lower & upper collision addresses

  function [80*4-1:0] hexstr2bin(input [(80+2)*8-1:0] hexstr);
    integer i, j;
    reg [1:8] ch;
    begin
      for (i=80; i>=1; i=i-1)
		begin
		  for (j=1; j<=8; j=j+1)
          ch[j] = hexstr[i*8-j];
		  case (ch)
		    "0" : {hexstr2bin[i*4-1], hexstr2bin[i*4-2], hexstr2bin[i*4-3], hexstr2bin[(i-1)*4]} = 4'h0;
			 "1" : {hexstr2bin[i*4-1], hexstr2bin[i*4-2], hexstr2bin[i*4-3], hexstr2bin[(i-1)*4]} = 4'h1;
			 "2" : {hexstr2bin[i*4-1], hexstr2bin[i*4-2], hexstr2bin[i*4-3], hexstr2bin[(i-1)*4]} = 4'h2;
			 "3" : {hexstr2bin[i*4-1], hexstr2bin[i*4-2], hexstr2bin[i*4-3], hexstr2bin[(i-1)*4]} = 4'h3;
			 "4" : {hexstr2bin[i*4-1], hexstr2bin[i*4-2], hexstr2bin[i*4-3], hexstr2bin[(i-1)*4]} = 4'h4;
			 "5" : {hexstr2bin[i*4-1], hexstr2bin[i*4-2], hexstr2bin[i*4-3], hexstr2bin[(i-1)*4]} = 4'h5;
			 "6" : {hexstr2bin[i*4-1], hexstr2bin[i*4-2], hexstr2bin[i*4-3], hexstr2bin[(i-1)*4]} = 4'h6;
			 "7" : {hexstr2bin[i*4-1], hexstr2bin[i*4-2], hexstr2bin[i*4-3], hexstr2bin[(i-1)*4]} = 4'h7;
			 "8" : {hexstr2bin[i*4-1], hexstr2bin[i*4-2], hexstr2bin[i*4-3], hexstr2bin[(i-1)*4]} = 4'h8;
			 "9" : {hexstr2bin[i*4-1], hexstr2bin[i*4-2], hexstr2bin[i*4-3], hexstr2bin[(i-1)*4]} = 4'h9;
			 "a",
			 "A" : {hexstr2bin[i*4-1], hexstr2bin[i*4-2], hexstr2bin[i*4-3], hexstr2bin[(i-1)*4]} = 4'hA;
			 "b",
			 "B" : {hexstr2bin[i*4-1], hexstr2bin[i*4-2], hexstr2bin[i*4-3], hexstr2bin[(i-1)*4]} = 4'hB;
			 "c",
			 "C" : {hexstr2bin[i*4-1], hexstr2bin[i*4-2], hexstr2bin[i*4-3], hexstr2bin[(i-1)*4]} = 4'hC;
			 "d",
			 "D" : {hexstr2bin[i*4-1], hexstr2bin[i*4-2], hexstr2bin[i*4-3], hexstr2bin[(i-1)*4]} = 4'hD;
			 "e",
			 "E" : {hexstr2bin[i*4-1], hexstr2bin[i*4-2], hexstr2bin[i*4-3], hexstr2bin[(i-1)*4]} = 4'hE;
			 "f",
			 "F" : {hexstr2bin[i*4-1], hexstr2bin[i*4-2], hexstr2bin[i*4-3], hexstr2bin[(i-1)*4]} = 4'hF;
			 default: {hexstr2bin[i*4-1], hexstr2bin[i*4-2], hexstr2bin[i*4-3], hexstr2bin[(i-1)*4]} = 4'hX;
		  endcase
		end
    end
  endfunction

  buf (DIA[0], DIA_0);
  buf (DIA[1], DIA_1);
  buf (DIA[2], DIA2);
  buf (DIA[3], DIA3);
  buf (DIA[4], DIA4);
  buf (DIA[5], DIA5);
  buf (DIA[6], DIA6);
  buf (DIA[7], DIA7);
  buf (DIA[8], DIA8);
  buf (DIB[0], DIB_0);
  buf (DIB[1], DIB_1);
  buf (DIB[2], DIB2);
  buf (DIB[3], DIB3);
  buf (DIB[4], DIB4);
  buf (DIB[5], DIB5);
  buf (DIB[6], DIB6);
  buf (DIB[7], DIB7);
  buf (DIB[8], DIB8);
  buf (ADA[0], ADA0);
  buf (ADA[1], ADA1);
  buf (ADA[2], ADA2);
  buf (ADA[3], ADA3);
  buf (ADA[4], ADA4);
  buf (ADA[5], ADA5);
  buf (ADA[6], ADA6);
  buf (ADA[7], ADA7);
  buf (ADA[8], ADA8);
  buf (ADA[9], ADA9);
  buf (ADA[10], ADA10);
  buf (ADA[11], ADA11);
  buf (ADA[12], ADA12);
  buf (ADB[0], ADB0);
  buf (ADB[1], ADB1);
  buf (ADB[2], ADB2);
  buf (ADB[3], ADB3);
  buf (ADB[4], ADB4);
  buf (ADB[5], ADB5);
  buf (ADB[6], ADB6);
  buf (ADB[7], ADB7);
  buf (ADB[8], ADB8);
  buf (ADB[9], ADB9);
  buf (ADB[10], ADB10);
  buf (ADB[11], ADB11);
  buf (ADB[12], ADB12);
  buf (CSA[0], CSA0);
  buf (CSA[1], CSA1);
  buf (CSA[2], CSA2);
  buf (CSB[0], CSB0);
  buf (CSB[1], CSB1);
  buf (CSB[2], CSB2);
  buf (CEA_node, CEA);
  buf (CEB_node, CEB);
  buf (CLKA_node, CLKA);
  buf (CLKB_node, CLKB);
  buf (OCEA_node, OCEA);
  buf (OCEB_node, OCEB);
  buf (WREA_node, WEA);
  buf (WREB_node, WEB);
  buf (RSTA_node, RSTA);
  buf (RSTB_node, RSTB);
  buf (DOA0, DOA_out[0]);
  buf (DOA1, DOA_out[1]);
  buf (DOA2, DOA_out[2]);
  buf (DOA3, DOA_out[3]);
  buf (DOA4, DOA_out[4]);
  buf (DOA5, DOA_out[5]);
  buf (DOA6, DOA_out[6]);
  buf (DOA7, DOA_out[7]);
  buf (DOA8, DOA_out[8]);
  buf (DOB0, DOB_out[0]);
  buf (DOB1, DOB_out[1]);
  buf (DOB2, DOB_out[2]);
  buf (DOB3, DOB_out[3]);
  buf (DOB4, DOB_out[4]);
  buf (DOB5, DOB_out[5]);
  buf (DOB6, DOB_out[6]);
  buf (DOB7, DOB_out[7]);
  buf (DOB8, DOB_out[8]);

  initial
  begin
    init_val_0  = hexstr2bin(INITVAL_00);
    init_val_1  = hexstr2bin(INITVAL_01);
    init_val_2  = hexstr2bin(INITVAL_02);
    init_val_3  = hexstr2bin(INITVAL_03);
    init_val_4  = hexstr2bin(INITVAL_04);
    init_val_5  = hexstr2bin(INITVAL_05);
    init_val_6  = hexstr2bin(INITVAL_06);
    init_val_7  = hexstr2bin(INITVAL_07);
    init_val_8  = hexstr2bin(INITVAL_08);
    init_val_9  = hexstr2bin(INITVAL_09);
    init_val_10 = hexstr2bin(INITVAL_0A);
    init_val_11 = hexstr2bin(INITVAL_0B);
    init_val_12 = hexstr2bin(INITVAL_0C);
    init_val_13 = hexstr2bin(INITVAL_0D);
    init_val_14 = hexstr2bin(INITVAL_0E);
    init_val_15 = hexstr2bin(INITVAL_0F);
    init_val_16 = hexstr2bin(INITVAL_10);
    init_val_17 = hexstr2bin(INITVAL_11);
    init_val_18 = hexstr2bin(INITVAL_12);
    init_val_19 = hexstr2bin(INITVAL_13);
    init_val_20 = hexstr2bin(INITVAL_14);
    init_val_21 = hexstr2bin(INITVAL_15);
    init_val_22 = hexstr2bin(INITVAL_16);
    init_val_23 = hexstr2bin(INITVAL_17);
    init_val_24 = hexstr2bin(INITVAL_18);
    init_val_25 = hexstr2bin(INITVAL_19);
    init_val_26 = hexstr2bin(INITVAL_1A);
    init_val_27 = hexstr2bin(INITVAL_1B);
    init_val_28 = hexstr2bin(INITVAL_1C);
    init_val_29 = hexstr2bin(INITVAL_1D);
    init_val_30 = hexstr2bin(INITVAL_1E);
    init_val_31 = hexstr2bin(INITVAL_1F);

    init_value = {init_val_31, init_val_30,
       init_val_29, init_val_28, init_val_27, init_val_26, init_val_25, init_val_24, init_val_23,
       init_val_22, init_val_21, init_val_20, init_val_19, init_val_18, init_val_17, init_val_16,
       init_val_15, init_val_14, init_val_13, init_val_12, init_val_11, init_val_10, init_val_9,
       init_val_8, init_val_7, init_val_6, init_val_5, init_val_4, init_val_3, init_val_2,
       init_val_1, init_val_0};

    for (j = 0; j < 512; j = j+1)
    begin
       for (i = 0; i < 18; i = i+1)
       begin
           v_MEM[(18 * j) + i] = init_value[(20 * j) + i]; 
       end
    end
  end

  initial
  begin
     RSTA_sig = 0;
     RSTA_node2 = 0;
     RSTB_sig = 0;
     RSTB_node2 = 0;
     RSTA_nogsr = 0;
     RSTA_nogsr2 = 0;
     RSTB_nogsr = 0;
     RSTB_nogsr2 = 0;
  end

  initial
  begin
     DOA_node = 0;
     DOA_node_tr = 0;
     DOA_node_wt = 0;
     DOA_node_rbr = 0;
     DOB_node = 0;
     DOB_node_tr = 0;
     DOB_node_wt = 0;
     DOB_node_rbr = 0;
     DO_node_tr = 0;
     DO_node_wt = 0;
     DO_node_rbr = 0;

     DIA_reg = 0;
     DIAB_reg = 0;
     BWA0_reg = 0;
     BWA1_reg = 0;
     ADA_reg = 0;
     WRENA_reg = 0;
     RENA_reg = 0;
     CSA_EN_reg = 0;
     DIB_reg = 0;
     BWB_reg = 0;
     ADB_reg = 0;
     WRENB_reg = 0;
     RENB_reg = 0;
     CSB_EN_reg = 0;
  end

  initial
  begin
     wr_a_wr_b_coll = 1'b0;
     wr_a_rd_b_coll = 1'b0;
     rd_a_wr_b_coll = 1'b0;
     memchg0 = 1'b0;
     memchg1 = 1'b0;
     memchga = 1'b0;
     memchgb = 1'b0;
     CLKA_valid = 1'b0;
	  CLKA_valid_new1 = 1'b0;
	  CLKA_valid_new2 = 1'b0;
	  CLKA_valid_new3 = 1'b0;
     CLKB_valid = 1'b0;
	  CLKB_valid_new1 = 1'b0;
	  CLKB_valid_new2 = 1'b0;
	  CLKB_valid_new3 = 1'b0;
     last_CLKA_valid = 1'b0;
     last_CLKA_valid1 = 1'b0;
     last_CLKB_valid = 1'b0;
     last_CLKB_valid1 = 1'b0;
  end

always @ (CLKA_valid, CLKB_valid, last_CLKA_valid1, last_CLKB_valid1)
begin
   last_CLKA_valid1 <= CLKA_valid;
   last_CLKB_valid1 <= CLKB_valid;
   last_CLKA_valid <= last_CLKA_valid1;
   last_CLKB_valid <= last_CLKB_valid1;
end

  assign DIA_0 = (DATA_WIDTH_A == 1) ? DIA1 : (DATA_WIDTH_A == 2) ? DIA2 : DIA0;
  assign DIA_1 = (DATA_WIDTH_A == 2) ? DIA5 : DIA1;
  assign DIB_0 = (DATA_WIDTH_A < 18 & DATA_WIDTH_B == 1) ? DIB1 : (DATA_WIDTH_A < 18 & DATA_WIDTH_B == 2) ? DIB2 : DIB0;
  assign DIB_1 = (DATA_WIDTH_B == 2) ? DIB5 : DIB1;

  always @ (GSR_sig or PUR_sig ) begin
    if (GSR == "ENABLED")
      SRN = GSR_sig & PUR_sig ;
    else if (GSR == "DISABLED")
      SRN = PUR_sig;

    SRN_pur = PUR_sig;
  end

  always @ (CSA)
  begin
     if (CSA == 3'b0 && CSDECODE_A == "0b000")
        CSA_EN = 1'b1;
     else if (CSA == 3'b001 && CSDECODE_A == "0b001")
        CSA_EN = 1'b1;
     else if (CSA == 3'b010 && CSDECODE_A == "0b010")
        CSA_EN = 1'b1;
     else if (CSA == 3'b011 && CSDECODE_A == "0b011")
        CSA_EN = 1'b1;
     else if (CSA == 3'b100 && CSDECODE_A == "0b100")
        CSA_EN = 1'b1;
     else if (CSA == 3'b101 && CSDECODE_A == "0b101")
        CSA_EN = 1'b1;
     else if (CSA == 3'b110 && CSDECODE_A == "0b110")
        CSA_EN = 1'b1;
     else if (CSA == 3'b111 && CSDECODE_A == "0b111")
        CSA_EN = 1'b1;
     else
        CSA_EN = 1'b0;
  end

  always @ (CSB)
  begin
     if (CSB == 3'b0 && CSDECODE_B == "0b000")
        CSB_EN = 1'b1;
     else if (CSB == 3'b001 && CSDECODE_B == "0b001")
        CSB_EN = 1'b1;
     else if (CSB == 3'b010 && CSDECODE_B == "0b010")
        CSB_EN = 1'b1;
     else if (CSB == 3'b011 && CSDECODE_B == "0b011")
        CSB_EN = 1'b1;
     else if (CSB == 3'b100 && CSDECODE_B == "0b100")
        CSB_EN = 1'b1;
     else if (CSB == 3'b101 && CSDECODE_B == "0b101")
        CSB_EN = 1'b1;
     else if (CSB == 3'b110 && CSDECODE_B == "0b110")
        CSB_EN = 1'b1;
     else if (CSB == 3'b111 && CSDECODE_B == "0b111")
        CSB_EN = 1'b1;
     else
        CSB_EN = 1'b0;
  end

assign DIA_node = (data_width__a == 1) ? DIA[0] :
             (data_width__a == 2) ? DIA[1:0] :
             (data_width__a == 4) ? DIA[3:0] : DIA[8:0];
assign DIB_node = (data_width__b == 1) ? DIB[0] :
             (data_width__b == 2) ? DIB[1:0] :
             (data_width__b == 4) ? DIB[3:0] : DIB[8:0];
assign DIB_dob = (data_width__a == 1) ? DIB[0] :
             (data_width__a == 2) ? DIB[1:0] :
             (data_width__a == 4) ? DIB[3:0] : DIB[8:0];

assign DIAB_node = {DIB, DIA};

assign BWA0_node = ADA[0];
assign BWA1_node = ADA[1];
assign BWB_node = ADB[0];

   not (SR1, SRN);
   or INST1 (RSTA_node1, RSTA_node, SR1);
   or INST2 (RSTB_node1, RSTB_node, SR1);

   always @ (RSTA_node1 or RSTA_node2)
   begin
      if ((ASYNC_RESET_RELEASE == "SYNC") && (RESETMODE == "ASYNC"))
      begin
         RSTA_sig <= RSTA_node2;
      end
      else
      begin
         RSTA_sig <= RSTA_node1;
      end
   end

   always @ (posedge CLKA_node or posedge RSTA_node1)
   begin
      if (RSTA_node1 == 1'b1)
         RSTA_node2 <= 1'b1;
      else
         RSTA_node2 <= 1'b0;
   end

   always @ (RSTB_node1 or RSTB_node2)
   begin
      if ((ASYNC_RESET_RELEASE == "SYNC") && (RESETMODE == "ASYNC"))
      begin
         RSTB_sig <= RSTB_node2;
      end
      else
      begin
         RSTB_sig <= RSTB_node1;
      end
   end

   always @ (posedge CLKB_node or posedge RSTB_node1)
   begin
      if (RSTB_node1 == 1'b1)
         RSTB_node2 <= 1'b1;
      else
         RSTB_node2 <= 1'b0;
   end

   assign RSTA_node_sync = (RESETMODE == "SYNC") ? RSTA_node : 1'b0;
   assign RSTB_node_sync = (RESETMODE == "SYNC") ? RSTB_node : 1'b0;

   not (SR_pur, SRN_pur);
   or INST3 (RSTA_nogsr1, RSTA_node_sync, SR_pur);
   or INST4 (RSTB_nogsr1, RSTB_node_sync, SR_pur);

   always @ (RSTA_nogsr1 or RSTA_nogsr2)
   begin
      if ((ASYNC_RESET_RELEASE == "SYNC") && (RESETMODE == "ASYNC"))
      begin
         RSTA_nogsr <= RSTA_nogsr1;
      end
      else
      begin
         RSTA_nogsr <= RSTA_nogsr1;
      end
   end
                                                                                              
   always @ (posedge CLKA_node or posedge RSTA_nogsr1)
   begin
      if (RSTA_nogsr1 == 1'b1)
         RSTA_nogsr2 <= 1'b1;
      else
         RSTA_nogsr2 <= 1'b0;
   end

   always @ (RSTB_nogsr1 or RSTB_nogsr2)
   begin
      if ((ASYNC_RESET_RELEASE == "SYNC") && (RESETMODE == "ASYNC"))
      begin
         RSTB_nogsr <= RSTB_nogsr1;
      end
      else
      begin
         RSTB_nogsr <= RSTB_nogsr1;
      end
   end
                                                                                              
   always @ (posedge CLKB_node or posedge RSTB_nogsr1)
   begin
      if (RSTB_nogsr1 == 1'b1)
         RSTB_nogsr2 <= 1'b1;
      else
         RSTB_nogsr2 <= 1'b0;
   end

   always @ (SR_pur or DIA_node or ADA or WREA_node or CSA_EN) 
   begin
      if (SR_pur == 1)
      begin
         assign DIA_reg = 0;
         assign DIAB_reg = 0;
         assign BWA0_reg = 0;
         assign BWA1_reg = 0;
         assign ADA_reg = 0;
         assign WRENA_reg = 0;
         assign RENA_reg = 0;
         assign CSA_EN_reg = 0;
      end
      else
      begin
         deassign DIA_reg;
         deassign DIAB_reg;
         deassign BWA0_reg;
         deassign BWA1_reg;
         deassign ADA_reg;
         deassign WRENA_reg;
         deassign RENA_reg;
         deassign CSA_EN_reg;
      end
   end

   always @(posedge CLKA_node)
   begin
      if (RSTA_nogsr == 1)
      begin
         CSA_EN_reg <= 0;
      end
      else
      begin
         if (CEA_node == 1)
         begin
            CSA_EN_reg <= CSA_EN;
         end
      end
   end

   always @(posedge CLKA_node)
   begin
         if (CEA_node == 1)
         begin
            DIA_reg_sync <= DIA_node[data_width__a-1:0];
            DIAB_reg_sync <= DIAB_node;
            BWA0_reg_sync <= BWA0_node;
            BWA1_reg_sync <= BWA1_node;
            ADA_reg_sync <= ADA_node;
            WRENA_reg_sync <= WREA_node;
            RENA_reg_sync <= ~WREA_node;
         end
   end

   always @(DIA_reg_sync or DIAB_reg_sync or BWA0_reg_sync or BWA1_reg_sync or ADA_reg_sync or
            WRENA_reg_sync or RENA_reg_sync or CSA_EN_reg)
   begin
         DIA_reg <= DIA_reg_sync;
         DIAB_reg <= DIAB_reg_sync;
         BWA0_reg <= BWA0_reg_sync;
         BWA1_reg <= BWA1_reg_sync;
         ADA_reg <= ADA_reg_sync;
         WRENA_reg <= WRENA_reg_sync & CSA_EN_reg;
         RENA_reg <= RENA_reg_sync & CSA_EN_reg;
   end

   always @ (SR_pur or DIB_node or ADB or WREB_node or CSB_EN) 
   begin
      if (SR_pur == 1)
      begin
         assign DIB_reg = 0;
         assign BWB_reg = 0;
         assign ADB_reg = 0;
         assign WRENB_reg = 0;
         assign RENB_reg = 0;
         assign CSB_EN_reg = 0;
      end
      else
      begin
         deassign DIB_reg;
         deassign BWB_reg;
         deassign ADB_reg;
         deassign WRENB_reg;
         deassign RENB_reg;
         deassign CSB_EN_reg;
      end
   end

   always @(posedge CLKB_node)
   begin
      if (RSTB_nogsr == 1)
      begin
         CSB_EN_reg <= 0;
      end
      else
      begin
         if (CEB_node == 1)
         begin
            CSB_EN_reg <= CSB_EN;
         end
      end
   end

   always @(posedge CLKB_node)
   begin
         if (CEB_node == 1)
         begin
            DIB_reg_sync <= DIB_node[data_width__b-1:0];
            BWB_reg_sync <= BWB_node;
            ADB_reg_sync <= ADB_node;
            WRENB_reg_sync <= WREB_node;
            RENB_reg_sync <= ~WREB_node;
         end
   end

   always @(DIB_reg_sync or BWB_reg_sync or ADB_reg_sync or WRENB_reg_sync or RENB_reg_sync or
            CSB_EN_reg)
   begin
         DIB_reg <= DIB_reg_sync;
         BWB_reg <= BWB_reg_sync;
         ADB_reg <= ADB_reg_sync;
         WRENB_reg <= WRENB_reg_sync & CSB_EN_reg;
         RENB_reg <= RENB_reg_sync & CSB_EN_reg;
   end

   always @(posedge CLKA_node)
   begin
      if (RSTA_sig == 1 && RESETMODE == "SYNC")
         CLKA_valid_new1 <= 0;
      else
         begin
         if (CEA_node == 1)
         begin
            if (CSA_EN == 1)
            begin
               CLKA_valid_new1 <= 1;
               #0.2 CLKA_valid_new1 = 0;
            end
            else
               CLKA_valid_new1 <= 0;
         end
         else
            CLKA_valid_new1 <= 0;
      end
   end

   always @(posedge CLKB_node)
   begin
      if (RSTB_sig == 1 && RESETMODE == "SYNC")
         CLKB_valid_new1 <= 0;
      else
      begin
         if (CEB_node == 1)
         begin
            if (CSB_EN == 1)
            begin
               CLKB_valid_new1 <= 1;
               #0.2 CLKB_valid_new1 = 0;
            end
            else
               CLKB_valid_new1 <= 0;
         end
         else
            CLKB_valid_new1 <= 0;
      end
   end

   always @(CLKA_valid_new1 or CLKA_valid_new2 or CLKA_valid_new3)
   begin
      CLKA_valid_new2 <= CLKA_valid_new1;
      CLKA_valid_new3 <= CLKA_valid_new2;
      CLKA_valid <= CLKA_valid_new3;
   end

   always @(CLKB_valid_new1 or CLKB_valid_new2 or CLKB_valid_new3)
   begin
      CLKB_valid_new2 <= CLKB_valid_new1;
      CLKB_valid_new3 <= CLKB_valid_new2;
      CLKB_valid <= CLKB_valid_new3;
   end

//----------------------------

   always @(ADA_reg or ADB_reg or WRENA_reg or WRENB_reg or CLKA_valid_new2 or CLKB_valid_new2 or
   RENA_reg or RENB_reg)
   begin
      ADDR_A = ADA_reg;
      ADDR_B = ADB_reg;
      //DN_ADDR_A = ADDR_A * DATA_WIDTH_A;
      //UP_ADDR_A = (((ADDR_A + 1) * DATA_WIDTH_A) - 1);
      //DN_ADDR_B = ADDR_B * DATA_WIDTH_B;
      //UP_ADDR_B = (((ADDR_B + 1) * DATA_WIDTH_B) - 1);

		DN_ADDR_A = (ADDR_A * DATA_WIDTH_A) + (ADDR_A / div_a);
		UP_ADDR_A = DN_ADDR_A + (DATA_WIDTH_A - 1);
		DN_ADDR_B = (ADDR_B * DATA_WIDTH_B) + (ADDR_B / div_b);
		UP_ADDR_B = DN_ADDR_B + (DATA_WIDTH_B - 1);

                if (~((UP_ADDR_B < DN_ADDR_A) || (DN_ADDR_B > UP_ADDR_A)))
                begin
                   if (wr_a_wr_b_coll == 1'b1)
                   begin
                      if (CLKA_valid_new2 == 1'b0 && CLKB_valid_new2 == 1'b0)
                         wr_a_wr_b_coll = 1'b0;
                   end
                end
                else
                begin
                   wr_a_wr_b_coll = 1'b0;
                end

                if (~((UP_ADDR_B < DN_ADDR_A) || (DN_ADDR_B > UP_ADDR_A)))
                begin
                   if (wr_a_rd_b_coll == 1'b1)
                   begin
                      if (CLKA_valid_new2 == 1'b0 && CLKB_valid_new2 == 1'b0)
                         wr_a_rd_b_coll = 1'b0;
                   end
                end
                else
                begin
                   wr_a_rd_b_coll = 1'b0;
                end

                if (~((UP_ADDR_A < DN_ADDR_B) || (DN_ADDR_A > UP_ADDR_B)))
                begin
                   if (rd_a_wr_b_coll == 1'b1)
                   begin
                      if (CLKA_valid_new2 == 1'b0 && CLKB_valid_new2 == 1'b0)
                         rd_a_wr_b_coll = 1'b0;
                   end
                end
                else
                begin
                   rd_a_wr_b_coll = 1'b0;
                end

		if (~((UP_ADDR_B < DN_ADDR_A) || (DN_ADDR_B > UP_ADDR_A)))
		begin
			if ((DN_ADDR_A > DN_ADDR_B) && (UP_ADDR_A < UP_ADDR_B))
			begin
				dn_coll_addr = DN_ADDR_A;
				up_coll_addr = UP_ADDR_A;
			end
			else if ((DN_ADDR_B > DN_ADDR_A) && (UP_ADDR_B < UP_ADDR_A))
			begin
				dn_coll_addr = DN_ADDR_B;
				up_coll_addr = UP_ADDR_B;
			end
			else if ((UP_ADDR_A - DN_ADDR_B) <= (UP_ADDR_B - DN_ADDR_A))
			begin
				dn_coll_addr = DN_ADDR_B;
				up_coll_addr = UP_ADDR_A;
			end
			else
			begin
				dn_coll_addr = DN_ADDR_A;
				up_coll_addr = UP_ADDR_B;
			end
		end

// Write collision

      if ((WRENA_reg == 1 && CLKA_valid_new2 == 1) && (WRENB_reg == 1 && CLKB_valid_new2 == 1))
      begin
         if (~((UP_ADDR_B < DN_ADDR_A) || (DN_ADDR_B > UP_ADDR_A)))
         begin
//            $display ("Warning! Block-Ram instance, %m:",
//                      "\n\t simulation time:",$time,
//                      "\n\t has possible write address collision.");
				wr_a_wr_b_coll = 1;
         end
      end

      if ((WRENA_reg == 1 && CLKA_valid_new2 == 1) && (RENB_reg == 1 && CLKB_valid_new2 == 1))
      begin
         if (~((UP_ADDR_B < DN_ADDR_A) || (DN_ADDR_B > UP_ADDR_A)))
         begin
//            $display ("Warning! Block-Ram instance, %m:",
//                      "\n\t simulation time:",$time,
//                      "\n\t has possible write (Port A) and read (Port B) address collision.");
				wr_a_rd_b_coll = 1;
         end
      end

      if ((RENA_reg == 1 && CLKA_valid_new2 == 1) && (WRENB_reg == 1 && CLKB_valid_new2 == 1))
      begin
         if (~((UP_ADDR_A < DN_ADDR_B) || (DN_ADDR_A > UP_ADDR_B)))
         begin
//            $display ("Warning! Block-Ram instance, %m:",
//                      "\n\t simulation time:",$time,
//                      "\n\t has possible write (Port B) and read (Port A) address collision.");
				rd_a_wr_b_coll = 1;
         end
      end

   end

//----------------------------

   always @(posedge CLKA_valid or posedge CLKB_valid)
   begin
      v_WADDR_A = ADA_reg;
      v_WADDR_B = ADB_reg;
      memchg0 <= ~memchg0;
 
      if (DATA_WIDTH_A == 18)
      begin
         if (WRENA_reg == 1 && CLKA_valid == 1)
         begin
            for (i = 0; i < DATA_WIDTH_A; i = i+1)
            begin
                 DO_node_rbr[i] = v_MEM[v_WADDR_A * DATA_WIDTH_A + i];
            end
            DOA_node_rbr = DO_node_rbr[8:0];
            DOB_node_rbr = DO_node_rbr[17:9];

            if (BWA0_reg == 1'b1)
            for (i = 0; i < 9; i = i+1)
                 begin
                      v_MEM[v_WADDR_A * DATA_WIDTH_A + i] = DIAB_reg[i];
                 end
            if (BWA1_reg == 1'b1)
               for (i = 0; i < 9; i = i+1)
               begin
                    v_MEM[v_WADDR_A * DATA_WIDTH_A + i + 9] = DIAB_reg[i + 9];
               end
            memchga <= ~memchga;
         end
      end
      else
      begin
         if (DATA_WIDTH_A == 9)
         begin
            if (BWA0_reg == 1'b1 && WRENA_reg == 1 && CLKA_valid == 1)
            begin
               for (i = 0; i < DATA_WIDTH_A; i = i+1)
               begin
                  DOA_node_rbr[i] = v_MEM[(v_WADDR_A * DATA_WIDTH_A) + (v_WADDR_A / div_a) + i];
               end

               for (i = 0; i < data_width__a; i = i+1)
                 begin
                      v_MEM[(v_WADDR_A * data_width__a) + i] = DIA_reg[i];
							 if ( (wr_a_wr_b_coll == 1) &&
							      (((v_WADDR_A * data_width__a) + i) >= dn_coll_addr) &&
							      (((v_WADDR_A * data_width__a) + i) <= up_coll_addr) &&
									( (DATA_WIDTH_B < 9) ||
									  ( (DATA_WIDTH_B == 9) &&
									    ( ((BWB_reg == 1'b1) && (((v_WADDR_A * DATA_WIDTH_A) % 9) == 0))
                         ) ) ) ) 
							    v_MEM[(v_WADDR_A * data_width__a) + i] = 1'bX;
                 end
               memchga <= ~memchga;
            end
         end
         else
         begin
            if (WRENA_reg == 1 && CLKA_valid == 1)
            begin
               for (i = 0; i < DATA_WIDTH_A; i = i+1)
               begin
                  DOA_node_rbr[i] = v_MEM[(v_WADDR_A * DATA_WIDTH_A) + (v_WADDR_A / div_a) + i];
               end
               for (i = 0; i < data_width__a; i = i+1)
                 begin
                      v_MEM[(v_WADDR_A * data_width__a) + (v_WADDR_A / div_a) + i] = DIA_reg[i];
							 if ( (wr_a_wr_b_coll == 1) &&
							      (((v_WADDR_A * data_width__a) + (v_WADDR_A / div_a) + i) >= dn_coll_addr) &&
							      (((v_WADDR_A * data_width__a) + (v_WADDR_A / div_a) + i) <= up_coll_addr) &&
									( (DATA_WIDTH_B < 9) ||
									  ( (DATA_WIDTH_B == 9) &&
									    ( ((BWB_reg == 1'b1) && ((((v_WADDR_A * DATA_WIDTH_A) + (v_WADDR_A / div_a)) % 9) == 0)) 
										 ) ) ) )
							    v_MEM[(v_WADDR_A * data_width__a) + (v_WADDR_A / div_a) + i] = 1'bX;
                 end
               memchga <= ~memchga;
            end
         end

         if (DATA_WIDTH_B == 9)
         begin
            if (BWB_reg == 1'b1 && WRENB_reg == 1 && CLKB_valid == 1)
            begin
               for (i = 0; i < DATA_WIDTH_B; i = i+1)
               begin
                  DOB_node_rbr[i] = v_MEM[(v_WADDR_B * DATA_WIDTH_B) + (v_WADDR_B / div_b) + i];
               end

               for (i = 0; i < data_width__b; i = i+1)
                 begin
                      v_MEM[(v_WADDR_B * data_width__b) + i] = DIB_reg[i];
							 if ( (wr_a_wr_b_coll == 1) &&
							      (((v_WADDR_B * data_width__b) + i) >= dn_coll_addr) &&
							      (((v_WADDR_B * data_width__b) + i) <= up_coll_addr) &&
									( (DATA_WIDTH_A < 9) ||
									  ( (DATA_WIDTH_A == 9) &&
									    ( ((BWA0_reg == 1'b1) && (((v_WADDR_B * DATA_WIDTH_B) % 9) == 0)) 
                          ))))
							    v_MEM[(v_WADDR_B * data_width__b) + i] = 1'bX;
                 end
               memchgb <= ~memchgb;
            end
         end
         else
         begin
            if (WRENB_reg == 1 && CLKB_valid == 1)
            begin
               for (i = 0; i < DATA_WIDTH_B; i = i+1)
               begin
                  DOB_node_rbr[i] = v_MEM[(v_WADDR_B * DATA_WIDTH_B) + (v_WADDR_B / div_b) + i];
               end

               for (i = 0; i < data_width__b; i = i+1)
               begin
                    v_MEM[(v_WADDR_B * data_width__b) + (v_WADDR_B / div_b) + i] = DIB_reg[i];
						  if ( (wr_a_wr_b_coll == 1) &&
							    (((v_WADDR_B * data_width__b) + (v_WADDR_B / div_b) + i) >= dn_coll_addr) &&
							    (((v_WADDR_B * data_width__b) + (v_WADDR_B / div_b) + i) <= up_coll_addr) &&
								 ( (DATA_WIDTH_A < 9) ||
									( (DATA_WIDTH_A == 9) &&
									  ( ((BWA0_reg == 1'b1) && ((((v_WADDR_B * DATA_WIDTH_B) + (v_WADDR_B / div_b)) % 9) == 0)) 
									  ) ) ) )
							    v_MEM[(v_WADDR_B * data_width__b) + (v_WADDR_B / div_b) + i] = 1'bX;
               end
               memchgb <= ~memchgb;
            end
         end
      end
   end

// Read operation
   always @(RENA_reg or RENB_reg or ADA_reg or ADB_reg or memchg0 or CLKA_valid or CLKB_valid or 
   posedge RSTA_sig or posedge RSTB_sig or
	wr_a_rd_b_coll or rd_a_wr_b_coll) 
   begin
      v_RADDR_A = ADA_reg;
      v_RADDR_B = ADB_reg;

      if (DATA_WIDTH_B == 18)
      begin
         if (RSTB_sig == 1'b1)
         begin
            if (RESETMODE == "SYNC")
            begin
               if (CLKB_node ==  1'b1)
               begin
                  DOA_node <= 0;
                  DOB_node <= 0;
               end
            end
            else
            begin
               DOA_node <= 0;
               DOB_node <= 0;
            end
         end
         else if (CLKB_valid === 1'b1 && last_CLKB_valid === 1'b0)
         begin
            if (RENB_reg == 1)
            begin

               for (i = 0; i < DATA_WIDTH_B; i = i+1)
               begin
                    DO_node_tr[i] = v_MEM[v_RADDR_B * DATA_WIDTH_B + i];
						  if ( (wr_a_rd_b_coll == 1) &&
							    ((v_RADDR_B * DATA_WIDTH_B + i) >= dn_coll_addr) &&
							    ((v_RADDR_B * DATA_WIDTH_B + i) <= up_coll_addr) &&
								 ( (DATA_WIDTH_A < 9) ||
									( (DATA_WIDTH_A == 9) &&
									  ( ((BWA0_reg == 1'b1) && (((v_RADDR_B * DATA_WIDTH_B) + i) % 9) < 9))) ||
									( (DATA_WIDTH_A == 18) &&
									  ( ((BWA0_reg == 1'b1) && ((((v_RADDR_B * DATA_WIDTH_B) + i) % 18) < 9)) ||
									    ((BWA1_reg == 1'b1) && ((((v_RADDR_B * DATA_WIDTH_B) + i) % 18) >= 9))
								 ))) )
							  DO_node_tr[i] = 1'bX;
               end
               DOB_node <= DO_node_tr[17:9];
               DOA_node <= DO_node_tr[8:0];
            end
            else if (RENB_reg == 0)
            begin
               if (WRITEMODE_B == "WRITETHROUGH")
               begin
                  for (i = 0; i < DATA_WIDTH_B; i = i+1)
                  begin
                     DO_node_wt[i] = v_MEM[v_RADDR_B * DATA_WIDTH_B + i];
                  end
                  DOB_node <= DO_node_wt[17:9];
                  DOA_node <= DO_node_wt[8:0];
               end
               else if (WRITEMODE_B == "READBEFOREWRITE")
               begin
                  DOB_node <= DO_node_rbr[17:9];
                  DOA_node <= DO_node_rbr[8:0];
               end
            end
         end
      end
      else
      begin
         if (RSTA_sig == 1'b1)
         begin
            if (RESETMODE == "SYNC")
            begin
               if (CLKA_node ==  1'b1)
               begin
                  DOA_node <= 0;
               end
            end
            else
            begin
               DOA_node <= 0;
            end
         end
         else if (CLKA_valid == 1'b1)
         begin
            if (RENA_reg == 1)
            begin
               if (last_CLKA_valid == 1'b0)
               begin
                  for (i = 0; i < DATA_WIDTH_A; i = i+1)
                  begin
                  //DOA_node[i] <= v_MEM[(v_RADDR_A * DATA_WIDTH_A) + (v_RADDR_A / div_a) + i];
						if ( (rd_a_wr_b_coll == 1) &&
							  (((v_RADDR_A * DATA_WIDTH_A) + (v_RADDR_A / div_a) + i) >= dn_coll_addr) &&
							  (((v_RADDR_A * DATA_WIDTH_A) + (v_RADDR_A / div_a) + i) <= up_coll_addr) &&
							  ( (DATA_WIDTH_B < 9) ||
								 ( (DATA_WIDTH_B == 9) &&
									( ((BWB_reg == 1'b1) && ((((v_RADDR_A * DATA_WIDTH_A) + (v_RADDR_A / div_a) + i) % 9) == 0)) 
									) ) ) )
							DOA_node[i] <= 1'bX;
						else
							DOA_node[i] <= v_MEM[(v_RADDR_A * DATA_WIDTH_A) + (v_RADDR_A / div_a) + i];
                  end
               end
            end
            else if (RENA_reg == 0)
            begin
               if (WRITEMODE_A == "WRITETHROUGH")
               begin
                  if (DATA_WIDTH_A <= 4)
                  begin
                     for (i = 0; i < DATA_WIDTH_A; i = i+1)
                     begin
                        DOA_node[i] <= v_MEM[(v_RADDR_A * DATA_WIDTH_A) + (v_RADDR_A / div_a) + i];
                     end
                  end
                  else if (DATA_WIDTH_A == 9)
                  begin
                     if (BWA0_reg == 1'b1)
                     begin
                        for (i = 0; i < 9; i = i+1)
                        begin
                           DOA_node[i] <= v_MEM[(v_RADDR_A * DATA_WIDTH_A) + (v_RADDR_A / div_a) + i];
                        end
                     end
                  end
               end
               else if (WRITEMODE_A == "READBEFOREWRITE")
               begin
                  if (last_CLKA_valid == 1'b0)
                  begin
                     DOA_node <= DOA_node_rbr;
                  end
               end
            end
         end

         if (RSTB_sig == 1'b1)
         begin
            if (RESETMODE == "SYNC")
            begin
               if (CLKB_node ==  1'b1)
               begin
                  DOB_node <= 0;
               end
            end
            else
            begin
               DOB_node <= 0;
            end
         end
         else if (CLKB_valid == 1'b1)
         begin
            if (RENB_reg == 1)
            begin
               if (last_CLKB_valid == 1'b0)
               begin
                  for (i = 0; i < DATA_WIDTH_B; i = i+1)
                  begin
                  //DOB_node[i] <= v_MEM[(v_RADDR_B * DATA_WIDTH_B) + (v_RADDR_B / div_b) + i];
						if ( (wr_a_rd_b_coll == 1) &&
							  (((v_RADDR_B * DATA_WIDTH_B) + (v_RADDR_B / div_b) + i) >= dn_coll_addr) &&
							  (((v_RADDR_B * DATA_WIDTH_B) + (v_RADDR_B / div_b) + i) <= up_coll_addr) &&
							  ( (DATA_WIDTH_A < 9) ||
								 ( (DATA_WIDTH_A == 9) &&
									( ((BWA0_reg == 1'b1) && ((((v_RADDR_B * DATA_WIDTH_B) + (v_RADDR_B / div_b) + i) % 9) < 9)) 
									) ) ||
								 ( (DATA_WIDTH_A == 18) &&
									( ((BWA0_reg == 1'b1) && ((((v_RADDR_B * DATA_WIDTH_B) + (v_RADDR_B / div_b) + i) % 18) < 9)) ||
									  ((BWA0_reg == 1'b1) && ((((v_RADDR_B * DATA_WIDTH_B) + (v_RADDR_B / div_b) + i) % 18) >= 9))
									) ) ) )
							DOB_node[i] <= 1'bX;
						else
							DOB_node[i] <= v_MEM[(v_RADDR_B * DATA_WIDTH_B) + (v_RADDR_B / div_b) + i];
                  end
               end
            end
            else if (RENB_reg == 0)
            begin
               if (WRITEMODE_B == "WRITETHROUGH")
               begin
                  if (DATA_WIDTH_B <= 4)
                  begin
                     for (i = 0; i < DATA_WIDTH_B; i = i+1)
                     begin
                        DOB_node[i] <= v_MEM[(v_RADDR_B * DATA_WIDTH_B) + (v_RADDR_B / div_b) + i];
                     end
                  end
                  else if (DATA_WIDTH_B == 9)
                  begin
                     if (BWB_reg == 1'b1)
                     begin
                        for (i = 0; i < 9; i = i+1)
                        begin
                           DOB_node[i] <= v_MEM[(v_RADDR_B * DATA_WIDTH_B) + (v_RADDR_B / div_b) + i];
                        end
                     end
                  end
               end
               else if (WRITEMODE_B == "READBEFOREWRITE")
               begin
                  if (last_CLKB_valid == 1'b0)
                  begin
                     DOB_node <= DOB_node_rbr;
                  end
               end
            end
         end
      end
   end

   always @ (SR1 or DOB_node or DOA_node)
   begin
      if (SR1 == 1)
      begin
         assign DOA_reg = 0;
         assign DOAB_reg = 0;
         assign DOB_reg = 0;
      end
      else
      begin
         deassign DOA_reg;
         deassign DOAB_reg;
         deassign DOB_reg;
      end
   end

   always @(posedge RSTA_sig or posedge CLKA_node)
   begin
      if (RSTA_sig == 1)
         DOA_reg_async <= 0;
      else
      begin
         if (OCEA_node == 1)
            DOA_reg_async <= DOA_node;
      end
   end

   always @(posedge CLKA_node)
   begin
      if (OCEA_node == 1)
      begin
         if (RSTA_sig == 1)
            DOA_reg_sync <= 0;
         else
            DOA_reg_sync <= DOA_node;
      end
   end

   always @(posedge RSTB_sig or posedge CLKB_node)
   begin
      if (RSTB_sig == 1)
      begin
         DOB_reg_async <= 0;
         DOAB_reg_async <= 0;
      end
      else
      begin
         if (OCEB_node == 1)
         begin
            DOB_reg_async <= DOB_node;
            DOAB_reg_async <= DOA_node;
         end
      end
   end

   always @(posedge CLKB_node)
   begin
      if (OCEB_node == 1)
      begin
         if (RSTB_sig == 1)
         begin
            DOB_reg_sync <= 0;
            DOAB_reg_sync <= 0;
         end
         else
         begin
            DOB_reg_sync <= DOB_node;
            DOAB_reg_sync <= DOA_node;
         end
      end
   end

   always @(DOA_reg_sync or DOA_reg_async or DOB_reg_sync or DOB_reg_async or DOAB_reg_sync or DOAB_reg_async)
   begin
      if (RESETMODE == "ASYNC")
      begin
         DOB_reg <= DOB_reg_async;
         DOA_reg <= DOA_reg_async;
         DOAB_reg <= DOAB_reg_async;
      end
      else
      begin
         DOB_reg <= DOB_reg_sync;
         DOA_reg <= DOA_reg_sync;
         DOAB_reg <= DOAB_reg_sync;
      end
   end

   always @(DOA_reg or DOB_reg or DOAB_reg or DOA_node or DOB_node)
   begin
      if (REGMODE_A == "OUTREG") 
      begin
         if (DATA_WIDTH_B == 18)
            DOA_out <= DOAB_reg;
         else
            DOA_out <= DOA_reg;
      end
      else
      begin
         DOA_out <= DOA_node;
      end

      if (REGMODE_B == "OUTREG") 
         DOB_out <= DOB_reg;
      else
         DOB_out <= DOB_node;
   end

endmodule

