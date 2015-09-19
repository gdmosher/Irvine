; AddVariables.asm - Chapter 3 example.

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
firstval  dword 20002000h
secondval dword 11111111h
thirdval  dword 22222222h
fourthval dword 0000FF03h
sum dword 0

.code
main proc
	mov eax,fourthval
	push eax
	pop eax
	mov	eax,firstval				
	add	eax,secondval		
	add eax,thirdval
	mov sum,eax

	invoke ExitProcess,0
main endp
end main