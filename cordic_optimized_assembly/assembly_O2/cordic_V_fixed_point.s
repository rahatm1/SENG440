	.arch armv4t
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 2
	.eabi_attribute 18, 4
	.file	"cordic_V_fixed_point.c"
	.text
	.align	2
	.global	cordic_V_fixed_point
	.type	cordic_V_fixed_point, %function
cordic_V_fixed_point:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6, r7, r8, sl}
	mov	ip, #0
	mov	r7, r0
	mov	r8, r1
	ldr	r0, [r0, #0]
	ldr	r1, [r1, #0]
	ldr	r6, .L8
	mov	sl, r2
	mov	r5, ip
	mov	r2, ip
.L4:
	cmp	r1, #0
	ldr	    r3, [r6, r2]
	subgt	r4, r1, r0, asr ip
	addle	r4, r1, r0, asr ip
	addgt	r5, r5, r3
	rsble	r5, r3, r5
	addgt	r3, r0, r1, asr ip
	suble	r3, r0, r1, asr ip
	add	ip, ip, #1
	cmp	ip, #15
	add	r2, r2, #4
	mov	r1, r4
	mov	r0, r3
	bne	.L4
	str	r3, [r7, #0]
	str	r4, [r8, #0]
	str	r5, [sl, #0]
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl}
	bx	lr
.L9:
	.align	2
.L8:
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
