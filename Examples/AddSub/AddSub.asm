TITLE Add and Subtract
; This program adds and subtracts 32-bit integers.
INCLUDE Irvine32.inc
.data	;none
.code
main	PROC
	mov eax,10000h
	add eax,40000h
	sub eax,20000h
	call DumpRegs	;display registers
	exit
main ENDP
END main

; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.code
main proc
	mov	eax,5				
	add	eax,6				

	invoke ExitProcess,0
main endp
end main