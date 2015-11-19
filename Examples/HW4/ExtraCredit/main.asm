TITLE MASM Template						(main.asm)
;=================================================
; ATTACHED: ExtraCredit for Chapter 4 Ex_4-11 Ex_4-12
;			BOTH PROGRAMS ARE IN THIS ONE FILE
;=================================================
; Program Description:	ExtraCredit	for Chapter 4
; Author:				GORDON MOSHER
; Date Created:			2015-1118
; Last Modification:	2015-1118
;=================================================

INCLUDE Irvine32.inc


.data
myMessage BYTE "Extra Credit for Chapter 4",0dh,0ah,0

number	WORD	-4
numbers	WORD	3,4,5,6
numbersPtr	DWORD	numbers

.code
main PROC
	call Clrscr  

	mov	 edx,offset myMessage
	call WriteString

	;Ex_4-11
	mov ax, number
	movsx eax, ax
	call DumpRegs

	;Ex_4-12
	mov eax, 0	;clear 4 registers
	mov ebx, 0
	mov ecx, 0
	mov edx, 0
	mov esi, numbersPtr	;load index register with array OFFSET
	mov ax, [esi]		;load 16 bit registers from array
	mov bx, [esi+2]
	mov cx, [esi+4]
	mov dx, [esi+6]
	call DumpRegs

	jmp done

done:
	exit
main ENDP

END main
COMMENT~
PROGRAM OUTPUT
Extra Credit for Chapter 4

  EAX=FFFFFFFC  EBX=7FFDE000  ECX=00401005  EDX=00406000
  ESI=00401005  EDI=00401005  EBP=0019FF94  ESP=0019FF84
  EIP=004034DD  EFL=00000202  CF=0  SF=0  ZF=0  OF=0  AF=0  PF=0


  EAX=00000003  EBX=00000004  ECX=00000005  EDX=00000006
  ESI=0040601F  EDI=00401005  EBP=0019FF94  ESP=0019FF84
  EIP=0040350B  EFL=00000202  CF=0  SF=0  ZF=0  OF=0  AF=0  PF=0

Press any key to continue . . .
~