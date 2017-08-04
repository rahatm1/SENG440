	.arch armv4t
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 18, 4
	.file	"cordic_R_fixed_point.c"
	.data
	.align	2
	.type	z_table, %object
	.size	z_table, 60
z_table:
	.word	25735
	.word	15192
	.word	8027
	.word	4074
	.word	2045
	.word	1023
	.word	511
	.word	255
	.word	127
	.word	63
	.word	31
	.word	15
	.word	7
	.word	3
	.word	1
	.text
	.align	2
	.global	cordic_R_fixed_point
	.type	cordic_R_fixed_point, %function
cordic_R_fixed_point:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #52
	str	r0, [fp, #-40]
	str	r1, [fp, #-44]
	str	r2, [fp, #-48]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-44]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-48]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L2
.L5:
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	bge	.L3
	mvn	r3, #0
	str	r3, [fp, #-52]
	b	.L4
.L3:
	mov	r3, #1
	str	r3, [fp, #-52]
.L4:
	ldr	r3, [fp, #-52]
	str	r3, [fp, #-8]
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-12]
	mov	r2, r2, asr r3
	ldr	r3, [fp, #-8]
	mul	r2, r3, r2
	ldr	r3, [fp, #-32]
	rsb	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-12]
	mov	r2, r2, asr r3
	ldr	r3, [fp, #-8]
	mul	r2, r3, r2
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-12]
	ldr	r3, .L7
	ldr	r2, [r3, r2, asl #2]
	ldr	r3, [fp, #-8]
	mul	r2, r3, r2
	ldr	r3, [fp, #-24]
	rsb	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L2:
	ldr	r3, [fp, #-12]
	cmp	r3, #14
	ble	.L5
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-32]
	str	r3, [r2, #0]
	ldr	r2, [fp, #-44]
	ldr	r3, [fp, #-28]
	str	r3, [r2, #0]
	ldr	r2, [fp, #-48]
	ldr	r3, [fp, #-24]
	str	r3, [r2, #0]
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
.L8:
	.align	2
.L7:
	.word	z_table
	.size	cordic_R_fixed_point, .-cordic_R_fixed_point
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
