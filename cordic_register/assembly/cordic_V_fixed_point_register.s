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
	.file	"cordic_V_fixed_point_register.c"
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
	.section	.rodata
	.align	2
.LC0:
	.ascii	"x : %d\012y : %d\012\000"
	.text
	.align	2
	.global	cordic_V_fixed_point
	.type	cordic_V_fixed_point, %function
cordic_V_fixed_point:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, fp, lr}
	add	fp, sp, #20
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #0]
	mov	r5, r3
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #0]
	mov	r6, r3
	mov	r7, #0
	mov	r4, #0
	b	.L2
.L5:
	mov	r3, r6
	cmp	r3, #0
	ble	.L3
	mov	r2, r6
	mov	r3, r4
	mov	r2, r2, asr r3
	mov	r3, r5
	add	r2, r2, r3
	str	r2, [fp, #-40]
	mov	r1, r6
	mov	r2, r5
	mov	r3, r4
	mov	r3, r2, asr r3
	rsb	r1, r3, r1
	str	r1, [fp, #-36]
	mov	r2, r4
	ldr	r3, .L7
	ldr	r2, [r3, r2, asl #2]
	mov	r3, r7
	add	r3, r2, r3
	mov	r7, r3
	b	.L4
.L3:
	mov	r1, r5
	mov	r2, r6
	mov	r3, r4
	mov	r3, r2, asr r3
	rsb	r1, r3, r1
	str	r1, [fp, #-40]
	mov	r2, r5
	mov	r3, r4
	mov	r2, r2, asr r3
	mov	r3, r6
	add	r2, r2, r3
	str	r2, [fp, #-36]
	mov	r1, r7
	mov	r2, r4
	ldr	r3, .L7
	ldr	r3, [r3, r2, asl #2]
	rsb	r3, r3, r1
	mov	r7, r3
.L4:
	ldr	r0, .L7+4
	ldr	r1, [fp, #-40]
	ldr	r2, [fp, #-36]
	bl	printf
	ldr	r5, [fp, #-40]
	ldr	r6, [fp, #-36]
	mov	r3, r4
	add	r3, r3, #1
	mov	r4, r3
.L2:
	mov	r3, r4
	cmp	r3, #14
	ble	.L5
	mov	r2, r5
	ldr	r3, [fp, #-24]
	str	r2, [r3, #0]
	mov	r2, r6
	ldr	r3, [fp, #-28]
	str	r2, [r3, #0]
	mov	r2, r7
	ldr	r3, [fp, #-32]
	str	r2, [r3, #0]
	sub	sp, fp, #20
	ldmfd	sp!, {r4, r5, r6, r7, fp, lr}
	bx	lr
.L8:
	.align	2
.L7:
	.word	z_table
	.word	.LC0
	.size	cordic_V_fixed_point, .-cordic_V_fixed_point
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
