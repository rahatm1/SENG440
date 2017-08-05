	.arch armv4t
	.eabi_attribute 27, 3
	.fpu neon
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 1
	.eabi_attribute 18, 4
	.file	"cordic_V_fixed_point_simd.c"
	.text
	.align	2
	.global	cordic_V_fixed_point
	.type	cordic_V_fixed_point, %function
cordic_V_fixed_point:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6}
	sub	sp, sp, #12
	mov	r4, r0
	mov	r5, r1
	mov	r6, r2
	ldr	r3, [r0, #0]
	str	r3, [sp, #0]
	ldr	r3, [r1, #0]
	str	r3, [sp, #4]
	mov	r3, sp
	vld1.32	{d17}, [r3]
	mov	r1, #0
	mov	ip, r1
	mov	r2, r1
	ldr	r0, .L7
.L4:
	vdup.32	d16, ip
	vrshl.s32	d16, d17, d16
	vrev64.32	d16, d16
	vadd.i32	d18, d17, d16
	vsub.i32	d16, d17, d16
	vmov.32	r3, d17[1]
	cmp	r3, #0
	ble	.L2
	vext.32	d16, d16, d18, #1
	vrev64.32	d17, d16
	ldr	r3, [r0, r2]
	add	r1, r1, r3
	b	.L3
.L2:
	vext.32	d16, d18, d16, #1
	vrev64.32	d17, d16
	ldr	r3, [r0, r2]
	rsb	r1, r3, r1
.L3:
	sub	ip, ip, #1
	add	r2, r2, #4
	cmn	ip, #15
	bne	.L4
	mov	r3, sp
	vst1.32	{d17}, [r3]
	ldr	r3, [sp, #0]
	str	r3, [r4, #0]
	ldr	r3, [sp, #4]
	str	r3, [r5, #0]
	str	r1, [r6, #0]
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, r6}
	bx	lr
.L8:
	.align	2
.L7:
	.word	.LANCHOR0
	.size	cordic_V_fixed_point, .-cordic_V_fixed_point
	.section	.rodata
	.align	2
.LANCHOR0 = . + 0
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
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
