TITLE HW4 

; Description:
; 
; Revision date:

INCLUDE Irvine32.inc
.data
myMessage BYTE "Homework 4",0dh,0ah,0

.code
HW4 PROC
	call Clrscr  

	mov	 edx,offset myMessage
	call WriteString
	call CrLf

	.data
		var1 SBYTE	-4,-2, 3, 1
		var2 WORD	1000h, 2000h, 3000h, 4000h
		var3 SWORD	-16, -42
		var4 DWORD	1,2,3,4,5
	.code
;	movzx ax, var2	;invalid instruction operands
;	movzx var2, al	;memory operand not allowed in context
	mov var2, 1000h
	mov ax, var2
	mov ax, var2 + 4
	mov ax, var3
	mov ax, var3 -2

	mov edx, var4
;	mov edx, var2
	mov edx, [var4 + 4]
;	mov edx, var1
	
	;HW4c
	.data
	val1 byte 10h
	val2 word 8000h
	val3 dword 0ffffh
	val4 word 7fffh
	.code
	inc val2
	dec val2
	sub eax, val3
	movsx ebx, val4
	sub val2, bx
	mov val2, 8000h
	add val2, 1
	call DumpRegs
	add val4, 1
	call DumpRegs
	sub val2, 1
	sub val4, 1

	mov eax, 0
	mov ax, 7ff0h
	add al, 10h
	call DumpRegs
	add ah, 1
	call DumpRegs
	add ax, 2
	call DumpRegs

	;Question 7
	.data
	value1	sword 6
	value2	sword 4
	value4	sword 3
	.code
	mov bx, value1
	mov ax, value2
	neg ax
	add ax, bx
	sub ax, value4
	call DumpRegs
	call CrLf

	.IF eax > ebx && eax >= ecx
		mov edx,1
	.ELSE
		mov edx,2
	.ENDIF
	call DumpRegs
	call CrLf

;Question 10
	mov eax, 80000000h
	neg eax
	call DumpRegs



	ret
HW4 ENDP
END
;end HW4