.386
include irvine32.inc ; include labriry

.data ; data area // memory area
 array DWORD 16,2,5 ; intial array length 3
 msg BYTE "enter two variables ?",0 ; message  to user 
 ;shap output string 
  
  ;intial variable 
 
  x_ptr DWORD 0
  y_ptr DWORD 0


.code ; instruction area 
main proc
  
 mov eax,0
  mov ecx,5
  l1:
  push ecx
  mov ecx,2
     l2:
     add eax,1
     call writeint 
     call crlf 
     

     loop l2
  pop ecx
  call crlf
  loop l1
 

  
 mov x_ptr,offset array
 mov  y_ptr,offset array+4
    
jmp function_swap


     
   

function_swap:
mov esi, x_ptr
mov eax,[esi]
mov edi, y_ptr   
mov edx,[edi]
mov [esi],edx
mov [edi],eax
;jp l1





 ;print array
 mov esi, offset array 
 mov ecx,3
 again2:
 mov eax,[esi]
 add esi,4
 call writeint 
 call crlf
 loop again2




 
 
 

  
    












    invoke ExitProcess,0
   
main endp
end main