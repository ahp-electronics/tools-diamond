
#define _arch PM

#if pmi_additional_pipeline == 1
#if #_arch == "ep5g00p"  // ECP
#define _pipeline_reg -PL_stages 1 -regp0clk pmi_reg_pipeline0_clk -regp0ce pmi_reg_pipeline0_ce -regp0rst pmi_reg_pipeline0_rst -regp1clk pmi_reg_pipeline1_clk -regp1ce pmi_reg_pipeline1_ce -regp1rst pmi_reg_pipeline1_rst -regsab1 -regsab1clk pmi_reg_signeda_1_clk -regsab1ce pmi_reg_signeda_1_ce -regsab1rst pmi_reg_signeda_1_rst -regas1 -regas1clk pmi_reg_addnsub_1_clk -regas1ce pmi_reg_addnsub_1_ce -regas1rst pmi_reg_addnsub_1_rst 
#else  // other DSP-based families
#define _pipeline_reg -PL_stages 1 -regp0clk pmi_reg_pipeline0_clk -regp0ce pmi_reg_pipeline0_ce -regp0rst pmi_reg_pipeline0_rst -regp1clk pmi_reg_pipeline1_clk -regp1ce pmi_reg_pipeline1_ce -regp1rst pmi_reg_pipeline1_rst -regsa1 -regsa1clk pmi_reg_signeda_1_clk -regsa1ce pmi_reg_signeda_1_ce -regsa1rst pmi_reg_signeda_1_rst -regsb1 -regsb1clk pmi_reg_signedb_1_clk -regsb1ce pmi_reg_signedb_1_ce -regsb1rst pmi_reg_signedb_1_rst -regas1 -regas1clk pmi_reg_addnsub_1_clk -regas1ce pmi_reg_addnsub_1_ce -regas1rst pmi_reg_addnsub_1_rst  
#endif
#else
#define _pipeline_reg -PL_stages 0
#endif

#if #pmi_input_reg == "on"
#if #_arch == "ep5g00p"  // ECP
#define _input_reg -input_reg -rega0 -rega0clk pmi_reg_inputa0_clk -rega0ce pmi_reg_inputa0_ce -rega0rst pmi_reg_inputa0_rst -rega1 -rega1clk pmi_reg_inputa1_clk -rega1ce pmi_reg_inputa1_ce -rega1rst pmi_reg_inputa1_rst -regb0 -regb0clk pmi_reg_inputb0_clk -regb0ce pmi_reg_inputb0_ce -regb0rst pmi_reg_inputb0_rst -regb1 -regb1clk pmi_reg_inputb1_clk -regb1ce pmi_reg_inputb1_ce -regb1rst pmi_reg_inputb1_rst -regsab0 -regsab0clk pmi_reg_signeda_0_clk -regsab0ce pmi_reg_signeda_0_ce -regsab0rst pmi_reg_signeda_0_rst -regas0 -regas0clk pmi_reg_addnsub_0_clk -regas0ce pmi_reg_addnsub_0_ce -regas0rst pmi_reg_addnsub_0_rst
#else  // other DSP-based families
#define _input_reg -input_reg -rega0 -rega0clk pmi_reg_inputa0_clk -rega0ce pmi_reg_inputa0_ce -rega0rst pmi_reg_inputa0_rst -rega1 -rega1clk pmi_reg_inputa1_clk -rega1ce pmi_reg_inputa1_ce -rega1rst pmi_reg_inputa1_rst -regb0 -regb0clk pmi_reg_inputb0_clk -regb0ce pmi_reg_inputb0_ce -regb0rst pmi_reg_inputb0_rst -regb1 -regb1clk pmi_reg_inputb1_clk -regb1ce pmi_reg_inputb1_ce -regb1rst pmi_reg_inputb1_rst -regsa0 -regsa0clk pmi_reg_signeda_0_clk -regsa0ce pmi_reg_signeda_0_ce -regsa0rst pmi_reg_signeda_0_rst -regsb0 -regsb0clk pmi_reg_signedb_0_clk -regsb0ce pmi_reg_signedb_0_ce -regsb0rst pmi_reg_signedb_0_rst -regas0 -regas0clk pmi_reg_addnsub_0_clk -regas0ce pmi_reg_addnsub_0_ce -regas0rst pmi_reg_addnsub_0_rst 
#endif
#else
#define _input_reg
#endif

