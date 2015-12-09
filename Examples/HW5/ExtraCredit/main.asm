TITLE MASM Template						(main.asm)
;=================================================
; ATTACHED: ExtraCredit for Chapter 5
;
;=================================================
; Program Description:	ExtraCredit	for Chapter 4
; Author:				GORDON MOSHER
; Date Created:			2015-1208
; Last Modification:	2015-1208
;=================================================

INCLUDE Irvine32.inc


.data
myMessage BYTE "Extra Credit for Chapter 5",0dh,0ah,0

	BUFFER_SIZE	= 5000
	INVALID_FILE_HANDLE = -1
	fileHandle	DWORD	?
	buffer		BYTE	BUFFER_SIZE DUP('0')
	fileName	BYTE	".\newFile.txt",0
	msg1		BYTE	"Number of bytes written: ",0
	msg2		BYTE	"Filename: ",0
.code
main PROC
	call Clrscr  

	mov	 edx,offset myMessage
	call WriteString

	;Ex_5-25
	mov edx, OFFSET fileName
	call CreateOutputFile
;should test for INVALID_FILE_HANDLE IN EAX
	.IF EAX == INVALID_FILE_HANDLE
		jmp done
	.ENDIF
	mov fileHandle, eax

	call Crlf
	mov edx, OFFSET msg2
	call WriteString
	mov edx, OFFSET fileName
	call WriteString
	call Crlf

	mov eax, fileHandle
	mov edx, OFFSET buffer
	mov ecx, BUFFER_SIZE
	call WriteToFile
	mov eax, eax		;contains 0 if error, else number of bytes written
;	.IF EAX > 0
		mov edx, OFFSET msg1
		call WriteString
		call WriteInt
		call Crlf
;	.ENDIF
	mov eax, fileHandle
	call CloseFile
	call DumpRegs

	jmp done

done:
	exit
main ENDP

END main
COMMENT~
PROGRAM OUTPUT
Extra Credit for Chapter 5

Filename: .\newFile.txt
Number of bytes written: +5000

  EAX=00000001  EBX=7FFDE000  ECX=7ADF8568  EDX=00000000
  ESI=00401005  EDI=00401005  EBP=0019FF94  ESP=0019FF84
  EIP=0040345C  EFL=00000246  CF=0  SF=0  ZF=1  OF=0  AF=0  PF=1

Press any key to continue . . .
~