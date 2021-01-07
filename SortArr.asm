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
   push ecx
   l1:
   mov ecx,OuterCounter
    mov index_max,ecx
          l2:
          MOV EDI , index_max			; EDI = innerloop
          MOV EDX , ecx            ; ecx=innercounter
        ;  dec ecx ;innerCounter =Innercounter-1
         dec EDX
         SHL EDI,2			; EDI = indexMax *4 
         SHL EDX,2				    ; ECX = (inLoop-1)*4
         ADD EDI,ESI					; EDI = offset Array + (indexMax)*4 , EDI = &arr [indexMax]
         ADD EDX,ESI					; ECX = offset Array + (inLoop-1)*4, ECX= &arr [in-1]
         MOV EAX,[EDI]				; EAX = arr [indexMax]
         mov EBX,[EDX]				; EBX = arr [innercounter-1]
         CMP EAX,EBX ;    arr[indexMax] <arr[innercounter-]
         jl index_maximum
         index_maximum:
         mov ebx   ,ecx
         mov index_max, ebx
         loop l2
     pop ecx
     ;swap
     mov EDX ,OuterCounter
     SHL EDX,2	
     ADD EDX,ESI            ;edx=&Arr[outercounter]
     mov EBX,[EDX]
   ;  MOV EBX,var1
     MOV [EDI],EBX				; arr[indexMax] = arr[OuterConter]
     MOV [EDX],EAX				;arr[OuterCounter]=arr[indexMax]
     LOOP L1

         


         
         
         loop l2
loop l1



 

  
 
    


     
   

function_swap:
mov eax,[x_ptr]
mov edx,[y_ptr]
mov [x_ptr],edx
mov [y_ptr],eax
;jmp backloop1









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