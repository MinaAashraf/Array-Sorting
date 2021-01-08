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
    dec OuterCounter
          l2:
          MOV EDI , index_max			; EDI = innerloop
          MOV EDX , ecx            ; ecx=innercounter
        ;  dec ecx ;innerCounter =Innercounter-1
          dec EDX
         mov InnerCounter,edx 
         SHL EDI,2			; EDI = indexMax *4 
         SHL EDX,2				    ; ECX = (innercounter)*4
         ADD EDI,ESI					; EDI = offset Array + (indexMax)*4 , EDI = &arr [indexMax]
         ADD EDX,ESI					; ECX = offset Array + (innercounter)*4, ECX= &arr [innercounter]
         MOV EAX,[EDI]				; EAX = arr [indexMax]
         mov EBX,[EDX]				; EBX = arr [innercounter] 
     
         CMP EBX,EAX ;    arr[innercounter] > arr[indexMax] 
         jle mm ;jump if a[indexMax]>arr[innercounter]

         ; if arr[innercounter] > arr[indexMax]
         ;indexmaximum =innercounter
         mov edx,InnerCounter
         mov index_max,edx
         mm: 
       loop l2


     mov ecx,var2
     ;swap

     mov EDX ,OuterCounter
     SHL EDX,2	
     ADD EDX,ESI            ;edx=&Arr[outercounter]
     ;EDX= Address arr [outerCounter]

     mov EDI,index_max
     SHL EDI,2
     ADD EDI,ESI

   ;edi = adress   arr[index_max]

     MOV   x_ptr,EDX
     MOV   Y_ptr,EDI

     
     ;swap
        mov esi,x_ptr
        mov eax,[esi]
        mov edi,y_ptr
        mov edx,[edi]
        mov [esi],edx
        mov [edi],eax

  
   LOOP L1

         
        

         
     



 

  

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