TITLE MASM Template						(main.asm)
;=================================================
; ATTACHED: HW3abc
;=================================================
; Program Description:	HW3a
; Author:				GORDON MOSHER
; Date Created:			2015-1106
; Last Modification:	2015-1106
;=================================================

INCLUDE Irvine32.inc

FIRST_QTR EQU 1
SECOND_QTR EQU 2
THIRD_QTR EQU 3
FOURTH_QTR EQU 4

.data
myMessage BYTE "MASM program example",0dh,0ah,0
quarters DWORD FIRST_QTR, SECOND_QTR, THIRD_QTR, FOURTH_QTR


.code
main PROC
	call Clrscr  

	mov	 edx,offset myMessage
	call WriteString

		MOV EAX, FIRST_QTR
		MOV EBX, SECOND_QTR
		MOV ECX, THIRD_QTR
		MOV EDX, FOURTH_QTR

		CALL DUMPREGS
	exit
main ENDP

END main
COMMENT~
PROGRAM OUTPUT
MASM program example

  EAX=00000001  EBX=00000002  ECX=00000003  EDX=00000004
  ESI=00401005  EDI=00401005  EBP=0019FF94  ESP=0019FF84
  EIP=004034C8  EFL=00000202  CF=0  SF=0  ZF=0  OF=0  AF=0  PF=0


~