; TEST - testing some stuff in assembly..
; Input/Ouput with variables..
; This program is a mini calculator (Addition, Subtraction, Multiplication, Division)..
.386
include Irvine32.inc
.model flat, stdcall
ExitProcess proto, dwExitCode: dword
.stack 4096

.data
	num1  dd ?
	num2  dd ?
	Q     dd ?
	R     dd ?
	msg1  db "Please, enter two 32-bit integers: ", 0
	msg2  db "Addition: ", 0
	msg3  db "Subtraction: ", 0
	msg4  db "Multiplication: ", 0
	msg5  db "Division: ", 0
	msg6  db "Quotient = ", 0
	msg7  db ", ", 0
	msg8  db "Remainder = ", 0

.code
main proc
	; Taking the two numbers from the user..
	mov  edx, offset msg1
	call writeString
	call crlf
	call readInt
	mov  num1, eax
	call readInt
	mov  num2, eax

	;Addition..
	mov  eax, num1
	add  eax, num2
	mov  edx, offset msg2
	call writeString
	call writeInt

	call crlf

	;Subtraction..
	mov  eax, num1
	sub  eax, num2
	mov  edx, offset msg3
	call writeString
	call writeInt

	call crlf

	;Multiplication..
	mov  edx, 0
	mov  eax, num1
	mov  ebx, num2
	mul  ebx
	mov  edx, offset msg4
	call writeString
	call writeInt

	call crlf

	;Division..
	mov  edx, 0
	mov  eax, num1
	mov  ebx, num2
	div  ebx
	mov  Q, eax
	mov  R, edx
	mov  edx, offset msg5
	call writeString
	mov  edx, offset msg6
	call writeString
	call writeInt
	mov  edx, offset msg7
	call writeString
	mov  edx, offset msg8
	call writeString
	mov  eax, R
	call writeInt

	call crlf

	invoke ExitProcess, 0
main endp
end main

end