#log _circuit_name.v

#define -r SLASH2 //
#define -r STARTCOM /*
#define -r ENDCOM */
#define SYNPQUOTE "
#macro converter1(arg1,arg2)
#define arg2 arg1##.txt
#endmacro
#if _freq == "LOW" 
#define _MC1_SEL_WIDTH 0
#elif _freq == "MED" || _freq == "HIGH"
#define _MC1_SEL_WIDTH 1
#endif
#if _gsr == "DISABLED" 
#define _MC1_GSRN_EN 0
#elif _gsr == "ENABLED"
#define _MC1_GSRN_EN 1
#endif
#if _freq == "LOW" || _freq == "MED"
#define _MC1_REFLOCK_ACC 00
#elif _freq == "HIGH"
#define _MC1_REFLOCK_ACC 01
#endif
#if _refclk_src == "EDGE" 
#define _MC1_REFCLK_SEL 0
#elif _refclk_src == "PRIMARY"
#define _MC1_REFCLK_SEL 1
#endif
#if _bus_width == 1 
#define _MC1_OUTPUT_WIDTH_ADC 00
#define _MC1_OUTPUT_WIDTH_BEF 00
#elif _bus_width == 2
#define _MC1_OUTPUT_WIDTH_ADC 01
#define _MC1_OUTPUT_WIDTH_BEF 01
#elif _bus_width == 4
#define _MC1_OUTPUT_WIDTH_ADC 11
#define _MC1_OUTPUT_WIDTH_BEF 11
#endif

