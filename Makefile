#
# A Makefile that compiles all .c and .s files in "src" and "res"
# subdirectories and places the output in a "obj" subdirectory
#

# If you move this project you can change the directory
# to match your GBDK root directory (ex: GBDK_HOME = "C:/GBDK/"

GBDK_HOME = ../../gbdk/

LCC = $(GBDK_HOME)bin/lcc

EMU = ../../Emulicious/emulicious

ROM_USAGE = ../../romusage

# You can set flags for LCC here
# For example, you can uncomment the line below to turn on debug output
# LCCFLAGS = -debug


# LCCFLAGS and SAVFLAGS are copied from the link below. I tried my best to document what they do
# some of the documentation comews from the same link, others from the gbdk toolchain wiki page
# http://www.devrs.com/gb/files/sram.txt

# -m is for selecting the port and platform (unset in this case)
# -yt2 = Tells the linker that we want ROM+MBC1+RAM (that's the NV RAM)
# -yo4 = Tells the linker we are using 4 ROM banks X 16K --- This is a 64K gb rom
# -ya4 = Tells the linker we are using 4 RAM banks X 8K --- 32K of nv RAM
# -yc means GBC compatible (not using that)

LCCFLAGS = -Wl-m -Wl-yt0x1B -Wl-yo4 -Wl-ya4 -Wl-j -autobank -Wb-ext=.rel -Wb-v
# -Wl-yc
# -W[pfablim]arg  pass `arg' to the preprocessor, compiler, assembler, bankpack, linker, ihxcheck, or makebin
# -Wa = pass assempler as an argument
# -l   Create list   file/outfile[.lst]
# -ba0 use data bank 0

SAVFLAGS = -Wf-ba0

# You can set the name of the .gb ROM file here
PROJECTNAME    = 5-of-a-Kind

DIR_SRC      = src

DIR_BANK_0	= $(DIR_SRC)/bank_0
DIR_BANK_1	= $(DIR_SRC)/bank_1
DIR_BANK_2	= $(DIR_SRC)/bank_2
DIR_BANK_3	= $(DIR_SRC)/bank_3

DIR_SRAM	= $(DIR_SRC)/sram

DIR_BUILD   = .build
DIR_ROM     = rom

BINS	    = $(DIR_ROM)/$(PROJECTNAME).gb
CSOURCES    = $(foreach dir,$(DIR_SRC), $(notdir $(wildcard $(dir)/*.c))) $(foreach dir, $(DIR_BANK_0), $(notdir $(wildcard $(dir)/*.c))) $(foreach dir, $(DIR_BANK_1), $(notdir $(wildcard $(dir)/*.c))) $(foreach dir, $(DIR_BANK_2), $(notdir $(wildcard $(dir)/*.c))) $(foreach dir, $(DIR_BANK_3), $(notdir $(wildcard $(dir)/*.c))) $(foreach dir, $(DIR_SRAM), $(notdir $(wildcard $(dir)/*.c)))

ASMSOURCES  = $(foreach dir,$(DIR_SRC), $(notdir $(wildcard $(dir)/*.s)))
OBJS       = $(CSOURCES:%.c=$(DIR_BUILD)/%.o) $(ASMSOURCES:%.s=$(DIR_BUILD)/%.o)

all:	prepare $(BINS)
	@$(ROM_USAGE) $(BINS)
	@$(EMU) $(BINS)

# needs Makefile
compile.bat: Makefile
	# text echo'd into compile.bat
	@echo "REM Automatically generated from Makefile" > compile.bat
	# silently prints the commands that would be run but doesn't run them
	# grep stores it in compile.bat
	@make -sn | sed y/\\//\\\\/ | grep -v make >> compile.bat


# $@ means multiple targets are being passed
# Compile .c files in "src/" to .o object files
$(DIR_BUILD)/%.o:	$(DIR_SRC)/%.c
	$(LCC) $(LCCFLAGS) -c -o $@ $<

# Compile .c files in "res/" to .o object files
$(DIR_BUILD)/%.o:	$(DIR_BANK_0)/%.c
	$(LCC) $(LCCFLAGS) -c -o $@ $<

# Compile .c files in func/ to .o object files
$(DIR_BUILD)/%.o:	$(DIR_BANK_1)/%.c
	$(LCC) $(LCCFLAGS) -c -o $@ $<

# Compile .c files in func/ to .o object files
$(DIR_BUILD)/%.o:	$(DIR_BANK_2)/%.c
	$(LCC) $(LCCFLAGS) -c -o $@ $<

# Compile .c files in func/ to .o object files
$(DIR_BUILD)/%.o:	$(DIR_BANK_3)/%.c
	$(LCC) $(LCCFLAGS) -c -o $@ $<

# Compile .c files in "sram/" to .o object files
$(DIR_BUILD)/%.o:	$(DIR_SRAM)/%.c
	$(LCC) $(SAVFLAGS) -c -o $@ $<

# Compile .s assembly files in "src/" to .o object files
$(DIR_BUILD)/%.o:	$(DIR_SRC)/%.s
	$(LCC) $(LCCFLAGS) -c -o $@ $<

# If needed, compile .c files in "src/" to .s assembly files
# (not required if .c is compiled directly to .o)
$(DIR_BUILD)/%.s:	$(DIR_SRC)/%.c
	$(LCC) $(LCCFLAGS) -S -o $@ $<

# Link the compiled object files into a .gb ROM file
$(BINS):	$(OBJS)
	$(LCC) $(LCCFLAGS) -o $(BINS) $(OBJS)

prepare:
#makes directory for storing .gbm
	mkdir -p $(DIR_BUILD)
	mkdir -p $(DIR_ROM)



clean:
# removes all files made in order to make .gb
# this is only if an above rule has a failure
#	rm -f  *.gb *.ihx *.cdb *.adb *.noi *.map
	rm -f  $(DIR_BUILD)/*.*
