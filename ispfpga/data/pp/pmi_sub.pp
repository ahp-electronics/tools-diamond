#ifndef pmi_sign
#define pmi_sign off
#endif

#define _EXECPATH_ FOUNDRY##/bin/##PLATFORM##/scuba
#define _arch PM

#if #pmi_sign == "off"
#_EXECPATH_ -w -arch _arch -n _module_name -bb -bus_exp 7 -type sub -width pmi_data_width -unsigned -port ci -port co -pmi
#else
#_EXECPATH_ -w -arch _arch -n _module_name -bb -bus_exp 7 -type sub -width pmi_data_width -signed -port ci -port overflow -pmi
#endif
