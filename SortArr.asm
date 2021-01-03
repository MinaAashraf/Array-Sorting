

INCLUDE Irvine32.inc
.data
array SDWORD 10, -1, 5, 11, 32, 4

.code
main PROC
	mov ESI, offset array ; load address of array 
	mov ebx, [esi] ; ebx contain minimum 
	mov ecx, lengthof array ; counter for loop
	L1:
		add esi,4
		cmp [esi],ebx
		jl smaller
		loop L1
		jmp found

	smaller:
	mov ebx,[esi] 
	cmp ecx,0
	je found
	loop L1
	
found:
	mov EAX, EBX
	call writeint
	call waitmsg
		

		
	
main ENDP
END main