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
	stmfd	sp!, {r4, r5, r6}
	mov	r5, r1
	ldr	r1, [r1, #0]
	ldr	ip, [r0, #0]
	cmp	r1, #0
	mvnle	r3, #25600
	movgt	r3, #25600
	mov	r6, r2
	addle	r2, ip, r1
	rsbgt	r2, ip, r1
	suble	r3, r3, #134
	addgt	r3, r3, #135
	rsble	r1, r1, ip
	addgt	r1, ip, r1
	cmp	r2, #0
	addle	ip, r2, r1, asr #1
	subgt	ip, r2, r1, asr #1
	suble	r3, r3, #15168
	addgt	r3, r3, #15168
	suble	r3, r3, #24
	addgt	r3, r3, #24
	suble	r1, r1, r2, asr #1
	addgt	r1, r1, r2, asr #1
	cmp	ip, #0
	addle	r2, ip, r1, asr #2
	subgt	r2, ip, r1, asr #2
	suble	r3, r3, #8000
	addgt	r3, r3, #8000
	suble	r3, r3, #27
	addgt	r3, r3, #27
	suble	r1, r1, ip, asr #2
	addgt	r1, r1, ip, asr #2
	cmp	r2, #0
	addle	ip, r2, r1, asr #3
	subgt	ip, r2, r1, asr #3
	suble	r3, r3, #4064
	addgt	r3, r3, #4064
	suble	r3, r3, #10
	addgt	r3, r3, #10
	suble	r1, r1, r2, asr #3
	addgt	r1, r1, r2, asr #3
	cmp	ip, #0
	addle	r2, ip, r1, asr #4
	subgt	r2, ip, r1, asr #4
	suble	r3, r3, #2032
	addgt	r3, r3, #2032
	suble	r3, r3, #13
	addgt	r3, r3, #13
	suble	r1, r1, ip, asr #4
	addgt	r1, r1, ip, asr #4
	cmp	r2, #0
	addle	ip, r2, r1, asr #5
	subgt	ip, r2, r1, asr #5
	suble	r3, r3, #1020
	addgt	r3, r3, #1020
	suble	r3, r3, #3
	addgt	r3, r3, #3
	suble	r1, r1, r2, asr #5
	addgt	r1, r1, r2, asr #5
	cmp	ip, #0
	addle	r2, ip, r1, asr #6
	subgt	r2, ip, r1, asr #6
	suble	r3, r3, #508
	addgt	r3, r3, #508
	suble	ip, r1, ip, asr #6
	addgt	ip, r1, ip, asr #6
	suble	r3, r3, #3
	addgt	r3, r3, #3
	cmp	r2, #0
	addle	r1, r2, ip, asr #7
	subgt	r1, r2, ip, asr #7
	mov	r4, r0
	suble	r0, r3, #255
	addgt	r0, r3, #255
	suble	r3, ip, r2, asr #7
	addgt	r3, ip, r2, asr #7
	cmp	r1, #0
	addle	r2, r1, r3, asr #8
	subgt	r2, r1, r3, asr #8
	suble	r3, r3, r1, asr #8
	addgt	r3, r3, r1, asr #8
	suble	r0, r0, #127
	addgt	r0, r0, #127
	cmp	r2, #0
	addle	ip, r2, r3, asr #9
	subgt	ip, r2, r3, asr #9
	suble	r3, r3, r2, asr #9
	addgt	r3, r3, r2, asr #9
	suble	r1, r0, #63
	addgt	r1, r0, #63
	cmp	ip, #0
	addle	r2, ip, r3, asr #10
	subgt	r2, ip, r3, asr #10
	suble	r3, r3, ip, asr #10
	addgt	r3, r3, ip, asr #10
	suble	r1, r1, #31
	addgt	r1, r1, #31
	cmp	r2, #0
	addle	ip, r2, r3, asr #11
	subgt	ip, r2, r3, asr #11
	suble	r3, r3, r2, asr #11
	addgt	r3, r3, r2, asr #11
	suble	r1, r1, #15
	addgt	r1, r1, #15
	cmp	ip, #0
	addle	r2, ip, r3, asr #12
	subgt	r2, ip, r3, asr #12
	suble	r3, r3, ip, asr #12
	addgt	r3, r3, ip, asr #12
	suble	r1, r1, #7
	addgt	r1, r1, #7
	cmp	r2, #0
	addle	ip, r2, r3, asr #13
	subgt	ip, r2, r3, asr #13
	suble	r3, r3, r2, asr #13
	addgt	r3, r3, r2, asr #13
	suble	r1, r1, #3
	addgt	r1, r1, #3
	cmp	ip, #0
	subgt	r0, ip, r3, asr #14
	addle	r0, ip, r3, asr #14
	addgt	r2, r1, #1
	addgt	r3, r3, ip, asr #14
	suble	r2, r1, #1
	suble	r3, r3, ip, asr #14
	str	r3, [r4, #0]
	str	r0, [r5, #0]
	str	r2, [r6, #0]
	ldmfd	sp!, {r4, r5, r6}
	bx	lr
	.size	cordic_V_fixed_point, .-cordic_V_fixed_point
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
