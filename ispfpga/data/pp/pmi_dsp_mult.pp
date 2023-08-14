
#define _arch PM

#if pmi_additional_pipeline == 1
#if #_arch == "ep5g00p"  // ECP
#define _pipeline_reg -PL_stages 1 -regpclk pmi_reg_pipeline_clk -regpce pmi_reg_pipeline_ce -regprst pmi_reg_pipeline_rst -regsab1 -regsab1clk pmi_reg_signeda_clk -regsab1ce pmi_reg_signeda_ce -regsab1rst pmi_reg_signeda_rst 
#else  // other DSP-based families
#define _pipeline_reg -PL_stages 1 -regpclk pmi_reg_pipeline_clk -regpce pmi_reg_pipeline_ce -regprst pmi_reg_pipeline_rst -regsa1 -regsa1clk pmi_reg_signeda_clk -regsa1ce pmi_reg_signeda_ce -regsa1rst pmi_reg_signeda_rst -regsb1 -regsb1clk pmi_reg_signedb_clk -regsb1ce pmi_reg_signedb_ce -regsb1rst pmi_reg_signedb_rst 
#endif
#else
#define _pipeline_reg -PL_stages 0
#endif

#if #pmi_input_reg == "on"
#if #_arch == "ep5g00p"  // ECP
#define _input_reg -input_reg -rega -regaclk pmi_reg_inputa_clk -regace pmi_reg_inputa_ce -regarst pmi_reg_inputa_rst -regb -regbclk pmi_reg_inputb_clk -regbce pmi_reg_inputb_ce -regbrst pmi_reg_inputb_rst -regsab0 -regsab0clk pmi_reg_signeda_clk -regsab0ce pmi_reg_signeda_ce -regsab0rst pmi_reg_signeda_rst
#else  // other DSP-based families
#define _input_reg -input_reg -rega -regaclk pmi_reg_inputa_clk -regace pmi_reg_inputa_ce -regarst pmi_reg_inputa_rst -regb -regbclk pmi_reg_inputb_clk -regbce pmi_reg_inputb_ce -regbrst pmi_reg_inputb_rst -regsa0 -regsa0clk pmi_reg_signeda_clk -regsa0ce pmi_reg_signeda_ce -regsa0rst pmi_reg_signeda_rst -regsb0 -regsb0clk pmi_reg_signedb_clk -regsb0ce pmi_reg_signedb_ce -regsb0rst pmi_reg_signedb_rst 
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
#if #pmi_source_control_a == "shift"
#define _shiftina -shiftina
#else
#define _shiftina
#endif
#if #pmi_source_control_b == "shift"
#define _shiftinb -shiftinb
#else
#define _shiftinb
#endif
#else  // other DSP-based families
#define _signed -signeda -signedb -dynamica -dynamicb
#define _shiftina
#define _shiftinb
#endif

#if #pmi_reg_inputa_clk == "CLK0" || #pmi_reg_inputb_clk == "CLK0" || #pmi_reg_pipeline_clk == "CLK0" || #pmi_reg_output_clk == "CLK0" || #pmi_reg_signeda_clk == "CLK0" || #pmi_reg_signedb_clk == "CLK0"
#define _clk0 -clk0
#else
#define _clk0
#endif

#if #pmi_reg_inputa_clk == "CLK1" || #pmi_reg_inputb_clk == "CLK1" || #pmi_reg_pipeline_clk == "CLK1" || #pmi_reg_output_clk == "CLK1" || #pmi_reg_signeda_clk == "CLK1" || #pmi_reg_signedb_clk == "CLK1"
#define _clk1 -clk1
#else
#define _clk1
#endif

#if #pmi_reg_inputa_clk == "CLK2" || #pmi_reg_inputb_clk == "CLK2" || #pmi_reg_pipeline_clk == "CLK2" || #pmi_reg_output_clk == "CLK2" || #pmi_reg_signeda_clk == "CLK2" || #pmi_reg_signedb_clk == "CLK2"
#define _clk2 -clk2
#else
#define _clk2
#endif

#if #pmi_reg_inputa_clk == "CLK3" || #pmi_reg_inputb_clk == "CLK3" || #pmi_reg_pipeline_clk == "CLK3" || #pmi_reg_output_clk == "CLK3" || #pmi_reg_signeda_clk == "CLK3" || #pmi_reg_signedb_clk == "CLK3"
#define _clk3 -clk3
#else
#define _clk3
#endif

