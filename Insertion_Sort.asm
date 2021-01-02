; a method to sort an array using Insertion Sort algorithm..
.386
include Irvine32.inc
.model flat, stdcall

ExitProcess proto, dwExitCode: dword

.stack 4096

.data

.code
main proc

	INVOKE ExitProcess, 0
main endp

end main

end
