#ifndef pmi_sign
#define pmi_sign off
#endif

#if #pmi_sign == "off"
#define _signed
#else
#define _signed -signed
#endif

#ifndef pmi_additional_pipeline
#define pmi_additional_pipeline 0
#endif

#if #pmi_additional_pipeline == "0"
#define _pipeline
#else
#define _pipeline -PL_stages pmi_additional_pipeline
#endif

#ifndef pmi_input_reg
#define pmi_input_reg off
#endif

#if #pmi_input_reg == "off"
#define _input_reg
#else
#define _input_reg -input_reg
#endif

#ifndef pmi_output_reg
#define pmi_output_reg off
#endif

#if #pmi_output_reg == "off"
#define _output_reg
#else
#define _output_reg -output_reg
#endif

#ifndef pmi_implementation
#define pmi_implementation DSP
#endif

#if #pmi_implementation == "DSP"
#define _pfu_mult
#else
#define _pfu_mult -pfu_mult
#endif

#define _EXECPATH_ FOUNDRY##/bin/##PLATFORM##/scuba
#define _arch PM

#_EXECPATH_ -w -n _module_name _pfu_mult -widtha pmi_dataa_width -widthb pmi_datab_width _signed _pipeline _input_reg _output_reg -bus_exp 7 -bb -arch _arch -type dspmult -gsr ENABLED -area -clk0 -ce0 -rst0 -simple_portname
