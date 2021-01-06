.386
include irvine32.inc ; include labriry

.data ; data area // memory area
 array DWORD 16,2,5,1 ; intial array length 3
 msg BYTE "enter two variables ?",0 ; message  to user 
 ;shap output string 
  
  ;intial variable 
 
  x_ptr DWORD 0
  y_ptr DWORD 0


.code ; instruction area 
main proc
  
 mov esi ,offset array ; adress array 
 mov ecx,4 ;ecx=i=lenght-1

          l1:
          push ecx
          mov ebx,0 ;index maxmum
          ;j=ecx
          mov edx ,ecx
          mov ecx ,edx
                     l2:
                     pop edx
                     mov edx,[esi+ebx]
                     cmp [esi+ecx],edx
                     jmp none
                     ;indexmamxmum =j
                     mov ebx,ecx
                     push edx


                     loop l2
           none:
                 push edx
                 mov edx,0
                      pop ecx
                      mov edx,[esi+ebx]
                     mov x_ptr,edx
                     mov edx,[esi+ecx]
                     mov  y_ptr,esi+ecx
                    jmp function_swap

            backloop1:
          loop l1
 

  
 
    


     
   

function_swap:
mov esi, x_ptr
mov eax,[esi]
mov edi, y_ptr   
mov edx,[edi]
mov [esi],edx
mov [edi],eax
jmp backloop1









 ;print array
 mov esi, offset array 
 mov ecx,3
 again2:
 mov eax,[esi]
 add esi,4
 call writeint 
 call crlf
 loop again2



 

 mov edx,4
 mov eax,4
 mov [offset array+4+edx],eax
 call writeint 
 
 

  
    












    invoke ExitProcess,0
   
main endp
end main