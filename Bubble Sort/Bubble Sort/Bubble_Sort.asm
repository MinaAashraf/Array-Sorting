.386
.model flat, stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD

.data



.code
main PROC



  INVOKE ExitProcess, eax
main ENDP

END main        ;specify the program's entry point