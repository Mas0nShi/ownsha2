#elftoc = $(./tools/elftoc)
#objconv = $(./tools/objconv)
#ssrip = $(./tools/sstrip)

final: 

	@nasm -f elf64 exp.asm
	@ld -static -m elf_x86_64 -T ./minsha.lds exp.o -o exp
	@./tools/sstrip ./exp 
	@# @./exp
	@# @ls -l ./exp
	
	# trim_asm
	@./tools/elftoc ./exp > fuck.h
	@g++ -g -o ./temp trim-src.c fuck.h
	@./temp
	
	# sha256sum zminsha256
	@sha256sum ./zminsha256
	# ./zminsha256
	@./zminsha256
	@ls -l zminsha256
	

clean:
	rm -f *.o
	rm zminsha256
	rm exp
	rm temp
	rm fuck.h

.PHONY: final
