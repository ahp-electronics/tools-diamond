// --------------------------------------------------------------------
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
// Simulation Library File for XO2
//
// fpga\verilog\pkg\versclibs\data\machxo2\EHXPLLJ.v 1.18 19-JAN-2011 12:07:50 IALMOHAN
//
`celldefine
`timescale 1 ns / 10 fs

module EHXPLLJ(CLKI, CLKFB, PHASESEL1, PHASESEL0, PHASEDIR, PHASESTEP, LOADREG, STDBY, 
   PLLWAKESYNC, RST, RESETM, RESETC, RESETD, ENCLKOP, ENCLKOS, ENCLKOS2, ENCLKOS3, 
   PLLCLK, PLLRST, PLLSTB, PLLWE, REFCLK,
   PLLADDR4, PLLADDR3, PLLADDR2, PLLADDR1, PLLADDR0, PLLDATI7, PLLDATI6, PLLDATI5, PLLDATI4,
   PLLDATI3, PLLDATI2, PLLDATI1, PLLDATI0, 
   CLKOP, CLKOS, CLKOS2, CLKOS3, LOCK, INTLOCK, PLLDATO7, PLLDATO6, PLLDATO5, PLLDATO4,
   PLLDATO3, PLLDATO2, PLLDATO1, PLLDATO0, PLLACK, DPHSRC, CLKINTFB);

parameter FIN = "100.0000";
parameter CLKI_DIV = 1;
parameter CLKFB_DIV = 1;
parameter CLKOP_DIV = 1;
parameter CLKOS_DIV = 1;
parameter CLKOS2_DIV = 1;
parameter CLKOS3_DIV = 1;
parameter CLKOP_ENABLE = "ENABLED";
parameter CLKOS_ENABLE = "ENABLED";
parameter CLKOS2_ENABLE = "ENABLED";
parameter CLKOS3_ENABLE = "ENABLED";
parameter CLKOP_CPHASE = 0;
parameter CLKOS_CPHASE = 0;
parameter CLKOS2_CPHASE = 0;
parameter CLKOS3_CPHASE = 0;
parameter CLKOP_FPHASE = 0;
parameter CLKOS_FPHASE = 0;
parameter CLKOS2_FPHASE = 0;
parameter CLKOS3_FPHASE = 0;
parameter FEEDBK_PATH = "CLKOP";
parameter FRACN_ENABLE = "DISABLED";
parameter FRACN_DIV = 0;
parameter PLL_USE_WB = "DISABLED";
parameter CLKOP_TRIM_POL = "RISING";
parameter CLKOP_TRIM_DELAY = 0;
parameter CLKOS_TRIM_POL = "RISING";
parameter CLKOS_TRIM_DELAY = 0;
parameter VCO_BYPASS_A0 = "DISABLED";
parameter VCO_BYPASS_B0 = "DISABLED";
parameter VCO_BYPASS_C0 = "DISABLED";
parameter VCO_BYPASS_D0 = "DISABLED";
parameter PREDIVIDER_MUXA1 = 0;
parameter PREDIVIDER_MUXB1 = 0;
parameter PREDIVIDER_MUXC1 = 0;
parameter PREDIVIDER_MUXD1 = 0;
parameter OUTDIVIDER_MUXA2 = "DIVA";
parameter OUTDIVIDER_MUXB2 = "DIVB";
parameter OUTDIVIDER_MUXC2 = "DIVC";
parameter OUTDIVIDER_MUXD2 = "DIVD";
parameter PLL_LOCK_DELAY = 200;
parameter PLL_LOCK_MODE = 0;    // 2 => sticky, 0 => non-sticky
parameter REFIN_RESET = "DISABLED";
parameter SYNC_ENABLE = "ENABLED";
parameter INT_LOCK_STICKY = "ENABLED";
parameter DPHASE_SOURCE = "DISABLED";
parameter STDBY_ENABLE = "DISABLED";
parameter PLLRST_ENA = "DISABLED";
parameter MRST_ENA = "DISABLED";
parameter DCRST_ENA = "DISABLED";
parameter DDRST_ENA = "DISABLED";
parameter INTFB_WAKE = "DISABLED";

input  CLKI, CLKFB, PHASESEL1, PHASESEL0, PHASEDIR, PHASESTEP;
input  LOADREG, STDBY, PLLWAKESYNC, RST, RESETM;
input  RESETC, RESETD, ENCLKOP, ENCLKOS, ENCLKOS2, ENCLKOS3, PLLCLK, PLLRST, PLLSTB, PLLWE;
input  PLLADDR4, PLLADDR3, PLLADDR2, PLLADDR1, PLLADDR0, PLLDATI7, PLLDATI6, PLLDATI5;
input PLLDATI4, PLLDATI3, PLLDATI2, PLLDATI1, PLLDATI0;
output CLKOP, CLKOS, CLKOS2, CLKOS3, LOCK, REFCLK, INTLOCK, PLLDATO7, PLLDATO6, PLLDATO5, PLLDATO4;
output PLLDATO3, PLLDATO2, PLLDATO1, PLLDATO0, PLLACK, DPHSRC, CLKINTFB;
reg false_clk;
reg clkop_first_time;
reg false_clk_first_time, fb_first_time;

reg clock_valid, clock_invalid, out_clk_valid;

reg vir_sclk, vir_kclk, vir_k2clk, vir_lock, vir_pclk, vir_intfb;
reg vir_kclk_p,  vir_kclk_s, final_sclk;

reg intfb_out, lock_all;
realtime t_diva_clk, t_divb_clk, t_divc_clk, t_divd_clk;
realtime ha_clk_a_trim, ha_clk_b_trim;
realtime ha_vco_a, ha_vco_b;

realtime next_clock_edge, last_clock_edge;
realtime next_clock_edge1, last_clock_edge1;
realtime t_in_clk, t_in_clk1, t_in_clk2, t_in_clk3;
realtime t_vco, ha_vco1, ha_vco, duty_vco1, duty_vco;
realtime t_fb_clk;
realtime first_int_edge, first_fb_edge;
realtime total_fb_delay, virtual_delay1;
realtime real_delay1, lock_delay_reg;
reg CLKOS3REG, CLKOS2REG, CLKOSREG, CLKOPREG, CLKOPREG1, LOCKREG, INTLOCKREG;
reg CLKOS3REG1, CLKOS2REG1, CLKOSREG1; 
reg [1:0] phase_sel;
reg d_lock, d1_lock, d2_lock, d3_lock, d4_lock, LOCKREG1, LOCKREG2, LOCKREG3;
reg load_reg_en, phase_dir, phase_step, last_phase_step;

real ext_divider, net_divide, net_divide1, frac_value;
integer    duty_i, step_s, step_s2, step_s3;
integer    step_p, step_op, step_op1, step_op2;
integer    step_os, step_os_1, step_os_2; 
integer    step_os2, step_os2_1, step_os2_2, step_os3, step_os3_1, step_os3_2;
integer fb_count, ratio1;
integer index_diva, index_divb, index_divc, index_divd;
reg  load_reg_en_op2, load_reg_en_op1, load_reg_en_op;
reg  load_reg_en_os_2, load_reg_en_os_1, load_reg_en_os;
reg  load_reg_en_os2_2, load_reg_en_os2_1, load_reg_en_os2;
reg  load_reg_en_os3_2, load_reg_en_os3_1, load_reg_en_os3;
reg  last_load_reg_en_op, last_load_reg_en_os, last_load_reg_en_os2, last_load_reg_en_os3;
//following variables are added to compensate vco rounding error
integer ha_vco_xprec;
realtime ha_vco_sim, round_err;
realtime ha_clk_a, ha_clk_b;
realtime vco_ph_del_a, vco_ph_del_b, vco_ph_del_c, vco_ph_del_d;
realtime diva_ph_del, divb_ph_del, divc_ph_del, divd_ph_del;
realtime op_ph_del, os_ph_del, os2_ph_del, os3_ph_del;
real index=0.0;
reg [231:0] MEM;
wire [4:0] PLLADDRB; 
wire [4:0] pll_addr;
wire [7:0] PLLDATIB, PLLDATOB;
reg [7:0] pll_wdata, wb_dat, muxdat;
reg wb_ack;
wire [1:0] PHASESELB;
wire LOADREGB, RSTB_NEW;
integer CLKOS_FPHASE_DYN, CLKOS2_FPHASE_DYN, CLKOS3_FPHASE_DYN, CLKOP_FPHASE_DYN;
integer CLKOS_CPHASE_DYN, CLKOS2_CPHASE_DYN, CLKOS3_CPHASE_DYN, CLKOP_CPHASE_DYN;
reg A0_OUT, B0_OUT, C0_OUT, D0_OUT;
reg PHA, PHB, PHC, PHD;
reg A1_OUT, B1_OUT, C1_OUT, D1_OUT;
reg DIVA_OUT_DEL, DIVB_OUT_DEL, DIVC_OUT_DEL, DIVD_OUT_DEL, DIVC_OUT_DEL2, DIVD_OUT_DEL2;
reg DIVA_OUT_DEL1, DIVB_OUT_DEL1, DIVA_OUT_DEL2, DIVB_OUT_DEL2;
reg DIVA_OUT_DEL1_last, DIVB_OUT_DEL1_last;
reg DIVA_OUT, DIVB_OUT, DIVC_OUT, DIVD_OUT;
reg A2_OUT, B2_OUT, C2_OUT, D2_OUT;
reg CLKOP_OUT, CLKOS_OUT, CLKOS2_OUT, CLKOS3_OUT;
reg first_time_a, first_time_b, first_time_c, first_time_d, first_time7;
integer CLKFB_DIV_REG, CLKI_DIV_REG, CLKOP_DIV_REG, CLKOS_DIV_REG;
integer CLKOS2_DIV_REG, CLKOS3_DIV_REG;
integer load_count_op, load_count_os, load_count_os2, load_count_os3;
reg vco_clk, vco_clk_a, vco_clk_b, DPHSRCB;
wire CLKINTFB_B;
integer load_cnt_op, load_cnt_os, load_cnt_os2, load_cnt_os3;
reg RESETCB_reg0, RESETCB_reg1, RESETCB_reg2, RESETDB_reg0;
reg RESETDB_reg1, RESETDB_reg2;
wire RESETCB_new, RESETDB_new;

