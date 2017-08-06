	.arch armv4t
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 1
	.eabi_attribute 18, 4
	.file	"cordic_R_fixed_point_loop_unrolling.c"
	.text
	.align	2
	.global	cordic_R_fixed_point
	.type	cordic_R_fixed_point, %function
cordic_R_fixed_point:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6, r7, r8, sl}
	mov	r7, r0
	mov	r8, r1
	mov	sl, r2
	ldr	r2, [r0, #0]
	ldr	r3, [r1, #0]
	ldr	r5, [sl, #0]
	ldr	r6, .L9
	mov	ip, #0
.L7:
	cmp	r5, #0
	addlt	r0, r2, r3, asr ip
	sublt	r1, r3, r2, asr ip
	ldrlt	r3, [r6, #-4]
	addlt	r2, r5, r3
	subge	r0, r2, r3, asr ip
	addge	r1, r3, r2, asr ip
	ldrge	r3, [r6, #-4]
	rsbge	r2, r3, r5
	add	r3, ip, #1
	cmp	r2, #0
	addlt	r4, r0, r1, asr r3
	sublt	r1, r1, r0, asr r3
	ldrlt	r3, [r6, #0]
	addlt	r5, r2, r3
	subge	r4, r0, r1, asr r3
	addge	r1, r1, r0, asr r3
	ldrge	r3, [r6, #0]
	rsbge	r5, r3, r2
	add	ip, ip, #2
	add	r6, r6, #8
	cmp	ip, #16
	movne	r2, r4
	movne	r3, r1
	bne	.L7
.L6:
	str	r4, [r7, #0]
	str	r1, [r8, #0]
	str	r5, [sl, #0]
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl}
	bx	lr
.L10:
	.align	2
.L9:
	.word	.LANCHOR0+4
	.size	cordic_R_fixed_point, .-cordic_R_fixed_point
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
