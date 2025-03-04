CommonFlags = -DUSE_TCL_STUBS -DBUILD_udp \
	-DTCL_MAJOR_VERSION=8 \
	-DPACKAGE_NAME=\"udp\" -DPACKAGE_VERSION=\"1.1\" \
	-I$(ActualTclPath)/include

ifeq ($(TargetType)$(TargetMachine),DebugX64)
	TargetDir = Debug8
	Target = udp110.dll
	CFlags = -m64 -ggdb $(CommonFlags) -D_M_AMD64
	cpp = gcc
endif

ifeq ($(TargetType)$(TargetMachine),ReleaseX64)
	TargetDir = Release8
	Target = udp110.dll
	CFlags = -m64 -Os $(CommonFlags) -D_M_AMD64
	cpp = gcc
endif

ifeq ($(TargetType)$(TargetMachine),DebugX86)
	TargetDir = Debug4
	Target = udp110.dll
	CFlags = -m32 -ggdb  $(CommonFlags)
	cpp = gcc
endif

ifeq ($(TargetType)$(TargetMachine),ReleaseX86)
	TargetDir = Release4
	Target = udp110.dll
	CFlags = -m32 -Os  $(CommonFlags)
	cpp = gcc
endif

All : $(TargetDir) $(TargetDir)/$(Target)

$(TargetDir) :
	mkdir $(TargetDir)
	
$(TargetDir)/$(Target) : ../generic/udp_tcl.c ../generic/udp_tcl.h stubstub$(TargetMachine).o
	$(cpp) $(CFlags) -flto -shared -o $@ ../generic/udp_tcl.c stubstub$(TargetMachine).o -lws2_32

stubstub$(TargetMachine).o : stubstub.c
	$(cpp) -c $(CFlags) -o $@ $<
