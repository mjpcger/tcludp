
ifeq ($(TargetType)$(TargetMachine),DebugX64)
	TargetDir = Debug64
	CFlags = -m64 -Os -DUSE_TCL_STUBS -DUSE_TK_STUBS -I./include -shared
	cpp = gcc
endif

ifeq ($(TargetType)$(TargetMachine),ReleaseX64)
	TargetDir = Release64
	CFlags = -m64 -Os -DUSE_TCL_STUBS -DUSE_TK_STUBS -I./include -shared
	cpp = gcc
endif

ifeq ($(TargetType)$(TargetMachine),DebugX86)
	TargetDir = Debug32
	CFlags = -m32 -ggdb -DUSE_TCL_STUBS -DUSE_TK_STUBS -I./include -shared
	cpp = gcc
endif

ifeq ($(TargetType)$(TargetMachine),ReleaseX86)
	TargetDir = Release32
	CFlags = -m32 -Os -DUSE_TCL_STUBS -DUSE_TK_STUBS -I./include -shared
	cpp = gcc
endif

All : $(TargetDir) $(TargetDir)/udp200.dll

$(TargetDir) :
	mkdir $(TargetDir)
	
$(TargetDir)/udp200.dll : udp_tcl.c udp_tcl.h 
	$(cpp) $(CFlags) -flto -o $@ udp_tcl.c -lws2_32
