.macro drawScreen
	drawHorizontalLine(32768, 0, BLACK)  # limpador de tela vagabundo
	#desenhando o tetrisboard
	drawHorizontalLine(82, 3612, WHITE)  # (4096 (uma coluna) - 512 (uma linha)) + 32 - 4 (borda)
	
	drawVerticalLine(162, 3612, WHITE)
	drawVerticalLine(162, 3936, WHITE)
	drawHorizontalLine(82, 86044, WHITE)
	
	drawHorizontalLine(34, 3948, WHITE)
	drawVerticalLine(34, 3948, WHITE)
	drawVerticalLine(34, 4080, WHITE)
	drawHorizontalLine(34, 20844, WHITE)
	
	# "e viu-se a borda vermelha como enfeite, era uma gambiarra recôndita"
	# "removereis a borda vermelha do display, e cagareis a colisão no game"
	# SALMOS 4:20-21
	drawVerticalLine(256, 0, RED)
	drawVerticalLine(256, 508, RED)
	drawHorizontalLine(128, 0, RED)
	drawHorizontalLine(128, 130560, RED)
.end_macro

.macro gameLoop

	newTetrimino:
	move $a0, $s0
	jal clearLines
	jal randomTetrimino
	
	loop:
	addu $s5, $s5, 1
	bgtu $s5, 50000, fallTetrimino
	jal keyboardParse
	beqz $v0, skipMovement
	beq $v0, DOWN, checkCollisionDown
	bnez $v1, movementRotation
	move $a0, $v0
	jal moveTetrimino
	j loop
	
	fallTetrimino:
	li $a0, DOWN
	jal moveTetrimino
	li $s5, 0
	bnez $v0, newTetrimino
	j loop
	
	movementRotation:
	jal rotateTetrimino
	j loop
	
	checkCollisionDown:
	move $a0, $v0
	jal moveTetrimino
	bnez $v0, newTetrimino
	j loop
	
	skipMovement:
	j loop
.end_macro