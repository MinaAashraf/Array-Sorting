; TEST - testing some stuff in assembly..
; First Array in Assembly..
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
	mov  eax, fourbyteArr
	call writeInt
	mov  edx, offset msg
	call writeString
	mov  eax, fourbyteArr[4]
	call writeInt
	call writeString
	mov  eax, fourbyteArr[8]
	call writeInt
	call writeString
	mov  eax, fourbyteArr[16]
	call writeInt

	call crlf
	
	invoke ExitProcess, 0
main endp
end main

end