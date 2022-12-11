CC := gcc # default compiler for arm64
TARGET := arm64 # arm64 or rv32i are supported (default: arm64)
TARGET_ARCH_RISCV_ABI := ilp32 # default ABI for rv32i
TARGET_ARCH_ARM := arm64-apple-darwin22.2.0 # default target for arm64

CPREFIX := # prefix for compiler
CFLAGS := -O1 -save-temps -Wall --target=$(TARGET_ARCH_ARM) # default compiler options

ifeq ($(TARGET), rv32i)
CPREFIX := riscv64-unknown-elf-
CFLAGS := -save-temps -march=$(TARGET) -mabi=$(TARGET_ARCH_RISCV_ABI) -O1 # compiler options for rv32i
endif

CC := $(CPREFIX)$(CC)
AR := $(CPREFIX)ar

all: clean build

build: main.o libpartition.a libnth.a
	$(CC) $(CFLAGS) main.o -L. -lnth -lpartition -o main

main.o:
	$(CC) $(CFLAGS) -c main.c

nth.o:
	$(CC) $(CFLAGS) -c nth.c

libnth.a: nth.o
	$(AR) rcs $@ $^

partition.o:
	$(CC) $(CFLAGS) -c partition.c

libpartition.a: partition.o
	$(AR) rcs $@ $^

clean:
	rm -rf *.o *.s *.bc *.i *.a main