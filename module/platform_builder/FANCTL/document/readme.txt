FANCTL version 1.0es

\document						=> document directory 
											 readme.txt (this file)
\preference					=> default preference file for the design
											 fanctl.lpf		
\src\params\verilog => default parameter file for the IP
											 fanctl_params.v
\src\rtl\verilog 		=> rtl files: 
											 fanctl.v			 	=> top-level wrapper of the IP
							 				 fanctl_core.v 	=> the fan controller IP core
							 				 pwm_gen.v 	 	 	=> pwm generator
							 				 startup_ctrl.v	=> startup circuit (optional)
							 				 alarm_gen.v    => alarm generator (optional)

