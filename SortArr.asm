

INCLUDE Irvine32.inc
.data
array SDWORD 100, -1, 987, 0, 12, 4
outLoop DWORD ?
inLoop DWORD ?
comma BYTE ", ",0
msg1 BYTE "The Ascending sort of the array is ",0
.code
main PROC
lea ESI, array ; Load ESI with offset array
MOV EAX, lengthof array ; get the lenght (n) of array
dec eax ; eax = n-1 
mov outLoop , eax ; outloop = n-1 
mov inLoop,0 

mov ECX, outLoop ; repeat the outer loop for n-1 times 
; Start Outer Loop
l1:
push ECX 
; Start Inner Loop
L2:
;shifting the  inLoop index
MOV EDI , inLoop ; EDI = inLoop
MOV EDX , inLoop ; ECX = inLoop
inc inLoop
INC EDX			; ECX = inLoop +1 
SHL EDI,2		; EDI = inLoop *4 
SHL EDX,2		; ECX = (inLoop+1)*4
ADD EDI,ESI		; EDI = offset Array + (inLoop)*4 , EDI = &arr [in]
ADD EDX,ESI		; ECX = offset Array + (inLoop+1)*4, ECX= &arr [in+1]

; getting array values from memory to registers 
MOV EAX,[EDI]		; EAX = arr [in]
mov EBX,[EDX]		; EBX = arr [in+1]

; after mofifying indexes lets apply condition 
CMP EAX,EBX ; 
JLE L3 ; IF arr[in] <= arr[in+1] jump L3,  else (arr[in]>arr[in+1]) continue

; swapping process 
MOV [EDI],EBX		; arr[in] = arr[in+1]
MOV [EDX],EAX		;arr[in+1]=arr[in]

LOOP L2
jmp next

L3:
cmp ECX,1
je next
loop L2
next:

mov inLoop,0
pop ECX
cmp ECX,1
jbe finish 
loop l1
finish:

; End of loop 1

; Loop for printing array after sorting 
LEA EDX,msg1
call writeString
call crlf
LEA ESI,array
MOV ECX,lengthof array
print:
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