	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"game.c"
	.text
	.align	2
	.global	initPlayer
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r2, #0
	mov	r4, #8
	mov	lr, #16
	mov	r0, #1
	mov	r1, #3
	mov	ip, #135
	ldr	r3, .L4
	str	r4, [r3, #16]
	str	lr, [r3, #20]
	str	ip, [r3]
	str	r2, [r3, #8]
	str	r2, [r3, #24]
	str	r2, [r3, #36]
	str	r2, [r3, #28]
	str	r2, [r3, #52]
	str	r0, [r3, #12]
	str	r0, [r3, #48]
	str	r1, [r3, #4]
	str	r1, [r3, #40]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	player
	.size	initPlayer, .-initPlayer
	.global	__aeabi_idivmod
	.align	2
	.global	animatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	animatePlayer, %function
animatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #2
	push	{r4, r5, r6, lr}
	ldr	r4, .L18
	ldr	r3, .L18+4
	ldr	r5, [r4, #24]
	smull	r0, r2, r3, r5
	asr	r3, r5, #31
	rsb	r3, r3, r2, asr #3
	ldr	r6, [r4, #28]
	add	r3, r3, r3, lsl r1
	cmp	r5, r3, lsl r1
	str	r6, [r4, #32]
	str	r1, [r4, #28]
	bne	.L7
	ldr	r0, [r4, #36]
	ldr	r3, .L18+8
	ldr	r1, [r4, #40]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #36]
.L7:
	ldr	r3, .L18+12
	ldrh	r2, [r3, #48]
	tst	r2, #32
	bne	.L8
	mov	r2, #1
	ldrh	r3, [r3, #48]
	tst	r3, #16
	str	r2, [r4, #28]
	bne	.L9
.L11:
	mov	r3, #0
	str	r3, [r4, #28]
.L9:
	add	r5, r5, #1
	str	r5, [r4, #24]
	pop	{r4, r5, r6, lr}
	bx	lr
.L8:
	ldrh	r3, [r3, #48]
	tst	r3, #16
	beq	.L11
	mov	r3, #0
	str	r6, [r4, #28]
	str	r3, [r4, #36]
	str	r3, [r4, #24]
	pop	{r4, r5, r6, lr}
	bx	lr
.L19:
	.align	2
.L18:
	.word	player
	.word	1717986919
	.word	__aeabi_idivmod
	.word	67109120
	.size	animatePlayer, .-animatePlayer
	.global	__aeabi_i2d
	.global	__aeabi_dmul
	.global	__aeabi_d2iz
	.global	__aeabi_dsub
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r4, .L103+8
	ldr	r3, [r4, #52]
	ldr	r2, .L103+12
	cmp	r3, #0
	sub	sp, sp, #36
	ldr	r3, [r2]
	beq	.L21
	cmp	r3, #9
	ble	.L22
.L24:
	mov	r3, #0
	str	r3, [r4, #52]
	str	r3, [r2]
.L23:
	ldr	r2, .L103+16
	ldr	r5, [r4]
	ldr	r3, [r2]
	ldr	r10, [r4, #20]
	add	r3, r3, #1
	add	r7, r5, r10
	ldr	fp, [r4, #56]
	str	r3, [r2]
	sub	r3, r7, #1
	str	r3, [sp, #4]
	ldr	r2, .L103+20
	mov	r0, fp
	mov	lr, pc
	bx	r2
	mov	r8, r0
	mov	r9, r1
	adr	r3, .L103
	ldmia	r3, {r2-r3}
	str	r8, [sp, #16]
	str	r9, [sp, #20]
	ldr	ip, .L103+24
	mov	lr, pc
	bx	ip
	ldr	r7, .L103+28
	mov	lr, pc
	bx	r7
	mov	r2, r0
	mov	r3, r1
	ldr	r9, .L103+32
	str	r2, [sp, #8]
	str	r3, [sp, #12]
	mov	lr, pc
	bx	r9
	ldr	r3, [sp, #4]
	ldr	r6, [r4, #4]
	sub	r3, r3, r0
	rsb	r3, r3, r3, lsl #4
	ldr	r8, .L103+36
	add	r2, r6, r3, lsl #4
	ldrb	r2, [r8, r2]	@ zero_extendqisi2
	cmp	r2, #0
	lsl	r3, r3, #4
	beq	.L25
	ldr	r1, [r4, #16]
	add	r2, r6, r1
	str	r1, [sp, #28]
	sub	r1, r2, #1
	add	r2, r3, r1
	ldrb	r2, [r8, r2]	@ zero_extendqisi2
	cmp	r2, #0
	str	r1, [sp, #24]
	bne	.L98
.L25:
	cmp	r5, #0
	ble	.L28
	ldr	r3, [r4, #8]
	sub	r3, r5, r3
	rsb	r3, r3, r3, lsl #4
	add	r2, r6, r3, lsl #4
	ldrb	r1, [r8, r2]	@ zero_extendqisi2
	cmp	r1, #0
	lsl	r3, r3, #4
	bne	.L99
.L28:
	mov	r3, #0
	ldr	fp, .L103+40
	str	r3, [fp]
.L27:
	cmp	r5, #0
	ble	.L31
	ldr	r3, [r4, #8]
	sub	r3, r5, r3
	rsb	r3, r3, r3, lsl #4
	add	r2, r6, r3, lsl #4
	ldrb	r2, [r8, r2]	@ zero_extendqisi2
	cmp	r2, #0
	lsl	r3, r3, #4
	bne	.L100
.L31:
	mov	r3, #0
	add	r5, r5, #1
	str	r5, [r4]
	str	r3, [r4, #56]
.L32:
	ldr	r3, .L103+44
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L33
	cmp	r6, #0
	ble	.L34
	ldr	r3, .L103+20
	ldr	r0, [r4, #56]
	mov	lr, pc
	bx	r3
	adr	r3, .L103
	ldmia	r3, {r2-r3}
	ldr	ip, .L103+24
	mov	lr, pc
	bx	ip
	mov	lr, pc
	bx	r7
	mov	lr, pc
	bx	r9
	ldr	r2, [r4]
	sub	r3, r2, r0
	rsb	r3, r3, r3, lsl #4
	sub	r1, r6, #1
	add	r3, r1, r3, lsl #4
	ldrb	r3, [r8, r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L101
.L34:
	mov	r3, #1
	str	r3, [r4, #28]
.L33:
	ldr	r3, .L103+44
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L35
	ldr	r6, [r4, #4]
	ldr	r5, [r4, #16]
	add	r5, r6, r5
	cmp	r5, #239
	ble	.L102
.L36:
	mov	r3, #0
	str	r3, [r4, #28]
.L35:
	ldr	r3, .L103+44
	ldrh	r3, [r3, #48]
	ands	r3, r3, #1
	bne	.L37
	ldr	r2, [fp]
	cmp	r2, #0
	beq	.L37
	ldr	r1, [r4]
	ldr	r2, [r4, #56]
	sub	r1, r1, #5
	add	r2, r2, #40
	str	r3, [r4, #60]
	str	r1, [r4]
	str	r2, [r4, #56]
.L38:
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	animatePlayer
.L37:
	ldr	r3, [r4, #60]
	cmp	r3, #5
	bgt	.L38
	ldr	r2, .L103+48
	ldrh	r2, [r2]
	tst	r2, #1
	beq	.L38
	ldr	r2, .L103+52
	ldrh	r2, [r2]
	tst	r2, #1
	bne	.L38
	ldr	r2, [fp]
	cmp	r2, #0
	bne	.L38
	ldr	r2, [r4, #56]
	cmp	r2, #0
	addgt	r2, r2, #10
	addgt	r3, r3, #1
	strgt	r2, [r4, #56]
	strgt	r3, [r4, #60]
	b	.L38
.L22:
	add	r3, r3, #1
	str	r3, [r2]
.L21:
	cmp	r3, #9
	ble	.L23
	b	.L24
.L99:
	ldr	r0, [r4, #16]
	ldr	r1, .L103+56
	add	ip, r6, r0
	add	ip, ip, r3
	ldrb	ip, [r1, ip]	@ zero_extendqisi2
	cmp	ip, #0
	beq	.L28
	add	r0, r0, r0, lsr #31
	add	r2, r2, r0, asr #1
	ldrb	r2, [r1, r2]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L28
	mov	r0, #0
	mov	r2, #1
	ldr	fp, .L103+40
	str	r0, [r4, #56]
	str	r2, [fp]
	b	.L30
.L102:
	ldr	r3, .L103+20
	ldr	r0, [r4, #56]
	mov	lr, pc
	bx	r3
	adr	r3, .L103
	ldmia	r3, {r2-r3}
	ldr	ip, .L103+24
	mov	lr, pc
	bx	ip
	mov	lr, pc
	bx	r7
	mov	lr, pc
	bx	r9
	ldr	r2, [r4]
	sub	r3, r2, r0
	rsb	r3, r3, r3, lsl #4
	add	r3, r5, r3, lsl #4
	ldrb	r3, [r8, r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L36
	add	r3, r10, r2
	sub	r3, r3, #2
	sub	r3, r3, r0
	rsb	r3, r3, r3, lsl #4
	add	r3, r5, r3, lsl #4
	ldrb	r3, [r8, r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L36
	add	r10, r10, r10, lsr #31
	add	r2, r2, r10, asr #1
	sub	r2, r2, #1
	sub	r0, r2, r0
	rsb	r0, r0, r0, lsl #4
	add	r5, r5, r0, lsl #4
	ldrb	r3, [r8, r5]	@ zero_extendqisi2
	cmp	r3, #0
	ldrne	r3, [r4, #12]
	addne	r6, r3, r6
	strne	r6, [r4, #4]
	b	.L36
.L104:
	.align	3
.L103:
	.word	2576980378
	.word	1069128089
	.word	player
	.word	invtimer
	.word	timer
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	round
	.word	__aeabi_d2iz
	.word	collisionmap1Bitmap
	.word	canJump
	.word	67109120
	.word	oldButtons
	.word	buttons
	.word	collisionmap1Bitmap-1
.L98:
	add	r2, r10, r10, lsr #31
	add	r2, r5, r2, asr #1
	sub	r2, r2, #1
	sub	r0, r2, r0
	rsb	r0, r0, r0, lsl #4
	add	r0, r1, r0, lsl #4
	ldrb	r2, [r8, r0]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L25
	cmn	fp, #49
	blt	.L26
	adr	r3, .L105
	ldmia	r3, {r2-r3}
	ldr	fp, .L105+16
	add	r1, sp, #16
	ldmia	r1, {r0-r1}
	mov	lr, pc
	bx	fp
	mov	lr, pc
	bx	r9
	ldr	r2, .L105+20
	str	r0, [r4, #56]
	mov	lr, pc
	bx	r2
	adr	r3, .L105+8
	ldmia	r3, {r2-r3}
	ldr	ip, .L105+24
	mov	lr, pc
	bx	ip
	mov	lr, pc
	bx	r7
	mov	r3, r1
	mov	r2, r0
	str	r2, [sp, #8]
	str	r3, [sp, #12]
	mov	lr, pc
	bx	r9
	mov	r2, #0
	ldr	r3, [sp, #4]
	sub	r3, r3, r0
	rsb	r3, r3, r3, lsl #4
	add	r1, r6, r3, lsl #4
	ldrb	r1, [r8, r1]	@ zero_extendqisi2
	ldr	fp, .L105+28
	cmp	r1, r2
	str	r2, [fp]
	lsl	r3, r3, #4
	beq	.L27
.L39:
	ldr	r2, [sp, #24]
	add	r2, r3, r2
	ldrb	r2, [r8, r2]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L27
	ldr	r2, [sp, #28]
	ldr	r1, .L105+32
	add	r2, r2, r2, lsr #31
	add	r3, r3, r6
	add	r3, r3, r2, asr #1
	ldrb	r3, [r1, r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L27
	mov	r0, r5
	ldr	r3, .L105+20
	mov	lr, pc
	bx	r3
	ldr	r5, .L105+16
	add	r3, sp, #8
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r5
	mov	lr, pc
	bx	r9
	mov	r5, r0
	str	r0, [r4]
	b	.L27
.L100:
	ldr	r1, .L105+32
.L30:
	ldr	r0, [r4, #16]
	add	r2, r6, r0
	add	r2, r2, r3
	ldrb	r2, [r1, r2]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L31
	add	r0, r0, r0, lsr #31
	add	r3, r6, r3
	add	r3, r3, r0, asr #1
	ldrb	r3, [r1, r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L32
	b	.L31
.L101:
	add	r3, r10, r2
	sub	r3, r3, #2
	sub	r3, r3, r0
	rsb	r3, r3, r3, lsl #4
	add	r3, r1, r3, lsl #4
	ldrb	r3, [r8, r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L34
	add	r3, r10, r10, lsr #31
	add	r2, r2, r3, asr #1
	sub	r2, r2, #1
	sub	r0, r2, r0
	rsb	r0, r0, r0, lsl #4
	add	r0, r1, r0, lsl #4
	ldrb	r3, [r8, r0]	@ zero_extendqisi2
	cmp	r3, #0
	ldrne	r3, [r4, #12]
	subne	r6, r6, r3
	strne	r6, [r4, #4]
	b	.L34
.L26:
	mov	r2, #0
	ldr	fp, .L105+28
	str	r2, [fp]
	b	.L39
.L106:
	.align	3
.L105:
	.word	2576980378
	.word	1074370969
	.word	2576980378
	.word	1069128089
	.word	__aeabi_dsub
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	canJump
	.word	collisionmap1Bitmap-1
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L108
	ldr	r2, [r1, #4]
	ldr	ip, [r1, #36]
	ldr	r3, [r1, #28]
	ldrb	r0, [r1]	@ zero_extendqisi2
	lsl	r2, r2, #23
	ldr	r1, .L108+4
	add	r3, r3, ip, lsl #5
	lsr	r2, r2, #23
	orr	r0, r0, #40960
	lsl	r3, r3, #1
	strh	r2, [r1, #2]	@ movhi
	strh	r0, [r1]	@ movhi
	strh	r3, [r1, #4]	@ movhi
	bx	lr
.L109:
	.align	2
.L108:
	.word	player
	.word	shadowOAM
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	initFlower
	.syntax unified
	.arm
	.fpu softvfp
	.type	initFlower, %function
initFlower:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	mov	r1, #16
	mov	ip, #55
	mov	r0, #1
	ldr	r3, .L111
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r1, [r3, #4]
	str	ip, [r3]
	str	r0, [r3, #48]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r2, [r3, #24]
	str	r2, [r3, #36]
	str	r2, [r3, #40]
	str	r2, [r3, #28]
	bx	lr
.L112:
	.align	2
.L111:
	.word	flower
	.size	initFlower, .-initFlower
	.align	2
	.global	updateFlower
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateFlower, %function
updateFlower:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L119
	add	r1, r3, #16
	ldm	r1, {r1, ip}
	ldm	r3, {r2, r3}
	sub	sp, sp, #16
	ldr	r0, .L119+4
	str	r2, [sp, #4]
	str	ip, [sp, #12]
	str	r1, [sp, #8]
	str	r3, [sp]
	add	r2, r0, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r0]
	ldr	r4, .L119+8
	ldr	r0, [r0, #4]
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	movne	r2, #1
	ldrne	r3, .L119+12
	strne	r2, [r3]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L120:
	.align	2
.L119:
	.word	flower
	.word	player
	.word	collision
	.word	winner
	.size	updateFlower, .-updateFlower
	.align	2
	.global	drawFlower
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFlower, %function
drawFlower:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #8
	ldr	r2, .L122
	ldr	r3, [r2, #4]
	ldrb	r1, [r2]	@ zero_extendqisi2
	lsl	r3, r3, #23
	ldr	r2, .L122+4
	lsr	r3, r3, #23
	orr	r3, r3, #16384
	orr	r1, r1, #8192
	strh	r3, [r2, #10]	@ movhi
	strh	r1, [r2, #8]	@ movhi
	strh	r0, [r2, #12]	@ movhi
	bx	lr
.L123:
	.align	2
.L122:
	.word	flower
	.word	shadowOAM
	.size	drawFlower, .-drawFlower
	.align	2
	.global	initMonkey
	.syntax unified
	.arm
	.fpu softvfp
	.type	initMonkey, %function
initMonkey:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r6, .L141
	mov	r5, #0
	mov	r4, r6
	mov	fp, #16
	ldr	r7, .L141+4
	ldr	r9, .L141+8
	ldr	r8, .L141+12
.L132:
	mov	r10, #0
	cmp	r5, #1
	str	fp, [r4, #16]
	str	fp, [r4, #20]
	str	r10, [r4, #8]
	str	r10, [r4, #12]
	ble	.L137
	cmp	r5, #2
	beq	.L138
	cmp	r5, #3
	beq	.L139
	cmp	r5, #4
	beq	.L140
.L128:
	mov	r3, #0
	mov	r1, #3
	add	r5, r5, #1
	cmp	r5, #5
	str	r3, [r4, #24]
	str	r3, [r4, #36]
	str	r3, [r4, #28]
	str	r3, [r4, #48]
	str	r1, [r4, #40]
	add	r4, r4, #64
	bne	.L132
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L137:
	mov	lr, pc
	bx	r7
	smull	r3, r1, r8, r0
	asr	r3, r0, #31
	rsb	r3, r3, r1, asr #4
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, lsl #1
	add	r3, r3, #100
	str	r3, [r4]
	mov	lr, pc
	bx	r7
	smull	r3, r1, r9, r0
	asr	r3, r0, #31
	add	r1, r1, r0
	rsb	r3, r3, r1, asr #6
	add	r3, r3, r3, lsl #1
	rsb	r3, r3, r3, lsl #4
	sub	r3, r0, r3, lsl #1
	add	r3, r3, #30
	str	r3, [r4, #4]
	b	.L128
.L138:
	mov	lr, pc
	bx	r7
	smull	r3, r1, r8, r0
	asr	r3, r0, #31
	rsb	r3, r3, r1, asr #4
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, lsl #1
	add	r3, r3, #100
	str	r3, [r6, #128]
	mov	lr, pc
	bx	r7
	ldr	r1, .L141+16
	smull	r3, r1, r0, r1
	asr	r3, r0, #31
	rsb	r3, r3, r1, asr #2
	rsb	r1, r3, r3, lsl #3
	rsb	r3, r3, r1, lsl #3
	sub	r0, r0, r3, lsl #1
	add	r0, r0, #120
	str	r0, [r6, #132]
	b	.L128
.L140:
	ldr	r4, .L141+4
	mov	lr, pc
	bx	r4
	ldr	r1, .L141+20
	smull	r3, r1, r0, r1
	asr	r2, r0, #31
	add	r1, r1, r0
	rsb	r2, r2, r1, asr #6
	add	r2, r2, r2, lsl #2
	rsb	r2, r2, r2, lsl #3
	sub	r0, r0, r2, lsl #1
	add	r0, r0, #10
	str	r0, [r6, #256]
	mov	lr, pc
	bx	r4
	mov	ip, #3
	ldr	r2, .L141+16
	smull	r3, r1, r2, r0
	asr	r2, r0, #31
	rsb	r2, r2, r1, asr #2
	rsb	r1, r2, r2, lsl ip
	rsb	r2, r2, r1, lsl ip
	sub	r0, r0, r2, lsl #1
	add	r0, r0, #120
	str	r10, [r6, #280]
	str	r10, [r6, #292]
	str	r10, [r6, #284]
	str	r10, [r6, #304]
	str	r0, [r6, #260]
	str	ip, [r6, #296]
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L139:
	mov	lr, pc
	bx	r7
	ldr	ip, .L141+20
	smull	r3, ip, r0, ip
	asr	r1, r0, #31
	add	ip, ip, r0
	rsb	r1, r1, ip, asr #6
	add	r1, r1, r1, lsl #2
	rsb	r1, r1, r1, lsl #3
	sub	r1, r0, r1, lsl #1
	add	r1, r1, #10
	str	r1, [r6, #192]
	mov	lr, pc
	bx	r7
	smull	r3, ip, r9, r0
	asr	r1, r0, #31
	add	ip, ip, r0
	rsb	r1, r1, ip, asr #6
	add	r1, r1, r1, lsl #1
	rsb	r1, r1, r1, lsl #4
	sub	r1, r0, r1, lsl #1
	add	r1, r1, #30
	str	r1, [r6, #196]
	add	r4, r4, #64
	str	r5, [r4, #-24]
	str	r10, [r4, #-40]
	str	r10, [r4, #-28]
	str	r10, [r4, #-36]
	str	r10, [r4, #-16]
	mov	r5, #4
	b	.L132
.L142:
	.align	2
.L141:
	.word	monkey
	.word	rand
	.word	-1240768329
	.word	1374389535
	.word	156180629
	.word	-368140053
	.size	initMonkey, .-initMonkey
	.align	2
	.global	animateMonkey
	.syntax unified
	.arm
	.fpu softvfp
	.type	animateMonkey, %function
animateMonkey:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r5, .L148
	ldr	r8, .L148+4
	ldr	r6, .L148+8
	add	r7, r5, #320
.L145:
	ldr	r4, [r5, #24]
	smull	r3, r2, r8, r4
	asr	r3, r4, #31
	rsb	r3, r3, r2, asr #3
	add	r3, r3, r3, lsl #2
	cmp	r4, r3, lsl #2
	bne	.L144
	add	r0, r5, #36
	ldm	r0, {r0, r1}
	add	r0, r0, #1
	mov	lr, pc
	bx	r6
	str	r1, [r5, #36]
.L144:
	add	r4, r4, #1
	str	r4, [r5, #24]
	add	r5, r5, #64
	cmp	r5, r7
	bne	.L145
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L149:
	.align	2
.L148:
	.word	monkey
	.word	1717986919
	.word	__aeabi_idivmod
	.size	animateMonkey, .-animateMonkey
	.align	2
	.global	drawMonkey
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawMonkey, %function
drawMonkey:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L154
	push	{r4, lr}
	ldr	r0, .L154+4
	ldr	r4, .L154+8
	add	lr, r3, #40
.L151:
	ldr	r1, [r0, #4]
	ldr	r2, [r0, #36]
	ldrb	ip, [r0]	@ zero_extendqisi2
	and	r1, r1, r4
	lsl	r2, r2, #6
	orr	r1, r1, #16384
	add	r2, r2, #4
	orr	ip, ip, #8192
	strh	r1, [r3, #18]	@ movhi
	strh	r2, [r3, #20]	@ movhi
	strh	ip, [r3, #16]	@ movhi
	add	r3, r3, #8
	cmp	lr, r3
	add	r0, r0, #64
	bne	.L151
	pop	{r4, lr}
	bx	lr
.L155:
	.align	2
.L154:
	.word	shadowOAM
	.word	monkey
	.word	511
	.size	drawMonkey, .-drawMonkey
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #7296
	push	{r4, r5, r6, r7, r8, lr}
	mov	r3, #256
	strh	r1, [r2, #8]	@ movhi
	ldr	r4, .L161
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L161+4
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L161+8
	ldr	r1, .L161+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L161+16
	ldr	r1, .L161+20
	mov	lr, pc
	bx	r4
	mov	lr, #8
	ldr	r1, .L161+24
	ldr	r0, .L161+28
	ldr	ip, [r1, #36]
	ldr	r2, [r1, #28]
	ldr	r5, .L161+32
	ldr	r3, [r0, #4]
	ldrb	r7, [r1]	@ zero_extendqisi2
	ldrb	r0, [r0]	@ zero_extendqisi2
	add	r2, r2, ip, lsl #5
	ldr	ip, [r1, #4]
	ldr	r6, .L161+36
	and	r3, r3, r5
	and	ip, ip, r5
	lsl	r2, r2, #1
	orr	r3, r3, #16384
	orr	r1, r0, #8192
	orr	r7, r7, #40960
	strh	r2, [r6, #4]	@ movhi
	strh	ip, [r6, #2]	@ movhi
	strh	r3, [r6, #10]	@ movhi
	strh	lr, [r6, #12]	@ movhi
	strh	r7, [r6]	@ movhi
	strh	r1, [r6, #8]	@ movhi
	bl	drawMonkey
	mov	ip, r5
	mov	r3, r6
	mov	r5, #192
	ldr	r2, .L161+40
	add	lr, r6, #40
.L157:
	ldrb	r0, [r2]	@ zero_extendqisi2
	ldr	r1, [r2, #4]
	orr	r0, r0, #8192
	and	r1, r1, ip
	strh	r5, [r3, #60]	@ movhi
	strh	r0, [r3, #56]	@ movhi
	strh	r1, [r3, #58]	@ movhi
	add	r3, r3, #8
	cmp	lr, r3
	add	r2, r2, #64
	bne	.L157
	ldr	r3, .L161+44
	ldr	r1, .L161+48
	ldr	r3, [r3]
	ldr	r2, .L161+52
	mla	r3, r1, r3, r2
	ldr	r2, .L161+56
	ldr	r1, .L161+60
	cmp	r3, r1
	ldr	r3, [r2]
	addls	r3, r3, #1
	strls	r3, [r2]
	ldr	r0, .L161+64
	ldr	r1, .L161+68
	lsl	r3, r3, #5
	add	r3, r3, #12
	strh	r3, [r6, #100]	@ movhi
	strh	r0, [r6, #96]	@ movhi
	strh	r1, [r6, #98]	@ movhi
	ldr	r2, .L161+72
	mov	lr, pc
	bx	r2
	mov	r3, #256
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L161+36
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L162:
	.align	2
.L161:
	.word	DMANow
	.word	gamescreen1Pal
	.word	18560
	.word	gamescreen1Tiles
	.word	100720640
	.word	gamescreen1Map
	.word	player
	.word	flower
	.word	511
	.word	shadowOAM
	.word	bullets
	.word	timer
	.word	652835029
	.word	17179869
	.word	clockState
	.word	34359738
	.word	8195
	.word	16387
	.word	waitForVBlank
	.size	drawGame, .-drawGame
	.align	2
	.global	initBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBullets, %function
initBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r2, #0
	mov	lr, #8
	mov	r5, #1
	ldr	r3, .L167
	ldr	r1, .L167+4
	add	r4, r3, #320
.L164:
	ldr	ip, [r1]
	ldr	r0, [r1, #4]
	add	ip, ip, #4
	add	r0, r0, #16
	str	lr, [r3, #16]
	str	lr, [r3, #20]
	str	r2, [r3, #8]
	str	r5, [r3, #12]
	str	r2, [r3, #24]
	str	r2, [r3, #36]
	str	r2, [r3, #40]
	str	r2, [r3, #28]
	str	r2, [r3, #48]
	str	ip, [r3]
	str	r0, [r3, #4]
	add	r3, r3, #64
	cmp	r3, r4
	add	r1, r1, #64
	bne	.L164
	pop	{r4, r5, lr}
	bx	lr
.L168:
	.align	2
.L167:
	.word	bullets
	.word	monkey
	.size	initBullets, .-initBullets
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r3, #256
	ldr	r4, .L171
	mov	r0, #3
	ldr	r2, .L171+4
	ldr	r1, .L171+8
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L171+12
	ldr	r1, .L171+16
	mov	lr, pc
	bx	r4
	mov	r0, #1
	mov	r1, #135
	mov	r3, #0
	mov	ip, #16
	mov	r4, #55
	mov	lr, #3
	mov	r5, #8
	ldr	r2, .L171+20
	str	r0, [r2]
	ldr	r2, .L171+24
	str	r0, [r2]
	ldr	r2, .L171+28
	str	r1, [r2]
	ldr	r1, .L171+32
	str	r0, [r2, #12]
	str	r4, [r1]
	str	r0, [r1, #48]
	str	ip, [r1, #16]
	str	ip, [r1, #20]
	str	ip, [r1, #4]
	str	r0, [r2, #48]
	str	r3, [r1, #8]
	ldr	r0, .L171+36
	str	r3, [r1, #12]
	str	r3, [r1, #24]
	str	r3, [r1, #36]
	str	r3, [r1, #40]
	str	r3, [r1, #28]
	ldr	r1, .L171+40
	str	r3, [r0]
	str	r3, [r1]
	str	ip, [r2, #20]
	ldr	r4, .L171+44
	ldr	ip, .L171+48
	ldr	r0, .L171+52
	ldr	r1, .L171+56
	str	r5, [r2, #16]
	str	r3, [r4]
	str	lr, [r2, #4]
	str	lr, [r2, #40]
	str	r3, [r2, #8]
	str	r3, [r2, #24]
	str	r3, [r2, #36]
	str	r3, [r2, #28]
	str	r3, [r2, #52]
	str	r3, [ip]
	str	r3, [r0]
	str	r3, [r1]
	bl	initMonkey
	pop	{r4, r5, r6, lr}
	b	initBullets
.L172:
	.align	2
.L171:
	.word	DMANow
	.word	83886592
	.word	playerspritesheetPal
	.word	100728832
	.word	playerspritesheetTiles
	.word	grav
	.word	canJump
	.word	player
	.word	flower
	.word	winner
	.word	jumptimer
	.word	timer
	.word	invtimer
	.word	cheatOn
	.word	clockState
	.size	initGame, .-initGame
	.align	2
	.global	updateBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBullets, %function
updateBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r5, #0
	ldr	r4, .L188
	ldr	r8, .L188+4
	ldr	r7, .L188+8
	ldr	r6, .L188+12
	ldr	r9, .L188+16
	ldr	r10, .L188+20
	ldr	fp, .L188+24
	sub	sp, sp, #20
.L181:
	ldr	r2, [r8]
	smull	r3, r1, r7, r2
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #4
	add	r3, r3, r3, lsl #2
	sub	r3, r2, r3, lsl #3
	cmp	r3, #5
	movle	r2, #0
	movgt	r2, #1
	cmp	r3, #4
	ble	.L174
	mov	r2, #1
	cmp	r3, #5
	str	r2, [r4, #48]
	ble	.L175
.L176:
	ldr	r3, [r4, #4]
	ldr	r2, [r4, #12]
	add	r3, r3, r2
	str	r3, [r4, #4]
.L175:
	ldr	r3, [r6, #52]
	cmp	r3, #0
	beq	.L187
.L178:
	add	r5, r5, #1
	cmp	r5, #5
	add	r4, r4, #64
	bne	.L181
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L174:
	ldr	r1, [r4, #48]
	cmp	r1, #0
	moveq	r2, #0
	cmp	r2, #0
	bne	.L176
	cmp	r3, #0
	bne	.L177
	ldr	r2, .L188+28
	ldr	r2, [r2, r5, lsl #6]
	add	r2, r2, #16
	str	r3, [r4, #48]
	str	r2, [r4, #4]
	b	.L178
.L187:
	ldm	r4, {r2, r3}
	ldr	r0, [r4, #20]
	ldr	r1, [r4, #16]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r6, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r6]
	ldr	r0, [r6, #4]
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	beq	.L178
	ldr	r2, [r10]
	cmp	r2, #0
	bne	.L178
	ldr	r3, .L188+32
	mov	r0, fp
	ldr	r1, [r3]
	ldr	r3, .L188+36
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, [r6, #28]
	cmp	r3, #0
	str	r2, [r6, #52]
	ldreq	r3, [r6, #4]
	subeq	r3, r3, #5
	streq	r3, [r6, #4]
	beq	.L178
.L180:
	cmp	r3, #1
	ldreq	r3, [r6, #4]
	addeq	r3, r3, #5
	streq	r3, [r6, #4]
	b	.L178
.L177:
	cmp	r1, #0
	bne	.L175
	b	.L178
.L189:
	.align	2
.L188:
	.word	bullets
	.word	timer
	.word	1717986919
	.word	player
	.word	collision
	.word	cheatOn
	.word	hitSound_data
	.word	monkey+4
	.word	hitSound_length
	.word	playSoundA
	.size	updateBullets, .-updateBullets
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	bl	updatePlayer
	bl	updateFlower
	bl	updateBullets
	ldr	r5, .L195
	ldr	r8, .L195+4
	ldr	r6, .L195+8
	add	r7, r5, #320
.L192:
	ldr	r4, [r5, #24]
	smull	r3, r2, r8, r4
	asr	r3, r4, #31
	rsb	r3, r3, r2, asr #3
	add	r3, r3, r3, lsl #2
	cmp	r4, r3, lsl #2
	bne	.L191
	add	r0, r5, #36
	ldm	r0, {r0, r1}
	add	r0, r0, #1
	mov	lr, pc
	bx	r6
	str	r1, [r5, #36]
.L191:
	add	r4, r4, #1
	str	r4, [r5, #24]
	add	r5, r5, #64
	cmp	r5, r7
	bne	.L192
	pop	{r4, r5, r6, r7, r8, lr}
	b	drawGame
.L196:
	.align	2
.L195:
	.word	monkey
	.word	1717986919
	.word	__aeabi_idivmod
	.size	updateGame, .-updateGame
	.align	2
	.global	drawBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBullets, %function
drawBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, #192
	ldr	r3, .L201
	ldr	r2, .L201+4
	ldr	lr, .L201+8
	add	ip, r3, #40
.L198:
	ldrb	r0, [r2]	@ zero_extendqisi2
	ldr	r1, [r2, #4]
	orr	r0, r0, #8192
	and	r1, r1, lr
	strh	r4, [r3, #60]	@ movhi
	strh	r0, [r3, #56]	@ movhi
	strh	r1, [r3, #58]	@ movhi
	add	r3, r3, #8
	cmp	r3, ip
	add	r2, r2, #64
	bne	.L198
	pop	{r4, lr}
	bx	lr
.L202:
	.align	2
.L201:
	.word	shadowOAM
	.word	bullets
	.word	511
	.size	drawBullets, .-drawBullets
	.align	2
	.global	drawClock
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawClock, %function
drawClock:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L205
	ldr	r1, .L205+4
	ldr	r2, .L205+8
	ldr	r3, [r3]
	mla	r3, r1, r3, r2
	ldr	r2, .L205+12
	ldr	r1, .L205+16
	cmp	r3, r1
	ldr	r3, [r2]
	addls	r3, r3, #1
	strls	r3, [r2]
	ldr	r0, .L205+20
	ldr	r2, .L205+24
	ldr	r1, .L205+28
	lsl	r3, r3, #5
	add	r3, r3, #12
	strh	r3, [r2, #100]	@ movhi
	strh	r0, [r2, #96]	@ movhi
	strh	r1, [r2, #98]	@ movhi
	bx	lr
.L206:
	.align	2
.L205:
	.word	timer
	.word	652835029
	.word	17179869
	.word	clockState
	.word	34359738
	.word	8195
	.word	shadowOAM
	.word	16387
	.size	drawClock, .-drawClock
	.comm	clockState,4,4
	.comm	tempnum,4,4
	.comm	cheatOn,4,4
	.comm	canJump,4,4
	.comm	invtimer,4,4
	.comm	grav,4,4
	.comm	jumptimer,4,4
	.comm	winner,4,4
	.comm	timer,4,4
	.comm	flower,64,4
	.comm	bullets,320,4
	.comm	monkey,320,4
	.comm	player,64,4
	.comm	shadowOAM,1024,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
