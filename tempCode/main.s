	.file	"main.c" # установочные метаданные
	.option nopic
	.attribute arch, "rv32i2p0_m2p0_a2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"%i\n" # константа для вывода ответа в терминал
	.text
	.align	1
	.globl	main # функиця main
	.type	main, @function
main:
	addi	sp,sp,-48 # пролог: сохранение регистров
	sw	ra,44(sp)
	lui	a5,%hi(.LANCHOR0)
	addi	a5,a5,%lo(.LANCHOR0)
	lw	a0,0(a5)
	lw	a1,4(a5)
	lw	a2,8(a5)
	lw	a3,12(a5)
	lw	a4,16(a5)
	lw	a5,20(a5)
	sw	a0,8(sp)
	sw	a1,12(sp)
	sw	a2,16(sp)
	sw	a3,20(sp)
	sw	a4,24(sp)
	sw	a5,28(sp) # end prologue
	li	a2,4
	li	a1,6
	addi	a0,sp,8
	call	nth # вызов nth с параметрами выше
	mv	a1,a0
	lui	a0,%hi(.LC1)
	addi	a0,a0,%lo(.LC1)
	call	printf # вызов функции вывода в терминал
	lw	ra,44(sp) # эпилог: освобождение стека
	addi	sp,sp,48
	jr	ra
	.size	main, .-main
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
.LC0: # исходный массив
	.word	12
	.word	36
	.word	110
	.word	1
	.word	6
	.word	99
	.ident	"GCC: (g2ee5e430018-dirty) 12.2.0"
