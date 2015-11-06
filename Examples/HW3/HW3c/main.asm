TITLE MASM Template						(main.asm)
;=================================================
; ATTACHED: HW3abc
;=================================================
; Program Description:	HW3c
; Author:				GORDON MOSHER
; Date Created:			2015-1106
; Last Modification:	2015-1106
;=================================================

INCLUDE Irvine32.inc
.data
myMessage BYTE "MASM program example",0dh,0ah,0
n1 SDWORD ?
n2 SDWORD ?
m1 BYTE "Enter the width:  ", 0
m2 BYTE "Enter the length: ", 0
m3 BYTE "The square equals ", 0
.code
main PROC
	call Clrscr  

	mov	 edx,offset myMessage
	call WriteString
	call crlf
	mov edx, offset m1
	call WriteString
	call ReadInt
	mov n1, eax

	mov edx, offset m2
	call WriteString
	call ReadInt
	mov n2, eax
	call crlf

	mov edx, offset m3
	call WriteString
	mov eax, n1
	imul eax, n2
	call writeInt
	call crlf
	exit
main ENDP

END main
COMMENT~
PROGRAM OUTPUT
MASM program example

Enter the width:  5
Enter the length: 6

The square equals +30

~