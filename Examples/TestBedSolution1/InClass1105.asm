TITLE InClass1105 
; This routine multiplies 2 32 - bit integers.
INCLUDE Irvine32.inc
pressKey EQU  <"Press <Enter>  ", 0>


.data ;InClass1105
num1	DWORD	4
m1_1105	BYTE "Num1 before incrementing: ",0
m2_1105	BYTE "Num1 after incrementing: ",0
m3_1105	BYTE "Num1 after decrementing: ",0
m4_1105	BYTE "Num1 after negating: ",0


.data ;GLOBALS
prompt  BYTE  pressKey
global  BYTE "22222ABCDEF22222"

.data


n1 SDWORD ?
n2 SDWORD ?
m1 BYTE "The total equals ", 0
m2 BYTE "Enter a number: ", 0
m3 BYTE " ", 0
mnum1 BYTE "num1",0
mnum2 BYTE "num2",0
msg_equals BYTE " = ", 0
msg_mult BYTE " * ", 0
msg_add BYTE " + ", 0
msg_sub BYTE " - ", 0
result DWORD ?

.code
InClass1105 PROC
call clrscr
mov edx, offset m2
call WriteString
call ReadInt
mov n1, eax

mov edx, offset m2
call WriteString
call ReadInt
mov n2, eax

imul eax, n1
mov result, eax


mov edx, offset mnum1
call WriteString
mov edx, offset msg_add
call WriteString
mov edx, offset mnum2
call WriteString
mov edx, offset msg_equals
call WriteString
mov eax, n1
add eax, n2
call writeInt
call crlf

mov edx, offset mnum1
call WriteString
mov edx, offset msg_sub
call WriteString
mov edx, offset mnum2
call WriteString
mov edx, offset msg_equals
call WriteString
mov eax, n1
sub eax, n2
call writeInt
call crlf

mov edx, offset mnum1
call WriteString
mov edx, offset msg_mult
call WriteString
mov edx, offset mnum2
call WriteString
mov edx, offset msg_equals
call WriteString
mov eax, n1
imul eax, n2
call writeInt
call crlf


call crlf
call crlf


;===============================================================
mov edx, offset m1_1105
call WriteString
mov eax, 0
mov ax, -10
movsx eax, ax
call WriteInt
call CrLf

mov edx, offset m2_1105
call WriteString
inc eax
mov num1, eax
call WriteInt
call CrLf

mov edx, offset m3_1105
call WriteString
dec num1
mov eax, num1
call WriteInt
call CrLf

mov edx, offset m4_1105
call WriteString
neg num1
mov eax, num1
call WriteInt
call CrLf








mov eax, 65d	;41h 'A'	0100 0001
mov eax, 97d	;61h 'a'	0110 0001
;or eax, 0ff00h
;and eax,  00dfh	;41h  '!'
;and eax,  0000000011011111	;21h  '!'
and eax,  11011111b	;41h  '!'


ret
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

mov edx, offset msg_mult
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
InClass1105 ENDP
END
;end InClass1105 