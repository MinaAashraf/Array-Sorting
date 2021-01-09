.386
include irvine32.inc 

.data 
 array DWORD 16,2,1,-1,50,-20,22,-10,4
 msg BYTE "enter two variables ?",0 

 
  x_ptr DWORD 0
  y_ptr DWORD 0
  index_max DWORD ?
  var2 DWORD ?
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
                                     MOV EDI , index_max	
                                     MOV EDX , InnerCounter         
                                     SHL EDI,2			
                                     SHL EDX,2				   
                                     ADD EDI,ESI					
                                     ADD EDX,ESI					
                                     MOV EAX,[EDI]				
                                     mov EBX,[EDX]				
                                     CMP EBX,EAX 
                                     jle mm 

                                     
                                     
                                     mov edx,InnerCounter
                                     mov index_max,edx
                                     mm: 

                                    dec InnerCounter
                                    jmp l2
                                    exit1:
     mov EDX ,OuterCounter
     SHL EDX,2	
     ADD EDX,ESI           
   

     mov EDI,index_max
     SHL EDI,2
     ADD EDI,ESI

   

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
        

         
     



 

  

     





 


 mov esi, offset array 
 mov ecx,9
 again2:
 mov eax,[esi]
 add esi,4
 call writeint 
 call crlf
 loop again2



  
    












    invoke ExitProcess,0
   
main endp
end main