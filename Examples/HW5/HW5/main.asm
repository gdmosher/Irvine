TITLE MASM Template						(main.asm)
;=================================================
; ATTACHED: HW5 and Chapter 5 Extra Credit
;	
;=================================================
; Program Description:	HW5
; Author:				GORDON MOSHER
; Date Created:			2015-1208
; Last Modification:	2015-1208
;=================================================

INCLUDE Irvine32.inc


.data
myMessage BYTE "HW5",0dh,0ah,0


.code
main PROC
	call Clrscr  

	mov	 edx,offset myMessage
	call WriteString
	call CrLf

;	HW5
	.data
	msg1	BYTE	"Enter first integer:  ",0
	msg2	BYTE	"Enter second integer: ",0
	num1	SDWORD	?
	num2	SDWORD	?
	sum		SDWORD	0
	msg3	BYTE	"The sum is:           ",0
	msg4	BYTE	0dh,0ah,0
	.code
	mov dh, 8
	mov dl, 20
	call gotoxy

	mov	edx, OFFSET msg1
	call WriteString
	call ReadInt
	mov num1, eax

	mov dh, 9
	mov dl, 20
	call gotoxy

	mov	edx, OFFSET msg2
	call WriteString
	call ReadInt
	mov num2, eax

	mov dh, 10
	mov dl, 20
	call gotoxy

	mov edx, OFFSET msg3
	call WriteString
	mov eax, num1
	add eax, num2
	mov sum, eax
	call WriteInt
	call CrLf
	call Crlf


	call DumpRegs

	jmp done

done:
	exit
main ENDP

END main
COMMENT~
PROGRAM OUTPUT
HW5







                    Enter first integer:  5
                    Enter second integer: 5
                    The sum is:           +10


  EAX=0000000A  EBX=7FFDE000  ECX=00401005  EDX=00406040
  ESI=00401005  EDI=00401005  EBP=0019FF94  ESP=0019FF84
  EIP=00403465  EFL=00000202  CF=0  SF=0  ZF=0  OF=0  AF=0  PF=0

Press any key to continue . . .
~