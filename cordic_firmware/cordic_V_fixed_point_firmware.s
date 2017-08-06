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
	.file	"cordic_V_fixed_point_firmware.c"
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
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-20]
#APP
@ 8 "cordic_V_fixed_point_firmware.c" 1
	EXTRACT_Y	r3,r3
@ 0 "" 2
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L2
.L5:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	ble	.L3
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-12]
#APP
@ 15 "cordic_V_fixed_point_firmware.c" 1
	XADD_YSUB	r2,r3,r3
@ 0 "" 2
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
#APP
@ 16 "cordic_V_fixed_point_firmware.c" 1
	EXTRACT_Y	r3,r3
@ 0 "" 2
	str	r3, [fp, #-8]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-12]
#APP
@ 17 "cordic_V_fixed_point_firmware.c" 1
	Z_ADD	r2,r3,r3
@ 0 "" 2
	str	r3, [fp, #-16]
	b	.L4
.L3:
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-12]
#APP
@ 21 "cordic_V_fixed_point_firmware.c" 1
	XSUB_YADD	r2,r3,r3
@ 0 "" 2
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
#APP
@ 22 "cordic_V_fixed_point_firmware.c" 1
	EXTRACT_Y	r3,r3
@ 0 "" 2
	str	r3, [fp, #-8]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-12]
#APP
@ 23 "cordic_V_fixed_point_firmware.c" 1
	Z_SUB	r2,r3,r3
@ 0 "" 2
	str	r3, [fp, #-16]
.L4:
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L2:
	ldr	r3, [fp, #-12]
	cmp	r3, #14
	ble	.L5
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-24]
	str	r3, [r2, #0]
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	cordic_V_fixed_point, .-cordic_V_fixed_point
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
