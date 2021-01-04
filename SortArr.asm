.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

Include Irvine32.inc

.data


Num_msg			BYTE "Enter the number of numbers you want to insert: ",0
Input_msg		BYTE "Enter a 32-bit signed integer: ",0
Output_msg		BYTE "The Numbers You Inserted are: ",0
Sort_type_msg		BYTE "Enter 1 for Bubble sort 2 for Selection sort 3 for Insertion sort: ",0
Reverse_ornot_msg	BYTE "Enter 1 for 0 for Ascending sorting and 1 for descending sorting",0

Array		dword 100009 dup (0)
Itr		dword ?
Sort_type	dword ?
Reverse     	dword ?


.code

main proc
	
num:	mov edx,OFFSET Num_msg			; displaying number of inputs message
		call WriteString						
		call Crlf			
		call ReadInt			; input the number of itration in Eax
		mov Ebx,1			; making sure num of elements is more than 0 
		cmp Eax,Ebx
		jl num
		mov Itr,Eax
		mov Ecx,Itr			; moving the number of iteration in Ecx for looping


		mov edi,OFFSET Array		; for storring 
		mov esi,OFFSET Array		; for loading

Input:   mov   edx,OFFSET Input_msg		; input loop 
		 call  WriteString
		 call  Crlf
		 call  ReadInt			; input integer into EAX
		 ;cmp Eax,0
		 ;je Input
		 ;mov Eax,Ecx
		 ;call  WriteInt
		 ;call  Crlf
		 stosd				; storing data in memory
   		 Loop  Input			; repeat the loop
		 
sort:	 mov edx,OFFSET Sort_type_msg		; getting sotring type
		 call WriteString
		 call Crlf
		 call ReadInt
		 mov Ebx,3			; making sure that the input is between 1 & 2 & 3
		 cmp Eax,Ebx
		 jg sort
		 mov Ebx,1
		 cmp Eax,Ebx
		 jl sort
		 mov Sort_type,Eax		; assining Sort_type with the input

rev:	 mov edx,OFFSET Reverse_ornot_msg	; getting ascending or descending sorting type
		 call WriteString
		 call Crlf
		 call ReadInt
		 mov Ebx,1			; making sure that the input is 0 or 1
		 cmp Eax,Ebx
		 jg rev
		 mov Ebx,0
		 cmp Eax,Ebx
		 jl rev
		 mov Reverse,Eax                ; assigning Reverse with the input

		 exit
main endp
end main