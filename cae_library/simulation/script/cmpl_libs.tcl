# Copyright (c) 2012-2013 by Lattice Semiconductor Corporation
# cfg\cae_library\pkg\simulation\script\cmpl_libs.tcl 1.7 24-APR-2013 15:09:49 IALMOHAN
#
proc Usage {} {
   puts {Usage: tclsh cmpl_libs.tcl -sim_path <sim_path> [-sim_vendor {mentor<default>}] [-lang {verilog|vhdl|all<default>}] [-device {sc|scm|ec|xp|ecp|machxo|ecp2|ecp2m|xp2|ecp3|machxo2|machxo3l|machxo3d|lptm|lptm2|ecp5u|ecp5um|lfmnx|lifmd|lifmdf|all<default>}] [-target_path <target_path>]}
   exit -1
}

if {$argc == 0} {
   Usage
}

set diamond_path ""
set sim_path ""
set sim_vendor "mentor"
set target_path "."
set lang "all"
set device "all"

if {[info exists env(FOUNDRY)]} {
   set diamond_path "[file join "$env(FOUNDRY)" ..]"
}

foreach {arg1 arg2} "$argv" {
   if {![string match "-*" $arg1]} {
      puts "ERROR: A valid option must start with -"
      Usage
   }

   switch -- $arg1 "-h" - "-help" {
      Usage
   } "-sim_path" {
      set sim_path $arg2
   } "-sim_vendor" {
      set sim_vendor $arg2
   } "-lang" {
      set lang $arg2
   } "-device" {
      set device $arg2
#   } "-diamond_path" {
#      set diamond_path $arg2
   } "-target_path" {
      set target_path $arg2
   } default {
      puts "ERROR: Unsupported option $arg1!"
      Usage
   }

   if {[string match "-*" $arg2] || $arg2 == ""} {
      puts "ERROR: $arg1 must be followed by a value!"
      Usage
   }
}

if {$sim_vendor != "mentor"} {
   puts "Script's library compilation is currently unavailable for this vendor!"
   Usage
}

if {$diamond_path == ""} {
   puts "Please set the FOUNDRY environment variable, then re-run!"
   Usage
} else {
   set diamond_path "[file normalize "$diamond_path"]"
   puts "Diamond install path: $diamond_path"
}

if {$sim_path == ""} {
   puts "ERROR: You must give path to Modelsim/Questa with -sim_path option!"
   Usage
}

if {![file exist $sim_path] || ![file isdirectory $sim_path]} {
   puts "ERROR: Path $sim_path doesn't exist, or it's not a directory!"
   exit -1
}

set script_path "[file join "$diamond_path" "cae_library/simulation/script"]"

if {![file exist $target_path]} {
   file mkdir $target_path
} elseif {![file isdirectory $target_path]} {
   puts "ERROR: Cannot overwrite file $target_path. Please specify a folder!"
   exit -1
}

if {$lang ni "verilog vhdl all"} {
   puts "ERROR: Please specify a valid value with -lang option \[default = all\]!"
   Usage
}

if {$device == "ecp2m"} {
   set device "ecp2"
}

if {$device == "ecp5um"} {
   set device "ecp5u"
}

set verilog_path "[file join "$diamond_path" "cae_library/simulation/verilog"]"
set vhdl_path "[file join "$diamond_path" "cae_library/simulation/vhdl"]"

set all_devices "sc scm ec xp ecp machxo ecp2 xp2 ecp3 machxo2 machxo3l machxo3d lptm ecp5u lfmnx lptm2 lifmd lifmdf";

#if { [file exist "[file join "$verilog_path" "lifmd"]"] && \
#     [file exist "[file join "$vhdl_path" "lifmd"]"] } {
#    set all_devices "$all_devices lifmd"
#}
#
#if {$device == "lifmd" && $device ni "$all_devices"} {
#   puts "lifmd library sources are missing! Please install LIFMD control pack."
#   exit -1
#}

if {$device != "all" && $device ni "$all_devices"} {
   puts "ERROR: Please specify a valid device with -device option \[default = all\]!"
   Usage
}

set target_path "[file normalize "$target_path"]"
set script_path "[file normalize "$script_path"]"

set env(PATH) "$sim_path;$env(PATH);$script_path"
if {$tcl_platform(platform) == "unix"} {
   set env(PATH) "[string map {; :} $env(PATH)]"
}

cd "$target_path"
exec echo "Log file for vmap..." >$target_path/vmap.log

source "$script_path/cmpl_vlg.tclproc"

if {$lang == "verilog" || $lang == "all"} {
   if {$device in "$all_devices"} {
      puts "Compiling [string toupper $device] Verilog library..."
      set device_vlg [format "%s_vlg" $device]
      cmpl_vlg $device
      exec vmap $device_vlg $target_path/$device_vlg >>$target_path/vmap.log
   } elseif {$device == "all"} {
      foreach dev "$all_devices" {
         set dev_vlg [format "%s_vlg" $dev]
         puts "Compiling [string toupper $dev] Verilog library..."
         cmpl_vlg $dev
         exec vmap $dev_vlg $target_path/$dev_vlg >>$target_path/vmap.log
      }
   }
}

source "$script_path/cmpl_vhd.tclproc"

