include irvine32.inc 
.data
msg BYTE " enter numbers from 1 to 10 ",0
LIST dword 10 DUP (?)
.code
main proc
LEA EDX,msg
call writeString
call crlf
MOV EBX,OFFSET LIST
MOV ECX, 10
input:
	call readint
	mov [EBX],EAX
	ADD EBX,4
	CALL crlf 
	loop input ; end of loop
	LEA EBX,LIST
	mov ecx,10
output:
	mov EAX,[EBX]
	call writeInt
	call crlf
	ADD EBX,4
loop output


INVOKE ExitProcess,0 
main endp
end main