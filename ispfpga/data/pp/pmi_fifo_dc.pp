#if (#pmi_regmode == "reg" || #pmi_regmode == "outreg")
#define _regmode -regout -no_enable
#elif #pmi_regmode == "outreg_rden"
#define _regmode -regout 
#else
#define _regmode
#endif

#if #pmi_resetmode == "async"
#if (#pmi_family == "XO2" || #pmi_family == "MACHXO2" || #pmi_family == "MACHXO3L" || #pmi_family == "MACHXO3LF" || #pmi_family == "MACHXO3D" || #pmi_family == "LPTM2" || #pmi_family == "ECP5U" || #pmi_family == "ECP5UM" || #pmi_family == "PRISM" || #pmi_family == "LIFMD")
#define _resetmode -reset_rel async
#else
#define _resetmode
#endif
#else
#define _resetmode -sync_reset
#endif

#define _EXECPATH_ FOUNDRY##/bin/##PLATFORM##/scuba
#define _arch PM

#ifndef pmi_implementation
#define pmi_implementation EBR
#endif

#if #pmi_implementation == "EBR"
#define _pfu_fifo
#else
#define _pfu_fifo -pfu_fifo
#endif

#ifndef pmi_data_width_w
#error pmi_data_width_w is not defined.
#quit
#endif

#if ( ((#pmi_family == "SC")||(#pmi_family == "SCM")||(#pmi_family == "XO")||(#pmi_family == "XO2")||(#pmi_family == "MACHXO2" || #pmi_family == "MACHXO3L" || #pmi_family == "MACHXO3D"|| #pmi_family == "MACHXO3LF")||(#pmi_family == "LPTM2")||(#pmi_family == "LPTM") || #pmi_family == "ECP5U" || #pmi_family == "ECP5UM" || #pmi_family == "PRISM" || #pmi_family == "LIFMD") && (#pmi_implementation == "EBR") )


#_EXECPATH_ -w -bus_exp 7 -bb -arch _arch -type ebfifo -width pmi_data_width_w -depth pmi_data_depth_w -rwidth pmi_data_width_r _regmode _resetmode -pe pmi_almost_empty_flag -pf pmi_almost_full_flag -n _module_name -pmi
#else
#_EXECPATH_ -w -bus_exp 7 -bb -arch _arch _pfu_fifo -type ebfifo -depth pmi_data_depth_w -width pmi_data_width_w -pf pmi_almost_full_flag -pe pmi_almost_empty_flag _regmode -n _module_name -pmi


#endif