#if #pmi_output_reg == "on"
#define _output_reg -output_reg -rego -regoclk pmi_reg_output_clk -regoce pmi_reg_output_ce -regorst pmi_reg_output_rst
#else
#define _output_reg
#endif

#if #_arch == "ep5g00p"  // ECP
#define _signed -signedab
#if #pmi_source_control_a0 == "shift"
#define _shiftina0 -shiftina0
#else
#define _shiftina0
#endif
#if #pmi_source_control_a1 == "shift"
#define _shiftina1 -shiftina1
#else
#define _shiftina1
#endif
#if #pmi_source_control_b0 == "shift"
#define _shiftinb0 -shiftinb0
#else
#define _shiftinb0
#endif
#if #pmi_source_control_b1 == "shift"
#define _shiftinb1 -shiftinb1
#else
#define _shiftinb1
#endif
#else  // other DSP-based families
#define _signed -signeda -signedb -dynamica0 -dynamica1 -dynamicb0 -dynamicb1
#define _shiftina0
#define _shiftina1
#define _shiftinb0
#define _shiftinb1
#endif

#if #pmi_reg_inputa0_clk == "CLK0" || #pmi_reg_inputa1_clk == "CLK0" || #pmi_reg_inputb0_clk == "CLK0" || #pmi_reg_inputb1_clk == "CLK0" || #pmi_reg_pipeline0_clk == "CLK0" || #pmi_reg_pipeline1_clk == "CLK0" || #pmi_reg_output_clk == "CLK0" || #pmi_reg_signeda_0_clk == "CLK0" || #pmi_reg_signeda_1_clk == "CLK0" || #pmi_reg_signedb_0_clk == "CLK0" || #pmi_reg_signedb_1_clk == "CLK0" || #pmi_reg_addnsub_0_clk == "CLK0" || #pmi_reg_addnsub_1_clk == "CLK0"
#define _clk0 -clk0
#else
#define _clk0
#endif

#if #pmi_reg_inputa0_clk == "CLK1" || #pmi_reg_inputa1_clk == "CLK1" || #pmi_reg_inputb0_clk == "CLK1" || #pmi_reg_inputb1_clk == "CLK1" || #pmi_reg_pipeline0_clk == "CLK1" || #pmi_reg_pipeline1_clk == "CLK1" || #pmi_reg_output_clk == "CLK1" || #pmi_reg_signeda_0_clk == "CLK1" || #pmi_reg_signeda_1_clk == "CLK1" || #pmi_reg_signedb_0_clk == "CLK1" || #pmi_reg_signedb_1_clk == "CLK1" || #pmi_reg_addnsub_0_clk == "CLK1" || #pmi_reg_addnsub_1_clk == "CLK1"
#define _clk1 -clk1
#else
#define _clk1
#endif

#if #pmi_reg_inputa0_clk == "CLK2" || #pmi_reg_inputa1_clk == "CLK2" || #pmi_reg_inputb0_clk == "CLK2" || #pmi_reg_inputb1_clk == "CLK2" || #pmi_reg_pipeline0_clk == "CLK2" || #pmi_reg_pipeline1_clk == "CLK2" || #pmi_reg_output_clk == "CLK2" || #pmi_reg_signeda_0_clk == "CLK2" || #pmi_reg_signeda_1_clk == "CLK2" || #pmi_reg_signedb_0_clk == "CLK2" || #pmi_reg_signedb_1_clk == "CLK2" || #pmi_reg_addnsub_0_clk == "CLK2" || #pmi_reg_addnsub_1_clk == "CLK2"
#define _clk2 -clk2
#else
#define _clk2
#endif