#converter1(_circuit_name, _circuit_name_new)
`timescale 1ns / 1 ps

module _circuit_name (
  refclk,
  rstn,
  force_lock,
  master_hold,
#if _num_slave_grps == 1 || _num_slave_grps == 2 || _num_slave_grps == 3 || _num_slave_grps == 4 || _num_slave_grps == 5 || _num_slave_grps == 6
  din_a0,
  din_a1,
  din_a2,
  dout_a0,
  dout_a1,
  dout_a2,
  clkout_a0,
  clkout_a1,
  clkout_a2,
  locked_a0,
  locked_a1,
  locked_a2,
  clkin_a_p,
  rstn_a0,
  rstn_a1,
  rstn_a2,
#endif

#if _num_slave_grps == 2 || _num_slave_grps == 3 || _num_slave_grps == 4 || _num_slave_grps == 5 || _num_slave_grps == 6
  din_b0,
  din_b1,
  din_b2,
  dout_b0,
  dout_b1,
  dout_b2,
  clkout_b0,
  clkout_b1,
  clkout_b2,
  locked_b0,
  locked_b1,
  locked_b2,
  clkin_b_p,
  rstn_b0,
  rstn_b1,
  rstn_b2,
#endif

#if _num_slave_grps == 3 || _num_slave_grps == 4 || _num_slave_grps == 5 || _num_slave_grps == 6
  din_c0,
  din_c1,
  din_c2,
  dout_c0,
  dout_c1,
  dout_c2,
  clkout_c0,
  clkout_c1,
  clkout_c2,
  locked_c0,
  locked_c1,
  locked_c2,
  clkin_c_p,
  rstn_c0,
  rstn_c1,
  rstn_c2,
#endif

#if _num_slave_grps == 4 || _num_slave_grps == 5 || _num_slave_grps == 6
  din_d0,
  din_d1,
  din_d2,
  dout_d0,
  dout_d1,
  dout_d2,
  clkout_d0,
  clkout_d1,
  clkout_d2,
  locked_d0,
  locked_d1,
  locked_d2,
  clkin_d_p,
  rstn_d0,
  rstn_d1,
  rstn_d2,
#endif

#if _num_slave_grps == 5 || _num_slave_grps == 6
  din_e0,
  din_e1,
  din_e2,
  dout_e0,
  dout_e1,
  dout_e2,
  clkout_e0,
  clkout_e1,
  clkout_e2,
  locked_e0,
  locked_e1,
  locked_e2,
  clkin_e_p,
  rstn_e0,
  rstn_e1,
  rstn_e2,
#endif

#if _num_slave_grps == 6
  din_f0,
  din_f1,
  din_f2,
  dout_f0,
  dout_f1,
  dout_f2,
  clkout_f0,
  clkout_f1,
  clkout_f2,
  locked_f0,
  locked_f1,
  locked_f2,
  clkin_f_p,
  rstn_f0,
  rstn_f1,
  rstn_f2,
#endif
  master_locked);

input        refclk;
input        rstn;
input        force_lock;
input        master_hold;
output       master_locked;
#if _num_slave_grps == 1 || _num_slave_grps == 2 || _num_slave_grps == 3 || _num_slave_grps == 4 || _num_slave_grps == 5 || _num_slave_grps == 6
input        din_a0;
input        din_a1;
input        din_a2;
#if _bus_width == 1
output       dout_a0;
#elif _bus_width == 2
output [1:0] dout_a0;
#elif _bus_width == 4
output [3:0] dout_a0;
#endif
#if _bus_width == 1
output       dout_a1;
#elif _bus_width == 2
output [1:0] dout_a1;
#elif _bus_width == 4
output [3:0] dout_a1;
#endif
#if _bus_width == 1
output       dout_a2;
#elif _bus_width == 2
output [1:0] dout_a2;
#elif _bus_width == 4
output [3:0] dout_a2;
#endif
output       clkout_a0;
output       clkout_a1;
output       clkout_a2;
output       locked_a0;
output       locked_a1;
output       locked_a2;
input        clkin_a_p;
input        rstn_a0;
input        rstn_a1;
input        rstn_a2;
#endif

#if _num_slave_grps == 2 || _num_slave_grps == 3 || _num_slave_grps == 4 || _num_slave_grps == 5 || _num_slave_grps == 6
input        din_b0;
input        din_b1;
input        din_b2;
#if _bus_width == 1
output       dout_b0;
#elif _bus_width == 2
output [1:0] dout_b0;
#elif _bus_width == 4
output [3:0] dout_b0;
#endif
#if _bus_width == 1
output       dout_b1;
#elif _bus_width == 2
output [1:0] dout_b1;
#elif _bus_width == 4
output [3:0] dout_b1;
#endif
#if _bus_width == 1
output       dout_b2;
#elif _bus_width == 2
output [1:0] dout_b2;
#elif _bus_width == 4
output [3:0] dout_b2;
#endif
output       clkout_b0;
output       clkout_b1;
output       clkout_b2;
output       locked_b0;
output       locked_b1;
output       locked_b2;
input        clkin_b_p;
input        rstn_b0;
input        rstn_b1;
input        rstn_b2;
#endif

#if _num_slave_grps == 3 || _num_slave_grps == 4 || _num_slave_grps == 5 || _num_slave_grps == 6
input        din_c0;
input        din_c1;
input        din_c2;
#if _bus_width == 1
output       dout_c0;
#elif _bus_width == 2
output [1:0] dout_c0;
#elif _bus_width == 4
output [3:0] dout_c0;
#endif
#if _bus_width == 1
output       dout_c1;
#elif _bus_width == 2
output [1:0] dout_c1;
#elif _bus_width == 4
output [3:0] dout_c1;
#endif
#if _bus_width == 1
output       dout_c2;
#elif _bus_width == 2
output [1:0] dout_c2;
#elif _bus_width == 4
output [3:0] dout_c2;
#endif
output       clkout_c0;
output       clkout_c1;
output       clkout_c2;
output       locked_c0;
output       locked_c1;
output       locked_c2;
input        clkin_c_p;
input        rstn_c0;
input        rstn_c1;
input        rstn_c2;
#endif

#if _num_slave_grps == 4 || _num_slave_grps == 5 || _num_slave_grps == 6
input        din_d0;
input        din_d1;
input        din_d2;
#if _bus_width == 1
output       dout_d0;
#elif _bus_width == 2
output [1:0] dout_d0;
#elif _bus_width == 4
output [3:0] dout_d0;
#endif
#if _bus_width == 1
output       dout_d1;
#elif _bus_width == 2
output [1:0] dout_d1;
#elif _bus_width == 4
output [3:0] dout_d1;
#endif
#if _bus_width == 1
output       dout_d2;
#elif _bus_width == 2
output [1:0] dout_d2;
#elif _bus_width == 4
output [3:0] dout_d2;
#endif
output       clkout_d0;
output       clkout_d1;
output       clkout_d2;
output       locked_d0;
output       locked_d1;
output       locked_d2;
input        clkin_d_p;
input        rstn_d0;
input        rstn_d1;
input        rstn_d2;
#endif

#if _num_slave_grps == 5 || _num_slave_grps == 6
input        din_e0;
input        din_e1;
input        din_e2;
#if _bus_width == 1
output       dout_e0;
#elif _bus_width == 2
output [1:0] dout_e0;
#elif _bus_width == 4
output [3:0] dout_e0;
#endif
#if _bus_width == 1
output       dout_e1;
#elif _bus_width == 2
output [1:0] dout_e1;
#elif _bus_width == 4
output [3:0] dout_e1;
#endif
#if _bus_width == 1
output       dout_e2;
#elif _bus_width == 2
output [1:0] dout_e2;
#elif _bus_width == 4
output [3:0] dout_e2;
#endif
output       clkout_e0;
output       clkout_e1;
output       clkout_e2;
output       locked_e0;
output       locked_e1;
output       locked_e2;
input        clkin_e_p;
input        rstn_e0;
input        rstn_e1;
input        rstn_e2;
#endif

#if  _num_slave_grps == 6
input        din_f0;
input        din_f1;
input        din_f2;
#if _bus_width == 1
output       dout_f0;
#elif _bus_width == 2
output [1:0] dout_f0;
#elif _bus_width == 4
output [3:0] dout_f0;
#endif
#if _bus_width == 1
output       dout_f1;
#elif _bus_width == 2
output [1:0] dout_f1;
#elif _bus_width == 4
output [3:0] dout_f1;
#endif
#if _bus_width == 1
output       dout_f2;
#elif _bus_width == 2
output [1:0] dout_f2;
#elif _bus_width == 4
output [3:0] dout_f2;
#endif
output       clkout_f0;
output       clkout_f1;
output       clkout_f2;
output       locked_f0;
output       locked_f1;
output       locked_f2;
input        clkin_f_p;
input        rstn_f0;
input        rstn_f1;
input        rstn_f2;
#endif

   wire  fpsc_vlo;

   VLO fpsc_vlo_inst (.Z(fpsc_vlo));

//synopsys translate_off
defparam LSCDR_INST.MIB_MEM = "0s0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000111111110010 ##_MC1_OUTPUT_WIDTH_BEF##0100111111010000000000000000000000111111110010 ##_MC1_OUTPUT_WIDTH_ADC##01001111111100000000 ##_MC1_REFCLK_SEL##0 ##_MC1_REFLOCK_ACC##_MC1_GSRN_EN##_MC1_SEL_WIDTH";
//synopsys translate_on

LSCDR LSCDR_INST (
 .RSTN(rstn),
#if _refclk_src == "EDGE"
 .REFCLK_EDGE(refclk),
 .REFCLK_PRIM(fpsc_vlo),
#elif _refclk_src == "PRIMARY"
 .REFCLK_EDGE(fpsc_vlo),
 .REFCLK_PRIM(refclk),
#endif
 .FORCE_LOCK(force_lock),
 .MASTER_HOLD(master_hold),
 .MASTER_LOCK(master_locked),
#if _num_slave_grps == 1 || _num_slave_grps == 2 || _num_slave_grps == 3 || _num_slave_grps == 4 || _num_slave_grps == 5 || _num_slave_grps == 6
 .DIN_A0_CIB(din_a0),
 .DIN_A1_CIB(din_a1),
 .DIN_A2_CIB(din_a2),
 .DOUT_A0(dout_a0),
 .DOUT_A1(dout_a1),
 .DOUT_A2(dout_a2),
 .CLKOUT_A0(clkout_a0),
 .CLKOUT_A1(clkout_a1),
 .CLKOUT_A2(clkout_a2),
 .LOCKED_A0(locked_a0),
 .LOCKED_A1(locked_a1),
 .LOCKED_A2(locked_a2),
 .CLKIN_A_P(clkin_a_p),
 .RSTN_A0(rstn_a0),
 .RSTN_A1(rstn_a1),
 .RSTN_A2(rstn_a2),
#else
 .DIN_A0_CIB(fpsc_vlo),
 .DIN_A1_CIB(fpsc_vlo),
 .DIN_A2_CIB(fpsc_vlo),
 .DOUT_A0(),
 .DOUT_A1(),
 .DOUT_A2(),
 .CLKOUT_A0(),
 .CLKOUT_A1(),
 .CLKOUT_A2(),
 .LOCKED_A0(),
 .LOCKED_A1(),
 .LOCKED_A2(),
 .CLKIN_A_P(fpsc_vlo),
 .RSTN_A0(fpsc_vlo),
 .RSTN_A1(fpsc_vlo),
 .RSTN_A2(fpsc_vlo),
#endif

#if _num_slave_grps == 2 || _num_slave_grps == 3 || _num_slave_grps == 4 || _num_slave_grps == 5 || _num_slave_grps == 6
 .DIN_B0_CIB(din_b0),
 .DIN_B1_CIB(din_b1),
 .DIN_B2_CIB(din_b2),
 .DOUT_B0(dout_b0),
 .DOUT_B1(dout_b1),
 .DOUT_B2(dout_b2),
 .CLKOUT_B0(clkout_b0),
 .CLKOUT_B1(clkout_b1),
 .CLKOUT_B2(clkout_b2),
 .LOCKED_B0(locked_b0),
 .LOCKED_B1(locked_b1),
 .LOCKED_B2(locked_b2),
 .CLKIN_B_P(clkin_b_p),
 .RSTN_B0(rstn_b0),
 .RSTN_B1(rstn_b1),
 .RSTN_B2(rstn_b2),
#else
 .DIN_B0_CIB(fpsc_vlo),
 .DIN_B1_CIB(fpsc_vlo),
 .DIN_B2_CIB(fpsc_vlo),
 .DOUT_B0(),
 .DOUT_B1(),
 .DOUT_B2(),
 .CLKOUT_B0(),
 .CLKOUT_B1(),
 .CLKOUT_B2(),
 .LOCKED_B0(),
 .LOCKED_B1(),
 .LOCKED_B2(),
 .CLKIN_B_P(fpsc_vlo),
 .RSTN_B0(fpsc_vlo),
 .RSTN_B1(fpsc_vlo),
 .RSTN_B2(fpsc_vlo),
#endif

#if _num_slave_grps == 3 || _num_slave_grps == 4 || _num_slave_grps == 5 || _num_slave_grps == 6
 .DIN_C0_CIB(din_c0),
 .DIN_C1_CIB(din_c1),
 .DIN_C2_CIB(din_c2),
 .DOUT_C0(dout_c0),
 .DOUT_C1(dout_c1),
 .DOUT_C2(dout_c2),
 .CLKOUT_C0(clkout_c0),
 .CLKOUT_C1(clkout_c1),
 .CLKOUT_C2(clkout_c2),
 .LOCKED_C0(locked_c0),
 .LOCKED_C1(locked_c1),
 .LOCKED_C2(locked_c2),
 .CLKIN_C_P(clkin_c_p),
 .RSTN_C0(rstn_c0),
 .RSTN_C1(rstn_c1),
 .RSTN_C2(rstn_c2),
#else
 .DIN_C0_CIB(fpsc_vlo),
 .DIN_C1_CIB(fpsc_vlo),
 .DIN_C2_CIB(fpsc_vlo),
 .DOUT_C0(),
 .DOUT_C1(),
 .DOUT_C2(),
 .CLKOUT_C0(),
 .CLKOUT_C1(),
 .CLKOUT_C2(),
 .LOCKED_C0(),
 .LOCKED_C1(),
 .LOCKED_C2(),
 .CLKIN_C_P(fpsc_vlo),
 .RSTN_C0(fpsc_vlo),
 .RSTN_C1(fpsc_vlo),
 .RSTN_C2(fpsc_vlo),
#endif

#if _num_slave_grps == 4 || _num_slave_grps == 5 || _num_slave_grps == 6
 .DIN_D0_CIB(din_d0),
 .DIN_D1_CIB(din_d1),
 .DIN_D2_CIB(din_d2),
 .DOUT_D0(dout_d0),
 .DOUT_D1(dout_d1),
 .DOUT_D2(dout_d2),
 .CLKOUT_D0(clkout_d0),
 .CLKOUT_D1(clkout_d1),
 .CLKOUT_D2(clkout_d2),
 .LOCKED_D0(locked_d0),
 .LOCKED_D1(locked_d1),
 .LOCKED_D2(locked_d2),
 .CLKIN_D_P(clkin_d_p),
 .RSTN_D0(rstn_d0),
 .RSTN_D1(rstn_d1),
 .RSTN_D2(rstn_d2),
#else
 .DIN_D0_CIB(fpsc_vlo),
 .DIN_D1_CIB(fpsc_vlo),
 .DIN_D2_CIB(fpsc_vlo),
 .DOUT_D0(),
 .DOUT_D1(),
 .DOUT_D2(),
 .CLKOUT_D0(),
 .CLKOUT_D1(),
 .CLKOUT_D2(),
 .LOCKED_D0(),
 .LOCKED_D1(),
 .LOCKED_D2(),
 .CLKIN_D_P(fpsc_vlo),
 .RSTN_D0(fpsc_vlo),
 .RSTN_D1(fpsc_vlo),
 .RSTN_D2(fpsc_vlo),
#endif

#if _num_slave_grps == 5 || _num_slave_grps == 6
 .DIN_E0_CIB(din_e0),
 .DIN_E1_CIB(din_e1),
 .DIN_E2_CIB(din_e2),
 .DOUT_E0(dout_e0),
 .DOUT_E1(dout_e1),
 .DOUT_E2(dout_e2),
 .CLKOUT_E0(clkout_e0),
 .CLKOUT_E1(clkout_e1),
 .CLKOUT_E2(clkout_e2),
 .LOCKED_E0(locked_e0),
 .LOCKED_E1(locked_e1),
 .LOCKED_E2(locked_e2),
 .CLKIN_E_P(clkin_e_p),
 .RSTN_E0(rstn_e0),
 .RSTN_E1(rstn_e1),
 .RSTN_E2(rstn_e2),
#else
 .DIN_E0_CIB(fpsc_vlo),
 .DIN_E1_CIB(fpsc_vlo),
 .DIN_E2_CIB(fpsc_vlo),
 .DOUT_E0(),
 .DOUT_E1(),
 .DOUT_E2(),
 .CLKOUT_E0(),
 .CLKOUT_E1(),
 .CLKOUT_E2(),
 .LOCKED_E0(),
 .LOCKED_E1(),
 .LOCKED_E2(),
 .CLKIN_E_P(fpsc_vlo),
 .RSTN_E0(fpsc_vlo),
 .RSTN_E1(fpsc_vlo),
 .RSTN_E2(fpsc_vlo),
#endif

#if _num_slave_grps == 6
 .DIN_F0_CIB(din_f0),
 .DIN_F1_CIB(din_f1),
 .DIN_F2_CIB(din_f2),
 .DOUT_F0(dout_f0),
 .DOUT_F1(dout_f1),
 .DOUT_F2(dout_f2),
 .CLKOUT_F0(clkout_f0),
 .CLKOUT_F1(clkout_f1),
 .CLKOUT_F2(clkout_f2),
 .LOCKED_F0(locked_f0),
 .LOCKED_F1(locked_f1),
 .LOCKED_F2(locked_f2),
 .CLKIN_F_P(clkin_f_p),
 .RSTN_F0(rstn_f0),
 .RSTN_F1(rstn_f1),
 .RSTN_F2(rstn_f2),
#else
 .DIN_F0_CIB(fpsc_vlo),
 .DIN_F1_CIB(fpsc_vlo),
 .DIN_F2_CIB(fpsc_vlo),
 .DOUT_F0(),
 .DOUT_F1(),
 .DOUT_F2(),
 .CLKOUT_F0(),
 .CLKOUT_F1(),
 .CLKOUT_F2(),
 .LOCKED_F0(),
 .LOCKED_F1(),
 .LOCKED_F2(),
 .CLKIN_F_P(fpsc_vlo),
 .RSTN_F0(fpsc_vlo),
 .RSTN_F1(fpsc_vlo),
 .RSTN_F2(fpsc_vlo),
#endif

 .TEST_CLK(),
 .DIN_A0_PAD(fpsc_vlo),
 .DIN_A1_PAD(fpsc_vlo),
 .DIN_A2_PAD(fpsc_vlo),
 .CLKIN_A1_S(fpsc_vlo),
 .CLKIN_A2_S(fpsc_vlo),
 .CLK_PHASE_A_0(),
 .CLK_PHASE_A_1(),
 .CLK_PHASE_A_2(),

 .DIN_B0_PAD(fpsc_vlo),
 .DIN_B1_PAD(fpsc_vlo),
 .DIN_B2_PAD(fpsc_vlo),
 .CLKIN_B1_S(fpsc_vlo),
 .CLKIN_B2_S(fpsc_vlo),
 .CLK_PHASE_B_0(),
 .CLK_PHASE_B_1(),
 .CLK_PHASE_B_2(),

 .DIN_C0_PAD(fpsc_vlo),
 .DIN_C1_PAD(fpsc_vlo),
 .DIN_C2_PAD(fpsc_vlo),
 .CLKIN_C1_S(fpsc_vlo),
 .CLKIN_C2_S(fpsc_vlo),
 .CLK_PHASE_C_0(),
 .CLK_PHASE_C_1(),
 .CLK_PHASE_C_2(),

 .DIN_D0_PAD(fpsc_vlo),
 .DIN_D1_PAD(fpsc_vlo),
 .DIN_D2_PAD(fpsc_vlo),
 .CLKIN_D1_S(fpsc_vlo),
 .CLKIN_D2_S(fpsc_vlo),
 .CLK_PHASE_D_0(),
 .CLK_PHASE_D_1(),
 .CLK_PHASE_D_2(),

 .DIN_E0_PAD(fpsc_vlo),
 .DIN_E1_PAD(fpsc_vlo),
 .DIN_E2_PAD(fpsc_vlo),
 .CLKIN_E1_S(fpsc_vlo),
 .CLKIN_E2_S(fpsc_vlo),
 .CLK_PHASE_E_0(),
 .CLK_PHASE_E_1(),
 .CLK_PHASE_E_2(),

 .DIN_F0_PAD(fpsc_vlo),
 .DIN_F1_PAD(fpsc_vlo),
 .DIN_F2_PAD(fpsc_vlo),
 .CLKIN_F1_S(fpsc_vlo),
 .CLKIN_F2_S(fpsc_vlo),
 .CLK_PHASE_F_0(),
 .CLK_PHASE_F_1(),
 .CLK_PHASE_F_2()
 ) STARTCOM synthesis IS_ASB = "TRUE" IS_MACO = "SYSTEM" MIB_MEM = SYNPQUOTE##0s0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000111111110010 ##_MC1_OUTPUT_WIDTH_BEF##0100111111010000000000000000000000111111110010 ##_MC1_OUTPUT_WIDTH_ADC##01001111111100000000 ##_MC1_REFCLK_SEL##0 ##_MC1_REFLOCK_ACC##_MC1_GSRN_EN##_MC1_SEL_WIDTH##SYNPQUOTE ENDCOM ;

SLASH2 exemplar begin
SLASH2 exemplar attribute LSCDR_INST IS_ASB TRUE
SLASH2 exemplar attribute LSCDR_INST IS_MACO  SYSTEM
SLASH2 exemplar attribute LSCDR_INST MIB_MEM  0s0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000111111110010 ##_MC1_OUTPUT_WIDTH_BEF##0100111111010000000000000000000000111111110010 ##_MC1_OUTPUT_WIDTH_ADC##01001111111100000000 ##_MC1_REFCLK_SEL##0 ##_MC1_REFLOCK_ACC##_MC1_GSRN_EN##_MC1_SEL_WIDTH
SLASH2 exemplar end

endmodule

#log LSCDR.v

`timescale 1ns / 1 ps

