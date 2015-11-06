TITLE MASM Template						(main.asm)
;=================================================
; ATTACHED: HW3abc
;=================================================
; Program Description:	HW3b
; Author:				GORDON MOSHER
; Date Created:			2015-1106
; Last Modification:	2015-1106
;=================================================

INCLUDE Irvine32.inc

Surrealism		EQU	"Salvador Dali",0dh,0ah,0
Abstract		EQU "Jackson Pollock",0dh,0ah,0
Impressionism	EQU	"Renoir",0dh,0ah,0

.data
myMessage BYTE "MASM program example",0dh,0ah,0
artist1	BYTE	Surrealism
artist2 BYTE	Abstract
artist3 BYTE	Impressionism
ptr_artist_array DWORD artist1, artist2, artist3	;array of OFFSET's

.code
main PROC
	call Clrscr  
	mov	ecx, LENGTHOF ptr_artist_array
	mov esi, 0		; array index
L1:	
	mov	 edx, ptr_artist_array[(esi)*TYPE ptr_artist_array]
	call WriteString
	inc esi			; inc array index
	loop L1

	CALL DUMPREGS
	exit
main ENDP

END main
COMMENT~
PROGRAM OUTPUT
Salvador Dali
Jackson Pollock
Renoir

  EAX=622BC42A  EBX=7FFDE000  ECX=00000000  EDX=00406039
  ESI=00000003  EDI=00401005  EBP=0019FF94  ESP=0019FF84
  EIP=00403403  EFL=00000206  CF=0  SF=0  ZF=0  OF=0  AF=0  PF=1


~