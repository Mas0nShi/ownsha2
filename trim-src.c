#include "fuck.h"
#include <fcntl.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <errno.h>


int main(int argc, char *argv[]) {

    size_t size = sizeof(foo);

    for (int i = 8; i < 16; ++i) {
        foo.ehdr.e_ident[i] = 0xFF;
    }
    foo.ehdr.e_version = 0xFFFFFFFF;
    foo.ehdr.e_shoff = 0xFFFFFFFFFFFFFFFF;
    foo.ehdr.e_flags = 0xFFFFFFFF;

    printf("text offset %d\n", offsetof(elf, text));

    foo.ehdr.e_entry = ADDR_TEXT + offsetof(elf, ehdr) + 8;
    printf("new entry %d\n", offsetof(elf, ehdr) + 8);

    // copy 4 bytes
    foo.ehdr.e_ident[8] = foo.text[0];
    foo.ehdr.e_ident[9] = foo.text[1];
    foo.ehdr.e_ident[10] = foo.text[2];
    foo.ehdr.e_ident[11] = foo.text[3];
    foo.ehdr.e_ident[12] = 0xEB;
    foo.ehdr.e_ident[13] = (offsetof(elf, ehdr) + offsetof(Elf64_Ehdr, e_version)) - (offsetof(elf, ehdr) + 14);
    printf("jmp %d\n", foo.ehdr.e_ident[13]);

    for (int i = 0; i < sizeof(foo.text) - 4; ++i) {
        foo.text[i] = foo.text[i + 4];
    }
    size -= 4;

    // copy 2 bytes
    ((char *) (&foo.ehdr.e_version))[0] = foo.text[0];
    ((char *) (&foo.ehdr.e_version))[1] = foo.text[1];
    ((char *) (&foo.ehdr.e_version))[2] = 0xEB;
    ((char *) (&foo.ehdr.e_version))[3] =
            (offsetof(elf, ehdr) + offsetof(Elf64_Ehdr, e_shoff)) -
            (offsetof(elf, ehdr) + offsetof(Elf64_Ehdr, e_version) + 4);

    for (int i = 0; i < sizeof(foo.text) - 2; ++i) {
        foo.text[i] = foo.text[i + 2];
    }
    size -= 2;

    // copy 8 bytes
    memcpy(&foo.ehdr.e_shoff, &foo.text[0], 8);
    ((char *) (&foo.ehdr.e_shoff))[8] = 0xEB;
    ((char *) (&foo.ehdr.e_shoff))[9] = offsetof(elf, text) -
                                         (offsetof(elf, ehdr) + offsetof(Elf64_Ehdr, e_shoff) + 10);
    printf("jmp %d\n", ((char *) (&foo.ehdr.e_shoff))[9]);
	
    for (int i = 0; i < sizeof(foo.text) - 8; ++i) {
        foo.text[i] = foo.text[i + 8];
    }
    size -= 8;
	printf("size: %d\n", size);


    // output
	
    FILE *fd = fopen("zminsha256", "wb");
	printf("fd: %p\n", fd);
	printf("Error: %s\n", strerror(errno));
	
	
    size_t n = fwrite(&foo, size, 1, fd);
	
	fclose(fd);
    printf("done: %d %d\n", size, n);
    return 0;
}
