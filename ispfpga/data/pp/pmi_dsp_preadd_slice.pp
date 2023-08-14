
#define _arch PM

#if #pmi_m0_sourceb_mode == "B"
#define -r _m0_srcb 0
#elif #pmi_m0_sourceb_mode == "C"
#define -r _m0_srcb 1
#else
#define -r _m0_srcb 3
#endif

#if #pmi_m1_sourceb_mode == "B"
#define -r _m1_srcb 0
#elif #pmi_m1_sourceb_mode == "C"
#define -r _m1_srcb 1
#else
#define -r _m1_srcb 3
#endif

#ifndef pmi_m0_sourcea_mode
#define pmi_m0_sourcea_mode OPA0
#endif
#ifndef pmi_m1_sourcea_mode
#define pmi_m1_sourcea_mode OPA1
#endif

#if #pmi_pre0_sourcea_mode == "A_SHIFT"
#define -r _p0_srca 0
#elif #pmi_pre0_sourcea_mode == "C_SHIFT"
#define -r _p0_srca 1
#elif #pmi_pre0_sourcea_mode == "A_C_DYNAMIC"
#define -r _p0_srca 2
#elif #pmi_pre0_sourcea_mode == "HIGHSPEED"
#define -r _p0_srca 3
#else
#define -r _p0_srca 4
#endif

#if #pmi_pre0_sourceb_mode == "SHIFT"
#define -r _p0_srcb 0
#elif #pmi_pre0_sourceb_mode == "PARALLEL"
#define -r _p0_srcb 1
#elif #pmi_pre0_sourceb_mode == "INTERNAL"
#define -r _p0_srcb 2
#else
#define -r _p0_srcb 3
#endif

#if #pmi_pre1_sourcea_mode == "A_SHIFT"
#define -r _p1_srca 0
#elif #pmi_pre1_sourcea_mode == "C_SHIFT"
#define -r _p1_srca 1
#elif #pmi_pre1_sourcea_mode == "A_C_DYNAMIC"
#define -r _p1_srca 2
#elif #pmi_pre1_sourcea_mode == "HIGHSPEED"
#define -r _p1_srca 3
#else
#define -r _p1_srca 4
#endif

#if #pmi_pre1_sourceb_mode == "SHIFT"
#define -r _p1_srcb 0
#elif #pmi_pre1_sourceb_mode == "PARALLEL"
#define -r _p1_srcb 1
#elif #pmi_pre1_sourceb_mode == "INTERNAL"
#define -r _p1_srcb 2
#else
#define -r _p1_srcb 3
#endif

#if #pmi_pre1_fb_mux == "SHIFT"
#define -r _fb_mux 2
#elif #pmi_pre1_fb_mux == "SHIFT_BYPASS"
#define -r _fb_mux 1
#else
#define -r _fb_mux 0
#endif
#if #pmi_pre0_symmetry_mode == "DIRECT"
#define -r _sym0 0
#else
#define -r _sym0 1
#endif
#if #pmi_pre1_symmetry_mode == "DIRECT"
#define -r _sym1 0
#else
#define -r _sym1 1
#endif
#if #pmi_m0_sourcea_mode == "OPA0"
#define -r _m0_srca 0
#elif #pmi_m0_sourcea_mode == "A"
#define -r _m0_srca 1
#else
#define -r _m0_srca 2
#endif
#if #pmi_m1_sourcea_mode == "OPA1"
#define -r _m1_srca 0
#elif #pmi_m1_sourcea_mode == "A"
#define -r _m1_srca 1
#else
#define -r _m1_srca 2
#endif
#if #pmi_cascade_match_reg == "on"
#define -r _cas -enable_cascade
#else
#define -r _cas 
#endif
#if #pmi_highspeed_clk == "NONE"
#define -r _hs_clk -1
#elif #pmi_highspeed_clk == "CLK0"
#define -r _hs_clk 0
#elif #pmi_highspeed_clk == "CLK1"
#define -r _hs_clk 1
#elif #pmi_highspeed_clk == "CLK2"
#define -r _hs_clk 2
#elif #pmi_highspeed_clk == "CLK3"
#define -r _hs_clk 3
#else
#define -r _hs_clk -1
#endif
#if #pmi_clk0_div == "ENABLED"
#define -r _clk0_div -clk0_div
#else
#define -r _clk0_div 
#endif
#if #pmi_clk1_div == "ENABLED"
#define -r _clk1_div -clk1_div
#else
#define -r _clk1_div 
#endif
#if #pmi_clk2_div == "ENABLED"
#define -r _clk2_div -clk2_div
#else
#define -r _clk2_div 
#endif
#if #pmi_clk3_div == "ENABLED"
#define -r _clk3_div -clk3_div
#else
#define -r _clk3_div
#endif
#define _EXECPATH_ FOUNDRY##/bin/##PLATFORM##/scuba

