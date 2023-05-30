    .386
    .model flat, stdcall
    option casemap :none
    include masm32.inc
    include kernel32.inc
    include macros.asm
    includelib masm32.lib
    includelib kernel32.lib
    .code
    start:
      print "Hello world"
      exit
    end start

