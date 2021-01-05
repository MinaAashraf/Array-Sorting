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
	Array dw 100009 dup(?)				;the array block
	Itr   dw ?							;number of elements of the array

	;variables for insertionSort only..
	temp  dw ?

.code
main proc
	;Input handling section (Moustafa Mahmoud)


	;Insertion Sort Algorithm..
	mov  ecx, 0							;clear ecx register
	mov  ecx, 1							;ecx = 1 (outer loop counter, starts from 1) (i=1)
	loop1:
		cmp  ecx, Itr					;the loop condition
		jge  exitLoop1
		mov  edx, Array[4*ecx]
		mov  temp, edx					;storing the element (i) into the temporary variable, temp
		push ecx						;saving the outer loop counter
		loop2:
			cmp  ecx, 0					;inner loop first condition (i<5)
			jle  exitLoop2
			cmp  edx, Array[4*ecx-4]	;inner loop second condition (temp<arr[j-1])
			jg   exitLoop2
			mov  esi, 0					;clear edx
			mov  esi, Array[4*ecx-4]	;edx = arr[j-1]
			mov  Array[4*ecx], esi		;arr[j] = edx
			dec  ecx					;ecx-- (j--)
			jmp  Loop2
		exitLoop2:
		mov  edx, 0						;clear edx
		mov  edx, temp					;edx = temp
		mov  Array[4*ecx], edx			;arr[j] = edx
		pop  ecx						;restore the outer loop counter
		inc  ecx						;ecx++ (i++)
		jmp  Loop1
	exitLoop1:

	;Output handling section (Mina Ashraf)


	;just a new line..
	call crlf

	invoke ExitProcess, 0
main endp
end main

end