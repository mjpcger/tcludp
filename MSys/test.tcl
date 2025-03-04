console show
set Result " \n "
pack [ttk::frame .f] -expand 1 -fill both
pack [ttk::button .f.b -text "Load Extension" -command {doWithCheck {load [glob Debug$tcl_platform(pointerSize)/udp*.dll]}}] -expand 1 -fill x -side left
pack [ttk::button .f.o -text "Open Socket 45454" -command {doWithCheck {set sock [udp_open 45454]}}] -expand 1 -fill x -side left
pack [ttk::button .f.c -text "Close opened socket" -command {doWithCheck {close $sock}}] -expand 1 -fill x -side left
pack [ttk::button .f.x -text "Exit" -command exit] -expand 1 -fill x -side right
pack [ttk::label .l -textvariable Result -anchor w ] -expand 1 -fill both

proc doWithCheck {cmd} {
    global Result sock tcl_platform
    set err [catch $cmd text]
    set Result "$text\n$err"
}