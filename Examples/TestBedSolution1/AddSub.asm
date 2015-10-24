TITLE Add and Subtract
; This program adds and subtracts 32 - bit integers.
INCLUDE Irvine32.inc
pressKey EQU  <"Press any key ...", 0dh, 0ah, 0>

.data ;GLOBALS
global  BYTE "11111ABCDEF11111"
prompt  BYTE  pressKey

newLine BYTE 0Dh, 0Ah, 0;not used



.code
AddSub	PROC


	mov eax,10000h
	add eax,40000h
	sub eax,20000h

call crlf
call crlf
	call DumpRegs	;display registers
	mov	 edx, offset prompt
	call  WriteString; displays “Press any key ...
call ReadDec;not ReadInt

	ret	
AddSub ENDP
END