#_EXECPATH_ -w -arch _arch -pmi -n _module_name -bus_exp 7 -bb -type dsppreadd \
-widtha pmi_data_m0a_width -widthb pmi_data_m0b_width -width_ba pmi_data_m1a_width -width_bb pmi_data_m1b_width \
-widthc pmi_data_m0c_width -width_bc pmi_data_m1c_width \
-rega0clk pmi_reg_input_m0a_mult_clk -rega0ce pmi_reg_input_m0a_mult_ce -rega0rst pmi_reg_input_m0a_mult_rst \
-regb0clk pmi_reg_input_m0b_mult_clk -regb0ce pmi_reg_input_m0b_mult_ce -regb0rst pmi_reg_input_m0b_mult_rst \
-rega1clk pmi_reg_input_m1a_mult_clk -rega1ce pmi_reg_input_m1a_mult_ce -rega1rst pmi_reg_input_m1a_mult_rst \
-regb1clk pmi_reg_input_m1b_mult_clk -regb1ce pmi_reg_input_m1b_mult_ce -regb1rst pmi_reg_input_m1b_mult_rst \
-rega2clk pmi_reg_input_m0a_pre_clk -rega2ce pmi_reg_input_m0a_pre_ce -rega2rst pmi_reg_input_m0a_pre_rst \
-regb2clk pmi_reg_input_m0b_pre_clk -regb2ce pmi_reg_input_m0b_pre_ce -regb2rst pmi_reg_input_m0b_pre_rst \
-rega3clk pmi_reg_input_m1a_pre_clk -rega3ce pmi_reg_input_m1a_pre_ce -rega3rst pmi_reg_input_m1a_pre_rst \
-regb3clk pmi_reg_input_m1b_pre_clk -regb3ce pmi_reg_input_m1b_pre_ce -regb3rst pmi_reg_input_m1b_pre_rst \
-regc0clk pmi_reg_input_m0c_clk -regc0ce pmi_reg_input_m0c_ce -regc0rst pmi_reg_input_m0c_rst \
-regc1clk pmi_reg_input_m1c_clk -regc1ce pmi_reg_input_m1c_ce -regc1rst pmi_reg_input_m1c_rst \
-regp0clk pmi_reg_pipeline0_clk -regp0ce pmi_reg_pipeline0_ce -regp0rst pmi_reg_pipeline0_rst \
-regp1clk pmi_reg_pipeline1_clk -regp1ce pmi_reg_pipeline1_ce -regp1rst pmi_reg_pipeline1_rst \
-regasload0clk pmi_reg_opcodein0_clk -regasload0ce pmi_reg_opcodein0_ce -regasload0rst pmi_reg_opcodein0_rst \
-regasload1clk pmi_reg_opcodein1_clk -regasload1ce pmi_reg_opcodein1_ce -regasload1rst pmi_reg_opcodein1_rst \
-regas0clk pmi_reg_oppre0_clk -regas0ce pmi_reg_oppre0_ce -regas0rst pmi_reg_oppre0_rst \
-regas1clk pmi_reg_oppre1_clk -regas1ce pmi_reg_oppre1_ce -regas1rst pmi_reg_oppre1_rst \
-regoclk pmi_reg_output_clk -regoce pmi_reg_output_ce -regorst pmi_reg_output_rst \
-regcfbclk pmi_reg_input_cfb_clk -regcfbce pmi_reg_input_cfb_ce -regcfbrst pmi_reg_input_cfb_rst \
_cas -signeda -signedb -signed_b_a -signed_b_b \
-srcb0 _p0_srcb \
-srcb1 _p1_srcb \
-srca0 _p0_srca \
-srca1 _p1_srca \
-fb_mux _fb_mux \
-sym0 _sym0 \
-sym1 _sym1 \
-m0_srcb _m0_srcb \
-m1_srcb _m1_srcb \
-m0_srca _m0_srca \
-m1_srca _m1_srca \
-hs_clk _hs_clk \
_clk0_div _clk1_div _clk2_div _clk3_div
