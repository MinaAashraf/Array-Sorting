

INCLUDE Irvine32.inc
.data
array SDWORD 10, -1, 5, 11, 32, 4
outLoop DWORD ?
inLoop DWORD ?
msg1 byte "hello from out loop",0
msg2 byte "hello from inner loop",0

.code
main PROC
MOV EAX, lengthof array
dec eax 
;mov outLoop , eax 
;mov inLoop,0
mov ecx, 5

l1:
push ecx
lea edx, msg1
call writeString
call crlf

mov ecx,5
l2:
lea edx, msg2
call writeString
call crlf

loop l2



pop cx
loop l1
call waitmsg
main ENDP
END main