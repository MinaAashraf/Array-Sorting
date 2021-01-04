.386
include irvine32.inc ; include labriry

.data ; data area // memory area

 msg BYTE "enter two variables ?",0 ; message  to user 
 msg1 BYTE "var1 = ",0

 msg2  BYTE "var2 = ",0
 ; intial variables 
 var1 DWORD ?
 var2 DWORD ?

.code ; instruction area 
main proc
 
 mov edx,OFFSET msg
 call writestring ;function to write string on screen 
 call crlf
 mov edx,Offset msg1
 call writestring 
 call readint;function to input by user
 mov var1,eax;
; call crlf ; function to next line 
 mov edx,Offset msg2
 call writestring 
 call readint 
 mov var2,eax 
 ;call crlf

 ; print 2 variables
 mov edx,offset msg1
 call writestring 
 mov eax,var1
 call writeint ;function display number to user
 call crlf
 mov edx,offset msg2
 call writestring 
 mov eax,var2
 call writeint 
 call crlf

 

  
    












    invoke ExitProcess,0
main endp
end main