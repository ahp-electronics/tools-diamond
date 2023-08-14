#if (#pmi_regmode == "reg" || #pmi_regmode == "outreg")
#define _regmode -regout -no_enable
#elif #pmi_regmode == "outreg_rden"
#define _regmode -regout 
#else
#define _regmode
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

#if (#pmi_family == "ECP5U" && #pmi_implementation == "EBR")
#define _reset_rel -reset_rel async
#elif (#pmi_family == "ECP5UM" || #pmi_family == "PRISM" && #pmi_implementation == "EBR")
#define _reset_rel -reset_rel async
#else
#define _reset_rel
#endif


#_EXECPATH_ -w -bus_exp 7 -bb -arch _arch _pfu_fifo -type ebfifo -sync_mode -depth pmi_data_depth -width pmi_data_width -pf pmi_almost_full_flag -pe pmi_almost_empty_flag _regmode -n _module_name -pmi _reset_rel
