	.arch armv4t
	.eabi_attribute 27, 3
	.fpu neon
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 18, 4
	.file	"cordic_R_fixed_point_simd.c"
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
	@ args = 0, pretend = 0, frame = 192
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #196
	str	r0, [fp, #-184]
	str	r1, [fp, #-188]
	str	r2, [fp, #-192]
	ldr	r3, [fp, #-184]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-180]
	ldr	r3, [fp, #-188]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-176]
	ldr	r3, [fp, #-192]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-172]
	sub	r3, fp, #180
	str	r3, [fp, #-132]
	ldr	r3, [fp, #-132]
	vld1.32	{d16}, [r3]
	fstd	d16, [fp, #-148]
	mov	r3, #0
	str	r3, [fp, #-168]
	b	.L2
.L5:
	ldr	r3, [fp, #-168]
	rsb	r3, r3, #0
	str	r3, [fp, #-128]
	ldr	r3, [fp, #-128]
	vdup.32	d16, r3
	fldd	d17, [fp, #-148]
	fstd	d17, [fp, #-116]
	fstd	d16, [fp, #-124]
	fldd	d17, [fp, #-116]
	fldd	d16, [fp, #-124]
	vrshl.s32	d16, d17, d16
	fstd	d16, [fp, #-108]
	fldd	d16, [fp, #-108]
	vrev64.32	d16, d16
	fstd	d16, [fp, #-140]
	fldd	d16, [fp, #-148]
	fstd	d16, [fp, #-92]
	fldd	d17, [fp, #-140]
	fstd	d17, [fp, #-100]
	fldd	d17, [fp, #-92]
	fldd	d16, [fp, #-100]
	vadd.i32	d16, d17, d16
	fstd	d16, [fp, #-164]
	fldd	d16, [fp, #-148]
	fstd	d16, [fp, #-76]
	fldd	d17, [fp, #-140]
	fstd	d17, [fp, #-84]
	fldd	d17, [fp, #-76]
	fldd	d16, [fp, #-84]
	vsub.i32	d16, d17, d16
	fstd	d16, [fp, #-156]
	ldr	r3, [fp, #-172]
	cmp	r3, #0
	bge	.L3
	fldd	d16, [fp, #-156]
	fstd	d16, [fp, #-60]
	fldd	d17, [fp, #-164]
	fstd	d17, [fp, #-68]
	fldd	d17, [fp, #-60]
	fldd	d16, [fp, #-68]
	vext.32	d16, d17, d16, #1
	fstd	d16, [fp, #-52]
	fldd	d16, [fp, #-52]
	vrev64.32	d16, d16
	fstd	d16, [fp, #-148]
	ldr	r2, [fp, #-168]
	ldr	r3, .L7
	ldr	r2, [r3, r2, asl #2]
	ldr	r3, [fp, #-172]
	add	r3, r3, r2
	str	r3, [fp, #-172]
	b	.L4
.L3:
	fldd	d16, [fp, #-164]
	fstd	d16, [fp, #-36]
	fldd	d17, [fp, #-156]
	fstd	d17, [fp, #-44]
	fldd	d17, [fp, #-36]
	fldd	d16, [fp, #-44]
	vext.32	d16, d17, d16, #1
	fstd	d16, [fp, #-28]
	fldd	d16, [fp, #-28]
	vrev64.32	d16, d16
	fstd	d16, [fp, #-148]
	ldr	r2, [fp, #-168]
	ldr	r3, .L7
	ldr	r2, [r3, r2, asl #2]
	ldr	r3, [fp, #-172]
	rsb	r3, r2, r3
	str	r3, [fp, #-172]
.L4:
	ldr	r3, [fp, #-168]
	add	r3, r3, #1
	str	r3, [fp, #-168]
.L2:
	ldr	r3, [fp, #-168]
	cmp	r3, #14
	ble	.L5
	sub	r3, fp, #180
	str	r3, [fp, #-8]
	fldd	d16, [fp, #-148]
	fstd	d16, [fp, #-20]
	ldr	r3, [fp, #-8]
	fldd	d16, [fp, #-20]
	vst1.32	{d16}, [r3]
	ldr	r2, [fp, #-180]
	ldr	r3, [fp, #-184]
	str	r2, [r3, #0]
	ldr	r2, [fp, #-176]
	ldr	r3, [fp, #-188]
	str	r2, [r3, #0]
	ldr	r2, [fp, #-192]
	ldr	r3, [fp, #-172]
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
