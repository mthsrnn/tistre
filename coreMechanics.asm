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
	#s0 -> ponteiro para o display
	#s1 -> posição do tetrimino atual
	#s2 -> tipo do tetrimino atual
	#s3 -> rotação do tetrimino atual
	#s4 -> proximo tetrimino
	#s5 -> pontuação

	
	lui  $s0, 0x1004
	li $s5, 0
	# 4288 -> tetrimino no tetrisboard
	# 4528 -> tetrimino na caixa do proximo tetrimino

	randomTetrimino($s4)
	li $s3, 0

	newTetrimino:
	move $a0, $s0
	jal clearLines
	add $s5, $s5, $v0


	move $s2, $s4
	
	randomTetrimino($s4)
    nop #AQUI
	li $a1, 4528
	clearNextTetrimino($a1)
	move $a0, $s4
	jal drawNewTetrimino ############################## ERRO AQUI

	

	move $a3, $s0
	li $a1, 4288
	move $a0, $s2
	li $s3, 0
	jal drawNewTetrimino
	move $s1, $v1
	bnez $v0, gameOver

	
	loop:
	addu $s5, $s5, 1
	bgtu $s5, 100000, fallTetrimino
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
	
	gameOver:
	la $a0, message_GameOver
	li $v0, 4
	syscall

	move $a0, $s5
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
.end_macro


.data

message_GameOver: .asciiz "Você perdeu! Pontuação:\n"
