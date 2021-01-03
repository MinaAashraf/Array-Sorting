

INCLUDE Irvine32.inc
.data
array SDWORD 10, -1, 5, 11, 32, 4
outLoop DWORD ?
inLoop DWORD ?
comma BYTE ", ",0
.code
main PROC
lea ESI, array
MOV EAX, lengthof array ; get the lenght (n) of array
dec eax ; eax = n-1 
mov outLoop , eax ; outloop = n-1 
mov inLoop,0 

mov ecx, outLoop
l1:
push ecx 



l2:


;shifting the  inLoop index
shl inLoop ,2
MOV EDI,ESI ; EDI = ESI = OFFSET array 
ADD EDI,inLoop

;shifting OutLoop
shl outLoop, 2
MOV EBX,ESI
ADD EBX,outLoop

; TRANSITION arr[inLoop] = [EDI] , arr[outLoop] = [EBX]
MOV EAX, [EDI];temp1= EAX = arr[in]
MOV EDX, [EBX];temp2= EDX = arr[out]
; after mofifying indexes lets apply condition 
CMP EDX,EAX ; 
JGE L3 ; if arr[out] >= arr[int] , then jumb to L3, else complete

; SWapping
MOV [EBX],EAX; arr[out] = arr[in]
mov [EDI],EDX; arr[IN] = ARR[out]

inc inLoop
dec outLoop
L3: loop l2



pop cx
cmp cx,1
jbe finish 
loop l1
finish:

; End of loop 1

; Loop for printing array after sorting 
MOV ESI,offset array
MOV ECX,lengthof array
print:
MOV EAX,[ESI]
CALL writeint
LEA EDX,comma
CALL writeString
ADD ESI,4
loop print


call waitmsg
main ENDP
END main