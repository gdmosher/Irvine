TITLE CStringCopy 
; This routine Copies a Cstring
INCLUDE Irvine32.inc
pressKey EQU  <"Press <Enter>  ", 0>

.data ;GLOBALS
prompt  BYTE  pressKey
global  BYTE "22222ABCDEF22222"

.data
source	BYTE	"This is the source string.", 0ah, 0dh, 0
target	BYTE	SIZEOF source DUP(0)
dest2	BYTE	SIZEOF source DUP(0)

.code
CStringCopy PROC

mov edx, offset source
call WriteString

mov esi, 0					;index register
mov ecx, SIZEOF source		;initialize loop counter
L1:
mov al, source[esi]			;get a character from source
mov target[esi],al			;store it in the target
inc esi						;move to the next character
loop L1

.code
mov edx, offset target
call WriteString
 mov eax, ds;@data ; Load same segment
 mov ds, eax ; to both DS
 mov es, eax ; and ES
 
    cld                  ; set direction flag forward
    lea esi, source      ; put address into the source index
    lea edi, dest2       ; put address into the destination index
    mov ecx, SIZEOF source          ; put the number of bytes to copy in ecx
  ; --------------------------------------------------
  ; repeat copying bytes from ESI to EDI until ecx = 0
  ; --------------------------------------------------
    rep movsb 
mov edx, offset dest2
call WriteString

call crlf
call crlf
	call DumpRegs	;display registers
	mov	 edx, offset prompt
	call  WriteString; displays “Press any key ...
call ReadDec;not ReadInt

ret
CStringCopy ENDP
END
;end CStringCopy 