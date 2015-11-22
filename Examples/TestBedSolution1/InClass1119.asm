TITLE InClass1119 

; Description:
; 
; Revision date:

INCLUDE Irvine32.inc

.data
myMessage BYTE "InClass1119",0dh,0ah,0

.code
InClass1119 PROC
	call Clrscr  
	mov	 edx,offset myMessage
	call WriteString
	call CrLf

;	EXERCISE 1
	.data
	numbers	SDWORD	1,3,5,7,8
	sum		SDWORD	0
	msg1	BYTE	"The sum equals ",0
	msg2	BYTE	".",0dh,0ah,0
	.code
	mov	ecx, LENGTHOF numbers
	mov eax, sum
	mov esi, OFFSET numbers
loop1:
	add eax, [esi]
	add esi, TYPE numbers
	loop loop1
	mov sum, eax

	mov edx, offset msg1
	call WriteString
	call WriteDec
	mov edx, offset msg2
	call WriteString
	call CrLf

;	EXERCISE 2
	.data
	numbers2	SDWORD	10,10,10,20,20,20,30,30,30,40,40,40
	msg2_1		BYTE	"Here are the numbers:",0dh,0ah,0
	.code
	mov edx, offset msg2_1
	call WriteString
	mov	ecx, LENGTHOF numbers2
	mov esi, OFFSET numbers2
loop2:
	mov eax, [esi]
	add esi, TYPE numbers2
	call WriteDec
	call CrLf
	loop loop2

;	EXERCISE 3
	.data
	number3		SDWORD	1
	sum3		SDWORD	0
;	msg1	BYTE	"The sum equals ",0
;	msg2	BYTE	".",0dh,0ah,0
	.code
	COUNT = 5
	mov	ecx, COUNT-1
	mov eax, number3
loop3:
	inc number3
	add eax, number3
	loop loop3
	mov sum, eax

	mov edx, offset msg1
	call WriteString
	call WriteDec
	mov edx, offset msg2
	call WriteString
	call CrLf

;	EXERCISE 4 and 5
	.data
	number4		SBYTE	-5
	msg5	BYTE	"Here is the number: ",0
	.code
	mov edx, offset msg5
	call WriteString
	movsx eax, number4
	call WriteInt
	call CrLf

;	EXERCISE 6
	.data
	number6		SDWORD	?
	result6		SDWORD	?
	msg6	BYTE	"Enter a number: ",0
	msg61	BYTE	"The absolute value of ",0
	msg62	BYTE	" equals ",0
	.code
	mov edx, offset msg6
	call WriteString
	call ReadInt
	mov number6, eax
	cmp number6, 0
	jle else1
	mov result6, eax
	neg result6
	jmp done6
else1:
	mov result6, eax
done6:
	mov edx, offset msg61
	call WriteString
	mov eax, result6
	call WriteInt
	mov edx, offset msg62
	call WriteString
	mov eax, number6
	call WriteInt
	call CrLf

;	EXERCISE 7
	.data
	max		SDWORD	0	;use ebx instead
	numbers7	SDWORD	3,5,1,9,12,77,31,2,71,4
	msg7	BYTE	"The highest value is ",0
	.code
	mov ecx, LENGTHOF numbers7
	mov esi, offset numbers7
	mov ebx, 0
L7:
	mov eax, [esi]
	.IF eax > ebx		;cmp eax, [esi]
		mov ebx, eax
	.ENDIF
	add esi, TYPE numbers7
	loop L7

	mov edx, offset msg7
	call WriteString
	mov eax, ebx	;mov max into acc
	call WriteInt
	call CrLf
	COMMENT~
;	EXERCISE 8
	.data
	count8	SDWORD	0
	msg8	BYTE	"Squares of all number from 0 to 10:",0dh,0ah,0
	msg81	BYTE	"   ",0
	.code
	mov edx, msg8
	Call WriteString
	mov edx, msg81

	mov ecx, count8	;0
	.REPEAT
	mov eax, ecx
	Call WriteInt
	Call WriteString
	imul eax, ecx
	Call WriteInt
	Call CrLf
	inc ecx
	.UNTIL ecx=11
	mov edx, offset msg8
	call WriteString
	~
	.data
	caption BYTE "Warning!",0
	message BYTE "There is never too much of a good thing.",0
	.code
	mov ebx, offset caption
	mov edx, offset message
	call MsgBoxAsk
	call DumpRegs
	mov dh, 3
	mov dl, 3
;	call Gotoxy




;	call DumpRegs
	call CrLf
	ret
InClass1119 ENDP
END
;end InClass1119 