;Bubble Sort Algorithm

INCLUDE Irvine32.inc ; including irvine library 
.data
Array		dword 100009 dup (0)
Itr			dword ?
Input_msg			BYTE "Enter a 32-bit signed integer: ",0
Output_msg			BYTE "The Numbers You Inserted are: ",0
Num_msg BYTE "Enter the number of Elements you want to insert: ",0

; My data ************************************************************************
outLoop	 DWORD ? ; counter for the outer loop
inLoop   DWORD ? ; counter for the inner loop 
comma    BYTE ", ",0 
msg1     BYTE "The Ascending sort of the array is ",0 
.code
main PROC
;Input section 
;----------------------------
mov edx,OFFSET Num_msg 
	call WriteString	
	call Crlf			
	call ReadInt		; input the number of itration in Eax
	call Crlf
	mov Itr,Eax
	mov Ecx,Itr			; moving the number of iteration in Ecx for looping

	mov edi,OFFSET Array ; for storring
	mov esi,OFFSET Array ; for loading

Input:   mov   edx,OFFSET Input_msg  ; input loop 
		 call  WriteString
		 call Crlf
		 call  ReadInt			     ; input integer into EAX
		 stosd						 ; storing data in memory
   		 Loop  Input                 ; repeat the loop

;*****************************************
; Bubble_Sort Algorithm
;------------------------
lea ESI, Array				; Load ESI with beggining address of the Array
MOV EAX, Itr				; get the lenght (n) of array
dec eax						; eax = Itr-1 
mov outLoop , eax			; outloop = Itr-1
mov inLoop,0 

mov ECX, outLoop			; repeat the outer loop for Itr-1 times 
; Start Outer Loop
l1:
push ECX					; push ECX to the stack to keep the outLoop counter from chainging 
; Start Inner Loop
L2:
;shifting the  inLoop index
MOV EDI , inLoop			; EDI = inLoop
MOV EDX , inLoop			; ECX = inLoop
inc inLoop
INC EDX						; ECX = inLoop +1 
SHL EDI,2					; EDI = inLoop *4 
SHL EDX,2					; ECX = (inLoop+1)*4
ADD EDI,ESI					; EDI = offset Array + (inLoop)*4 , EDI = &arr [in]
ADD EDX,ESI					; ECX = offset Array + (inLoop+1)*4, ECX= &arr [in+1]

; getting array values from memory to registers 
MOV EAX,[EDI]				; EAX = arr [in]
mov EBX,[EDX]				; EBX = arr [in+1]

; after mofifying indexes lets apply condition 
CMP EAX,EBX ; 
JLE L3						; IF arr[in] <= arr[in+1] jump L3,  else (arr[in]>arr[in+1]) continue

; swapping process 
MOV [EDI],EBX				; arr[in] = arr[in+1]
MOV [EDX],EAX				;arr[in+1]=arr[in]

LOOP L2						; go back to label L2
jmp next					; after finishing outerLoop got to the next label 

L3:							; when arr[in] < arr[in+1] 
cmp ECX,1					; this comparison is used if the two last elements in array are sorted, so the loop must be finished 
je next
loop L2
next:

mov inLoop,0				; initialize the inLoop counter to start from zero 
pop ECX						; retrieve (ECX = outLoop) counter of outer loop from the stack
cmp ECX,1					; outer loop finishes when ECX=1
jbe finish 
loop l1
finish:

; End of loop 1

; Loop for printing array after sorting 
LEA EDX,msg1				; lodad the msg1 address in EDX register 
call writeString			; print "The Ascending sort of the array is "
call crlf					; print empty line
LEA ESI,Array				; load start address of Array
MOV ECX,Itr
print:						; loop for each element in array then print it 
MOV EAX,[ESI]
CALL writeint
LEA EDX,comma
CALL writeString
ADD ESI,4
loop print
call crlf

call waitmsg
main ENDP
END main