%include "io.inc"
    
section .text
    global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
                PRINT_STRING num_msg
                NEWLINE
                GET_DEC 4,Itr_Num
                mov Ecx,[Itr_Num]
                mov Edi,Array
                and di,0
                shr  Edi,8
                mov Esi,Array
                mov Edi,Array
                ;mov ES,di
                PRINT_HEX 4,Edi
                NEWLINE    
input:       PRINT_STRING Input_msg
                NEWLINE
                GET_DEC 4,Input
                PRINT_DEC 4,Input
                NEWLINE
                mov Eax,Input
                stosd
                DEC Ecx
                jnz input
                mov Ecx,[Itr_Num]
                PRINT_STRING Output_msg
                NEWLINE
output:    ;lodsd
               PRINT_DEC 4,Eax            
               NEWLINE
               DEC Ecx
               jnz output   
               ret
                
section .data 
    num_msg         db   "Enter the number of elements You will insert",0
    Input_msg       db   "Enter the Number you want to insert",0
    Output_msg     db   "The Numbers You Entered",0
    Input          dd    0
    Itr_Num      dd   0 
    Array      times 1000 dd 0                