module LSCDR (
   REFCLK_EDGE,
   REFCLK_PRIM,
   RSTN,
   FORCE_LOCK,
   MASTER_HOLD,
   MASTER_LOCK,
   TEST_CLK,
   DIN_A0_CIB,
   DIN_A0_PAD,
   DIN_A1_CIB,
   DIN_A1_PAD,
   DIN_A2_CIB,
   DIN_A2_PAD,
   DOUT_A0,
   DOUT_A1,
   DOUT_A2,
   CLKOUT_A0,
   CLKOUT_A1,
   CLKOUT_A2,
   LOCKED_A0,
   LOCKED_A1,
   LOCKED_A2,
   CLKIN_A_P,
   CLKIN_A1_S,
   CLKIN_A2_S,
   RSTN_A0,
   RSTN_A1,
   RSTN_A2,
   CLK_PHASE_A_0,
   CLK_PHASE_A_1,
   CLK_PHASE_A_2,

   DIN_B0_CIB,
   DIN_B0_PAD,
   DIN_B1_CIB,
   DIN_B1_PAD,
   DIN_B2_CIB,
   DIN_B2_PAD,
   DOUT_B0,
   DOUT_B1,
   DOUT_B2,
   CLKOUT_B0,
   CLKOUT_B1,
   CLKOUT_B2,
   LOCKED_B0,
   LOCKED_B1,
   LOCKED_B2,
   CLKIN_B_P,
   CLKIN_B1_S,
   CLKIN_B2_S,
   RSTN_B0,
   RSTN_B1,
   RSTN_B2,
   CLK_PHASE_B_0,
   CLK_PHASE_B_1,
   CLK_PHASE_B_2,

   DIN_C0_CIB,
   DIN_C0_PAD,
   DIN_C1_CIB,
   DIN_C1_PAD,
   DIN_C2_CIB,
   DIN_C2_PAD,
   DOUT_C0,
   DOUT_C1,
   DOUT_C2,
   CLKOUT_C0,
   CLKOUT_C1,
   CLKOUT_C2,
   LOCKED_C0,
   LOCKED_C1,
   LOCKED_C2,
   CLKIN_C_P,
   CLKIN_C1_S,
   CLKIN_C2_S,
   RSTN_C0,
   RSTN_C1,
   RSTN_C2,
   CLK_PHASE_C_0,
   CLK_PHASE_C_1,
   CLK_PHASE_C_2,

   DIN_D0_CIB,
   DIN_D0_PAD,
   DIN_D1_CIB,
   DIN_D1_PAD,
   DIN_D2_CIB,
   DIN_D2_PAD,
   DOUT_D0,
   DOUT_D1,
   DOUT_D2,
   CLKOUT_D0,
   CLKOUT_D1,
   CLKOUT_D2,
   LOCKED_D0,
   LOCKED_D1,
   LOCKED_D2,
   CLKIN_D_P,
   CLKIN_D1_S,
   CLKIN_D2_S,
   RSTN_D0,
   RSTN_D1,
   RSTN_D2,
   CLK_PHASE_D_0,
   CLK_PHASE_D_1,
   CLK_PHASE_D_2,

   DIN_E0_CIB,
   DIN_E0_PAD,
   DIN_E1_CIB,
   DIN_E1_PAD,
   DIN_E2_CIB,
   DIN_E2_PAD,
   DOUT_E0,
   DOUT_E1,
   DOUT_E2,
   CLKOUT_E0,
   CLKOUT_E1,
   CLKOUT_E2,
   LOCKED_E0,
   LOCKED_E1,
   LOCKED_E2,
   CLKIN_E_P,
   CLKIN_E1_S,
   CLKIN_E2_S,
   RSTN_E0,
   RSTN_E1,
   RSTN_E2,
   CLK_PHASE_E_0,
   CLK_PHASE_E_1,
   CLK_PHASE_E_2,

   DIN_F0_CIB,
   DIN_F0_PAD,
   DIN_F1_CIB,
   DIN_F1_PAD,
   DIN_F2_CIB,
   DIN_F2_PAD,
   DOUT_F0,
   DOUT_F1,
   DOUT_F2,
   CLKOUT_F0,
   CLKOUT_F1,
   CLKOUT_F2,
   LOCKED_F0,
   LOCKED_F1,
   LOCKED_F2,
   CLKIN_F_P,
   CLKIN_F1_S,
   CLKIN_F2_S,
   RSTN_F0,
   RSTN_F1,
   RSTN_F2,
   CLK_PHASE_F_0,
   CLK_PHASE_F_1,
   CLK_PHASE_F_2
   )/* synthesis syn_black_box*/;

   parameter ip_type     = "LSCDR";
   parameter module_type = "LSCDR";