buf U101 (REFCLK, CLKI);
buf U1 (CLKOS, CLKOSREG1);
buf U2 (CLKOP, CLKOPREG1);
buf U3 (CLKOS2, CLKOS2REG1);
buf U50 (CLKOS3, CLKOS3REG1);
buf U4 (LOCK, LOCKREG3);
buf U6 (CLKIB, CLKI);
buf U7 (FBB, CLKFB);
buf U81 (RSTB, RST);
buf U82 (RESETMB, RESETM);
buf U83 (RESETCB, RESETC);
buf U84 (RESETDB, RESETD);
buf U8 (PLLCLKB, PLLCLK);
buf U9 (PLLRSTB, PLLRST);
buf U10 (PLLSTBB, PLLSTB);
buf U11 (PLLWEB, PLLWE);
buf U12 (PLLADDRB[4], PLLADDR4);
buf U13 (PLLADDRB[3], PLLADDR3);
buf U14 (PLLADDRB[2], PLLADDR2);
buf U15 (PLLADDRB[1], PLLADDR1);
buf U16 (PLLADDRB[0], PLLADDR0);
buf U17 (PLLDATIB[7], PLLDATI7);
buf U18 (PLLDATIB[6], PLLDATI6);
buf U19 (PLLDATIB[5], PLLDATI5);
buf U20 (PLLDATIB[4], PLLDATI4);
buf U21 (PLLDATIB[3], PLLDATI3);
buf U22 (PLLDATIB[2], PLLDATI2);
buf U23 (PLLDATIB[1], PLLDATI1);
buf U24 (PLLDATIB[0], PLLDATI0);
buf U25 (PLLDATO7, PLLDATOB[7]);
buf U26 (PLLDATO6, PLLDATOB[6]);
buf U27 (PLLDATO5, PLLDATOB[5]);
buf U28 (PLLDATO4, PLLDATOB[4]);
buf U29 (PLLDATO3, PLLDATOB[3]);
buf U30 (PLLDATO2, PLLDATOB[2]);
buf U31 (PLLDATO1, PLLDATOB[1]);
buf U32 (PLLDATO0, PLLDATOB[0]);
buf U33 (PLLACK, PLLACKB);
buf U34 (PHASESELB[1], PHASESEL1);
buf U35 (PHASESELB[0], PHASESEL0);
buf U36 (PHASEDIRB, PHASEDIR);
buf U37 (PHASESTEPB, PHASESTEP);
buf U38 (LOADREGB, LOADREG);
buf U39 (CLKINTFB, CLKINTFB_B);
buf U40 (DPHSRC, DPHSRCB);
buf U41 (INTLOCK, INTLOCKREG);

initial
begin
   RESETCB_reg0 = 0;
   RESETCB_reg1 = 0;
   RESETCB_reg2 = 0;
   RESETDB_reg0 = 0;
   RESETDB_reg1 = 0;
   RESETDB_reg2 = 0;
   load_cnt_op = 1;
   load_cnt_os = 1;
   load_cnt_os2 = 1;
   load_cnt_os3 = 1;
   clkop_first_time = 1'b1;
   wb_ack = 1'b0;
   wb_dat = 0;
   load_reg_en = 0;
   load_reg_en_op2 = 0;
   load_reg_en_op1 = 0;
   load_reg_en_op = 0;
   last_load_reg_en_op = 0;
   load_reg_en_os_2 = 0;
   load_reg_en_os_1 = 0;
   load_reg_en_os = 0;
   last_load_reg_en_os = 0;
   load_reg_en_os2_2 = 0;
   load_reg_en_os2_1 = 0;
   load_reg_en_os2 = 0;
   last_load_reg_en_os2 = 0;
   load_reg_en_os3_2 = 0;
   load_reg_en_os3_1 = 0;
   load_reg_en_os3 = 0;
   last_load_reg_en_os3 = 0;
   phase_dir = 0;
   phase_step = 0;
   last_phase_step = 0;
   phase_sel = 0;
   step_p = 0;
   step_s = 0;
   step_s2 = 0;
   step_s3 = 0;
   step_op = 0;
   step_op1 = 0;
   step_op2 = 0;
   step_os = 0;
   step_os_1 = 0;
   step_os_2 = 0;
   step_os2 = 0;
   step_os2_1 = 0;
   step_os2_2 = 0;
   step_os3 = 0;
   step_os3_1 = 0;
   step_os3_2 = 0;
   if (DPHASE_SOURCE == "DISABLED")
      DPHSRCB = 1'b0;
   else
      DPHSRCB = 1'b1;
end

always @ (phase_step)
begin
   last_phase_step <= phase_step;
end

always @ (load_reg_en_op, load_reg_en_os, load_reg_en_os2, load_reg_en_os3)
begin
   last_load_reg_en_op <= load_reg_en_op;
   last_load_reg_en_os <= load_reg_en_os;
   last_load_reg_en_os2 <= load_reg_en_os2;
   last_load_reg_en_os3 <= load_reg_en_os3;
end

always @ (DIVA_OUT_DEL1, DIVB_OUT_DEL1)
begin
   DIVA_OUT_DEL1_last <= DIVA_OUT_DEL1;
   DIVB_OUT_DEL1_last <= DIVB_OUT_DEL1;
end

//
// Generate False Clocks
initial begin
   false_clk = 1'b0;
   forever #5 false_clk = ~false_clk;
end

assign CLKINTFB_B = false_clk;                                                                                    
// Measure input clock period
                                                                                    
initial
begin
   lock_delay_reg = 1.0;
   last_clock_edge = 0.0;
   next_clock_edge = 0.0;
   t_in_clk = 0.0;
   t_in_clk1 = 0.0;
   t_in_clk2 = 0.0;
   t_in_clk3 = 0.0;
   net_divide = 1.0;
   net_divide1 = 1.0;
end

initial
begin
PHA = 1'b0;
PHB = 1'b0;
PHC = 1'b0;
PHD = 1'b0;
A0_OUT = 1'b0;
B0_OUT = 1'b0;
C0_OUT = 1'b0;
D0_OUT = 1'b0;
A1_OUT = 1'b0;
B1_OUT = 1'b0;
C1_OUT = 1'b0;
D1_OUT = 1'b0;
A2_OUT = 1'b0;
B2_OUT = 1'b0;
C2_OUT = 1'b0;
D2_OUT = 1'b0;
DIVA_OUT = 1'b0;
DIVB_OUT = 1'b0;
DIVC_OUT = 1'b0;
DIVD_OUT = 1'b0;
DIVA_OUT_DEL = 1'b0;
DIVB_OUT_DEL = 1'b0;
DIVC_OUT_DEL = 1'b0;
DIVD_OUT_DEL = 1'b0;
DIVA_OUT_DEL1 = 1'b0;
DIVA_OUT_DEL2 = 1'b0;
DIVB_OUT_DEL1 = 1'b0;
DIVB_OUT_DEL2 = 1'b0;
DIVC_OUT_DEL2 = 1'b0;
DIVD_OUT_DEL2 = 1'b0;
d4_lock = 1'b1;
d3_lock = 1'b1;
d2_lock = 1'b1;
d1_lock = 1'b1;
d_lock = 1'b1;
fb_count = 0;
first_time_a = 1;
first_time_b = 1;
first_time_c = 1;
first_time_d = 1;
first_time7 = 1;
ratio1 = 0;
out_clk_valid = 0;
lock_all = 0;
vir_kclk = 0;
vir_kclk_p = 0;
vir_kclk_s = 0;
vir_k2clk = 0;
vir_lock = 0;
clock_valid = 0;
clock_invalid = 1;
final_sclk = 0;
vir_sclk = 0;
vir_intfb = 0;
vir_pclk = 0;
intfb_out = 0;
false_clk = 0;
CLKOSREG = 0;
CLKOSREG1 = 0;
CLKOPREG = 0;
CLKOPREG1 = 0;
CLKOS2REG = 0;
CLKOS2REG1 = 0;
CLKOS3REG = 0;
CLKOS3REG1 = 0;
LOCKREG = 0;
INTLOCKREG = 0;
LOCKREG1 = 0;
LOCKREG2 = 0;
LOCKREG3 = 0;
end

