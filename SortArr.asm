.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

Include Irvine32.inc

.data


Num_msg BYTE "Enter the number of numbers you want to insert: ",0
Input_msg   BYTE "Enter a 32-bit signed integer: ",0
Output_msg  BYTE "The Numbers You Inserted are: ",0
Array dword 10000 dup (0)
Itr	  dword ?
.code

main proc
	

	mov edx,OFFSET Num_msg 
	call WriteString	
	call Crlf			
	call ReadInt		; input the number of itration in Eax
	call Crlf
	mov Itr,Eax
	mov Ecx,Itr			; moving the number of iteration in Ecx for looping

	mov edi,OFFSET Array ; for storring
	mov esi,OFFSET Array ; for loading

Input:   mov   edx,OFFSET Input_msg
		 call  WriteString
		 call Crlf
		 call  ReadInt			; input integer into EAX
		 stosd
   		 Loop  Input                 ; repeat the loop
		 
		 mov edx,OFFSET Output_msg
		 call WriteString
		 call Crlf
		 mov Ecx,Itr

Output:  lodsd
		 Call WriteInt
		 call Crlf
		 loop Output
	exit
main endp
end main