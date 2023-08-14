#if #pmi_regmode == "reg"
#define _regmode -pipe_final_output
#else
#define _regmode
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

#define _EXECPATH_ FOUNDRY##/bin/##PLATFORM##/scuba
#define _arch PM

#_EXECPATH_ -w -bus_exp 7 -bb -arch _arch -type sdpram -num_rows pmi_addr_depth -data_width pmi_data_width _regmode _memfile -memformat _memformat -n _module_name -pmi
