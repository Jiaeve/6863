CLANG=clang
LLVM_LINK=llvm-link

INCLUDES = -I.

all: kfifo.bc

kfifo_model.bc: kfifo_model.c kfifo_model.h
	$(CLANG) -emit-llvm -c -g $(INCLUDES) $< -o $@

kfifo_klee_driver.bc: kfifo_klee_driver.c kfifo_model.h
	$(CLANG) -emit-llvm -c -g $(INCLUDES) $< -o $@

kfifo.bc: kfifo_model.bc kfifo_klee_driver.bc
	$(LLVM_LINK) kfifo_model.bc kfifo_klee_driver.bc -o kfifo.bc

clean:
	rm -f *.bc
