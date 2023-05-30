
ML.EXE /Zi /c /Fl /coff  flat_wiki0.ASM

if errorlevel 1 goto terminate

LINK32.EXE  /subsystem:console /debug /debugtype:cv flat_wiki0.obj

if errorlevel 1 goto terminate
rem dir %1.*

flat_wiki0.exe >> res.txt
:terminate
pause