initial
begin
MEM[231:0] = 0;
MEM[166:160] = (CLKI_DIV - 1);
MEM[174:168] = (CLKFB_DIV - 1);
MEM[54:48] = (CLKOP_DIV - 1);
MEM[62:56] = (CLKOS_DIV - 1);
MEM[70:64] = (CLKOS2_DIV - 1);
MEM[78:72] = (CLKOS3_DIV - 1);


  if (PLLRST_ENA == "ENABLED")
  begin
     MEM[63] = 1'b1;
  end

  if (MRST_ENA == "ENABLED")
  begin
     MEM[71] = 1'b1;
  end

  if (DCRST_ENA == "ENABLED")
  begin
     MEM[95] = 1'b1;
  end

  if (DDRST_ENA == "ENABLED")
  begin
     MEM[103] = 1'b1;
  end

  if (CLKOP_ENABLE == "ENABLED")
  begin
     MEM[128] = 1'b1;
  end

  if (CLKOS_ENABLE == "ENABLED")
  begin
     MEM[129] = 1'b1;
  end

  if (CLKOS2_ENABLE == "ENABLED")
  begin
     MEM[130] = 1'b1;
  end

  if (CLKOS3_ENABLE == "ENABLED")
  begin
     MEM[131] = 1'b1;
  end

     MEM[82:80] = CLKOP_FPHASE;
     MEM[22:16] = CLKOP_CPHASE;

     MEM[86:84] = CLKOS_FPHASE;
     MEM[30:24] = CLKOS_CPHASE;

     MEM[90:88] = CLKOS2_FPHASE;
     MEM[38:32] = CLKOS2_CPHASE;

     MEM[94:92] = CLKOS3_FPHASE;
     MEM[46:40] = CLKOS3_CPHASE;

     CLKOP_FPHASE_DYN = CLKOP_FPHASE;
     CLKOP_CPHASE_DYN = CLKOP_CPHASE;
     CLKOS_FPHASE_DYN = CLKOS_FPHASE;
     CLKOS_CPHASE_DYN = CLKOS_CPHASE;
     CLKOS2_FPHASE_DYN = CLKOS2_FPHASE;
     CLKOS2_CPHASE_DYN = CLKOS2_CPHASE;
     CLKOS3_FPHASE_DYN = CLKOS3_FPHASE;
     CLKOS3_CPHASE_DYN = CLKOS3_CPHASE;

  if (FRACN_ENABLE == "ENABLED")
  begin
     MEM[47] = 1'b1;
  end
  else
  begin
     MEM[47] = 1'b0;
  end

     MEM[15:0] = FRACN_DIV;

  if (CLKOP_TRIM_POL == "RISING")
  begin
     MEM[127] = 1'b1;
  end
  else if (CLKOP_TRIM_POL == "FALLING")
  begin
     MEM[127] = 1'b0;
  end

MEM[126:124] = (CLKOP_TRIM_DELAY);

  if (CLKOS_TRIM_POL == "RISING")
  begin
     MEM[123] = 1'b1;
  end
  else if (CLKOS_TRIM_POL == "FALLING")
  begin
     MEM[123] = 1'b0;
  end
                                                                                                
MEM[122:120] = (CLKOS_TRIM_DELAY);

  if (VCO_BYPASS_A0 == "DISABLED")
  begin
     MEM[208] = 1'b1;
  end

  if (VCO_BYPASS_B0 == "DISABLED")
  begin
     MEM[209] = 1'b1;
  end

  if (VCO_BYPASS_C0 == "DISABLED")
  begin
     MEM[210] = 1'b1;
  end

  if (VCO_BYPASS_D0 == "DISABLED")
  begin
     MEM[211] = 1'b1;
  end

MEM[119:118] = (PREDIVIDER_MUXA1);
MEM[117:116] = (PREDIVIDER_MUXB1);
MEM[115:114] = (PREDIVIDER_MUXC1);
MEM[113:112] = (PREDIVIDER_MUXD1);

  if (OUTDIVIDER_MUXA2 == "DIVA")
  begin
     MEM[98:96] = 3'b000;
  end
  else if (OUTDIVIDER_MUXA2 == "DIVB")
  begin
     MEM[98:96] = 3'b001;
  end
  else if (OUTDIVIDER_MUXA2 == "DIVC")
  begin
     MEM[98:96] = 3'b010;
  end
  else if (OUTDIVIDER_MUXA2 == "DIVD")
  begin
     MEM[98:96] = 3'b011;
  end
  else if (OUTDIVIDER_MUXA2 == "REFCLK")
  begin
     MEM[98:96] = 3'b100;
  end

  if (OUTDIVIDER_MUXB2 == "DIVB")
  begin
     MEM[102:100] = 3'b000;
  end
  else if (OUTDIVIDER_MUXB2 == "DIVC")
  begin
     MEM[102:100] = 3'b001;
  end
  else if (OUTDIVIDER_MUXB2 == "DIVD")
  begin
     MEM[102:100] = 3'b010;
  end
  else if (OUTDIVIDER_MUXB2 == "DIVA")
  begin
     MEM[102:100] = 3'b011;
  end
  else if (OUTDIVIDER_MUXB2 == "REFCLK")
  begin
     MEM[102:100] = 3'b100;
  end

  if (OUTDIVIDER_MUXC2 == "DIVC")
  begin
     MEM[109:107] = 3'b000;
  end
  else if (OUTDIVIDER_MUXC2 == "DIVD")
  begin
     MEM[109:107] = 3'b001;
  end
  else if (OUTDIVIDER_MUXC2 == "DIVA")
  begin
     MEM[109:107] = 3'b010;
  end
  else if (OUTDIVIDER_MUXC2 == "DIVB")
  begin
     MEM[109:107] = 3'b011;
  end
  else if (OUTDIVIDER_MUXC2 == "REFCLK")
  begin
     MEM[109:107] = 3'b100;
  end

  if (OUTDIVIDER_MUXD2 == "DIVD")
  begin
     MEM[106:104] = 3'b000;
  end
  else if (OUTDIVIDER_MUXD2 == "DIVA")
  begin
     MEM[106:104] = 3'b001;
  end
  else if (OUTDIVIDER_MUXD2 == "DIVB")
  begin
     MEM[106:104] = 3'b010;
  end
  else if (OUTDIVIDER_MUXD2 == "DIVC")
  begin
     MEM[106:104] = 3'b011;
  end
  else if (OUTDIVIDER_MUXD2 == "REFCLK")
  begin
     MEM[106:104] = 3'b100;
  end

  if (STDBY_ENABLE == "ENABLED")
  begin
     MEM[79] = 1'b1;
  end

//  if (DPHASE_SOURCE == "DISABLED")
//  begin
     MEM[23] = 1'b0;
     #1
     MEM[23] = 1'b1;
     #5
     MEM[23] = 1'b0;