input   REFCLK_EDGE;
input   REFCLK_PRIM;
input   RSTN;
input   FORCE_LOCK;
input   MASTER_HOLD;
output   MASTER_LOCK;
output   TEST_CLK;
input   DIN_A0_CIB;
input   DIN_A0_PAD;
input   DIN_A1_CIB;
input   DIN_A1_PAD;
input   DIN_A2_CIB;
input   DIN_A2_PAD;
output [3:0]   DOUT_A0;
output [3:0]   DOUT_A1;
output [3:0]   DOUT_A2;
output   CLKOUT_A0;
output   CLKOUT_A1;
output   CLKOUT_A2;
output   LOCKED_A0;
output   LOCKED_A1;
output   LOCKED_A2;
input   CLKIN_A_P;
input   CLKIN_A1_S;
input   CLKIN_A2_S;
input   RSTN_A0;
input   RSTN_A1;
input   RSTN_A2;
output [3:0]   CLK_PHASE_A_0;
output [3:0]   CLK_PHASE_A_1;
output [3:0]   CLK_PHASE_A_2;

input   DIN_B0_CIB;
input   DIN_B0_PAD;
input   DIN_B1_CIB;
input   DIN_B1_PAD;
input   DIN_B2_CIB;
input   DIN_B2_PAD;
output [3:0]   DOUT_B0;
output [3:0]   DOUT_B1;
output [3:0]   DOUT_B2;
output   CLKOUT_B0;
output   CLKOUT_B1;
output   CLKOUT_B2;
output   LOCKED_B0;
output   LOCKED_B1;
output   LOCKED_B2;
input   CLKIN_B_P;
input   CLKIN_B1_S;
input   CLKIN_B2_S;
input   RSTN_B0;
input   RSTN_B1;
input   RSTN_B2;
output [3:0]   CLK_PHASE_B_0;
output [3:0]   CLK_PHASE_B_1;
output [3:0]   CLK_PHASE_B_2;