#if #pmi_reg_inputa0_clk == "CLK3" || #pmi_reg_inputa1_clk == "CLK3" || #pmi_reg_inputb0_clk == "CLK3" || #pmi_reg_inputb1_clk == "CLK3" || #pmi_reg_pipeline0_clk == "CLK3" || #pmi_reg_pipeline1_clk == "CLK3" || #pmi_reg_output_clk == "CLK3" || #pmi_reg_signeda_0_clk == "CLK3" || #pmi_reg_signeda_1_clk == "CLK3" || #pmi_reg_signedb_0_clk == "CLK3" || #pmi_reg_signedb_1_clk == "CLK3" || #pmi_reg_addnsub_0_clk == "CLK3" || #pmi_reg_addnsub_1_clk == "CLK3"
#define _clk3 -clk3
#else
#define _clk3
#endif

#if #pmi_reg_inputa0_ce == "CE0" || #pmi_reg_inputa1_ce == "CE0" || #pmi_reg_inputb0_ce == "CE0" || #pmi_reg_inputb1_ce == "CE0" || #pmi_reg_pipeline0_ce == "CE0" || #pmi_reg_pipeline1_ce == "CE0" || #pmi_reg_output_ce == "CE0" || #pmi_reg_signeda_0_ce == "CE0" || #pmi_reg_signeda_1_ce == "CE0" || #pmi_reg_signedb_0_ce == "CE0" || #pmi_reg_signedb_1_ce == "CE0" || #pmi_reg_addnsub_0_ce == "CE0" || #pmi_reg_addnsub_1_ce == "CE0"
#define _ce0 -ce0
#else
#define _ce0
#endif

#if #pmi_reg_inputa0_ce == "CE1" || #pmi_reg_inputa1_ce == "CE1" || #pmi_reg_inputb0_ce == "CE1" || #pmi_reg_inputb1_ce == "CE1" || #pmi_reg_pipeline0_ce == "CE1" || #pmi_reg_pipeline1_ce == "CE1" || #pmi_reg_output_ce == "CE1" || #pmi_reg_signeda_0_ce == "CE1" || #pmi_reg_signeda_1_ce == "CE1" || #pmi_reg_signedb_0_ce == "CE1" || #pmi_reg_signedb_1_ce == "CE1" || #pmi_reg_addnsub_0_ce == "CE1" || #pmi_reg_addnsub_1_ce == "CE1"
#define _ce1 -ce1
#else
#define _ce1
#endif

#if #pmi_reg_inputa0_ce == "CE2" || #pmi_reg_inputa1_ce == "CE2" || #pmi_reg_inputb0_ce == "CE2" || #pmi_reg_inputb1_ce == "CE2" || #pmi_reg_pipeline0_ce == "CE2" || #pmi_reg_pipeline1_ce == "CE2" || #pmi_reg_output_ce == "CE2" || #pmi_reg_signeda_0_ce == "CE2" || #pmi_reg_signeda_1_ce == "CE2" || #pmi_reg_signedb_0_ce == "CE2" || #pmi_reg_signedb_1_ce == "CE2" || #pmi_reg_addnsub_0_ce == "CE2" || #pmi_reg_addnsub_1_ce == "CE2"
#define _ce2 -ce2
#else
#define _ce2
#endif

#if #pmi_reg_inputa0_ce == "CE3" || #pmi_reg_inputa1_ce == "CE3" || #pmi_reg_inputb0_ce == "CE3" || #pmi_reg_inputb1_ce == "CE3" || #pmi_reg_pipeline0_ce == "CE3" || #pmi_reg_pipeline1_ce == "CE3" || #pmi_reg_output_ce == "CE3" || #pmi_reg_signeda_0_ce == "CE3" || #pmi_reg_signeda_1_ce == "CE3" || #pmi_reg_signedb_0_ce == "CE3" || #pmi_reg_signedb_1_ce == "CE3" || #pmi_reg_addnsub_0_ce == "CE3" || #pmi_reg_addnsub_1_ce == "CE3"
#define _ce3 -ce3
#else
#define _ce3
#endif

