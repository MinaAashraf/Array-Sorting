; TEST - testing some stuff in assembly..
; Input/Ouput with variables..
; This program is to divide two integers..
.386
include Irvine32.inc
.model flat, stdcall

ExitProcess proto, dwExitCode: dword

.stack 4096

.data
	msg1 db "Please, enter two integers: ", 0
	msg2 db " / ", 0
	msg3 db " = ", 0
	msg4 db ", Remainder = ", 0

	num1 dd ?
	num2 dd ?
	Q    dd ?
	R    dd ?

.code
main proc
	mov  edx, offset msg1
	call writeString					;display a string..
	call crlf							;just for new line..

	;taking two integers from user..
	call readInt						;accept the first integer from user..
	mov  num1, eax						;num1 = eax
	call readInt						;accept the second integer from user..
	mov  num2, eax						;num2 = eax

	;division operation..
	mov  edx, 0							;clear edx
	mov  eax, num1						;eax = num1
	mov  ebx, num2						;edx = num2
	div  ebx							;eax / ebx
	mov  Q, eax							;Q = eax (Quotient)
	mov  R, edx							;R = edx (Remainder)

	;Displaying the result..
	mov  eax, num1
	call writeInt
	mov  edx, offset msg2
	call writeString
	mov  eax, num2
	call writeInt
	mov  edx, offset msg3
	call writeString
	mov  eax, Q
	call writeInt
	mov  edx, offset msg4
	call writeString
	mov  eax, R
	call writeInt

	call crlf

	INVOKE ExitProcess, 0
main endp

end main

end
