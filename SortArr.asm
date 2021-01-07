.386
include irvine32.inc ; include labriry

.data ; data area // memory area
            ;0  4 8 12
 array DWORD 16,2,5,1 ; intial array length 3
 msg BYTE "enter two variables ?",0 ; message  to user 
 ;shap output string 
  
  ;intial variable 
 
  x_ptr DWORD 0
  y_ptr DWORD 0
  index_max DWORD ?
  var2 DWORD ?
  InnerCounter Dword ?
  OuterCounter Dword ?


.code ; instruction area 
main proc
   
   lea ESI,  array	
   mov eax,4 ;length
   dec eax   
   mov OuterCounter,eax
   mov ecx,OuterCounter
   l1:
    mov index_max,ecx
    mov var2,ecx
    mov ecx,OuterCounter
          l2:
          MOV EDI , index_max			; EDI = innerloop
          MOV EDX , ecx            ; ecx=innercounter
        ;  dec ecx ;innerCounter =Innercounter-1
         dec EDX
         SHL EDI,2			; EDI = indexMax *4 
         SHL EDX,2				    ; ECX = (innercounter)*4
         ADD EDI,ESI					; EDI = offset Array + (indexMax)*4 , EDI = &arr [indexMax]
         ADD EDX,ESI					; ECX = offset Array + (innercounter)*4, ECX= &arr [innercounter]
         MOV EAX,[EDI]				; EAX = arr [indexMax]
         mov EBX,[EDX]				; EBX = arr [innercounter] 
     comment @
     CMP EBX,EAX ;    arr[indexMax] <arr[innercounter]
   
        jb index_maximum
         index_maximum:
         mov ebx   ,ecx
         mov index_max, ebx
         @
 
    cmp EBX,EAX
    jng  case
    jmp en

    case:
         mov ebx   ,ecx
         mov index_max, ebx

    en:

         loop l2
     mov ecx,var2
     ;swap

     mov EDX ,OuterCounter
     SHL EDX,2	
     ADD EDX,ESI            ;edx=&Arr[outercounter]
   
     MOV   x_ptr,EDX
     MOV   Y_ptr,EDI
     mov eax,[x_ptr]
    mov edx,[y_ptr]
    mov [x_ptr],edx
    mov [y_ptr],eax



    comment @
    mov EBX,[EDX]
   ;  MOV EBX,var1
     MOV [EDI],EBX				; arr[indexMax] = arr[OuterConter]
     MOV [EDX],EAX				;arr[OuterCounter]=arr[indexMax]
  @
 
  dec OuterCounter
   LOOP L1

         


         
     



 

  
 
    


     
   
 comment @
function_swap:
mov eax,[x_ptr]
mov edx,[y_ptr]
mov [x_ptr],edx
mov [y_ptr],eax
jmp back

@







 

 ;print array
 mov esi, offset array 
 mov ecx,4
 again2:
 mov eax,[esi]
 add esi,4
 call writeint 
 call crlf
 loop again2



 


  
    












    invoke ExitProcess,0
   
main endp
end main