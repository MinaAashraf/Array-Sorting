.386
include irvine32.inc ; include labriry

.data ; data area // memory area



 
  x_ptr DWORD 0
  y_ptr DWORD 0
  index_max DWORD ?
  InnerCounter Dword ?
  OuterCounter Dword ?


.code ; instruction area 
main proc

      lea ESI,  array	
 
     mov OuterCounter,9
    
  
  
         l1: cmp OuterCounter,0
          jle xx
          dec OuterCounter
          mov eax,OuterCounter
          mov index_max,eax
          dec eax
          mov InnerCounter,eax
         lea ESI,  array	

                                l2: cmp InnerCounter,0
                                    jl exit1
                                     lea ESI,  array	
                                     MOV EDI , index_max	    ; EDI = indexCounter
                                     MOV EDX , InnerCounter     ;edx=innerCounter        
                                     SHL EDI,2			        ; EDI = indexMax *4 
                                     SHL EDX,2				    ; ECX = (innercounter)*4
                                     ADD EDI,ESI			    ; EDI = offset Array + (indexMax)*4 , EDI = &arr [indexMax]
                                     ADD EDX,ESI				; EDX = offset Array + (innercounter)*4, EDX= &arr [innercounter]
                                     MOV EAX,[EDI]				; EAX = arr [indexMax]
                                     mov EBX,[EDX]				; EBX = arr [innercounter] 
                                     CMP EBX,EAX ;    arr[innercounter] > arr[indexMax] 
                                     jle mm ;jump if a[indexMax]>arr[innercounter]

                                     ; if arr[innercounter] > arr[indexMax]
                                     ;indexmaximum =innercounter
                                     mov edx,InnerCounter
                                     mov index_max,edx
                                     mm: 


                                    dec InnerCounter
                                    jmp l2
                                    exit1:
     mov EDX ,OuterCounter
     SHL EDX,2	
     ADD EDX,ESI           
   ;EDX= Address arr [outerCounter]

     mov EDI,index_max
     SHL EDI,2
     ADD EDI,ESI
     ;EDX= Address arr [index_max]
   
   
     MOV   x_ptr,EDX
     MOV   Y_ptr,EDI

     
    
        mov esi,x_ptr
        mov eax,[esi]
        mov edi,y_ptr
        mov edx,[edi]
        mov [esi],edx
        mov [edi],eax

 
 jmp l1
 xx:
        

         
     



 

  

     





 



  
    












    invoke ExitProcess,0
   
main endp
end main