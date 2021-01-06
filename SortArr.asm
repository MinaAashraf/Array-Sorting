.386
include irvine32.inc ; include labriry

.data ; data area // memory area
 array DWORD 16,2,5 ; intial array length 3
 msg BYTE "enter two variables ?",0 ; message  to user 
 ;shap output string 
  
  ;intial variable 
  var1 DWORD 4
  index DWORD 0
  x_ptr DWORD 8
  y_ptr DWORD 7


.code ; instruction area 
main proc
  
  COMMENT @
 ; accessing fisrt element 
     mov index, offset array 
     mov ecx,3
     again:
     mov eax,var1
     mov [offset array],eax
     inc var1
     add index ,4
     
     loop again
     mov [index+4],10
     mov [index+8],10
     ;swap function 
     @

     ;sort array
     COMMENT @
      mov esi,offset array
      mov ecx,0
      mov edx ,4
    mov eax,[esi+edx]
    call writeint 

 loop1:
  ;   mov eax,[esi+edx]
 ;    mov ebx,[esi+edx]
IF
     cmp [esi+edx],eax
     jmp ELSE
     ;swap
     mov x_ptr,esi+ecx
     mov y_ptr,esi+edx
     jmp function_swap

ELSE 
l1:
  add ecx,4
  add edx,4
  jmp loop1

 ENDIF

 
 @
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


COMMENT @
mov eax,x_ptr
call writeint ;x_ptr=7
call crlf 
mov eax,y_ptr
call writeint ;x_ptr=8



call crlf 
 @




 ;print array
 mov index, offset array 
 mov ecx,3
 again2:
 mov ebx,index
 mov eax,[ebx]
 add index,4
 call writeint 
 call crlf
 loop again2




 
 
 

  
    












    invoke ExitProcess,0
   
main endp
end main