input   DIN_C0_CIB;
input   DIN_C0_PAD;
input   DIN_C1_CIB;
input   DIN_C1_PAD;
input   DIN_C2_CIB;
input   DIN_C2_PAD;
output [3:0]   DOUT_C0;
output [3:0]   DOUT_C1;
output [3:0]   DOUT_C2;
output   CLKOUT_C0;
output   CLKOUT_C1;
output   CLKOUT_C2;
output   LOCKED_C0;
output   LOCKED_C1;
output   LOCKED_C2;
input   CLKIN_C_P;
input   CLKIN_C1_S;
input   CLKIN_C2_S;
input   RSTN_C0;
input   RSTN_C1;
input   RSTN_C2;
output [3:0]   CLK_PHASE_C_0;
output [3:0]   CLK_PHASE_C_1;
output [3:0]   CLK_PHASE_C_2;

input   DIN_D0_CIB;
input   DIN_D0_PAD;
input   DIN_D1_CIB;
input   DIN_D1_PAD;
input   DIN_D2_CIB;
input   DIN_D2_PAD;
output [3:0]   DOUT_D0;
output [3:0]   DOUT_D1;
output [3:0]   DOUT_D2;
output   CLKOUT_D0;
output   CLKOUT_D1;
output   CLKOUT_D2;
output   LOCKED_D0;
output   LOCKED_D1;
output   LOCKED_D2;
input   CLKIN_D_P;
input   CLKIN_D1_S;
input   CLKIN_D2_S;
input   RSTN_D0;
input   RSTN_D1;
input   RSTN_D2;
output [3:0]   CLK_PHASE_D_0;
output [3:0]   CLK_PHASE_D_1;
output [3:0]   CLK_PHASE_D_2;

