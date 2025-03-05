# Comment out -ggdb to create release versions
# Comment -ggdb to create debug versions

CommonFlags = -DUSE_TCL_STUBS -DBUILD_udp \
	-DPACKAGE_NAME=\"udp\" -DPACKAGE_VERSION=\"1.1\" \
	-I$(ActualTclPath)/include \
	-ggdb

ifeq ($(TargetType)$(TargetMachine),Tcl8X64)
	TargetDir = Tcl8-64
	Target = udp110.dll
	CFlags = -m64 $(CommonFlags) -D_M_AMD64 -DTCL_MAJOR_VERSION=8 
	cpp = gcc
endif

ifeq ($(TargetType)$(TargetMachine),Tcl9X64)
	TargetDir = Tcl9-64
	Target = udp110.dll
	CFlags = -m64 $(CommonFlags) -D_M_AMD64
	cpp = gcc
endif

ifeq ($(TargetType)$(TargetMachine),TclX86)
	TargetDir = Tcl-32
	Target = udp110.dll
	CFlags = -m32 $(CommonFlags) -DTCL_MAJOR_VERSION=8 
	cpp = gcc
endif

All : $(TargetDir) $(TargetDir)/$(Target)

$(TargetDir) :
	mkdir $(TargetDir)
	
$(TargetDir)/$(Target) : ../generic/udp_tcl.c ../generic/udp_tcl.h
	$(cpp) $(CFlags) -flto -shared -o $@ ../generic/udp_tcl.c \
	$(ActualTclPath)/lib/libtclstub.a -lws2_32
