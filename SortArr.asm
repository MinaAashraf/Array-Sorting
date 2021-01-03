.386
include irvine32.inc

.data ; data area // memory area
 msg BYTE "enter two variable =",0
 msg1 BYTE "var1= ",0
 msg2 BYTE "var2= ",0
 addition BYTE "add= ",0
 Subition BYTE "Sub= ",0
 divion BYTE "div= ",0
r BYTE "r= ",0
MUlitupltion BYTE "mul= ",0
var1 DWORD ?
var2 DWORD ?

.code ; instruction area 

main proc
 
   mov edx,OFFSET msg
  call writestring
  call readint 
  mov var1,eax
   call readint 
  mov var2,eax
    mov edx,OFFSET msg1
    mov eax,var1
    call writestring
    call writeint 
    call crlf
    mov edx,OFFSET msg2
    mov eax,var2
    call writestring
    call writeint 
    call crlf

    mov eax,0; eax=0
    add eax,var1
    add eax,var2
    mov edx ,OFFSET addition
    call writestring
    call writeint 
    call crlf

    mov eax,var1; eax=0
    sub eax,var2
    mov edx ,OFFSET  Subition
    call writestring
    call writeint 
    call crlf

    












    invoke ExitProcess,0
main endp
end main