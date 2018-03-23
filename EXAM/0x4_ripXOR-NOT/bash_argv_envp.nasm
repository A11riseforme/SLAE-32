; bash_argv_envp.nasm
; author:  Chase Hatch


section .text
global _start
_start:
	; ultimately, want equivalent:
	; export PS1='[bash]: ' 
	; bash -norc

	xor eax, eax
	xor ebx, ebx
	xor ecx, ecx
	xor edx, edx
	xor esi, esi
	xor edi, edi
	push eax		;48 ;0x00000000
	push 0x68736162 	;44 ;  hsab 
	push 0x2f6e6962 	;36 ;  /nib 
	push 0x2f2f2f2f 	;32 ;  ////
	mov ebx, esp		; best time to grab ebx
	push eax		;28 ;0x00000000
	push 0x90909063 	;24 ;  c 
	push 0x726f6e2d 	;20 ;  ron-
	mov dword [esp+5], eax	    ;becomes 0x00000063
	push eax		;16 ;0x00000000
	push 0x5a3a5d68 	;12;  Z:]h 
	push 0x7361625b 	;8 ;  sab[ 
	push 0x3d315350 	;4 ;  =1SP 
	mov byte [esp+11], 0x20    ; change byte at Z to space
	push eax		;0 ;0x00000000
	lea esi, [esp]

	; start building argv array.  ESP currently points to 0x00000000
	lea ecx, [esi+20]	
	push ecx		; argv[1]
	push ebx		; argv[0]
	mov ecx, esp		;ecx now 0x[argv1] 0x[argv0] 0x00000000
	
	; start building envp array. 		
	push eax		;  ;0x00000000
	lea edx, [esi+4]
	push edx
	lea edx, [esp] 	
	mov al, 0xb
	int 0x80
	


	