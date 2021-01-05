; Insertion Sort Algorithm written in Assembly using Irvine32 Library..
comment!
	; Java code for insertion sort algorithm..
	for(int i=1 ; i<arr.length ; i++) {
		int newElement = arr[i];
		int j = i;
		while(j>0 && newElement<arr[j-1]) {
			arr[j] = arr[j-1];
			j--;
		}
		arr[j] = newElement;
	}
!
.386
include Irvine32.inc
.model flat, stdcall
ExitProcess proto, dwExitCode: dword
.stack 4096

.data
	Num_msg    db "Enter the number of numbers you want to insert: ", 0
	Input_msg  db "Enter a 32-bit signed integer: ", 0
	Output_msg db "The Numbers you inserted are: ", 0

	Array      dd 100009 dup(?)				;the array block
	Itr        dd ?							;number of elements of the array

	;variables for insertionSort only..
	temp       dd ?

.code
main proc
	;Input handling section (Moustafa Mahmoud)
	mov  edx, 0								;clear edx register
	mov  edx, offset Num_msg
	call writeString
	call crlf
	call readInt							;the number of elements of the array, stored in eax
	call crlf
	mov  Itr, eax
	mov  ecx, Itr							;moving the number of iteration (elements) in ecx for looping

	mov  edi, offset Array					;for storing
	mov  esi, offset Array					;for loading

	Input:									;input loop
		mov  edx, 0							;just clear edx register
		mov  edx, offset Input_msg
		call writeString
		call crlf
		call readInt						;input integer into eax
		stosd								;storing data in memory
		loop Input							;repeat the loop
	;end Input handling section
	;----------------------------------------------------------------------------------------------------------

	;Insertion Sort Algorithm..
	mov  ecx, 0								;clear ecx register
	mov  ecx, 1								;ecx = 1 (outer loop counter, starts from 1) (i=1)
	loop1:
		cmp  ecx, Itr						;the loop condition
		jge  exitLoop1
		mov  edx, Array[4*ecx]
		mov  temp, edx						;storing the element (i) into the temporary variable, temp
		push ecx							;saving the outer loop counter
		loop2:
			cmp  ecx, 0						;inner loop first condition (i<Itr)
			jle  exitLoop2
			cmp  edx, Array[4*ecx-4]		;inner loop second condition (temp<Array[j-1])
			jg   exitLoop2
			mov  esi, 0						;clear edx
			mov  esi, Array[4*ecx-4]		;edx = Array[j-1]
			mov  Array[4*ecx], esi			;Array[j] = edx
			dec  ecx						;ecx-- (j--)
			jmp  Loop2
		exitLoop2:
		mov  edx, 0							;clear edx
		mov  edx, temp						;edx = temp
		mov  Array[4*ecx], edx				;Array[j] = edx
		pop  ecx							;restore the outer loop counter
		inc  ecx							;ecx++ (i++)
		jmp  Loop1
	exitLoop1:
	;end insertionSort algorithm section
	;----------------------------------------------------------------------------------------------------------


	;Output handling section (Mina Ashraf)

	;end output handling section
	;----------------------------------------------------------------------------------------------------------

	;just a new line..
	call crlf

	invoke ExitProcess, 0
main endp
end main

end