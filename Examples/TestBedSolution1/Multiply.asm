TITLE Multiply 
; This routine multiplies 2 32 - bit integers.
INCLUDE Irvine32.inc
pressKey EQU  <"Press <Enter>  ", 0>

.data ;GLOBALS
prompt  BYTE  pressKey
global  BYTE "22222ABCDEF22222"

.data


n1 DWORD ?
n2 DWORD ?
m1 BYTE "The total equals ", 0
m2 BYTE "Enter a number: ", 0
m3 BYTE " ", 0
msg_equals BYTE " = ", 0
msg_multiply BYTE " * ", 0
result DWORD ?

.code
Multiply PROC
mov edx, offset m2
call WriteString
call ReadDec;not ReadInt
mov n1, eax

mov edx, offset m2
call WriteString
call ReadDec
mov n2, eax

imul eax, n1
mov result, eax


mov eax, n1
call writeDec

mov edx, offset msg_multiply
call WriteString

mov eax, n2
call writeDec

mov edx, offset msg_equals
call WriteString

mov eax, result
call writeDec

call crlf
call crlf
	call DumpRegs	;display registers
	mov	 edx, offset prompt
	call  WriteString; displays “Press any key ...
call ReadDec;not ReadInt

ret
Multiply ENDP
END
;end Multiply 