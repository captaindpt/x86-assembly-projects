GCC_OPTIONS= -m64 -no-pie
NASM_OPTIONS= -f elf64
 
run.out: main.o area.o
	gcc $(GCC_OPTIONS) -o run.out main.o area.o

main.out: main.c area.o
	gcc -o main.out $(GCC_OPTIONS) main.c area.o

area.o: area.asm
	nasm $(NASM_OPTIONS) area.asm


