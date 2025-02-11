@echo off

set name="biPolEXP"

set path=%path%;.\TOOLS\cc65\bin\

set CC65_HOME=TOOLS\

cc65 -Oirs %name%.c --add-source
ca65 crt0.s
ca65 %name%.s -g

ld65 -C nrom_32k_vert.cfg -o %name%.nes crt0.o %name%.o nes.lib -Ln %name%.labels --dbgfile %name%.dbg

del *.o

move /Y %name%.labels BUILD\ 
move /Y %name%.s BUILD\ 
move /Y %name%.nes BUILD\ 
move /Y %name%.dbg BUILD\