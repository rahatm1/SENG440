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
	.file	"cordic_V_fixed_point_hardware.c"
	.text
	.align	2
	.global	cordic_V_fixed_point
	.type	cordic_V_fixed_point, %function
cordic_V_fixed_point:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #36
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	str	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-28]
	mov	r2, #0
	str	r2, [fp, #-24]
	b	.L2
.L3:
	ldr	r3, [fp, #-32]
	ldr	r2, [fp, #-28]
#APP
@ 13 "cordic_V_fixed_point_hardware.c" 1
	CORDIC_SINGLE_V r3, r3, r2
@ 0 "" 2
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L2:
	ldr	r2, [fp, #-24]
	cmp	r2, #14
	ble	.L3
	ldr	r3, [fp, #-20]
	mov	r2, r3, asr #16
	ldr	r3, [fp, #-8]
	str	r2, [r3, #0]
	ldr	r2, [fp, #-20]
	mov	r3, r2, asl #16
	mov	r2, r3, asr #16
	ldr	r3, [fp, #-16]
	str	r2, [r3, #0]
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	cordic_V_fixed_point, .-cordic_V_fixed_point
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
