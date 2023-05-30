Ml -c -coff -Fl flat_wiki.asm
pause
rem link32 -subsystem:console -v flat_wiki.obj   - error
rem link32 -DEBUGTYPE:COFF flat_wiki.obj	- error	

LINK32.EXE  /subsystem:console /debug /debugtype:cv flat_wiki.obj

pause