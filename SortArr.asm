.386
include irvine32.inc
.model flat,stdcall
.stack 4096
.data

arr DWORD 2,5,8,0,1,7
counter DWORD 6
input BYTE ?

.code

main proc

call readint
cmp eax , 0
jz output

 reverse:
    mov edx , 0
    mov eax , counter
    mov ebx , 2
    div ebx
    mov ecx,eax

    mov ebx , offset arr
    sub counter , 1
    mov eax , 4
    mul counter
       

    lo1:
        mov edx , [ebx]
        mov edi , [ebx+eax]
        mov [ebx],edi
        mov [ebx+eax],edx
        add ebx , 4
        sub eax , 8

   loop lo1


   output:
   mov ecx , 6
   mov ebx , offset arr
   lo2:
        mov eax , [ebx]
        add ebx,4
        call writeint
        call crlf

    loop lo2



    invoke ExitProcess,0
main endp
end main