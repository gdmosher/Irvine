TITLE InClass1112 

; Description:
; 
; Revision date:

INCLUDE Irvine32.inc
.data
myMessage BYTE "MASM program example",0dh,0ah,0
grade byte "A"
finalGrade byte ?
msg byte "Your grade is ",0
.code
InClass1112 PROC
	call Clrscr  

	mov	 edx,offset myMessage
	call WriteString
	call CrLf

	mov eax, 0FFFFFFFFh
	mov AL, grade
	mov finalGrade, AL

	mov	 edx,offset msg
	call WriteString
	call WriteChar		;from AL
	call WriteInt


	call CrLf

.data
	value WORD 5
	svalue SWORD -5
.code
	mov bx, value
	mov cx, svalue
	movsx eax, bx


	call DumpRegs

.data
	firstLetter	BYTE	'A'
	lastLetter	BYTE	'Z'
.code
	mov al, firstLetter
	xchg al, lastLetter
	mov firstLetter, al
	mov bl, firstletter

.data
	scores WORD 1,2,3,4
	Dscores DWORD 1,2,3,4
.code
	;Example 4-6 in Lecture #4
	;index addressing see CH#3 pg 8 of 11
	mov ax, [scores+6]		;4
	mov ebx, [Dscores+4]	;2
	mov ecx, [Dscores+12]	;4

	mov dx, scores	;1




	call CrLf




	ret
InClass1112 ENDP
END
;end InClass1112 