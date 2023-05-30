Ml -c -coff -Fl /Zi lab_flat_0.asm
pause
rem link32 -subsystem:console -v lab_flat_0.obj
rem link32 -DEBUGTYPE:COFF lab_flat_0.obj
rem f:\Asm\Asm32\Masm615\LINK32.EXE  /subsystem:console /debug /debugtype:cv LAB_flat_0.obj

LINK32.EXE  /subsystem:console /debug /debugtype:cv LAB_flat_0.obj
pause