TITLE MASM Template						(main.asm)
;=================================================
; ATTACHED: HW4de
;			BOTH PROGRAMS ARE IN THIS ONE FILE
;=================================================
; Program Description:	HW4de
; Author:				GORDON MOSHER
; Date Created:			2015-1202
; Last Modification:	2015-1202
;=================================================

INCLUDE Irvine32.inc


.data
myMessage BYTE "HW4de",0dh,0ah,0


.code
main PROC
	call Clrscr  

	mov	 edx,offset myMessage
	call WriteString
	call CrLf

;	HW4d
	.data
	numbers	DWORD	10,60,20,33,72,89,45,65,72,18	;array of 10 unsigned 32 bit integers
	sum		DWORD	0
	msg1	BYTE	"The sum equals ",0
	msg2	BYTE	".",0dh,0ah,0
	.code
	mov	ecx, LENGTHOF numbers						;10
	mov eax, sum
	mov esi, OFFSET numbers
loop1:
	mov ebx, [esi]
	cmp ebx, 50
	ja skipAdd
	add eax, [esi]
skipAdd:
	add esi, TYPE numbers							;4 bytes (32 bits)
	loop loop1
	mov sum, eax

	mov edx, offset msg1
	call WriteString
	call WriteInt									;sum is still in eax
	mov edx, offset msg2
	call WriteString
	call CrLf


;	HW4e
	.code
	mov sum, 0
	mov	ecx, LENGTHOF numbers						;10
	mov eax, sum
	mov esi, OFFSET numbers
	.WHILE ecx > 0
loop1e:
	mov ebx, [esi]
	cmp ebx, 50
	ja skipAdde
	add eax, [esi]
skipAdde:
	add esi, TYPE numbers							;4 bytes (32 bits)
;	loop loop1e
	dec ecx
	.ENDW
	mov sum, eax

	mov edx, offset msg1
	call WriteString
	call WriteInt									;sum is still in eax
	mov edx, offset msg2
	call WriteString
	call CrLf


	call DumpRegs

	jmp done

done:
	exit
main ENDP

END main
COMMENT~
PROGRAM OUTPUT
HW4de

The sum equals +126.

The sum equals +126.


  EAX=0000007E  EBX=00000012  ECX=00000000  EDX=00406044
  ESI=00406030  EDI=00401005  EBP=0019FF94  ESP=0019FF84
  EIP=00403593  EFL=00000202  CF=0  SF=0  ZF=0  OF=0  AF=0  PF=0

Press any key to continue . . .
~