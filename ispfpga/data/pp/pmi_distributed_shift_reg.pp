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

#if #pmi_shiftreg_type == "fixed"
#define _mode 0
#elif #pmi_shiftreg_type == "lossless"
#define _mode 2
#else
#define _mode 1
#endif

#if #pmi_shiftreg_type == "fixed" && #pmi_max_width != "4"
#error "Parameter 'pmi_max_width' of module pmi_distributed_shift_reg must be 4 in 'fixed' mode."
#quit
#endif

#define _EXECPATH_ FOUNDRY##/bin/##PLATFORM##/scuba
#define _arch PM

#if #pmi_shiftreg_type == "fixed"
#_EXECPATH_ -w -bus_exp 7 -bb -arch _arch -type shiftreg -width pmi_data_width -depth pmi_num_shift -mode _mode _regmode _memfile -memformat _memformat -n _module_name -pmi
#else
#_EXECPATH_ -w -bus_exp 7 -bb -arch _arch -type shiftreg -width pmi_data_width -depth pmi_max_shift -mode _mode _regmode _memfile -memformat _memformat -n _module_name -pmi
#endif

