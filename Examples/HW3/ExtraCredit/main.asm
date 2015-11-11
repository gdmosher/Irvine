TITLE MASM Template						(main.asm)
;=================================================
; ATTACHED: ExtraCredit 
;=================================================
; Program Description:	ExtraCredit	- Summing an Array
; Author:				GORDON MOSHER
; Date Created:			2015-1110
; Last Modification:	2015-1110
;=================================================

INCLUDE Irvine32.inc


.data
myMessage BYTE "MASM program example",0dh,0ah,0

intArray	DWORD	10000h, 20000h, 30000h, 40000h

.code
main PROC
	call Clrscr  

	mov	 edx,offset myMessage
	call WriteString

	mov edi, OFFSET intArray	;address of intArray
	mov ecx, LENGTHOF intArray	;loop counter
	mov eax, 0					;sum = 0
L1:								;loop head
	add eax, [edi]				;add an integer
	add edi, TYPE intArray		;incr array pointer
	loop L1						;repeat until ecx = 0

	CALL DUMPREGS
	exit
main ENDP

END main
COMMENT~
PROGRAM OUTPUT
MASM program example

  EAX=000A0000  EBX=7FFDE000  ECX=00000000  EDX=00406000
  ESI=00401005  EDI=00406027  EBP=0019FF94  ESP=0019FF84
  EIP=0040340A  EFL=00000206  CF=0  SF=0  ZF=0  OF=0  AF=0  PF=1

Press any key to continue . . .
~