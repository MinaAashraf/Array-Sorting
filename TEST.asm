; Insertion Sort Algorithm written in Assembly using Irvine32 Library..
.386
include Irvine32.inc
.model flat, stdcall
ExitProcess proto, dwExitCode: dword
.stack 4096

.data
	

.code
; insertionSort procedure..
insertionSort proc
	
	ret
insertionSort endp

main proc
	

	;just for new line
	call crlf

	invoke ExitProcess, 0
main endp
end main

end