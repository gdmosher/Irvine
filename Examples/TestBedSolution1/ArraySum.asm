TITLE ArraySum 
; This routine Sums an Array
INCLUDE Irvine32.inc
pressKey EQU  <"Press <Enter>  ", 0>

.data ;GLOBALS
prompt  BYTE  pressKey
global  BYTE "22222ABCDEF22222"

.data
intArray	DWORD	10000h, 20000h, 30000h, 40000h

.code
ArraySum PROC
mov edi, OFFSET intArray	;EDI=address on intArray
mov ecx, LENGTHOF intArray	;initialize loop counter
mov eax, 0					;sum = 0
L1:
add eax, [edi]				;add an integer
add edi, TYPE intArray		;point to the next element
loop L1

.data
m2	BYTE	"The sum of the array elements is "
.code
mov edx, offset m2
call WriteString

;result is already in eax
;mov eax, n1
call writeDec

call crlf
call crlf
	call DumpRegs	;display registers
	mov	 edx, offset prompt
	call  WriteString; displays “Press any key ...
call ReadDec;not ReadInt

ret
ArraySum ENDP
END
;end ArraySum 