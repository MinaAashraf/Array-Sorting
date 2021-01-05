.386
include irvine32.inc
.model flat,stdcall
.stack 4096
.data

Array DWORD 2,5,8,0,1,7
Itr DWORD 6
Reverse  dword 1

; Sort algorithm data  *****************************************************
outLoop	 DWORD ? ; counter for the outer loop
inLoop   DWORD ? ; counter for the inner loop 
comma    BYTE ", ",0 
msg1     BYTE "The Ascending sort of the array is ",0 
.code

main proc


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
LEA EDX,comma				; add comma after each element 
CALL writeString
ADD ESI,4					
loop print
call crlf
call waitmsg				; wait to show the output for user



;**************************
output: 
 cmp Reverse , 0                ; Check ascending (Reverse = 0) Or descending (Reverse = 1)
 jz output                      ; If (reverse = 0) goto output directly to print the sorted array without reversing (ASSENDING SORT)


 reverseArr:   ; Reverse the array

   ; cacluate arrSize/2 and assign it into ecx:
    mov eax , Itr              ; numerator = Itr (arrSize)
    mov edx , 0     
    mov edi , 2                ; denominator = 2
    div edi                   ; eax = Itr/2 = arrSize/2  (neglect reminder)
    mov ecx , eax              ; ecx = arrSize/2


    ; get the addresses of the first element and the last element in arr
    mov ebx , offset Array     ; ebx =  address of the first element
    mov eax , 4   
    mul Itr                    ; eax = Itr * 4
    sub eax , 4                ; eax = Itr * 4 - 4 = offset of last element relative to the arr
    add eax , ebx              ; eax = address of last element relative to the segment


    loop1:                     ; loop through the half of the array
        mov edx , [ebx]        ; edx = element from the first half of the array
        mov edi , [eax]        ; edi = the corresponding element from the second half  
       ; swap the two elements in the array:
        mov [ebx],edi          
        mov [eax],edx
        add ebx , 4
        sub eax , 4

   loop loop1


   ; print the array
   output:
   mov ecx , Itr              ; ecx = arrSize
   mov ebx , offset Array     ; reset the ebx to be equal the address of first element again
   
   loop2:                     ; loop through each element in the array
        mov eax , [ebx]
        call writeint         ; print the content of eax
        call crlf             ; new line
        add ebx , 4           ; go to the next element
               
    loop loop2


    invoke ExitProcess,0
main endp
end main


