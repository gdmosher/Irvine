TITLE InClass1203

; Description:
; 
; Revision date:

INCLUDE Irvine32.inc
.data
myMessage BYTE "InClass1203",0dh,0ah,0


.code
InClass1203 PROC
	call Clrscr  

	mov	 edx,offset myMessage
	call WriteString

	;EXERCISE#1
	BUFFER_SIZE = 5000
	.data
		buffer BYTE BUFFER_SIZE DUP(?)
		myFile BYTE "C:\test.txt",0
		fileName	BYTE 40 DUP(0),0	;init with 40 nulls plus a null term
		bytesRead	DWORD ?
		fileHandle	DWORD ?

		promptFileName	BYTE	"Enter a file name:  ",0
		promptInput		BYTE	"Input string from the file:  ",0dh,0ah,0
	.code
		call Clrscr
		mov edx, OFFSET myfile
		call OpenInputfile
		MOV FILEHANDLE, EAX
		call WriteWindowsMsg
		call DumpRegs

;		mov eax, fileHandle				;filehandle is already in eax
		mov edx, OFFSET buffer
		mov ecx, BUFFER_SIZE
		call ReadFromFile

		mov bytesRead, eax
		call WriteWindowsMsg

		call DumpRegs
		call Crlf
		call Crlf

		mov edx, OFFSET buffer
		call WriteString

		call Crlf
		call Crlf
		mov eax, fileHandle
		call DumpRegs
		call CloseFile
		call WriteWindowsMsg
		call DumpRegs
		call Crlf
		call Crlf		
		CALL CRLF


	;EXERCISE#2 (FOR THE QUIZ)
	.code
		call Crlf
		call Crlf
		mov edx, OFFSET promptFileName
		call WriteString

		;read in the file anme
		mov edx, OFFSET fileName
		mov ecx, SIZEOF fileName
		call ReadString

		;open the file
		mov edx, OFFSET fileName
		call OpenInputFile
		mov filehandle, eax

		;check to see if error opening file
		cmp eax, INVALID_HANDLE_VALUE
		;if no error jump to read
		jne read
		;if error, display the message and jump to close_and_exit
		call WriteWindowsMsg
		call Crlf
		jmp close_and_exit
	read:
		;read the file into the buffer
		mov edx, OFFSET buffer
		mov ecx, BUFFER_SIZE
		call ReadFromFile

		;display the string
		call Crlf
		mov edx, OFFSET promptInput
		call WriteString
		mov edx, OFFSET buffer
		call WriteString
		call Crlf
		call Crlf
	close_and_exit:
		;close the file
		mov eax, fileHandle
		call CloseFile

	;Ex_5-1 positive or negative
	.code
List_SIZE = 32

.data
	getNumber BYTE "Enter a number:  ",0
	sayNegative BYTE "The number is negative.",0dh,0ah,0
	sayPositive BYTE "The number is positive.",0dh,0ah,0
	sayEven BYTE "The number is zero.",0dh,0ah,0
.code
	mov eax, 0
	mov edx, OFFSET getNumber
	call WriteString
	call ReadInt

	cmp eax, 0
	jl NegNum

	cmp eax, 0
	je ZeroNum
	mov edx, OFFSET sayPositive
	call WriteString
	jmp Done2

NegNum:
	mov edx, OFFSET sayNegative
	call WriteString
	jmp Done2

ZeroNum:
	mov edx, OFFSET sayEven
	call WriteString
	jmp Done2

Done2:
	call Crlf

;EX_5-2   a .while loop
.data
	count DWORD 0
	msg BYTE "Hello",0
.code
	.WHILE count < 5
		mov edx, OFFSET msg
		call WriteString
		call Crlf
		inc count
	.ENDW

	;EX_5-4 counting negative random numbers (for the quiz)
;INCLUDE Irvine32.inc

.data
	intArray SDWORD 20 DUP(?)
	count2 DWORD 0
	displayNums BYTE "Here are 20 random 32 bit signed integers (SDWORD's):",0dh,0ah,0dh,0ah,0
	negNumCount BYTE "The number of negative numbers is:  ",0
.code
	call Randomize
	
	; Fill the array with random values
	mov  esi,OFFSET intArray 		; point to the array
	mov  ecx,LENGTHOF intArray 		; loop counter

	mov edx, OFFSET displayNums
	call WriteString

L1:	call	Random32					; EAX = random value
	call	WriteInt
	call	Crlf
	mov	[esi],eax
	add	esi,TYPE intArray
	loop	L1

	; Search for negative values
	mov	esi,OFFSET intArray 	; point to the array
	mov	ecx,LENGTHOF intArray 	; loop counter
L2:	
	mov eax, [esi]
	cmp  eax ,0 				; compare value to zero

;  negative value?
	jge  L3					; jump if greater than or equal to  0
	inc  count2				; if negative, add to count
	
L3:
	add  esi,4
	loop L2
	call Crlf
	mov edx, OFFSET negNumCount
	call WriteString

	mov  eax,count2
	call WriteDec
	call Crlf
	call Crlf

		
	done:
		ret

InClass1203 ENDP
END
;end InClass1203 