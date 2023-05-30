ML.EXE /Zi /c /Fl /coff 4Lab.asm
pause

LINK32.EXE  /subsystem:console /debug /debugtype:cv 4Lab.obj
pause