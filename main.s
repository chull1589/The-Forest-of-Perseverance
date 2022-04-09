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
	.file	"main.c"
	.text
	.align	2
	.global	goToStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #7296
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L4
	strh	r1, [r2, #8]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L4+4
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L4+8
	ldr	r1, .L4+12
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L4+16
	ldr	r1, .L4+20
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+28
	mov	lr, pc
	bx	r3
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L4+32
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+40
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L4+44
	ldr	r3, .L4+48
	mov	lr, pc
	bx	r3
	mov	r3, #0
	ldr	r1, .L4+52
	ldr	r2, .L4+56
	str	r3, [r1]
	str	r3, [r2]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	startPal
	.word	19232
	.word	startTiles
	.word	100720640
	.word	startMap
	.word	hideSprites
	.word	waitForVBlank
	.word	shadowOAM
	.word	stopSound
	.word	startSong_length
	.word	startSong_data
	.word	playSoundA
	.word	seed
	.word	state
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #4864
	push	{r4, lr}
	ldr	r3, .L8
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+4
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToStart
.L9:
	.align	2
.L8:
	.word	setupSounds
	.word	setupInterrupts
	.size	initialize, .-initialize
	.align	2
	.global	goToInstructions1
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstructions1, %function
goToInstructions1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #7296
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L12
	strh	r1, [r2, #8]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L12+4
	mov	lr, pc
	bx	r4
	mov	r3, #14080
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L12+8
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L12+12
	ldr	r1, .L12+16
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L12+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L12+24
	mov	lr, pc
	bx	r3
	mov	r3, #256
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L12+28
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L12+32
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L13:
	.align	2
.L12:
	.word	DMANow
	.word	instructions1Pal
	.word	instructions1Tiles
	.word	100720640
	.word	instructions1Map
	.word	hideSprites
	.word	waitForVBlank
	.word	shadowOAM
	.word	state
	.size	goToInstructions1, .-goToInstructions1
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L26
	mov	lr, pc
	bx	r3
	ldr	r4, .L26+4
	ldr	r2, .L26+8
	ldrh	r3, [r4]
	ldr	r0, [r2]
	tst	r3, #8
	add	r0, r0, #1
	str	r0, [r2]
	beq	.L15
	ldr	r2, .L26+12
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L24
.L15:
	tst	r3, #1
	beq	.L14
	ldr	r3, .L26+12
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L25
.L14:
	pop	{r4, lr}
	bx	lr
.L25:
	pop	{r4, lr}
	b	goToInstructions1
.L24:
	ldr	r3, .L26+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L26+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L26+24
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L26+28
	ldr	r3, .L26+32
	mov	lr, pc
	bx	r3
	mov	r1, #3
	ldr	r2, .L26+36
	ldr	r3, .L26+40
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L15
.L27:
	.align	2
.L26:
	.word	waitForVBlank
	.word	oldButtons
	.word	seed
	.word	buttons
	.word	srand
	.word	stopSound
	.word	MokokoVillage_length
	.word	MokokoVillage_data
	.word	playSoundB
	.word	state
	.word	initGame
	.size	start, .-start
	.align	2
	.global	goToInstructions2
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstructions2, %function
goToInstructions2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #7296
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L30
	strh	r1, [r2, #8]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L30+4
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L30+8
	ldr	r1, .L30+12
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L30+16
	ldr	r1, .L30+20
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L30+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L30+28
	mov	lr, pc
	bx	r3
	mov	r3, #256
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L30+32
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L30+36
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L31:
	.align	2
.L30:
	.word	DMANow
	.word	instructions2Pal
	.word	8864
	.word	instructions2Tiles
	.word	100720640
	.word	instructions2Map
	.word	hideSprites
	.word	waitForVBlank
	.word	shadowOAM
	.word	state
	.size	goToInstructions2, .-goToInstructions2
	.align	2
	.global	instructions1
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructions1, %function
instructions1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L37
	ldrh	r3, [r3]
	tst	r3, #1
	bxeq	lr
	ldr	r3, .L37+4
	ldrh	r3, [r3]
	tst	r3, #1
	bxne	lr
	b	goToInstructions2
.L38:
	.align	2
.L37:
	.word	oldButtons
	.word	buttons
	.size	instructions1, .-instructions1
	.align	2
	.global	instructions2
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructions2, %function
instructions2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L44
	ldrh	r3, [r3]
	tst	r3, #1
	bxeq	lr
	ldr	r3, .L44+4
	ldrh	r3, [r3]
	tst	r3, #1
	bxne	lr
	b	goToStart
.L45:
	.align	2
.L44:
	.word	oldButtons
	.word	buttons
	.size	instructions2, .-instructions2
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #3
	ldr	r3, .L47
	str	r2, [r3]
	bx	lr
.L48:
	.align	2
.L47:
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r5, #67108864
	ldr	r2, .L51
	ldr	r4, .L51+4
	strh	r2, [r5, #10]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L51+8
	mov	lr, pc
	bx	r4
	mov	r3, #2496
	mov	r0, #3
	ldr	r2, .L51+12
	ldr	r1, .L51+16
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L51+20
	ldr	r1, .L51+24
	mov	lr, pc
	bx	r4
	mov	r2, #7296
	mov	r3, #256
	strh	r2, [r5, #8]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L51+28
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L51+32
	ldr	r1, .L51+36
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L51+40
	ldr	r1, .L51+44
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L51+48
	mov	lr, pc
	bx	r3
	ldr	r3, .L51+52
	mov	lr, pc
	bx	r3
	mov	r3, #256
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L51+56
	mov	lr, pc
	bx	r4
	mov	r0, #1
	mov	r2, #4
	ldr	r1, .L51+60
	ldr	r3, .L51+64
	str	r0, [r1]
	str	r2, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L52:
	.align	2
.L51:
	.word	23940
	.word	DMANow
	.word	pausebackgroundPal
	.word	100679680
	.word	pausebackgroundTiles
	.word	100722688
	.word	pausebackgroundMap
	.word	pause1Pal
	.word	7584
	.word	pause1Tiles
	.word	100720640
	.word	pause1Map
	.word	hideSprites
	.word	waitForVBlank
	.word	shadowOAM
	.word	option
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r3, .L106
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	ldr	r4, .L106+4
	ldr	r2, .L106+8
	ldrh	r1, [r4]
	ldrh	r2, [r2]
	strh	r1, [r3, #20]	@ movhi
	ldr	r6, .L106+12
	strh	r2, [r3, #22]	@ movhi
	ldrh	r3, [r6]
	tst	r3, #64
	beq	.L102
	ldr	r2, .L106+16
	ldrh	r2, [r2]
	tst	r2, #64
	beq	.L97
.L102:
	ldr	r5, .L106+20
.L54:
	tst	r3, #128
	beq	.L103
	ldr	r8, .L106+16
	ldrh	r2, [r8]
	ands	r7, r2, #128
	beq	.L57
.L103:
	tst	r3, #2
	ldr	r2, [r5]
	beq	.L60
	ldr	r1, .L106+16
	ldrh	r1, [r1]
	tst	r1, #2
	bne	.L60
.L69:
	mov	r0, #1
	ldr	r1, .L106+24
	str	r0, [r1]
.L60:
	cmp	r2, #0
	and	r2, r3, #8
	beq	.L61
	cmp	r2, #0
	beq	.L62
	ldr	r2, .L106+16
	ldrh	r2, [r2]
	tst	r2, #8
	bne	.L62
.L63:
	ldr	r3, .L106+28
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r1, [r5]
	ldr	r3, .L106+32
	cmp	r1, #0
	str	r2, [r3]
	beq	.L105
.L65:
	ldr	r3, [r4]
	add	r3, r3, #1
	str	r3, [r4]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L105:
	ldrh	r3, [r6]
.L104:
	and	r2, r3, #8
.L61:
	cmp	r2, #0
	beq	.L67
	ldr	r2, .L106+16
	ldrh	r2, [r2]
	tst	r2, #8
	bne	.L67
.L68:
	bl	goToStart
	b	.L65
.L67:
	tst	r3, #1
	beq	.L65
	ldr	r3, .L106+16
	ldrh	r3, [r3]
	tst	r3, #1
	bne	.L65
	b	.L68
.L62:
	tst	r3, #1
	beq	.L65
	ldr	r3, .L106+16
	ldrh	r3, [r3]
	tst	r3, #1
	bne	.L65
	b	.L63
.L97:
	ldr	r5, .L106+36
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L106+40
	mov	lr, pc
	bx	r5
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L106+44
	ldr	r1, .L106+48
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	ldr	r2, .L106+52
	mov	r0, #3
	ldr	r1, .L106+56
	mov	lr, pc
	bx	r5
	mov	r2, #1
	ldr	r5, .L106+20
	ldrh	r3, [r6]
	str	r2, [r5]
	b	.L54
.L57:
	ldr	r9, .L106+36
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L106+60
	mov	lr, pc
	bx	r9
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L106+44
	ldr	r1, .L106+64
	mov	lr, pc
	bx	r9
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L106+52
	ldr	r1, .L106+68
	mov	lr, pc
	bx	r9
	ldrh	r3, [r6]
	tst	r3, #2
	str	r7, [r5]
	beq	.L104
	ldrh	r2, [r8]
	ands	r2, r2, #2
	beq	.L69
	b	.L104
.L107:
	.align	2
.L106:
	.word	waitForVBlank
	.word	hOff
	.word	vOff
	.word	oldButtons
	.word	buttons
	.word	option
	.word	cheatOn
	.word	unpauseSound
	.word	state
	.word	DMANow
	.word	pause1Pal
	.word	7584
	.word	pause1Tiles
	.word	100720640
	.word	pause1Map
	.word	pause2Pal
	.word	pause2Tiles
	.word	pause2Map
	.size	pause, .-pause
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #7296
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L110
	strh	r1, [r2, #8]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L110+4
	mov	lr, pc
	bx	r4
	mov	r3, #8000
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L110+8
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L110+12
	ldr	r1, .L110+16
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L110+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L110+24
	mov	lr, pc
	bx	r3
	mov	r3, #256
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L110+28
	mov	lr, pc
	bx	r4
	mov	r2, #5
	ldr	r3, .L110+32
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L111:
	.align	2
.L110:
	.word	DMANow
	.word	losePal
	.word	loseTiles
	.word	100720640
	.word	loseMap
	.word	hideSprites
	.word	waitForVBlank
	.word	shadowOAM
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L119
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L119+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L112
	ldr	r3, .L119+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L118
.L112:
	pop	{r4, lr}
	bx	lr
.L118:
	pop	{r4, lr}
	b	goToStart
.L120:
	.align	2
.L119:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	lose, .-lose
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #7296
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L123
	strh	r1, [r2, #8]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L123+4
	mov	lr, pc
	bx	r4
	mov	r3, #8064
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L123+8
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L123+12
	ldr	r1, .L123+16
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L123+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L123+24
	mov	lr, pc
	bx	r3
	mov	r3, #256
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L123+28
	mov	lr, pc
	bx	r4
	mov	r2, #6
	ldr	r3, .L123+32
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L124:
	.align	2
.L123:
	.word	DMANow
	.word	winPal
	.word	winTiles
	.word	100720640
	.word	winMap
	.word	hideSprites
	.word	waitForVBlank
	.word	shadowOAM
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L136
	mov	lr, pc
	bx	r3
	ldr	r3, .L136+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L136+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L126
	ldr	r3, .L136+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L133
.L126:
	ldr	r3, .L136+16
	ldr	r3, [r3]
	cmp	r3, #1000
	bgt	.L134
	ldr	r3, .L136+20
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L135
	pop	{r4, lr}
	bx	lr
.L134:
	ldr	r3, .L136+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L136+28
	mov	r2, #0
	ldr	r1, [r3]
	ldr	r0, .L136+32
	ldr	r3, .L136+36
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToLose
.L135:
	ldr	r3, .L136+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L136+40
	mov	r2, #0
	ldr	r1, [r3]
	ldr	r0, .L136+44
	ldr	r3, .L136+36
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToWin
.L133:
	ldr	r3, .L136+48
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToPause
.L137:
	.align	2
.L136:
	.word	updateGame
	.word	drawGame
	.word	oldButtons
	.word	buttons
	.word	timer
	.word	winner
	.word	stopSound
	.word	loseSound_length
	.word	loseSound_data
	.word	playSoundA
	.word	winSound_length
	.word	winSound_data
	.word	pauseSound
	.size	game, .-game
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #4864
	push	{r4, r7, fp, lr}
	ldr	r3, .L156
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r6, .L156+4
	ldr	r3, .L156+8
	ldr	fp, .L156+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L156+16
	mov	lr, pc
	bx	r3
	ldr	r5, .L156+20
	ldr	r10, .L156+24
	ldr	r2, [r6]
	ldrh	r0, [fp]
	ldr	r9, .L156+28
	ldr	r8, .L156+32
	ldr	r7, .L156+36
	ldr	r4, .L156+40
.L140:
	strh	r0, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #6
	ldrls	pc, [pc, r2, asl #2]
	b	.L149
.L142:
	.word	.L147
	.word	.L146
	.word	.L145
	.word	.L144
	.word	.L143
	.word	.L141
	.word	.L141
.L141:
	mov	lr, pc
	bx	r7
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L140
.L143:
	mov	lr, pc
	bx	r8
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L140
.L144:
	mov	lr, pc
	bx	r9
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L140
.L145:
	tst	r0, #1
	beq	.L149
	tst	r3, #1
	beq	.L155
.L149:
	mov	r0, r3
	b	.L140
.L147:
	mov	lr, pc
	bx	r10
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L140
.L146:
	tst	r0, #1
	beq	.L149
	tst	r3, #1
	bne	.L149
	ldr	r3, .L156+44
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L140
.L155:
	ldr	r3, .L156+16
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L140
.L157:
	.align	2
.L156:
	.word	setupSounds
	.word	state
	.word	setupInterrupts
	.word	buttons
	.word	goToStart
	.word	oldButtons
	.word	start
	.word	game
	.word	pause
	.word	lose
	.word	67109120
	.word	goToInstructions2
	.size	main, .-main
	.text
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	lose
	.size	win, .-win
	.comm	seed,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	option,4,4
	.comm	state,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
