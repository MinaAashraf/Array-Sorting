; insertionSort procedure in Assembly..
.386
include Irvine32.inc
.model flat, stdcall
ExitProcess proto, dwExitCode: dword
.stack 4096

.data

.code
insertionSort proc
	push ebp
	mov  ebp, esp
	mov  [ebp-4], edi
	;push something
	;push another something

	;pop  the something
	;pop  the other something
	pop  ebp
	ret
insertionSort endp

main proc
	
	call insertionSort
	
	invoke ExitProcess, 0
main endp
end main

end