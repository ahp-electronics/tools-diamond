#if #pmi_regmode_a == "reg"
#define _regmode_a -read_reg0 outreg
#else
#define _regmode_a
#endif

#if #pmi_regmode_b == "reg"
#define _regmode_b -read_reg1 outreg
#else
#define _regmode_b
#endif

#if #pmi_gsr == "enable"
#define _gsr ENABLED
#else
#define _gsr DISABLED
#endif

#if #pmi_write_mode_a == "normal"
#define _writemodeA 0
#endif

#if #pmi_write_mode_b == "normal"
#define _writemodeB 0
#endif

#if #pmi_write_mode_a == "writethrough"
#define _writemodeA 1
#endif

#if #pmi_write_mode_b == "writethrough"
#define _writemodeB 1
#endif

#if #pmi_write_mode_a == "readbeforewrite"
#define _writemodeA 2
#endif

#if #pmi_write_mode_b == "readbeforewrite"
#define _writemodeB 2
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


#_EXECPATH_ -w -bus_exp 7 -bb -arch _arch -type bram -wp 11 -rp 1010 -data_width pmi_data_width_a -rdata_width pmi_data_width_b -num_rows pmi_addr_depth_a _regmode_a _regmode_b -gsr _gsr -write_mode_0 _writemodeA -write_mode_1 _writemodeB _resetmode _memfile -memformat _memformat -cascade _cascade -byte pmi_byte_size -n _module_name -pmi
