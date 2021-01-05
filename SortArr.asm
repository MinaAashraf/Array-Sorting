.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

INCLUDE Irvine32.inc ; including irvine library 

.data

; Inputs Data ***************************************************************

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

; This part of code was written by Mostsafa Mahmoud Mostafa 
; For handling input validation storage

; getting the length of the Array	
num:	mov edx,OFFSET Num_msg				; displaying number of inputs message
		call WriteString						
		call Crlf			
		call ReadInt				; input the number of itration in Eax
		mov Itr,Eax				; Itr = Eax
		pushf					; pushing the flag register in stack			
		pop Eax					; Eax = EFLAG
		mov Ebx,2048				; to check if valid int input
		and Ebx,Eax				; ebx &= eax
		cmp Ebx,0				; if ( unvalid input) goto num	
		jne num
		mov eax,Itr							
		mov Ebx,1				; making sure num of elements is more than 0 
		cmp Eax,Ebx				; if ( Itr <= 0 ) goto num
		jl num
		mov Ecx,Itr				; moving the number of iteration in Ecx for looping

		mov edi,OFFSET Array			; for stoaring 
		mov esi,OFFSET Array			; for loading

; getting the elements from the user
Input:   	mov   edx,OFFSET Input_msg		; input loop 
		call  WriteString
		call  Crlf
		call  ReadInt				; input integer into EAX
		pushf								
		pop Eax
		mov Ebx,2048				; to check if valid int input
		and Ebx,Eax
		cmp Ebx,0
		jne Input
		stosd					; storing data in memory
   		Loop  Input				; repeat the loop

; getting the Sorting type from the user
sort:	 	mov edx,OFFSET Sort_type_msg		; getting sotring type
		call WriteString
		call Crlf
		call ReadInt
		mov Ebx,3				; making sure that the input is between 1 & 2 & 3
		cmp Eax,Ebx				; if ( eax > 3 ) goto sort	
		jg sort
		mov Ebx,1				; if ( eax < 0) goto sort
		cmp Eax,Ebx					
		jl sort
		mov Sort_type,Eax			; assining Sort_type with the input


; getting the ascending or descending from the user

rev:	mov edx,OFFSET Reverse_ornot_msg		; getting ascending or descending sorting type
		call WriteString
		call Crlf
		call ReadInt
		mov Ebx,1				; making sure that the input is 0 or 1
		cmp Eax,Ebx				; if ( eax > ebx ) goto rev
		jg rev
		mov Ebx,0				
		cmp Eax,Ebx				; if ( eax < 0 ) goto rev
		jl rev	
		mov Reverse,Eax                    	; assigning Reverse with the input
		
		cmp Sort_type,1				; if( Sort_type == 1 )goto Bubble_Sort
		je Bubble_Sort				
		cmp Sort_type,2				;if( Sort_type == 2)goto Selection_Sort
		je Selection_Sort
		cmp Sort_type,3				;if(Sort_type == 3)goto Insertion_sort
		je Insertion_sort	

Bubble_Sort:
Selection_Sort:	
Insertion_sort:		
		exit

main endp
end main