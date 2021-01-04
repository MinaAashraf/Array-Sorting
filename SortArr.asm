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

 ;sort two variable 
 IF
 mov eax ,var1
 cmp eax ,var2
 jng else
 call writeint 
 call crlf 
 mov eax,var2
 call writeint 
 call crlf
 jl end

 ELSE
 
 mov eax,var2
 call writeint 
 call crlf
 mov eax ,var1
 call writeint 
 call crlf 

ENDIF



 ; print 2 variables
 ;mov edx,offset msg1
 ;all writestring 
 ;mov eax,var1
 ;all writeint ;function display number to user
 ;call crlf
 ;ov edx,offset msg2
 ;call writestring 
 ;ov eax,var2
 ;call writeint 
 ;cal crlf

 

  
    












    invoke ExitProcess,0
main endp
end main