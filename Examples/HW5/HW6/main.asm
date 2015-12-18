TITLE MASM Template						(main.asm)
;=================================================
; ATTACHED: HW6
;	
;=================================================
; Program Description:	HW6
; Author:				GORDON MOSHER
; Date Created:			2015-1215
; Last Modification:	2015-1215
;=================================================

INCLUDE Irvine32.inc


.data
myMessage BYTE "HW6",0dh,0ah,0


.code
GetNums PROC
	push ebp
	mov ebp, esp
	mov edx, OFFSET msg0
	call WriteString
	call Crlf
	mov esi, [ebp+8]			;OFFSET numbers
	mov ecx, [ebp+12]			;LENGTHOF numbers
nextNum:
	mov edx, OFFSET msg1
	call WriteString
	call ReadDec
	mov [esi], eax
	add esi, TYPE numbers
	loop nextNum
	pop ebp
	ret 8
GetNums ENDP
ShowNums PROC USES eax ecx edx esi, a:DWORD, b:DWORD
;	push ebp
;	mov ebp, esp
	mov edx, OFFSET msg2
	call WriteString
	call Crlf
	mov esi, a;[ebp+8]			;OFFSET numbers
	mov ecx, b;[ebp+12]			;LENGTHOF numbers
nextNum2:
	mov eax, [esi]
	call WriteDec
	call Crlf
	add esi, TYPE numbers
	loop nextNum2
;	pop ebp
	ret							;STDCALL does ret 8
ShowNums ENDP
main PROC
	call Clrscr  

	mov	 edx,offset myMessage
	call WriteString
	call CrLf

;	HW6
	.data
	msg0	BYTE	"You will enter 5 numbers",0
	msg1	BYTE	"Enter a number:  ",0
	msg2	BYTE	"Here are the numbers: ",0
	numbers	DWORD	5 dup(0)

	.code
	push LENGTHOF numbers	;parameter 2 - notice reverse order
	push OFFSET numbers		;parameter 1 - for STDCALL
	call GetNums
;	call Clrscr
	push LENGTHOF numbers
	push OFFSET numbers
	call ShowNums
	call CrLf
	call Crlf


	call DumpRegs

	jmp done

done:
	call WaitMsg
	exit
main ENDP

END main
COMMENT~
PROGRAM OUTPUT
Here are the numbers:
1
2
3
4
5



  EAX=00000005  EBX=003F0000  ECX=00000000  EDX=00406031
  ESI=0040605C  EDI=00401005  EBP=0019FF94  ESP=0019FF74
  EIP=00403496  EFL=00000202  CF=0  SF=0  ZF=0  OF=0  AF=0  PF=0

Press any key to continue...
~