; TEST - testing some stuff in assembly..
; Accessing elements of array..
.386
include Irvine32.inc
.model flat, stdcall
ExitProcess proto, dwExitCode: dword
.stack 4096

.data
	msg         db ", ", 0

	onebyteArr  db 5, 10, 6, 13, 19
	twobyteArr  dw 5, 10, 6, 13, 19
	fourbyteArr dd 5, 10, 6, 13, 19

.code
main proc
	mov  ebx, offset fourbyteArr				;saving the memory address of the beginning of the array
	mov  eax, [ebx]								;eax = first element of the array
	call writeInt
	mov  edx, offset msg
	call writeString
	mov  eax, [ebx+4]							;eax = second element of the array
	call writeInt
	call writeString
	mov  eax, [ebx+8]							;eax = 3rd element of the array
	call writeInt
	call writeString
	mov  eax, [ebx+12]							;eax = 4th element of the array
	call writeInt
	call writeString
	mov  eax, [ebx+16]							;eax = 5th element of the array
	call writeInt

	call crlf
	
	invoke ExitProcess, 0
main endp
end main

end