input   DIN_E0_CIB;
input   DIN_E0_PAD;
input   DIN_E1_CIB;
input   DIN_E1_PAD;
input   DIN_E2_CIB;
input   DIN_E2_PAD;
output [3:0]   DOUT_E0;
output [3:0]   DOUT_E1;
output [3:0]   DOUT_E2;
output   CLKOUT_E0;
output   CLKOUT_E1;
output   CLKOUT_E2;
output   LOCKED_E0;
output   LOCKED_E1;
output   LOCKED_E2;
input   CLKIN_E_P;
input   CLKIN_E1_S;
input   CLKIN_E2_S;
input   RSTN_E0;
input   RSTN_E1;
input   RSTN_E2;
output [3:0]   CLK_PHASE_E_0;
output [3:0]   CLK_PHASE_E_1;
output [3:0]   CLK_PHASE_E_2;

input   DIN_F0_CIB;
input   DIN_F0_PAD;
input   DIN_F1_CIB;
input   DIN_F1_PAD;
input   DIN_F2_CIB;
input   DIN_F2_PAD;
output [3:0]   DOUT_F0;
output [3:0]   DOUT_F1;
output [3:0]   DOUT_F2;
output   CLKOUT_F0;
output   CLKOUT_F1;
output   CLKOUT_F2;
output   LOCKED_F0;
output   LOCKED_F1;
output   LOCKED_F2;
input   CLKIN_F_P;
input   CLKIN_F1_S;
input   CLKIN_F2_S;
input   RSTN_F0;
input   RSTN_F1;
input   RSTN_F2;
output [3:0]   CLK_PHASE_F_0;
output [3:0]   CLK_PHASE_F_1;
output [3:0]   CLK_PHASE_F_2;

