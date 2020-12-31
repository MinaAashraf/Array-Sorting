%include "io.inc"
    
section .text
    global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
                PRINT_STRING num_msg
                NEWLINE
                GET_DEC 4,Itr_Num
    
input:    PRINT_STRING Input_msg
                NEWLINE
                GET_DEC 4,Input
                PRINT_DEC 4,Input
                NEWLINE
                DEC Ecx
                jnz input
                mov Ecx,[Itr_Num]
                PRINT_STRING Output_msg    
section .data 
    num_msg         db   "Enter the number of elements You will insert",0
    Input_msg       db   "Enter the Number you want to insert",0
    Input          dd    0
    Itr_Num      dd   0                 
