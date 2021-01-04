.386
include irvine32.inc
.model flat,stdcall
.stack 4096
.data

Array DWORD 2,5,8,0,1,7
Itr DWORD 6
Reverse  dword 1

.code

main proc

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