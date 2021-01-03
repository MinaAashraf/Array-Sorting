; TEST - testing some stuff in assembly..
; First interactive program (accepting input from user and displaying output)..
.386
include Irvine32.inc
.model flat, stdcall

ExitProcess proto, dwExitCode: dword

.stack 4096

.data
	msg1  db "Enter an integer to display..", 0
	msg2  db "You have entered: ", 0

.code
main proc
	;Displaying a message to the user in the command line
	mov  edx, offset msg1				;storing the memory address of variable (msg1) in edx register..
	call writeString					;displaying the string, stored in edx register, in the command line..
	call crlf							;just for new line..

	;Accepting input from user
	call readInt						;accepting signed integer from the user (the entered value is stored in eax register)..
	
	;Displaying output for the user in the command line
	mov  edx, offset msg2				;storing the memory address of variable (msg2) in the edx register..
	call writeString					;displaying the content (string) of edx register..
	call writeInt						;displaying the content (signed integer value) of eax register..
	call crlf							;just a new line..

	INVOKE ExitProcess, 0
main endp

end main

end
