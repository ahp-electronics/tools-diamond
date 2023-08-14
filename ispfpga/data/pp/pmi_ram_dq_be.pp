#if #pmi_regmode == "reg"
#define _regmode -read_reg0 outreg
#else
#define _regmode
#endif

#if #pmi_gsr == "enable"
#define _gsr ENABLED
#else
#define _gsr DISABLED
#endif

#if #pmi_write_mode == "normal"
#define _writemode 0
#endif

#if #pmi_write_mode == "writethrough"
#define _writemode 1
#endif

#if #pmi_write_mode == "readbeforewrite"
#define _writemode 2
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

#if #pmi_init_file == "none"
#define _memfile
#else
#define _memfile -memfile #pmi_init_file
#endif

#if #pmi_init_file_format == "binary"
#define _memformat bin
#else
#define _memformat hex
#endif

#ifndef pmi_optimization
#define pmi_optimization speed
#endif

#if #pmi_optimization == "speed"
#define _cascade -1
#else
#define _cascade 11
#endif

#define _EXECPATH_ FOUNDRY##/bin/##PLATFORM##/scuba
#define _arch PM


#_EXECPATH_ -w -bus_exp 7 -bb -arch _arch -type bram -wp 10 -rp 1000 -data_width pmi_data_width -num_rows pmi_addr_depth _regmode -gsr _gsr -write_mode_0 _writemode _resetmode _memfile -memformat _memformat -cascade _cascade -byte pmi_byte_size -n _module_name -pmi
