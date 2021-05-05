C_SOURCES = $(wildcard kernel/*.c drivers/*.c cpu/*.c)
HEADERS = $(wildcard kernel/*.h drivers/*.h cpu/*.h)

OBJ = ${C_SOURCES:.c=.o}

all: arinos-image

run: all    qemu-system-i386 arinos-image

arinos-image: bootloader/boot_sector.bin kernel.bin cat $^ > $@

kernel.bin: kernel/kernel_entry.o ${OBJ}    ld -o $@ -Ttext 0x1000 $^ --oformat binary -m elf_i386

%.o: %.c ${HEADERS} gcc -m32 -ffreestanding -fno-pie -c $< -o $@

%.o: %.asm  nasm -f elf32 $< -o $@

%.bin: %.asm    nasm -f bin $< -o $@

clean:  rm -rf *.bin *.o arinos-image rm -rf bootloader/*.bin kernel/*.o drivers/*.o cpu/*.o
