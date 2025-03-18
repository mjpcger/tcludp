proc doload {dir} {
	global tcl_version tcl_platform
	
	if {$tcl_platform(platform) != "windows"} {
		error "Package udp supported for Windows only."
	}
	if {$tcl_platform(pointerSize) == 4} {
		load [file join $dir Tcl-32 udp110.dll]
	} elseif {[format "%0.0f" [expr $tcl_version - 0.45]] == 8} {
		load [file join $dir Tcl8-64 udp110.dll]
	} {
		load [file join $dir Tcl9-64 udp110.dll]
	}
}

package ifneeded udp 1.1.0 [list doload $dir]
