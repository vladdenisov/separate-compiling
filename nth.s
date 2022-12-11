	.file	"nth.c"
	.option nopic
	.attribute arch, "rv32i2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.globl	nth
	.type	nth, @function
nth:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	sw	s1,20(sp)
	sw	s2,16(sp)
	sw	s3,12(sp)
	mv	s2,a0
	addi	s0,a2,-1
	addi	s1,a1,-1
	li	s3,0
	j	.L2
.L5:
	mv	s1,a0
.L2:
	mv	a2,s1
	mv	a1,s3
	mv	a0,s2
	call	partition
	beq	a0,s0,.L7
	bgtu	a0,s0,.L5
	addi	s3,a0,1
	j	.L2
.L7:
	slli	s0,s0,2
	add	s2,s2,s0
	lw	a0,0(s2)
	lw	ra,28(sp)
	lw	s0,24(sp)
	lw	s1,20(sp)
	lw	s2,16(sp)
	lw	s3,12(sp)
	addi	sp,sp,32
	jr	ra
	.size	nth, .-nth
	.ident	"GCC: (g2ee5e430018-dirty) 12.2.0"
