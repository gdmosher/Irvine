TITLE InClass1210

; Description:
; 
; Revision date:

INCLUDE Irvine32.inc
.data
myMessage BYTE "MASM program example",0dh,0ah,0
buffer BYTE 5000 dup(?)
val1 DWORD 3
val2 DWORD 4
msg BYTE "The sum equals ",0

.code
ShowMessage PROC
ShowMessage ENDP
InClass1210 PROC
	call Clrscr  

	mov	 edx,offset myMessage
	call WriteString

	push val2
	push val1
	call AddNumbers
	mov edx, OFFSET msg
	call WriteString
	call WriteDec
	call Crlf
	call Crlf
	pop val1
	pop val2
	ret
InClass1210 ENDP
.code
AddNumbers PROC
	push ebp
	mov ebp, esp
	mov eax, [ebp+12]
	add eax, [ebp+8]
	pop ebp
	ret
AddNumbers ENDP
ShowMessage2 PROC
ShowMessage2 ENDP
END
;end InClass1203