//   end
end


  always @(*)   // MUXA0
  begin
     if (MEM[208] == 1'b1)
        A0_OUT <= PHA;
     else if (MEM[208] == 1'b0)
        A0_OUT <= CLKIB;
  end

  always @(*)
  begin
     if (MEM[209] == 1'b1)
        B0_OUT <= PHB;
     else if (MEM[209] == 1'b0)
        B0_OUT <= CLKIB;
  end

  always @(*)
  begin
     if (MEM[210] == 1'b1)
        C0_OUT <= PHC;
     else if (MEM[210] == 1'b0)
        C0_OUT <= CLKIB;
  end

  always @(*)
  begin
     if (MEM[211] == 1'b1)
        D0_OUT <= PHD;
     else if (MEM[211] == 1'b0)
        D0_OUT <= CLKIB;
  end

// END MUXA0
// BEGIN MUXA1

  always @(*)
  begin
     if (MEM[119:118] == 2'b00)
        A1_OUT <= A0_OUT;
     else if (MEM[119:118] == 2'b01)
        A1_OUT <= DIVD_OUT_DEL;
     else if (MEM[119:118] == 2'b10)
        A1_OUT <= DIVB_OUT_DEL;
     else if (MEM[119:118] == 2'b11)
        A1_OUT <= DIVC_OUT_DEL;
  end

  always @(*)
  begin
     if (MEM[117:116] == 2'b00)
        B1_OUT <= B0_OUT;
     else if (MEM[117:116] == 2'b01)
        B1_OUT <= DIVA_OUT_DEL;
     else if (MEM[117:116] == 2'b10)
        B1_OUT <= DIVD_OUT_DEL;
     else if (MEM[117:116] == 2'b11)
        B1_OUT <= DIVC_OUT_DEL;
  end

  always @(*)
  begin
     if (MEM[115:114] == 2'b00)
        C1_OUT <= C0_OUT;
     else if (MEM[115:114] == 2'b01)
        C1_OUT <= DIVA_OUT_DEL;
     else if (MEM[115:114] == 2'b10)
        C1_OUT <= DIVB_OUT_DEL;
     else if (MEM[115:114] == 2'b11)
        C1_OUT <= DIVD_OUT_DEL;
  end

  always @(*)
  begin
     if (MEM[113:112] == 2'b00)
        D1_OUT <= D0_OUT;
     else if (MEM[113:112] == 2'b01)
        D1_OUT <= DIVA_OUT_DEL;
     else if (MEM[113:112] == 2'b10)
        D1_OUT <= DIVB_OUT_DEL;
     else if (MEM[113:112] == 2'b11)
        D1_OUT <= DIVC_OUT_DEL;
  end

// END MUXA1
// BEGIN MUXA2

  always @(*)
  begin
     if (MEM[98:96] == 3'b000)
        A2_OUT <= DIVA_OUT_DEL;
     else if (MEM[98:96] == 3'b001)
        A2_OUT <= DIVB_OUT_DEL;
     else if (MEM[98:96] == 3'b010)
        A2_OUT <= DIVC_OUT_DEL;
     else if (MEM[98:96] == 3'b011)
        A2_OUT <= DIVD_OUT_DEL;
     else if (MEM[98:96] == 3'b100)
        A2_OUT <= CLKIB;
  end

  always @(*)
  begin
     if (MEM[102:100] == 3'b000)
        B2_OUT <= DIVB_OUT_DEL;
     else if (MEM[102:100] == 3'b001)
        B2_OUT <= DIVC_OUT_DEL;
     else if (MEM[102:100] == 3'b010)
        B2_OUT <= DIVD_OUT_DEL;
     else if (MEM[102:100] == 3'b011)
        B2_OUT <= DIVA_OUT_DEL;
     else if (MEM[102:100] == 3'b100)
        B2_OUT <= CLKIB;
  end

  always @(*)
  begin
     if (MEM[109:107] == 3'b000)
        C2_OUT <= DIVC_OUT_DEL;
     else if (MEM[109:107] == 3'b001)
        C2_OUT <= DIVD_OUT_DEL;
     else if (MEM[109:107] == 3'b010)
        C2_OUT <= DIVA_OUT_DEL;
     else if (MEM[109:107] == 3'b011)
        C2_OUT <= DIVB_OUT_DEL;
     else if (MEM[109:107] == 3'b100)
        C2_OUT <= CLKIB;
  end

  always @(*)
  begin
     if (MEM[106:104] == 3'b000)
        D2_OUT <= DIVD_OUT_DEL;
     else if (MEM[106:104] == 3'b001)
        D2_OUT <= DIVA_OUT_DEL;
     else if (MEM[106:104] == 3'b010)
        D2_OUT <= DIVB_OUT_DEL;
     else if (MEM[106:104] == 3'b011)
        D2_OUT <= DIVC_OUT_DEL;
     else if (MEM[106:104] == 3'b100)
        D2_OUT <= CLKIB;
  end

// END MUXA2
// BEGIN CLOCK ENABLE

  always @(*)
  begin
     if (MEM[128] == 1'b0 && ENCLKOP == 1'b0)
        CLKOP_OUT <= 1'b0;
     else 
        CLKOP_OUT <= A2_OUT;
  end

  always @(*)
  begin
     if (MEM[129] == 1'b0 && ENCLKOS == 1'b0)
        CLKOS_OUT <= 1'b0;
     else
        CLKOS_OUT <= B2_OUT;
  end

  always @(*)
  begin
     if (MEM[130] == 1'b0 && ENCLKOS2 == 1'b0)
        CLKOS2_OUT <= 1'b0;
     else
        CLKOS2_OUT <= C2_OUT;
  end

  always @(*)
  begin
     if (MEM[131] == 1'b0 && ENCLKOS3 == 1'b0)
        CLKOS3_OUT <= 1'b0;
     else
        CLKOS3_OUT <= D2_OUT;
  end

// END CLOCK ENABLE

  always @(*)
  begin
    if (RSTB_NEW == 1'b1)
    begin
       assign index_diva = 0;
       assign index_divb = 0;
       assign index_divc = 0;
       assign index_divd = 0;
       assign index = 0.0;
       assign first_time_a = 1'b1;
       assign first_time_b = 1'b1;
       assign first_time_c = 1'b1;
       assign first_time_d = 1'b1;
       assign first_time7 = 1'b1;
    end
    else
    begin
       deassign index_diva;
       deassign index_divb;
       deassign index_divc;
       deassign index_divd;
       deassign index;
       deassign first_time_a;
       deassign first_time_b;
       deassign first_time_c;
       deassign first_time_d;
       deassign first_time7;
    end
  end

  always @(*)
  begin
    if (RESETCB_new == 1'b1)
    begin
       assign DIVC_OUT = 1'b0;
       assign DIVC_OUT_DEL = 1'b0;
    end
    else
    begin
       deassign DIVC_OUT;
       deassign DIVC_OUT_DEL;
    end
  end

  always @(*)
  begin
    if (RESETDB_new == 1'b1)
    begin
       assign DIVD_OUT = 1'b0;
       assign DIVD_OUT_DEL = 1'b0;
    end
    else
    begin
       deassign DIVD_OUT;
       deassign DIVD_OUT_DEL;
    end
  end

  always @(A1_OUT)
  begin
      if (first_time_a == 1'b1)
      begin
         if (A1_OUT === 1'b1)
         begin
            index_diva = 0;
            first_time_a = 1'b0;
            DIVA_OUT = 1'b1;
         end
      end
     else
     begin
        index_diva = index_diva + 1;
        if (index_diva == (MEM[54:48] + 1))
        begin
           DIVA_OUT = ~DIVA_OUT;
           index_diva = 0;
        end
     end
  end

  always @(B1_OUT)
  begin
      if (first_time_b == 1'b1)
      begin
         if (B1_OUT === 1'b1)
         begin
            index_divb = 0;
            first_time_b = 1'b0;
            DIVB_OUT = 1'b1;
         end
      end
     else
     begin
        index_divb = index_divb + 1;
        if (index_divb == (MEM[62:56] + 1))
        begin
           DIVB_OUT = ~DIVB_OUT;
           index_divb = 0;
        end
     end
  end

  always @(C1_OUT or posedge RESETCB_new)
  begin
     if (RESETCB_new == 1'b1)
     begin
        DIVC_OUT = 1'b0;
        first_time_c = 1'b1;
        index_divc = 0;
     end
     else if (first_time_c == 1'b1)
      begin
         if (C1_OUT === 1'b1)
         begin
            index_divc = 0;
            first_time_c = 1'b0;
            DIVC_OUT = 1'b1;
         end
      end
     else
     begin
        index_divc = index_divc + 1;
        if (index_divc == (MEM[70:64] + 1))
        begin
           DIVC_OUT = ~DIVC_OUT;
           index_divc = 0;
        end
     end
  end

  always @(D1_OUT or posedge RESETDB_new)
  begin
     if (RESETDB_new == 1'b1)
     begin
        DIVD_OUT = 1'b0;
        first_time_d = 1'b1;
        index_divd = 0;
     end
     else if (first_time_d == 1'b1)
      begin
         if (D1_OUT === 1'b1)
         begin
            index_divd = 0;
            first_time_d = 1'b0;
            DIVD_OUT = 1'b1;
         end
      end
     else
     begin
        index_divd = index_divd + 1;
        if (index_divd == (MEM[78:72] + 1))
        begin
           DIVD_OUT = ~DIVD_OUT;
           index_divd = 0;
        end
     end
  end

  always @(*)
  begin
     CLKFB_DIV_REG = MEM[174:168] + 1;
     CLKI_DIV_REG = MEM[166:160] + 1;
     CLKOP_DIV_REG = MEM[54:48] + 1;
     CLKOS_DIV_REG = MEM[62:56] + 1;
     CLKOS2_DIV_REG = MEM[70:64] + 1;
     CLKOS3_DIV_REG = MEM[78:72] + 1;

     if (FEEDBK_PATH == "CLKOP" || FEEDBK_PATH == "INT_DIVA" || FEEDBK_PATH == "USERCLOCK")
     begin
        net_divide1 = CLKOP_DIV_REG;
     end
     else if (FEEDBK_PATH == "CLKOS" || FEEDBK_PATH == "INT_DIVB")
     begin
        net_divide1 = CLKOS_DIV_REG;
     end
     else if (FEEDBK_PATH == "CLKOS2" || FEEDBK_PATH == "INT_DIVC")
     begin
        net_divide1 = CLKOS2_DIV_REG;
     end
     else if (FEEDBK_PATH == "CLKOS3" || FEEDBK_PATH == "INT_DIVD")
     begin
        net_divide1 = CLKOS3_DIV_REG;
     end
  end

  always @(*)
  begin
     if (MEM[47] == 1'b1)
     begin
        frac_value = MEM[15:0];
        net_divide <= net_divide1 * (CLKFB_DIV_REG + (frac_value / 65536));
     end
     else
     begin
        net_divide <= (CLKFB_DIV_REG * net_divide1);
     end
  end

// Measure the feedback delay value
                                                                                               
  initial
   begin
      first_int_edge = 0.0;
      first_fb_edge = 0.0;
      virtual_delay1 = 0.0;
       false_clk_first_time = 1'b0;
       fb_first_time = 1'b0;
       #1;
       false_clk_first_time = 1'b1;
       fb_first_time = 1'b1;
   end
                                                                                               
always @(posedge false_clk)
  begin
     if (false_clk_first_time == 1)
     first_int_edge=$realtime;
     false_clk_first_time = 1'b0;
  end
                                                                                               
always @(posedge FBB)
  begin
     if (fb_first_time == 1)
     begin
        first_fb_edge=$realtime;
        fb_first_time = 1'b0;
     end
  end

always @(FBB or CLKIB)
  begin
     total_fb_delay = first_fb_edge - first_int_edge;
     if ( (total_fb_delay > 0) && (t_in_clk > 0) )
     begin
        ratio1 = total_fb_delay / t_in_clk;
        virtual_delay1 = total_fb_delay - (t_in_clk * ratio1);
        real_delay1 = t_in_clk - virtual_delay1;
     end
end

  always @(posedge FBB)
  begin
     fb_count = fb_count + 1;
     if (fb_count == 6)
        clkop_first_time = 1'b0;
  end

  always @(posedge CLKIB)
   begin
   last_clock_edge=next_clock_edge;
   next_clock_edge=$realtime;

    if (last_clock_edge > 0)
        begin
        t_in_clk <= next_clock_edge - last_clock_edge;
        t_in_clk1 <= t_in_clk;
        t_in_clk2 <= t_in_clk1;
        t_in_clk3 <= t_in_clk2;
        end

    if (t_in_clk > 0)
        begin
         if ( ((t_in_clk - t_in_clk1) < 0.0001) && ((t_in_clk - t_in_clk1) > -0.0001) && ((t_in_clk1 - t_in_clk2) < 0.0001) && ((t_in_clk1 - t_in_clk2) > -0.0001) && ((t_in_clk2 - t_in_clk3) < 0.0001) && ((t_in_clk2 - t_in_clk3) > -0.0001))
           clock_valid <= 1;
         else
           clock_valid <= 0;
        end
                                                                                                
    if (t_in_clk > 0)
        begin
         if ( ((t_in_clk - t_in_clk1) < 0.0001) && ((t_in_clk - t_in_clk1) > -0.0001))
           clock_invalid <= 0;
         else
           clock_invalid <= 1;
        end

    if (t_in_clk > 0)
        begin
           t_vco = ((t_in_clk * CLKI_DIV_REG) / net_divide);
           ha_vco1 = (t_vco / 2);
           ha_clk_a = (ha_vco1 * (MEM[54:48] + 1));
           ha_clk_b = (ha_vco1 * (MEM[62:56] + 1));
           t_diva_clk = 2 * ha_clk_a;
           t_divb_clk = 2 * ha_clk_b;
           t_divc_clk = (t_vco * (MEM[70:64] + 1));
           t_divd_clk = (t_vco * (MEM[78:72] + 1));

           duty_vco1 = ((t_vco * duty_i) / 16);
           ha_vco_xprec = ha_vco1 * 100000; //convert to time precision (multiply by 1ns/10fs), take integer value
           ha_vco_sim = ha_vco_xprec / 100000.0; //time as it appears in simulation (with precision error)
           round_err = ((t_in_clk - ((ha_vco_sim * 2 * net_divide) / CLKI_DIV_REG)) / 2);
        end
   end
                                                                                                
// PHASE SHIFT
  always @ (*)
  begin
     if (DPHASE_SOURCE == "ENABLED")
     begin
        load_reg_en <= LOADREGB;
        phase_dir <= PHASEDIRB;
        phase_step <= PHASESTEPB;
        phase_sel <= PHASESELB;
     end
     else 
     begin
        load_reg_en <= MEM[23];
        phase_dir <= MEM[137];
        phase_step <= MEM[136];
        phase_sel <= MEM[139:138];
     end
  end

  always @ (posedge load_reg_en_op2)
  begin
     if (phase_sel == 2'b11)
        load_cnt_op <= load_cnt_op + 1;
  end

  always @ (posedge load_reg_en_os_2)
  begin
     if (phase_sel == 2'b00)
        load_cnt_os <= load_cnt_os + 1;
  end

  always @ (posedge load_reg_en_os2_2)
  begin
     if (phase_sel == 2'b01)
        load_cnt_os2 <= load_cnt_os2 + 1;
  end

  always @ (posedge load_reg_en_os3_2)
  begin
     if (phase_sel == 2'b10)
        load_cnt_os3 <= load_cnt_os3 + 1;
  end

  always @(*)
  begin
     if (RSTB_NEW == 1'b1)
     begin 
        step_p <= 0;
        step_s <= 0;
        step_s2<= 0;
        step_s3 <= 0;
//        step_n <= 0;
     end
     else
     begin 
        if (phase_sel == 2'b11)
        begin
           if (phase_step === 1'b0 && last_phase_step === 1'b1)
           begin
              if (phase_dir == 1'b0)
              begin
                 step_p <= step_p + 1;
              end
              else
              begin
                 step_p <= step_p - 1;
              end
           end
        end
        else if (phase_sel == 2'b00)
        begin
           if (phase_step === 1'b0 && last_phase_step === 1'b1)
           begin
              if (phase_dir == 1'b0)
              begin
                 step_s <= step_s + 1;
              end
              else
              begin
                 step_s <= step_s - 1;
              end
           end
        end
        else if (phase_sel == 2'b01)
        begin
           if (phase_step === 1'b0 && last_phase_step === 1'b1)
           begin
              if (phase_dir == 1'b0)
              begin
                 step_s2 <= step_s2 + 1;
              end
              else
              begin
                 step_s2 <= step_s2 - 1;
              end
           end
        end
        else if (phase_sel == 2'b10)
        begin
           if (phase_step === 1'b0 && last_phase_step === 1'b1)
           begin
              if (phase_dir == 1'b0)
              begin
                 step_s3 <= step_s3 + 1;
              end
              else
              begin
                 step_s3 <= step_s3 - 1;
              end
           end
        end
     end
  end

  always @(posedge DIVA_OUT)
  begin
      step_op <= step_p;
      step_op1 <= step_op;
      load_reg_en_op2 <= load_reg_en;
      load_reg_en_op1 <= load_reg_en_op2;
  end

  always @(negedge DIVA_OUT_DEL1)
  begin
      step_op2 <= step_op1;
      load_reg_en_op <= load_reg_en_op1;
  end

  always @(posedge DIVB_OUT)
  begin
      step_os <= step_s;
      step_os_1 <= step_os;
      load_reg_en_os_2 <= load_reg_en;
      load_reg_en_os_1 <= load_reg_en_os_2;
  end

  always @(negedge DIVB_OUT_DEL1)
  begin
      step_os_2 <= step_os_1;
      load_reg_en_os <= load_reg_en_os_1;
  end

  always @(posedge DIVC_OUT)
  begin
      step_os2 <= step_s2;
      step_os2_1 <= step_os2;
      load_reg_en_os2_2 <= load_reg_en;
      load_reg_en_os2_1 <= load_reg_en_os2_2;
  end

  always @(negedge DIVC_OUT_DEL)
  begin
      step_os2_2 <= step_os2_1;
      load_reg_en_os2 <= load_reg_en_os2_1;
  end

  always @(posedge DIVD_OUT)
  begin
      step_os3 <= step_s3;
      step_os3_1 <= step_os3;
      load_reg_en_os3_2 <= load_reg_en;
      load_reg_en_os3_1 <= load_reg_en_os3_2;
  end

  always @(negedge DIVD_OUT_DEL)
  begin
      step_os3_2 <= step_os3_1;
      load_reg_en_os3 <= load_reg_en_os3_1;
  end

  always @ (load_reg_en or posedge DIVA_OUT)
  begin
     if (load_reg_en == 1'b1 || load_count_op > 4)
        load_count_op = 0;
     else 
        load_count_op = load_count_op + 1; 
  end

  always @ (load_reg_en or posedge DIVB_OUT)
  begin
     if (load_reg_en == 1'b1 || load_count_os > 4)
        load_count_os = 0;
     else
        load_count_os = load_count_os + 1;
  end

  always @ (load_reg_en or posedge DIVC_OUT)
  begin
     if (load_reg_en == 1'b1 || load_count_os2 > 4)
        load_count_os2 = 0;
     else
        load_count_os2 = load_count_os2 + 1;
  end

  always @ (load_reg_en or posedge DIVD_OUT)
  begin
     if (load_reg_en == 1'b1 || load_count_os3 > 4)
        load_count_os3 = 0;
     else
        load_count_os3 = load_count_os3 + 1;
  end

  always @ (*) 
  begin
//     if (phase_sel == 2'b11)
//     begin
        if (t_diva_clk > 0)
        begin
           if (step_op2 >= 0)
           begin
              vco_ph_del_a <= ((CLKOP_FPHASE_DYN + step_op2) * t_diva_clk) / (8 * CLKOP_DIV_REG);   
           end
           else if (step_op2 < 0) 
           begin
              vco_ph_del_a <= t_diva_clk - (((CLKOP_FPHASE_DYN - step_op2) * t_diva_clk) / (8 * CLKOP_DIV_REG));   
           end
        end
//     end
//     else if (phase_sel == 2'b00)
//     begin
        if (t_divb_clk > 0)
        begin
           if (step_os_2 >= 0)
           begin
              vco_ph_del_b <= ((CLKOS_FPHASE_DYN + step_os_2) * t_divb_clk) / (8 * CLKOS_DIV_REG);
           end
           else if (step_os_2 < 0)
           begin
              vco_ph_del_b <= t_divb_clk - (((CLKOS_FPHASE_DYN - step_os_2) * t_divb_clk) / (8 * CLKOS_DIV_REG));
           end
        end
//     end
//     else if (phase_sel == 2'b01)
//     begin
        if (t_divc_clk > 0)
        begin
           if (step_os2_2 >= 0)
           begin
              vco_ph_del_c <= ((CLKOS2_FPHASE_DYN + step_os2_2) * t_divc_clk) / (8 * CLKOS2_DIV_REG);
           end
           else if (step_os2_2 < 0)
           begin
              vco_ph_del_c <= t_divc_clk - (((CLKOS2_FPHASE_DYN - step_os2_2) * t_divc_clk) / (8 * CLKOS2_DIV_REG));
           end
        end
//     end
//     else if (phase_sel == 2'b10)
//     begin
        if (t_divd_clk > 0)
        begin
           if (step_os3_2 >= 0)
           begin
              vco_ph_del_d <= ((CLKOS3_FPHASE_DYN + step_os3_2) * t_divd_clk) / (8 * CLKOS3_DIV_REG);
           end
           else if (step_os3_2 < 0)
           begin
              vco_ph_del_d <= t_divd_clk - (((CLKOS3_FPHASE_DYN - step_os3_2) * t_divd_clk) / (8 * CLKOS3_DIV_REG));
           end
        end
//     end
  end

  always @ (*)
  begin
   if ((load_reg_en_op === 1'b0 && last_load_reg_en_op === 1'b1) || (load_cnt_op == 1))
   begin
     if (t_diva_clk > 0)
     begin
        if ((CLKOP_DIV_REG - 1) > CLKOP_CPHASE_DYN)
        begin
           diva_ph_del <= t_diva_clk - ((((CLKOP_DIV_REG -1) - CLKOP_CPHASE_DYN) * t_diva_clk) / CLKOP_DIV_REG);
        end
        else if (CLKOP_CPHASE_DYN > (CLKOP_DIV_REG - 1))
        begin
           diva_ph_del <= (((CLKOP_CPHASE_DYN - (CLKOP_DIV_REG -1)) * t_diva_clk) / CLKOP_DIV_REG);
        end
        else
        begin
           diva_ph_del <= 0.0;
        end
     end
   end
  end

  always @ (*)
  begin
   if ((load_reg_en_os === 1'b0 && last_load_reg_en_os === 1'b1) || (load_cnt_os == 1))
   begin
     if (t_divb_clk > 0)
     begin
        if ((CLKOS_DIV_REG - 1)> CLKOS_CPHASE_DYN)
        begin
           divb_ph_del <= t_divb_clk - ((((CLKOS_DIV_REG - 1) - CLKOS_CPHASE_DYN) * t_divb_clk) / CLKOS_DIV_REG);
        end
        else if (CLKOS_CPHASE_DYN > (CLKOS_DIV_REG -1))
        begin
           divb_ph_del <= (((CLKOS_CPHASE_DYN - (CLKOS_DIV_REG - 1)) * t_divb_clk)/ CLKOS_DIV_REG);
        end
        else
        begin
           divb_ph_del <= 0.0;
        end
     end
   end
  end

  always @ (*)
  begin
   if ((load_reg_en_os2 === 1'b0 && last_load_reg_en_os2 === 1'b1) || (load_cnt_os2 == 1))
   begin
     if (t_divc_clk > 0)
     begin
        if ((CLKOS2_DIV_REG -1)> CLKOS2_CPHASE_DYN)
        begin
           divc_ph_del <= t_divc_clk - ((((CLKOS2_DIV_REG -1) - CLKOS2_CPHASE_DYN) * t_divc_clk) / CLKOS2_DIV_REG);
        end
        else if (CLKOS2_CPHASE_DYN > (CLKOS2_DIV_REG -1))
        begin
           divc_ph_del <= (((CLKOS2_CPHASE_DYN - (CLKOS2_DIV_REG -1)) * t_divc_clk) / CLKOS2_DIV_REG);
        end
        else
        begin
           divc_ph_del <= 0.0;
        end
     end
   end
  end

  always @ (*)
  begin
   if ((load_reg_en_os3 === 1'b0 && last_load_reg_en_os3 === 1'b1) || (load_cnt_os3 == 1))
   begin
     if (t_divd_clk > 0)
     begin
        if ((CLKOS3_DIV_REG -1) > CLKOS3_CPHASE_DYN)
        begin
           divd_ph_del <= t_divd_clk - ((((CLKOS3_DIV_REG -1) - CLKOS3_CPHASE_DYN) * t_divd_clk) / CLKOS3_DIV_REG);
        end
        else if (CLKOS3_CPHASE_DYN > (CLKOS3_DIV_REG -1))
        begin
           divd_ph_del <= (((CLKOS3_CPHASE_DYN - (CLKOS3_DIV_REG -1)) * t_divd_clk) / CLKOS3_DIV_REG);
        end
        else
        begin
           divd_ph_del <= 0.0;
        end
     end
   end
  end

//assign RSTB_NEW = RSTB | RESETMB | RESETCB | RESETDB;
assign RSTB_NEW = (MEM[63] & RSTB) | (MEM[71] & RESETMB);

always @ (posedge vco_clk)
begin
   if (MEM[95] == 1'b1)
   begin
       RESETCB_reg0 <= RESETCB;
       RESETCB_reg1 <= RESETCB_reg0;
       RESETCB_reg2 <= RESETCB_reg1;
   end

   if (MEM[103] == 1'b1)
   begin
      RESETDB_reg0 <= RESETDB;
      RESETDB_reg1 <= RESETDB_reg0;
      RESETDB_reg2 <= RESETDB_reg1;
   end
end

assign RESETCB_new = RESETCB | RESETCB_reg2;
assign RESETDB_new = RESETDB | RESETDB_reg2;

// LOCK GEN

always @(posedge RSTB_NEW)
begin
   d_lock <= 1'b0;
end

always @(posedge CLKIB)
begin
   if (d_lock == 1'b0 && RSTB_NEW == 1'b0)
   begin
       d_lock <= 1'b1;
   end
end
                                                                                                
always @(posedge CLKIB)
begin
       d1_lock <= d_lock;
end
                                                                                                
always @(posedge CLKIB)
begin
       d3_lock <= d1_lock;
end
                                                                                                
always @(d1_lock or d_lock)
begin
       d2_lock <= d_lock & d1_lock;
end
                                                                                                
always @(d1_lock or d_lock or d3_lock)
begin
       d4_lock <= d_lock & d1_lock & d3_lock;
end

  always @(intfb_out)
  begin
     if (out_clk_valid == 1'b0)
        vir_lock <= 1'b0;
     else if (out_clk_valid == 1'b1)
        vir_lock <= 1'b1;
  end

  always @(RSTB_NEW or vir_lock or clock_invalid or out_clk_valid)
   begin
    if (RSTB_NEW == 1)
     lock_all <= 0;
    else
    begin
     if (clock_invalid == 1)
      lock_all <= 0;
     else
      if (out_clk_valid == 1)
      lock_all <= #(PLL_LOCK_DELAY * lock_delay_reg) vir_lock;
    end
   end

//

  always @(posedge CLKIB or posedge RSTB_NEW or negedge d_lock)
  begin
     if (RSTB_NEW == 1'b1 || d_lock == 1'b0)
        out_clk_valid <= 1'b0;
     else
        out_clk_valid <= clock_valid;
  end

  always @(out_clk_valid or intfb_out)
  begin
     if (out_clk_valid == 1'b0)
     begin
        intfb_out <= 1'b0;
        first_time7 <= 1'b1;
        index = 0.0;
     end
     else
     begin
        if (first_time7 == 1'b1)
        begin
           intfb_out <= 1'b1;
           first_time7 <= 1'b0;
           index = 0.0;
        end
        else
        begin
           index = index + 1.0;
           if (index >= net_divide)
           begin
              intfb_out <= #(ha_vco1 + round_err) ~intfb_out;
              index = 0.0;
           end
           else
              intfb_out <= #ha_vco1 ~intfb_out;
        end
     end
  end

// P11 internal feedback clockout

  always @(*)
  begin
     if (MEM[126:124] != 3'b000)
     begin
        ha_clk_a_trim <= (0.07*MEM[126:124]);
     end
  end

  always @(*)
  begin
     if (MEM[122:120] != 3'b000)
     begin
        ha_clk_b_trim <= (0.07*MEM[122:120]);
     end
  end

  always @(intfb_out)
  begin
      if (FEEDBK_PATH == "INT_DIVA" || FEEDBK_PATH == "INT_DIVB" || FEEDBK_PATH == "INT_DIVC" || FEEDBK_PATH == "INT_DIVD")
         vco_clk <= intfb_out;
      else 
         vco_clk <= #real_delay1 intfb_out;
  end

  always @(vco_clk)
  begin
     vco_clk_a <= vco_clk;
  end

  always @(vco_clk)
  begin
     vco_clk_b <= vco_clk;
  end

  always @(vco_clk or vco_clk_a or vco_clk_b)
  begin
//      PHA <= #vco_ph_del_a vco_clk_a;
      PHA <= vco_clk_a;
      PHB <= vco_clk_b;
      PHC <= vco_clk;
      PHD <= vco_clk;
  end

  always @(DIVA_OUT)
  begin
      DIVA_OUT_DEL2 <= #(vco_ph_del_a) DIVA_OUT;
  end

  always @ (*)
  begin
     if (load_reg_en_op === 1'b0 && last_load_reg_en_op === 1'b1)
     begin
        op_ph_del <= load_cnt_op * diva_ph_del;
     end
  end

  always @(DIVA_OUT_DEL2)
  begin
     if (load_cnt_op == 1)
     begin
        DIVA_OUT_DEL1 <= #(diva_ph_del) DIVA_OUT_DEL2;
     end
     else 
     begin
        DIVA_OUT_DEL1 <= #(op_ph_del) DIVA_OUT_DEL2;
     end
  end

  always @(DIVB_OUT)
  begin
      DIVB_OUT_DEL2 <= #(vco_ph_del_b) DIVB_OUT;
  end

  always @ (*)
  begin
     if (load_reg_en_os === 1'b0 && last_load_reg_en_os === 1'b1)
     begin
        os_ph_del <= load_cnt_os * divb_ph_del;
     end
  end

  always @(DIVB_OUT_DEL2)
  begin
     if (load_cnt_os == 1)
     begin
        DIVB_OUT_DEL1 <= #(divb_ph_del) DIVB_OUT_DEL2;
     end
     else 
     begin
        DIVB_OUT_DEL1 <= #(os_ph_del) DIVB_OUT_DEL2;
     end
  end

  always @(DIVC_OUT)
  begin
      DIVC_OUT_DEL2 <= #(vco_ph_del_c) DIVC_OUT;
  end

  always @ (*)
  begin
     if (load_reg_en_os2 === 1'b0 && last_load_reg_en_os2 === 1'b1)
     begin
        os2_ph_del <= load_cnt_os2 * divc_ph_del;
     end
  end

  always @(DIVC_OUT_DEL2)
  begin
     if (load_cnt_os2 == 1)
     begin
        DIVC_OUT_DEL <= #(divc_ph_del) DIVC_OUT_DEL2;
     end
     else 
     begin
        DIVC_OUT_DEL <= #(os2_ph_del) DIVC_OUT_DEL2;
     end
  end

  always @(DIVD_OUT)
  begin
      DIVD_OUT_DEL2 <= #(vco_ph_del_d) DIVD_OUT;
  end

  always @ (*)
  begin
     if (load_reg_en_os3 === 1'b0 && last_load_reg_en_os3 === 1'b1)
     begin
        os3_ph_del <= load_cnt_os3 * divd_ph_del;
     end
  end

  always @(DIVD_OUT_DEL2)
  begin
     if (load_cnt_os3 == 1)
     begin
        DIVD_OUT_DEL <= #(divd_ph_del) DIVD_OUT_DEL2;
     end
     else 
     begin
        DIVD_OUT_DEL <= #(os3_ph_del) DIVD_OUT_DEL2;
     end
  end

  always @(DIVA_OUT_DEL1)
  begin
     if (MEM[127] == 1'b1)
     begin
        if (DIVA_OUT_DEL1 == 1'b1 && DIVA_OUT_DEL1_last == 1'b0)
        begin
           DIVA_OUT_DEL <= #(ha_clk_a_trim) DIVA_OUT_DEL1;
        end
        else if (DIVA_OUT_DEL1 == 1'b0 && DIVA_OUT_DEL1_last == 1'b1)
        begin
           DIVA_OUT_DEL <= DIVA_OUT_DEL1;
        end
     end
     else if (MEM[127] == 1'b0)
     begin
        if (DIVA_OUT_DEL1 == 1'b0 && DIVA_OUT_DEL1_last == 1'b1)
        begin
           DIVA_OUT_DEL <= #(ha_clk_a_trim) DIVA_OUT_DEL1;
        end
        else if (DIVA_OUT_DEL1 == 1'b1 && DIVA_OUT_DEL1_last == 1'b0)
        begin
           DIVA_OUT_DEL <= DIVA_OUT_DEL1;
        end
     end
  end

  always @(DIVB_OUT_DEL1)
  begin
     if (MEM[123] == 1'b1)
     begin
        if (DIVB_OUT_DEL1 == 1'b1 && DIVB_OUT_DEL1_last == 1'b0)
        begin
           DIVB_OUT_DEL <= #(ha_clk_b_trim) DIVB_OUT_DEL1;
        end
        else if (DIVB_OUT_DEL1 == 1'b0 && DIVB_OUT_DEL1_last == 1'b1)
        begin
           DIVB_OUT_DEL <= DIVB_OUT_DEL1;
        end
     end
     else if (MEM[123] == 1'b0)
     begin
        if (DIVB_OUT_DEL1 == 1'b0 && DIVB_OUT_DEL1_last == 1'b1)
        begin
           DIVB_OUT_DEL <= #(ha_clk_b_trim) DIVB_OUT_DEL1;
        end
        else if (DIVB_OUT_DEL1 == 1'b1 && DIVB_OUT_DEL1_last == 1'b0)
        begin
           DIVB_OUT_DEL <= DIVB_OUT_DEL1;
        end
     end
  end

  always @ (RSTB_NEW or CLKOP_OUT or false_clk or CLKOS_OUT or CLKOS2_OUT or CLKOS3_OUT or lock_all)
  begin
     if (MEM[98:96] == 3'b100) 
     begin
        if (RSTB_NEW == 1'b1)
        begin
           CLKOPREG <= 1'b0;
        end
        else
        begin
           CLKOPREG <= CLKOP_OUT;
        end  
     end
     else
     begin
        if (clkop_first_time == 1'b1)
        begin
           CLKOPREG <= false_clk;
        end
        else if (RSTB_NEW == 1'b1)
        begin
           CLKOPREG <= 1'b0;
        end
        else if (out_clk_valid == 1'b1)
        begin
           CLKOPREG <= CLKOP_OUT;
        end
     end

     if (MEM[102:100] == 3'b100)
     begin
        if (RSTB_NEW == 1'b1)
        begin
           CLKOSREG <= 1'b0;
        end
        else
        begin
           CLKOSREG <= CLKOS_OUT;
        end
     end
     else
     begin
        if (clkop_first_time == 1'b1)
        begin
           CLKOSREG <= false_clk;
        end
        else if (RSTB_NEW == 1'b1)
        begin
           CLKOSREG <= 1'b0;
        end
        else if (out_clk_valid == 1'b1)
        begin
           CLKOSREG <= CLKOS_OUT;
        end
     end

     if (MEM[109:107] == 3'b100)
     begin
        if (RSTB_NEW == 1'b1)
        begin
           CLKOS2REG <= 1'b0;
        end
        else
        begin
           CLKOS2REG <= CLKOS2_OUT;
        end
     end
     else
     begin
        if (clkop_first_time == 1'b1)
        begin
           CLKOS2REG <= false_clk;
        end
        else if (RSTB_NEW == 1'b1)
        begin
           CLKOS2REG <= 1'b0;
        end
        else if (out_clk_valid == 1'b1)
        begin
           CLKOS2REG <= CLKOS2_OUT;
        end
     end

     if (MEM[106:104] == 3'b100)
     begin
        if (RSTB_NEW == 1'b1)
        begin
           CLKOS3REG <= 1'b0;
        end
        else
        begin
           CLKOS3REG <= CLKOS3_OUT;
        end
     end
     else
     begin
        if (clkop_first_time == 1'b1)
        begin
           CLKOS3REG <= false_clk;
        end
        else if (RSTB_NEW == 1'b1)
        begin
           CLKOS3REG <= 1'b0;
        end
        else if (out_clk_valid == 1'b1)
        begin
           CLKOS3REG <= CLKOS3_OUT;
        end
     end

     if (clkop_first_time == 1'b1)
     begin
        LOCKREG <= 1'b0;
     end
     else if (RSTB_NEW == 1'b1)
     begin
        LOCKREG <= 1'b0;
     end
     else if (out_clk_valid == 1'b1)
     begin
        LOCKREG <= lock_all;
     end
  end

  always@(LOCKREG or d4_lock)
  begin
     LOCKREG1 <= LOCKREG & d4_lock;
  end

  always@(*)
  begin
     if (PLL_LOCK_MODE == 2)
     begin
        if (RSTB_NEW == 1'b1)
        begin
           LOCKREG2 <= LOCKREG1;
        end
        else
        begin 
           LOCKREG2 <= LOCKREG1 | LOCKREG2;
        end
     end
     else 
     begin
        LOCKREG2 <= LOCKREG1;
     end
  end

  always@(*)
  begin
     if (MEM[79] == 1'b1)
     begin
        if (INTFB_WAKE == "ENABLED")
        begin
           if (STDBY == 1'b1 && PLLWAKESYNC == 1'b0)
           begin
              INTLOCKREG <= 1'b0;
              LOCKREG3 <= 1'b0;
           end
           else if (STDBY == 1'b0 && PLLWAKESYNC == 1'b1)
           begin
              if (INTLOCKREG == 1'b1)
              begin
                 LOCKREG3 <= #(PLL_LOCK_DELAY) LOCKREG2;
              end
           end
           else if (STDBY == 1'b0 && PLLWAKESYNC == 1'b0)
           begin
              INTLOCKREG <= LOCKREG2;
              LOCKREG3 <= 1'b0;
           end
           else if (STDBY == 1'b1 && PLLWAKESYNC == 1'b1)
           begin
              INTLOCKREG <= LOCKREG2;
              LOCKREG3 <= LOCKREG2;
           end
        end
        else
        begin
           if (STDBY == 1'b1)
           begin
              INTLOCKREG <= 1'b0;
              LOCKREG3 <= 1'b0;
           end
           else if (STDBY == 1'b0)
           begin
              INTLOCKREG <= LOCKREG2;
              LOCKREG3 <= LOCKREG2;
           end
        end
     end
     else
     begin
        LOCKREG3 <= LOCKREG2;
        INTLOCKREG <= LOCKREG2;
     end
  end

  always @(CLKOPREG)
  begin
     if (clkop_first_time == 1'b1)
        CLKOPREG1 <= CLKOPREG;
     else if ((MEM[79] == 1'b1) && LOCKREG3 == 1'b0 && STDBY == 1'b1)
        CLKOPREG1 <= 1'b0;
     else
        CLKOPREG1 <= CLKOPREG;
  end

  always @(CLKOSREG)
  begin
     if (clkop_first_time == 1'b1)
        CLKOSREG1 <= CLKOSREG;
     else if ((MEM[79] == 1'b1) && LOCKREG3 == 1'b0 && STDBY == 1'b1)
        CLKOSREG1 <= 1'b0;
     else
        CLKOSREG1 <= CLKOSREG;
  end

  always @(CLKOS2REG)
  begin
     if (clkop_first_time == 1'b1)
        CLKOS2REG1 <= CLKOS2REG;
     else if ((MEM[79] == 1'b1) && LOCKREG3 == 1'b0 && STDBY == 1'b1)
        CLKOS2REG1 <= 1'b0;
     else
        CLKOS2REG1 <= CLKOS2REG;
  end

  always @(CLKOS3REG)
  begin
     if (clkop_first_time == 1'b1)
        CLKOS3REG1 <= CLKOS3REG;
     else if ((MEM[79] == 1'b1) && LOCKREG3 == 1'b0 && STDBY == 1'b1)
        CLKOS3REG1 <= 1'b0;
     else
        CLKOS3REG1 <= CLKOS3REG;
  end

always @(posedge PLLCLKB)
begin
    wb_ack <= PLLSTBB & ~PLLRSTB;
end
 
assign PLLACKB = wb_ack & PLLSTBB & ~PLLRSTB;

always @(posedge PLLCLKB)
begin
   if (PLLWEB == 1'b1)
      pll_wdata <= PLLDATIB;
end

assign wrena = PLLWEB & PLLSTBB & ~PLLRSTB;

//always @(posedge PLLCLKB)
//begin
//   if (wrena == 1'b1)
assign pll_addr = PLLADDRB;
//end

always @(posedge PLLCLKB)
begin
   if (PLLSTBB & ~PLLWEB & ~PLLRSTB)
      wb_dat <= muxdat;
   else
      wb_dat <= 0;
end

assign PLLDATOB = (PLLSTBB) ? wb_dat : 0;

always @(*)
begin
   if (wrena == 1'b1)
   begin
   case (pll_addr)
      8'h00 : begin MEM[7:0] <= pll_wdata; end
      8'h01 : begin MEM[15:8] <= pll_wdata; end
      8'h02 : begin MEM[23:16] <= pll_wdata; end
      8'h03 : begin MEM[31:24] <= pll_wdata; end
      8'h04 : begin MEM[39:32] <= pll_wdata; end
      8'h05 : begin MEM[47:40] <= pll_wdata; end
      8'h06 : begin MEM[55:48] <= pll_wdata; end
      8'h07 : begin MEM[63:56] <= pll_wdata; end
      8'h08 : begin MEM[71:64] <= pll_wdata; end
      8'h09 : begin MEM[79:72] <= pll_wdata; end
      8'h0a : begin MEM[87:80] <= pll_wdata; end
      8'h0b : begin MEM[95:88] <= pll_wdata; end
      8'h0c : begin MEM[103:96] <= pll_wdata; end
      8'h0d : begin MEM[111:104] <= pll_wdata; end
      8'h0e : begin MEM[119:112] <= pll_wdata; end
      8'h0f : begin MEM[127:120] <= pll_wdata; end
      8'h10 : begin MEM[135:128] <= pll_wdata; end
      8'h11 : begin MEM[143:136] <= pll_wdata; end
      8'h12 : begin MEM[151:144] <= pll_wdata; end
      8'h13 : begin MEM[159:152] <= pll_wdata; end
      8'h14 : begin MEM[167:160] <= pll_wdata; end
      8'h15 : begin MEM[175:168] <= pll_wdata; end
      8'h16 : begin MEM[183:176] <= pll_wdata; end
      8'h17 : begin MEM[191:184] <= pll_wdata; end
      8'h18 : begin MEM[199:192] <= pll_wdata; end
      8'h19 : begin MEM[207:200] <= pll_wdata; end
      8'h1a : begin MEM[215:208] <= pll_wdata; end
      8'h1b : begin MEM[223:216] <= pll_wdata; end
   endcase
   end   

   if (LOCKREG3 == 1'b1)
      MEM[224] <= 1'b1;
   else
      MEM[224] <= 1'b0;
end   


always @(*)
begin
   case (pll_addr)
      8'h00 : begin muxdat <= MEM[7:0] ; end
      8'h01 : begin muxdat <= MEM[15:8]  ; end
      8'h02 : begin muxdat <= MEM[23:16]  ; end
      8'h03 : begin muxdat <= MEM[31:24]  ; end
      8'h04 : begin muxdat <= MEM[39:32]  ; end
      8'h05 : begin muxdat <= MEM[47:40]  ; end
      8'h06 : begin muxdat <= MEM[55:48]  ; end
      8'h07 : begin muxdat <= MEM[63:56]  ; end
      8'h08 : begin muxdat <= MEM[71:64]  ; end
      8'h09 : begin muxdat <= MEM[79:72]  ; end
      8'h0a : begin muxdat <= MEM[87:80]  ; end
      8'h0b : begin muxdat <= MEM[95:88]  ; end
      8'h0c : begin muxdat <= MEM[103:96]  ; end
      8'h0d : begin muxdat <= MEM[111:104]  ; end
      8'h0e : begin muxdat <= MEM[119:112]  ; end
      8'h0f : begin muxdat <= MEM[127:120]  ; end
      8'h10 : begin muxdat <= MEM[135:128]  ; end
      8'h11 : begin muxdat <= MEM[143:136]  ; end
      8'h12 : begin muxdat <= MEM[151:144]  ; end
      8'h13 : begin muxdat <= MEM[159:152]  ; end
      8'h14 : begin muxdat <= MEM[167:160]  ; end
      8'h15 : begin muxdat <= MEM[175:168]  ; end
      8'h16 : begin muxdat <= MEM[183:176]  ; end
      8'h17 : begin muxdat <= MEM[191:184]  ; end
      8'h18 : begin muxdat <= MEM[199:192]  ; end
      8'h19 : begin muxdat <= MEM[207:200]  ; end
      8'h1a : begin muxdat <= MEM[215:208]  ; end
      8'h1b : begin muxdat <= MEM[223:216]  ; end
      8'h1c : begin muxdat <= MEM[231:224]  ; end
   endcase
end

endmodule
`endcelldefine
