#ifndef pmi_updown
#define pmi_updown up
#endif

#if #pmi_updown == "up"
#define _updown -up
#elif #pmi_updown == "down"
#define _updown -down
#else
#define _updown -updown
#endif

#define _EXECPATH_ FOUNDRY##/bin/##PLATFORM##/scuba
#define _arch PM

#_EXECPATH_ -w -arch _arch -n _module_name -bb -bus_exp 7 -type counter -width pmi_data_width _updown -pmi 
