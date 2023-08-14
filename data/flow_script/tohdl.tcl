#Scripts to call hdl converter engine
proc tohdl {language src_format src_file out_file project_dir} {
	set engine(SchematicToVHDL) [list sch2vhd -FPGA -lib [runtime_property value device.family] -i $src_file -o $out_file -gui -msgset $project_dir/promote.xml]
	set engine(SchematicToVerilog) [list sch2vlog -FPGA -i $src_file -o $out_file -gui -msgset $project_dir/promote.xml]
	
	set con "${src_format}To${language}"
	runtime_log "\n$engine($con)\n"
	set status 0
	set error_msg ""
	if {[catch {eval exec -keepnewline $engine($con)} out]} {
		if {[lindex $::errorCode 0] eq "CHILDSTATUS"} {
            set status [lindex $::errorCode 2]
		} else {
		    # Some kind of unexpected failure
			set status -1
		}
		set error_msg "Error in converting $src_file to $out_file\n"
    }
	runtime_log "$out"
	return -code $status $error_msg
}
