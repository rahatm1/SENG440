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
	.file	"cordic_R_fixed_point.c"
	.text
	.align	2
	.global	cordic_R_fixed_point
	.type	cordic_R_fixed_point, %function
cordic_R_fixed_point:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r2, #0]
	cmp	r3, #0
	ldr	ip, [r1, #0]
	subge	r3, r3, #25600
	addlt	r3, r3, #25600
	stmfd	sp!, {r4, r5, r6}
	mov	r6, r2
	ldr	r2, [r0, #0]
	subge	r3, r3, #135
	addlt	r3, r3, #135
	mov	r5, r1
	addge	r1, r2, ip
	rsblt	r1, r2, ip
	rsbge	ip, ip, r2
	addlt	ip, r2, ip
	cmp	r3, #0
	subge	r3, r3, #15168
	addlt	r3, r3, #15168
	subge	r3, r3, #24
	addlt	r3, r3, #24
	addge	r2, r1, ip, asr #1
	sublt	r2, r1, ip, asr #1
	subge	ip, ip, r1, asr #1
	addlt	ip, ip, r1, asr #1
	cmp	r3, #0
	subge	r3, r3, #8000
	addlt	r3, r3, #8000
	subge	r3, r3, #27
	addlt	r3, r3, #27
	addge	r1, r2, ip, asr #2
	sublt	r1, r2, ip, asr #2
	subge	ip, ip, r2, asr #2
	addlt	ip, ip, r2, asr #2
	cmp	r3, #0
	subge	r3, r3, #4064
	addlt	r3, r3, #4064
	subge	r3, r3, #10
	addlt	r3, r3, #10
	addge	r2, r1, ip, asr #3
	sublt	r2, r1, ip, asr #3
	subge	ip, ip, r1, asr #3
	addlt	ip, ip, r1, asr #3
	cmp	r3, #0
	subge	r3, r3, #2032
	addlt	r3, r3, #2032
	subge	r3, r3, #13
	addlt	r3, r3, #13
	addge	r1, r2, ip, asr #4
	sublt	r1, r2, ip, asr #4
	subge	ip, ip, r2, asr #4
	addlt	ip, ip, r2, asr #4
	cmp	r3, #0
	subge	r3, r3, #1020
	addlt	r3, r3, #1020
	subge	r3, r3, #3
	addlt	r3, r3, #3
	addge	r2, r1, ip, asr #5
	sublt	r2, r1, ip, asr #5
	subge	ip, ip, r1, asr #5
	addlt	ip, ip, r1, asr #5
	cmp	r3, #0
	subge	r3, r3, #508
	addlt	r3, r3, #508
	subge	r3, r3, #3
	addlt	r3, r3, #3
	addge	r1, r2, ip, asr #6
	sublt	r1, r2, ip, asr #6
	subge	ip, ip, r2, asr #6
	addlt	ip, ip, r2, asr #6
	cmp	r3, #0
	subge	r3, r3, #255
	addlt	r3, r3, #255
	addge	r2, r1, ip, asr #7
	sublt	r2, r1, ip, asr #7
	subge	ip, ip, r1, asr #7
	addlt	ip, ip, r1, asr #7
	cmp	r3, #0
	subge	r3, r3, #127
	addlt	r3, r3, #127
	addge	r1, r2, ip, asr #8
	sublt	r1, r2, ip, asr #8
	subge	ip, ip, r2, asr #8
	addlt	ip, ip, r2, asr #8
	cmp	r3, #0
	subge	r3, r3, #63
	addlt	r3, r3, #63
	addge	r2, r1, ip, asr #9
	sublt	r2, r1, ip, asr #9
	subge	ip, ip, r1, asr #9
	addlt	ip, ip, r1, asr #9
	cmp	r3, #0
	subge	r3, r3, #31
	addlt	r3, r3, #31
	addge	r1, r2, ip, asr #10
	sublt	r1, r2, ip, asr #10
	subge	ip, ip, r2, asr #10
	addlt	ip, ip, r2, asr #10
	cmp	r3, #0
	subge	r3, r3, #15
	addlt	r3, r3, #15
	addge	r2, r1, ip, asr #11
	sublt	r2, r1, ip, asr #11
	subge	ip, ip, r1, asr #11
	addlt	ip, ip, r1, asr #11
	cmp	r3, #0
	subge	r3, r3, #7
	addlt	r3, r3, #7
	addge	r1, r2, ip, asr #12
	sublt	r1, r2, ip, asr #12
	subge	ip, ip, r2, asr #12
	addlt	ip, ip, r2, asr #12
	cmp	r3, #0
	subge	r3, r3, #3
	addlt	r3, r3, #3
	addge	r2, r1, ip, asr #13
	sublt	r2, r1, ip, asr #13
	subge	ip, ip, r1, asr #13
	addlt	ip, ip, r1, asr #13
	cmp	r3, #0
	mov	r4, r0
	addlt	r1, r3, #1
	subge	r1, r3, #1
	sublt	r0, r2, ip, asr #14
	addlt	r3, ip, r2, asr #14
	addge	r0, r2, ip, asr #14
	subge	r3, ip, r2, asr #14
	str	r3, [r4, #0]
	str	r0, [r5, #0]
	str	r1, [r6, #0]
	ldmfd	sp!, {r4, r5, r6}
	bx	lr
	.size	cordic_R_fixed_point, .-cordic_R_fixed_point
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
