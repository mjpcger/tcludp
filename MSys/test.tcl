set Result " \n "
if {$tcl_platform(pointerSize) == 4} {
    set libdir Tcl-32
} {
    set libdir "Tcl[format "%0.0f" [expr $tcl_version -0.45]]-64"
}
pack [ttk::frame .f] -expand 1 -fill both
pack [ttk::button .f.b -text "Load Extension" -command {doWithCheck {load [glob $libdir/udp*.dll]}}] -expand 1 -fill x -side left
pack [ttk::button .f.o -text "Open Socket 45454" -command {doWithCheck {set Socket [set sock [udp_open 45454]]}}] -expand 1 -fill x -side left
pack [ttk::button .f.c -text "Close opened socket" -command {doWithCheck {close $sock}}] -expand 1 -fill x -side left
pack [ttk::button .f.x -text "Exit" -command exit] -expand 1 -fill x -side right
pack [ttk::labelframe .c  -text {free command, use $sock or $Socket as socket handle}] -expand 1 -fill both
pack [ttk::entry .c.e -textvariable Cmd -width 120] -expand 1 -fill both -side left
pack [ttk::button .c.b -text "Execute" -command {doCmd $Cmd}] -fill y -side right
pack [ttk::label .l -textvariable Result -anchor w ] -expand 1 -fill both

set Cmd ""
set Count 0

proc setResult {text err} {
    global Result Count
    incr Count
    set Result "$text\n[format "%3d - %d" $Count $err]"
}

proc doWithCheck {cmd} {
    global Result sock Socket tcl_platform libdir tcl_version
    set err [catch $cmd text]
    setResult $text $err
}

proc doCmd {cmd} {
    global Result sock Socket
    set prev $sock
    if {[set err [catch $cmd text]] == 0} {
        switch -glob "$text" {
            sock*   {
                set Socket [set sock $text]
            }
            default {
                if {$sock != $Socket} {
                    if {$sock == $prev} {
                        set sock $Socket
                    } {
                        set Socket $sock
                    }
                    if {$text == ""} {
                        set text $sock
                    }
                }
            }
        }
    }
    setResult $text $err
}