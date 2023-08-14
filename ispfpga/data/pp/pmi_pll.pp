#define _EXECPATH_ FOUNDRY##/bin/##PLATFORM##/scuba
#define _arch PM

#if #pmi_family == "SC" || #pmi_family == "SCM"
#define _phase = pmi_phase_adj/45
#if #pmi_clkfb_source == "CLKOP"
#define _fb 1
#define _usrfreq
#elif #pmi_clkfb_source == "USERCLOCK"
#define _fb 3
#define _usrfreq -fusr pmi_freq_clkfb
#else
#define _fb 0
#define _usrfreq
#endif
#_EXECPATH_ -w -arch _arch -n _module_name -bb -bus_exp 7 -type pll -fin pmi_freq_clki -mfreq pmi_freq_clkop -nfreq pmi_freq_clkos -fb _fb -tap _phase _usrfreq -pmi

#elif #pmi_family == "XO2" || #pmi_family == "MACHXO2" || #pmi_family == "MACHXO3L" || #pmi_family == "MACHXO3LF" || #pmi_family == "MACHXO3D" || #pmi_family == "LPTM2" || #pmi_family == "ECP5U" || #pmi_family == "ECP5UM" || #pmi_family == "LIFMD"
#define _phase = pmi_phase_adj
#if #pmi_clkfb_source == "CLKOS"
#define _fb 2
#elif #pmi_clkfb_source == "USERCLOCK"
#define _fb 9
#else
#define _fb 1
#endif
#_EXECPATH_ -w -arch _arch -n _module_name -bb -bus_exp 7 -type pll -fin pmi_freq_clki -fclkop pmi_freq_clkop -fclkos pmi_freq_clkos  -fb_mode _fb -phases _phase -pmi

#else
#define _phase = pmi_phase_adj
#if #pmi_clkfb_source == "CLKOP"
#define _fb CLKOP
#elif #pmi_clkfb_source == "CLKOS"
#define _fb CLKOS
#elif #pmi_clkfb_source == "USERCLOCK"
#define _fb EXTERNAL
#else
#define _fb INTERNAL
#endif
#if #pmi_family == "EC" || #pmi_family == "XP" || #pmi_family == "ECP" || #pmi_family == "XO" || #pmi_family == "LPTM"
   #define _duty = pmi_duty_cycle/12.5
#else
   #define _duty = pmi_duty_cycle/6.25
#endif
#_EXECPATH_ -w -arch _arch -n _module_name -bb -bus_exp 7 -type pll -fin pmi_freq_clki -fclkop pmi_freq_clkop -fclkok pmi_freq_clkok  -fb_mode _fb -phaseadj _phase -duty _duty -pmi
#endif

