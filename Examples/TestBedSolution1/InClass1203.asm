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
		bytesRead	DWORD ?
		fileHandle	DWORD ?
	.code
		call Clrscr
		mov edx, OFFSET myfile
		call OpenInputfile
		MOV FILEHANDLE, EAX
		call WriteWindowsMsg
		call DumpRegs

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


	;EXERCISE#2

	ret

InClass1203 ENDP
END
;end InClass1203 