TITLE Add3Integers
; This routine adds 3 32 - bit integers.
INCLUDE Irvine32.inc
pressKey EQU  <"Press any key ...", 0dh, 0ah, 0>

.data ;GLOBALS
global BYTE "33333ABCDEF33333"
.code
Add3Integers PROC

.data ;LOCALS
prompt  BYTE  pressKey
num1	DWORD 3
num2	DWORD 4
num3	DWORD 5
total	DWORD ?
msg BYTE "The total equals ", 0

.code
;add three numbers and display the result
mov eax, num1
add eax, num2
add eax, num3
mov total, eax; store eax
mov edx, offset msg
call writeString
mov edx, offset total
call writeDec;or writeInt


call crlf
call crlf
	call DumpRegs	;display registers
	mov	 edx, offset prompt
	call  WriteString; displays “Press any key ...
call ReadDec;not ReadInt

ret
Add3Integers ENDP
END
;end Multiply 