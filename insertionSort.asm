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
	msg1 db "Hello there, this is an Array-sorting application..", 0
	msg2 db "The array after sorting: ", 0
	msg3 db ", ", 0

	arr  dd 5 dup(?)					;define an array of 5 double-word elements with no initialization
	temp dd ?							;temporary variable for the insertion sort algorithm

.code
main proc
	mov  edx, 0
	mov  edx, offset msg1
	call writeString
	call crlf
	
	mov  ebx, offset arr				;moving the memory address of the array into ebx
	;filling the array with elements {5, 4, 3, 1, 2} respectively..
	mov  edx, 5
	mov  [ebx], edx
	mov  edx, 4
	mov  [ebx+4], edx
	mov  edx, 3
	mov  [ebx+8], edx
	mov  edx, 1
	mov  [ebx+12], edx
	mov  edx, 2
	mov  [ebx+16], edx

	;Insertion Sort Algorithm..
	mov  ecx, 0							;clear ecx register
	mov  ecx, 1							;ecx = 1 (outer loop counter, starts from 1) (i=1)
	loop1:
		cmp  ecx, 5						;the loop condition
		jge  exitLoop1
		mov  edx, arr[4*ecx]
		mov  temp, edx					;storing the element (i) into the temporary variable, temp
		mov  edi, 0						;clear edi
		mov  edi, ecx					;edi = ecx (inner loop counter, starts from outer loop counter) (j=i)
		loop2:
			cmp  edi, 0					;inner loop first condition (i<5)
			jle  exitLoop2
			cmp  edx, arr[4*edi-4]		;inner loop second condition (temp<arr[j-1])
			jg   exitLoop2
			mov  esi, 0					;clear edx
			mov  esi, arr[4*edi-4]		;edx = arr[j-1]
			mov  arr[4*edi], esi		;arr[j] = edx
			dec  edi					;edi-- (j--)
			jmp  Loop2
		exitLoop2:
		mov  edx, 0						;clear edx
		mov  edx, temp					;edx = temp
		mov  arr[4*edi], edx			;arr[j] = edx
		inc  ecx						;ecx++ (i++)
		jmp  Loop1
	exitLoop1:

	;Displaying the array..
	mov  edx, 0							;clear edx
	mov  edx, offset msg2
	call writeString
	mov  edx, 0							;clear edx
	mov  edx, offset msg3
	mov  ecx, 0							;clear ecx
	L1:
		cmp  ecx, 5						;the loop condition
		jge  exitLoop
		mov  eax, 0
		mov  eax, [ebx+4*ecx]
		call writeInt
		cmp  ecx, 4
		jge   L2
		call writeString
		L2:
		inc  ecx
		jmp  L1

	exitLoop:

	;just a new line..
	call crlf

	invoke ExitProcess, 0
main endp
end main

end