if {$lang == "vhdl" || $lang == "all"} {
   if {$device in "$all_devices"} {
      puts "Compiling [string toupper $device] VHDL library..."
      cmpl_vhd $device
      exec vmap $device $target_path/$device >>$target_path/vmap.log
   } elseif {$device == "all"} {
      foreach dev "$all_devices" {
         puts "Compiling [string toupper $dev] VHDL library..."
         cmpl_vhd $dev
         exec vmap $dev $target_path/$dev >>$target_path/vmap.log
      }
   }
}

#
#Always compile the pmi_work library
#
puts "Compiling PMI_WORK library..."
exec echo Compiling the PMI Verilog files... >$target_path/pmi_work.log
file delete -force $target_path/pmi_work
exec vlib $target_path/pmi_work >>$target_path/pmi_work.log
set pmi_list [open "$target_path/pmi_work.f" w]
set pmi_files [glob "$script_path/../verilog/pmi/*.v"]
puts $pmi_list "$pmi_files"
close $pmi_list
exec vlog -work $target_path/pmi_work -f $target_path/pmi_work.f >>$target_path/pmi_work.log
#exec vlog -work $target_path/pmi_work $script_path/../verilog/pmi/*.v >>$target_path/pmi_work.log
exec vmap pmi_work $target_path/pmi_work >>$target_path/vmap.log
#

if {$device == "sc" || $device == "scm" || $device == "all"} {
   puts "Refreshing PCSA library..."
   exec echo Refreshing the PCSA library... >$target_path/pcsa_work.log
   file delete -force $target_path/pcsa_work
   file copy $script_path/../blackbox/pcsa_work $target_path/pcsa_work
   exec vlog -refresh -work $target_path/pcsa_work >>$target_path/pcsa_work.log
   exec vmap pcsa_work $target_path/pcsa_work >>$target_path/vmap.log
   #
   puts "Refreshing SYSBUSA library..."
   exec echo Refreshing the SYSBUSA library... >$target_path/sysbusa_work.log
   file delete -force $target_path/sysbusa_work
   file copy $script_path/../blackbox/sysbusa_work $target_path/sysbusa_work
   exec vlog -refresh -work $target_path/sysbusa_work >>$target_path/sysbusa_work.log
   exec vmap sysbusa_work $target_path/sysbusa_work >>$target_path/vmap.log
   #
   puts "Refreshing LSCDR library..."
   exec echo Refreshing the LSCDR library... >$target_path/lscdr_work.log
   file delete -force $target_path/lscdr_work
   file copy $script_path/../blackbox/lscdr_work $target_path/lscdr_work
   exec vlog -refresh -work $target_path/lscdr_work >>$target_path/lscdr_work.log
   exec vmap lscdr_work $target_path/lscdr_work >>$target_path/vmap.log
}
if {$device == "ecp2" || $device == "all"} {
   if {$lang == "verilog" || $lang == "all"} {
      puts "Mapping ECP2M Verilog library..."
      exec vmap ecp2m_vlg $target_path/ecp2_vlg >>$target_path/vmap.log
   }
   if {$lang == "vhdl" || $lang == "all"} {
      puts "Mapping ECP2M VHDL library..."
      exec vmap ecp2m $target_path/ecp2 >>$target_path/vmap.log
   }
   #
   puts "Refreshing PCSC library..."
   exec echo Refreshing the PCSC library... >$target_path/pcsc_work.log
   file delete -force $target_path/pcsc_work
   file copy $script_path/../blackbox/pcsc_work $target_path/pcsc_work
   exec vlog -refresh -work $target_path/pcsc_work >>$target_path/pcsc_work.log
   exec vmap pcsc_work $target_path/pcsc_work >>$target_path/vmap.log
   #
   puts "Refreshing PCSC revA library..."
   exec echo Refreshing the PCSC revA library... >$target_path/pcsc_work_revA.log
   file delete -force $target_path/pcsc_work_revA
   file copy $script_path/../blackbox/pcsc_work_revA $target_path/pcsc_work_revA
   exec vlog -refresh -work $target_path/pcsc_work_revA >>$target_path/pcsc_work_revA.log
   exec vmap pcsc_work_revA $target_path/pcsc_work_revA >>$target_path/vmap.log
}
if {$device == "ecp3" || $device == "all"} {
   puts "Refreshing PCSD library..."
   exec echo Refreshing the PCSD library... >$target_path/pcsd_work.log
   file delete -force $target_path/pcsd_work
   file copy $script_path/../blackbox/pcsd_work $target_path/pcsd_work
   exec vlog -refresh -work $target_path/pcsd_work >>$target_path/pcsd_work.log
   exec vmap pcsd_work $target_path/pcsd_work >>$target_path/vmap.log
}
if {$device == "ecp5u" || $device == "all"} {
  if {"ecp5u" in "$all_devices"} {
   if {$lang == "verilog" || $lang == "all"} {
      puts "Mapping ECP5UM Verilog library..."
      exec vmap ecp5um_vlg $target_path/ecp5u_vlg >>$target_path/vmap.log
   }
   if {$lang == "vhdl" || $lang == "all"} {
      puts "Mapping ECP5UM VHDL library..."
      exec vmap ecp5um $target_path/ecp5u >>$target_path/vmap.log
   }
  }
}

puts "Libraries are located in $target_path and modelsim.ini is updated."