#if #pmi_reg_inputa_ce == "CE0" || #pmi_reg_inputb_ce == "CE0" || #pmi_reg_pipeline_ce == "CE0" || #pmi_reg_output_ce == "CE0" || #pmi_reg_signeda_ce == "CE0" || #pmi_reg_signedb_ce == "CE0"
#define _ce0 -ce0
#else
#define _ce0
#endif

#if #pmi_reg_inputa_ce == "CE1" || #pmi_reg_inputb_ce == "CE1" || #pmi_reg_pipeline_ce == "CE1" || #pmi_reg_output_ce == "CE1" || #pmi_reg_signeda_ce == "CE1" || #pmi_reg_signedb_ce == "CE1"
#define _ce1 -ce1
#else
#define _ce1
#endif

#if #pmi_reg_inputa_ce == "CE2" || #pmi_reg_inputb_ce == "CE2" || #pmi_reg_pipeline_ce == "CE2" || #pmi_reg_output_ce == "CE2" || #pmi_reg_signeda_ce == "CE2" || #pmi_reg_signedb_ce == "CE2"
#define _ce2 -ce2
#else
#define _ce2
#endif

#if #pmi_reg_inputa_ce == "CE3" || #pmi_reg_inputb_ce == "CE3" || #pmi_reg_pipeline_ce == "CE3" || #pmi_reg_output_ce == "CE3" || #pmi_reg_signeda_ce == "CE3" || #pmi_reg_signedb_ce == "CE3"
#define _ce3 -ce3
#else
#define _ce3
#endif

#if #pmi_reg_inputa_rst == "RST0" || #pmi_reg_inputb_rst == "RST0" || #pmi_reg_pipeline_rst == "RST0" || #pmi_reg_output_rst == "RST0" || #pmi_reg_signeda_rst == "RST0" || #pmi_reg_signedb_rst == "RST0"
#define _rst0 -rst0
#else
#define _rst0
#endif

#if #pmi_reg_inputa_rst == "RST1" || #pmi_reg_inputb_rst == "RST1" || #pmi_reg_pipeline_rst == "RST1" || #pmi_reg_output_rst == "RST1" || #pmi_reg_signeda_rst == "RST1" || #pmi_reg_signedb_rst == "RST1"
#define _rst1 -rst1
#else
#define _rst1
#endif

#if #pmi_reg_inputa_rst == "RST2" || #pmi_reg_inputb_rst == "RST2" || #pmi_reg_pipeline_rst == "RST2" || #pmi_reg_output_rst == "RST2" || #pmi_reg_signeda_rst == "RST2" || #pmi_reg_signedb_rst == "RST2"
#define _rst2 -rst2
#else
#define _rst2
#endif

#if #pmi_reg_inputa_rst == "RST3" || #pmi_reg_inputb_rst == "RST3" || #pmi_reg_pipeline_rst == "RST3" || #pmi_reg_output_rst == "RST3" || #pmi_reg_signeda_rst == "RST3" || #pmi_reg_signedb_rst == "RST3"
#define _rst3 -rst3
#else
#define _rst3
#endif

#define _datap_width = (pmi_dataa_width + pmi_datab_width)

#ifndef pmi_pipelined_mode
#define pmi_pipelined_mode off
#endif

#if #pmi_pipelined_mode == "off"
#define _pipe_full
#else
#define _pipe_full -pipe_full
#define -r _pipeline_reg -regpclk pmi_reg_pipeline_clk -regpce pmi_reg_pipeline_ce -regprst pmi_reg_pipeline_rst -regsa1 -regsa1clk pmi_reg_signeda_clk -regsa1ce pmi_reg_signeda_ce -regsa1rst pmi_reg_signeda_rst -regsb1 -regsb1clk pmi_reg_signedb_clk -regsb1ce pmi_reg_signedb_ce -regsb1rst pmi_reg_signedb_rst
#endif


#define _EXECPATH_ FOUNDRY##/bin/##PLATFORM##/scuba

#_EXECPATH_ -w -arch _arch -pmi -n _module_name -bus_exp 7 -bb -type dspmult -widtha pmi_dataa_width -widthb pmi_datab_width -widthp _datap_width _signed _shiftina _shiftinb _input_reg _pipeline_reg _clk0 _clk1 _clk2 _clk3 _ce0 _ce1 _ce2 _ce3 _rst0 _rst1 _rst2 _rst3 _output_reg -shiftouta -shiftoutb _pipe_full
