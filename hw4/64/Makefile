GCC_OPTIONS= -m32
NASM_OPTIONS= -f elf

run.out: gcd.o lcm.o main.o
	gcc $(GCC_OPTIONS) -o run.out gcd.o lcm.o main.o

gcd.o: gcd.asm
	nasm $(NASM_OPTIONS) gcd.asm

lcm.o: lcm.asm 
	nasm $(NASM_OPTIONS) lcm.asm

main.o: main.c
	gcc $(GCC_OPTIONS) -c main.c