//synopsys translate_off
parameter MIB_MEM = "0s0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000111111110010 ##_MC1_OUTPUT_WIDTH_BEF##0100111111010000000000000000000000111111110010 ##_MC1_OUTPUT_WIDTH_ADC##01001111111100000000 ##_MC1_REFCLK_SEL##0 ##_MC1_REFLOCK_ACC##_MC1_GSRN_EN##_MC1_SEL_WIDTH";

defparam LSCDR_sim_inst.MIB_MEM = MIB_MEM;

 LSCDR_sim LSCDR_sim_inst (
   .REFCLK_EDGE(REFCLK_EDGE),
   .REFCLK_PRIM(REFCLK_PRIM),
   .RSTN(RSTN),
   .FORCE_LOCK(FORCE_LOCK),
   .MASTER_HOLD(MASTER_HOLD),
   .MASTER_LOCK(MASTER_LOCK),
   .TEST_CLK(TEST_CLK),
   .DIN_A0_CIB(DIN_A0_CIB),
   .DIN_A0_PAD(DIN_A0_PAD),
   .DIN_A1_CIB(DIN_A1_CIB),
   .DIN_A1_PAD(DIN_A1_PAD),
   .DIN_A2_CIB(DIN_A2_CIB),
   .DIN_A2_PAD(DIN_A2_PAD),
   .DOUT_A0(DOUT_A0),
   .DOUT_A1(DOUT_A1),
   .DOUT_A2(DOUT_A2),
   .CLKOUT_A0(CLKOUT_A0),
   .CLKOUT_A1(CLKOUT_A1),
   .CLKOUT_A2(CLKOUT_A2),
   .LOCKED_A0(LOCKED_A0),
   .LOCKED_A1(LOCKED_A1),
   .LOCKED_A2(LOCKED_A2),
   .CLKIN_A_P(CLKIN_A_P),
   .CLKIN_A1_S(CLKIN_A1_S),
   .CLKIN_A2_S(CLKIN_A2_S),
   .RSTN_A0(RSTN_A0),
   .RSTN_A1(RSTN_A1),
   .RSTN_A2(RSTN_A2),
   .CLK_PHASE_A_0(CLK_PHASE_A_0),
   .CLK_PHASE_A_1(CLK_PHASE_A_1),
   .CLK_PHASE_A_2(CLK_PHASE_A_2),

   .DIN_B0_CIB(DIN_B0_CIB),
   .DIN_B0_PAD(DIN_B0_PAD),
   .DIN_B1_CIB(DIN_B1_CIB),
   .DIN_B1_PAD(DIN_B1_PAD),
   .DIN_B2_CIB(DIN_B2_CIB),
   .DIN_B2_PAD(DIN_B2_PAD),
   .DOUT_B0(DOUT_B0),
   .DOUT_B1(DOUT_B1),
   .DOUT_B2(DOUT_B2),
   .CLKOUT_B0(CLKOUT_B0),
   .CLKOUT_B1(CLKOUT_B1),
   .CLKOUT_B2(CLKOUT_B2),
   .LOCKED_B0(LOCKED_B0),
   .LOCKED_B1(LOCKED_B1),
   .LOCKED_B2(LOCKED_B2),
   .CLKIN_B_P(CLKIN_B_P),
   .CLKIN_B1_S(CLKIN_B1_S),
   .CLKIN_B2_S(CLKIN_B2_S),
   .RSTN_B0(RSTN_B0),
   .RSTN_B1(RSTN_B1),
   .RSTN_B2(RSTN_B2),
   .CLK_PHASE_B_0(CLK_PHASE_B_0),
   .CLK_PHASE_B_1(CLK_PHASE_B_1),
   .CLK_PHASE_B_2(CLK_PHASE_B_2),

   .DIN_C0_CIB(DIN_C0_CIB),
   .DIN_C0_PAD(DIN_C0_PAD),
   .DIN_C1_CIB(DIN_C1_CIB),
   .DIN_C1_PAD(DIN_C1_PAD),
   .DIN_C2_CIB(DIN_C2_CIB),
   .DIN_C2_PAD(DIN_C2_PAD),
   .DOUT_C0(DOUT_C0),
   .DOUT_C1(DOUT_C1),
   .DOUT_C2(DOUT_C2),
   .CLKOUT_C0(CLKOUT_C0),
   .CLKOUT_C1(CLKOUT_C1),
   .CLKOUT_C2(CLKOUT_C2),
   .LOCKED_C0(LOCKED_C0),
   .LOCKED_C1(LOCKED_C1),
   .LOCKED_C2(LOCKED_C2),
   .CLKIN_C_P(CLKIN_C_P),
   .CLKIN_C1_S(CLKIN_C1_S),
   .CLKIN_C2_S(CLKIN_C2_S),
   .RSTN_C0(RSTN_C0),
   .RSTN_C1(RSTN_C1),
   .RSTN_C2(RSTN_C2),
   .CLK_PHASE_C_0(CLK_PHASE_C_0),
   .CLK_PHASE_C_1(CLK_PHASE_C_1),
   .CLK_PHASE_C_2(CLK_PHASE_C_2),

   .DIN_D0_CIB(DIN_D0_CIB),
   .DIN_D0_PAD(DIN_D0_PAD),
   .DIN_D1_CIB(DIN_D1_CIB),
   .DIN_D1_PAD(DIN_D1_PAD),
   .DIN_D2_CIB(DIN_D2_CIB),
   .DIN_D2_PAD(DIN_D2_PAD),
   .DOUT_D0(DOUT_D0),
   .DOUT_D1(DOUT_D1),
   .DOUT_D2(DOUT_D2),
   .CLKOUT_D0(CLKOUT_D0),
   .CLKOUT_D1(CLKOUT_D1),
   .CLKOUT_D2(CLKOUT_D2),
   .LOCKED_D0(LOCKED_D0),
   .LOCKED_D1(LOCKED_D1),
   .LOCKED_D2(LOCKED_D2),
   .CLKIN_D_P(CLKIN_D_P),
   .CLKIN_D1_S(CLKIN_D1_S),
   .CLKIN_D2_S(CLKIN_D2_S),
   .RSTN_D0(RSTN_D0),
   .RSTN_D1(RSTN_D1),
   .RSTN_D2(RSTN_D2),
   .CLK_PHASE_D_0(CLK_PHASE_D_0),
   .CLK_PHASE_D_1(CLK_PHASE_D_1),
   .CLK_PHASE_D_2(CLK_PHASE_D_2),

   .DIN_E0_CIB(DIN_E0_CIB),
   .DIN_E0_PAD(DIN_E0_PAD),
   .DIN_E1_CIB(DIN_E1_CIB),
   .DIN_E1_PAD(DIN_E1_PAD),
   .DIN_E2_CIB(DIN_E2_CIB),
   .DIN_E2_PAD(DIN_E2_PAD),
   .DOUT_E0(DOUT_E0),
   .DOUT_E1(DOUT_E1),
   .DOUT_E2(DOUT_E2),
   .CLKOUT_E0(CLKOUT_E0),
   .CLKOUT_E1(CLKOUT_E1),
   .CLKOUT_E2(CLKOUT_E2),
   .LOCKED_E0(LOCKED_E0),
   .LOCKED_E1(LOCKED_E1),
   .LOCKED_E2(LOCKED_E2),
   .CLKIN_E_P(CLKIN_E_P),
   .CLKIN_E1_S(CLKIN_E1_S),
   .CLKIN_E2_S(CLKIN_E2_S),
   .RSTN_E0(RSTN_E0),
   .RSTN_E1(RSTN_E1),
   .RSTN_E2(RSTN_E2),
   .CLK_PHASE_E_0(CLK_PHASE_E_0),
   .CLK_PHASE_E_1(CLK_PHASE_E_1),
   .CLK_PHASE_E_2(CLK_PHASE_E_2),

   .DIN_F0_CIB(DIN_F0_CIB),
   .DIN_F0_PAD(DIN_F0_PAD),
   .DIN_F1_CIB(DIN_F1_CIB),
   .DIN_F1_PAD(DIN_F1_PAD),
   .DIN_F2_CIB(DIN_F2_CIB),
   .DIN_F2_PAD(DIN_F2_PAD),
   .DOUT_F0(DOUT_F0),
   .DOUT_F1(DOUT_F1),
   .DOUT_F2(DOUT_F2),
   .CLKOUT_F0(CLKOUT_F0),
   .CLKOUT_F1(CLKOUT_F1),
   .CLKOUT_F2(CLKOUT_F2),
   .LOCKED_F0(LOCKED_F0),
   .LOCKED_F1(LOCKED_F1),
   .LOCKED_F2(LOCKED_F2),
   .CLKIN_F_P(CLKIN_F_P),
   .CLKIN_F1_S(CLKIN_F1_S),
   .CLKIN_F2_S(CLKIN_F2_S),
   .RSTN_F0(RSTN_F0),
   .RSTN_F1(RSTN_F1),
   .RSTN_F2(RSTN_F2),
   .CLK_PHASE_F_0(CLK_PHASE_F_0),
   .CLK_PHASE_F_1(CLK_PHASE_F_1),
   .CLK_PHASE_F_2(CLK_PHASE_F_2)
   );
//synopsys translate_on
endmodule
#include <pcs/lscdr.tft>


