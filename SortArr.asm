.data
	;variables for insertionSort only..
	temp       dd ?

.code
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