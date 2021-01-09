.386
include irvine32.inc
.model flat,stdcall
.stack 4096
.data

; Inputs Data ***************************************************************

Num_msg			BYTE "Enter the number of numbers you want to insert: ",0
Input_msg		BYTE "Enter a 32-bit signed integer: ",0
Output_msg		BYTE "The Numbers You Inserted are: ",0
Sort_type_msg		BYTE "Enter 1 for Bubble sort 2 for Selection sort 3 for Insertion sort: ",0
Reverse_ornot_msg	BYTE "Enter 0 for Ascending sorting and 1 for descending sorting",0
	
Array		dword 100009 dup (0)
Itr		dword ?
Sort_type	dword ?
Reverse     	dword ?
Var		dword ?

; Bubble Sort algorithm data  *****************************************************
outLoop	 	DWORD ? ; counter for the outer loop
inLoop  	DWORD ? ; counter for the inner loop 
comma   	BYTE ", ",0 
msg1    	BYTE "The Ascending sort of the array is ",0 


; Insertion Algorithm data ************************************************
temp  dd ?

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
		mov Var,Eax
		pushf								
		pop Eax
		mov Ebx,2048				; to check if valid int input
		and Ebx,Eax
		cmp Ebx,0
		jne Input
		mov Eax,Var
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
	;	cmp Sort_type,2				;if( Sort_type == 2)goto Selection_Sort
;		je Selection_Sort
		cmp Sort_type,3				;if(Sort_type == 3)goto Insertion_sort
		je Insertion_Sort	

;*****************************************
; Bubble_Sort Algorithm
;------------------------
Bubble_Sort:
		lea ESI, Array				; Load ESI with beggining address of the Array
		MOV EAX, Itr				; get the lenght (n) of array
		dec eax					; eax = Itr-1 
		mov outLoop , eax			; outloop = Itr-1
		mov inLoop,0 

		mov ECX, outLoop			; repeat the outer loop for Itr-1 times 
; Start Outer Loop
l1:
		push ECX				; push ECX to the stack to keep the outLoop counter from chainging 
; Start Inner Loop
L2:
		;shifting the  inLoop index
		MOV EDI , inLoop			; EDI = inLoop
		MOV EDX , inLoop			; ECX = inLoop
		inc inLoop
		INC EDX					; ECX = inLoop +1 
		SHL EDI,2				; EDI = inLoop *4 
		SHL EDX,2				; ECX = (inLoop+1)*4
		ADD EDI,ESI				; EDI = offset Array + (inLoop)*4 , EDI = &arr [in]
		ADD EDX,ESI				; ECX = offset Array + (inLoop+1)*4, ECX= &arr [in+1]

; getting array values from memory to registers 
		MOV EAX,[EDI]				; EAX = arr [in]
		mov EBX,[EDX]				; EBX = arr [in+1]

; after mofifying indexes lets apply condition 
CMP EAX,EBX ; 
		JLE L3					; IF arr[in] <= arr[in+1] jump L3,  else (arr[in]>arr[in+1]) continue

; swapping process 
		MOV [EDI],EBX				; arr[in] = arr[in+1]
		MOV [EDX],EAX				;arr[in+1]=arr[in]

LOOP L2							; go back to label L2
		jmp next				; after finishing outerLoop got to the next label 

L3:							; when arr[in] < arr[in+1] 
		cmp ECX,1				; this comparison is used if the two last elements in array are sorted, so the loop must be finished 
		je next
		loop L2

next:
		mov inLoop,0				; initialize the inLoop counter to start from zero 
		pop ECX					; retrieve (ECX = outLoop) counter of outer loop from the stack
		cmp ECX,1				; outer loop finishes when ECX=1
		jbe finish 
		loop l1
finish:

; End of loop 1
		
 jmp Output

;**************************
;Insertion Sort Algorithm..
Insertion_Sort:
	mov  ecx, 0						;clear ecx register
	mov  ecx, 1						;ecx = 1 (outer loop counter, starts from 1) (i=1)
	loop1:
		cmp  ecx, Itr					;the outer loop condition
		jge  exitLoop1
		mov  edx, Array[4*ecx]				;edx = Array[i]
		mov  temp, edx					;storing the element (i) into the temporary variable, temp
		push ecx					;saving the outer loop counter
		loop2:
			cmp  ecx, 0				;inner loop first condition (i<Itr)
			jle  exitLoop2
			cmp  edx, Array[4*ecx-4]		;inner loop second condition (temp<Array[j-1])
			jg   exitLoop2
			mov  esi, 0				;clear edx
			mov  esi, Array[4*ecx-4]		;edx = Array[j-1]
			mov  Array[4*ecx], esi			;Array[j] = edx
			dec  ecx				;ecx-- (j--)
			jmp  Loop2
		exitLoop2:
		mov  edx, 0					;clear edx
		mov  edx, temp					;edx = temp
		mov  Array[4*ecx], edx				;Array[j] = edx
		pop  ecx					;restore the outer loop counter
		inc  ecx					;ecx++ (i++)
		jmp  Loop1
	exitLoop1:
	;end insertionSort algorithm section
	;----------------------------------------------------------------------------------------------------------
	
;**************************
Output: 
cmp Reverse , 0               			; Check ascending (Reverse = 0) Or descending (Reverse = 1)
jz printResult                      			; If (reverse = 0) goto Print directly to print the sorted array without reversing (ASSENDING SORT)


reverseArr:   					; Reverse the array
; cacluate arrSize/2 and assign it into ecx:
mov eax , Itr              			; numerator = Itr (arrSize)
mov edx , 0     
mov edi , 2                			; denominator = 2
div edi                   			; eax = Itr/2 = arrSize/2  (neglect reminder)
mov ecx , eax             	 		; ecx = arrSize/2


; get the addresses of the first element and the last element in arr
mov ebx , offset Array     			; ebx =  address of the first element
mov eax , 4   
mul Itr                    			; eax = Itr * 4
sub eax , 4                			; eax = Itr * 4 - 4 = offset of last element relative to the arr
add eax , ebx              			; eax = address of last element relative to the segment


reversingLoop:                     		; loop through the half of the array
mov edx , [ebx]        				; edx = element from the first half of the array
mov edi , [eax]        				; edi = the corresponding element from the second half  
; swap the two elements in the array:
mov [ebx],edi          
mov [eax],edx
add ebx , 4
sub eax , 4
loop reversingLoop


; print the array
printResult:
mov ecx , Itr              			; ecx = arrSize
mov ebx , offset Array     			; reset the ebx to be equal the address of first element again
   
printingLoop:                     		; loop through each element in the array
mov eax , [ebx]
call writeint         				; print the content of eax
call crlf             				; new line
add ebx , 4           				; go to the next element
loop printingLoop

invoke ExitProcess,0
main endp
end main
