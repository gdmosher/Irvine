TITLE Add and Subtract
; This program adds and subtracts 32 - bit integers.
INCLUDE Irvine32.inc
pressKey EQU  <"Press any key ...", 0dh, 0ah, 0>
.data; none
list2 	BYTE 	10, 20, 30, 40
BYTE 	50, 60, 70, 80
BYTE 	81, 82, 83, 84,
85, 86, 87, 88
prompt  BYTE  pressKey
num1	DWORD 3
num2	DWORD 4
num3	DWORD 5
total	DWORD ?
msg BYTE "The total equals ", 0
newLine BYTE 0Dh, 0Ah, 0
n1 DWORD ?
n2 DWORD ?
m1 BYTE "The total equals ", 0
m2 BYTE "Enter a number: ", 0
m3 BYTE " ", 0
equals BYTE " = ", 0
multiply BYTE " * ", 0
result DWORD ?

.code
main	PROC
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

mov edx, offset multiply
call WriteString

mov eax, n2
call writeDec

mov edx, offset equals
call WriteString

mov eax, result
call writeDec

call crlf
call crlf


mov edx, offset list2
mov eax, num1
add eax, num2
add eax, num3
mov total, eax; store eax
mov edx, offset msg
call writeString
mov edx, offset total
call writeDec;or writeInt
	mov edx, offset newLine
	call writeString
	call Crlf			;works from Irvine?

	mov eax,10000h
	add eax,40000h
	sub eax,20000h
	call DumpRegs	;display registers
	mov	 edx, offset prompt
	call  WriteString; displays “Press any key ...

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