#if #pmi_reg_inputa0_rst == "RST0" || #pmi_reg_inputa1_rst == "RST0" || #pmi_reg_inputb0_rst == "RST0" || #pmi_reg_inputb1_rst == "RST0" || #pmi_reg_pipeline0_rst == "RST0" || #pmi_reg_pipeline1_rst == "RST0" || #pmi_reg_output_rst == "RST0" || #pmi_reg_signeda_0_rst == "RST0" || #pmi_reg_signeda_1_rst == "RST0" || #pmi_reg_signedb_0_rst == "RST0" || #pmi_reg_signedb_1_rst == "RST0" || #pmi_reg_addnsub_0_rst == "RST0" || #pmi_reg_addnsub_1_rst == "RST0"
#define _rst0 -rst0
#else
#define _rst0
#endif

#if #pmi_reg_inputa0_rst == "RST1" || #pmi_reg_inputa1_rst == "RST1" || #pmi_reg_inputb0_rst == "RST1" || #pmi_reg_inputb1_rst == "RST1" || #pmi_reg_pipeline0_rst == "RST1" || #pmi_reg_pipeline1_rst == "RST1" || #pmi_reg_output_rst == "RST1" || #pmi_reg_signeda_0_rst == "RST1" || #pmi_reg_signeda_1_rst == "RST1" || #pmi_reg_signedb_0_rst == "RST1" || #pmi_reg_signedb_1_rst == "RST1" || #pmi_reg_addnsub_0_rst == "RST1" || #pmi_reg_addnsub_1_rst == "RST1"
#define _rst1 -rst1
#else
#define _rst1
#endif

#if #pmi_reg_inputa0_rst == "RST2" || #pmi_reg_inputa1_rst == "RST2" || #pmi_reg_inputb0_rst == "RST2" || #pmi_reg_inputb1_rst == "RST2" || #pmi_reg_pipeline0_rst == "RST2" || #pmi_reg_pipeline1_rst == "RST2" || #pmi_reg_output_rst == "RST2" || #pmi_reg_signeda_0_rst == "RST2" || #pmi_reg_signeda_1_rst == "RST2" || #pmi_reg_signedb_0_rst == "RST2" || #pmi_reg_signedb_1_rst == "RST2" || #pmi_reg_addnsub_0_rst == "RST2" || #pmi_reg_addnsub_1_rst == "RST2"
#define _rst2 -rst2
#else
#define _rst2
#endif

#if #pmi_reg_inputa0_rst == "RST3" || #pmi_reg_inputa1_rst == "RST3" || #pmi_reg_inputb0_rst == "RST3" || #pmi_reg_inputb1_rst == "RST3" || #pmi_reg_pipeline0_rst == "RST3" || #pmi_reg_pipeline1_rst == "RST3" || #pmi_reg_output_rst == "RST3" || #pmi_reg_signeda_0_rst == "RST3" || #pmi_reg_signeda_1_rst == "RST3" || #pmi_reg_signedb_0_rst == "RST3" || #pmi_reg_signedb_1_rst == "RST3" || #pmi_reg_addnsub_0_rst == "RST3" || #pmi_reg_addnsub_1_rst == "RST3"
#define _rst3 -rst3
#else
#define _rst3
#endif

#define _datap_width = (pmi_dataa_width + pmi_datab_width + 1)

#ifndef pmi_pipelined_mode
#define pmi_pipelined_mode off
#endif

#if #pmi_pipelined_mode == "off"
#define _pipe_full
#else
#define _pipe_full -pipe_full
#endif

#ifndef pmi_cascade_match_reg
#define pmi_cascade_match_reg off
#endif

#if #pmi_cascade_match_reg == "off"
#define _enable_cascade
#else
#define _enable_cascade -enable_cascade
#endif


#define _EXECPATH_ FOUNDRY##/bin/##PLATFORM##/scuba

#_EXECPATH_ -w -arch _arch -pmi -n _module_name -bus_exp 7 -bb -type dspmadd -maddsub -load -widtha pmi_dataa_width -widthb pmi_datab_width -widthp _datap_width _signed _shiftina0 _shiftina1 _shiftinb0 _shiftinb1 _input_reg _pipeline_reg _clk0 _clk1 _clk2 _clk3 _ce0 _ce1 _ce2 _ce3 _rst0 _rst1 _rst2 _rst3 _output_reg -shiftouta -shiftoutb _pipe_full _enable_cascade
