; AddTwoSum_64.asm - Chapter 3 example.

ExitProcess proto

COMMENT ~
;OUTPUT MODEL ISSUE NOT 64BIT (remember to set config)
;	https://www.youtube.com/watch?v=QWWTrdNkhBI
;	project buildCustomization MASM
;	solutionPlatform new x64 copyFromWin32 createPlatformFiles
;	property linker advanced entrypoint main
;INCLUDE irvine64.inc (does not exist)
;NO .486
;NO .MODEL
~				;~ end comment
.data
sum qword 0

.code
main proc
	mov	  rax,12345678AABBFF03h
	push rax
	pop rax
	mov	  rax,5
	add	  rax,6
	mov   sum,rax

	mov   ecx,0	;or rcx
	mov   edx,0	;reminder 64 bit windows api params in 4 registers
	mov   r8,0
	mov   r9,0
	call  ExitProcess
main endp
end
