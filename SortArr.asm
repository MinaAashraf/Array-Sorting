.386
include irvine32.inc ; include labriry

.data ; data area // memory area
 array DWORD 16,2,5 ; intial array length 3
 msg BYTE "enter two variables ?",0 ; message  to user 
 ;shap output string 
  
  ;intial variable 
  var1 DWORD 5
  index DWORD 0


.code ; instruction area 
main proc
 
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