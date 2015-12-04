comment~
F5 Run
F7 Make
ALWAYS CLEAN SOLUTION AND EXIT VS BEFORE ADD -ALL, COMMIT --AMEND
3w 3b 3j 3k 3h 3l %
ctrlG 0 gg G 5G

f
c5w
d3w dd 3dd y p
r
iAaOo
Uu ctrlR
?/SUMMARYnN ctrlO ctrlI :s/old/new/gc
:w
:q
:!
  4. To substitute new for the first old in a line type    :s/old/new
     To substitute new for all 'old's on a line type	   :s/old/new/g
     To substitute phrases between two line #'s type	   :#,#s/old/new/g
     To substitute all occurrences in the file type	   :%s/old/new/g
     To ask for confirmation each time add 'c'		   :%s/old/new/gc
~
TITLE Add and Subtract
; This program adds and subtracts 32 - bit integers.
INCLUDE Irvine32.inc
InClass1105 PROTO
InClass1112 PROTO
InClass1119 PROTO
InClass1203 PROTO
HW4 PROTO
Add3Integers PROTO
Multiply PROTO
AddSub PROTO
ArraySum PROTO
CStringCopy PROTO
pressKey EQU  <"Press any key ...", 0dh, 0ah, 0>

.data ;GLOBALS
global  BYTE "11111ABCDEF11111"
prompt  BYTE  pressKey

newLine BYTE 0Dh, 0Ah, 0;not used

.code
main	PROC


mov edx, offset global; use this line just to find Data Seg in EDX

Call InClass1203
Call InClass1119
Call HW4
COMMENT~
Call InClass1112
Call InClass1105
Call Add3Integers
Call Multiply
Call AddSub
Call ArraySum
Call CStringCopy
~
jmp done

.data
var1	DWORD	50000h
var2	WORD	65535
var3	WORD	1h
.code
	;play with NEG, MOVSX, OFFSET
	;play with NEG and 2's complement
	mov eax,10000h	;10000
	sub eax,40000h	;-30000
	neg eax			;make it positive
	sub eax,20000h	;10000
	mov eax, ds
	mov edx, OFFSET global
	mov ecx, OFFSET var1
	mov ebx, var1
	movsx ebx, var2
	neg ebx
	movsx ebx, var3
	neg ebx
	;play with OFFSET and ARRAY

	mov eax, 0
	mov ebx, 0
	mov ecx, 0
	mov edx, 0
.data
numArray	DWORD 10h,20h,30h,40h
.code
mov esi, 3
mov eax, numArray[esi*4]

mov ecx, 1000d
_123counter:
mov eax, ecx
call WriteDec
loop _123counter


call crlf
call crlf
	call DumpRegs	;display registers
	mov	 edx, offset prompt
	call  WriteString; displays “Press any key ...
call ReadDec;not ReadInt

done:
	exit
main ENDP
END main

; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.code
main proc
	mov	eax,5				
	add	eax,6				

	invoke ExitProcess,0
main endp
end main