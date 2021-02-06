GCC_OPTIONS= -m32
NASM_OPTIONS= -f elf

run.out: main.o area.o
	gcc $(GCC_OPTIONS) -o run.out main.o area.o

area.o: area.asm 
	nasm $(NASM_OPTIONS) -d ELF_TYPE area.asm

main.o: main.c
	gcc $(GCC_OPTIONS) -c main.c
