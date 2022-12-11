	.file	"partition.c"
	.option nopic
	.attribute arch, "rv32i2p0_m2p0_a2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.globl	partition
	.type	partition, @function
partition:
	mv	t1,a0
	mv	a0,a2
	add	a5,a1,a2
	srli	a5,a5,1
	slli	a5,a5,2
	add	a5,t1,a5
	lw	a2,0(a5)
	blt	a1,a0,.L2
	ret
.L4:
	addi	a1,a1,1
	mv	a3,a5
	addi	a5,a5,4
	lw	a4,-4(a5)
	blt	a4,a2,.L4
	mv	a6,a3
.L8:
	slli	a5,a0,2
	add	a7,t1,a5
	lw	a3,0(a7)
	bge	a2,a3,.L5
	addi	a5,a5,-4
	add	a5,t1,a5
.L6:
	addi	a0,a0,-1
	mv	a7,a5
	addi	a5,a5,-4
	lw	a3,4(a5)
	bgt	a3,a2,.L6
.L5:
	sw	a3,0(a6)
	sw	a4,0(a7)
	bge	a1,a0,.L1
.L2:
	slli	a5,a1,2
	add	a6,t1,a5
	lw	a4,0(a6)
	addi	a5,a5,4
	add	a5,t1,a5
	bgt	a2,a4,.L4
	j	.L8
.L1:
	ret
	.size	partition, .-partition
	.ident	"GCC: (g2ee5e430018-dirty) 12.2.0"
