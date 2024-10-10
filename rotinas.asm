drawLineH:
	move $t2, $a2
	move $t3, $a0
	drawLineHLoop:
	sw   $a1, 0($t3)
	addi  $t3, $t3, 4
	addi $t2, $t2, -1
	bgt  $t2, 0, drawLineHLoop
	jr $ra

drawLineV:
	move $t2, $a2
	move $t3, $a0
	drawLineVLoop:
	sw   $a1, ($t3)
	addi   $t3, $t3, 508
	addi  $t3, $t3, 4
	addi $t2, $t2, -1
	bgt  $t2, 0, drawLineVLoop
	jr $ra

drawBlock:
	li $t2, 8
	move $t3, $a0
	drawBlockOuterLoop:
		li $t4, 8
		move $t5, $a1
		drawBlockInnerLoop:
			sw $t5, 0($t3)
			addi $t3, $t3, 4
			addi $t4, $t4, -1
			bgt $t4, 0, drawBlockInnerLoop
			addi $t3, $t3, 480
			addi $t2, $t2, -1
			bgt $t2, 0, drawBlockOuterLoop
	jr $ra
	
deleteBlock:
	li $t2, 8
	move $t3, $a0
	deleteBlockOuterLoop:
		li $t4, 8
		li $t5, BLACK
		deleteBlockInnerLoop:
			sw $t5, 0($t3)
			addi $t3, $t3, 4
			addi $t4, $t4, -1
			bgt $t4, 0, deleteBlockInnerLoop
			addi $t3, $t3, 480
			addi $t2, $t2, -1
			bgt $t2, 0, deleteBlockOuterLoop
	jr $ra


randomTetrimino:
    li $a0, 0
    li $a1, 6
    li $v0, 42
    syscall
    
    beq $a0, 0, randomTetriminoJ
    beq $a0, 1, randomTetriminoL
    beq $a0, 2, randomTetriminoI
    beq $a0, 3, randomTetriminoO
    beq $a0, 4, randomTetriminoS
    beq $a0, 5, randomTetriminoZ
    beq $a0, 6, randomTetriminoT
    j endRandomTetrimino

	randomTetriminoJ:
    	drawTetriminoJ(4288, BLUE)
    	j endRandomTetrimino

	randomTetriminoL:
    	drawTetriminoL(4256, RED)
    	j endRandomTetrimino

	randomTetriminoI:
    	drawTetriminoI(4256, CYAN)
    	j endRandomTetrimino

	randomTetriminoO:
    	drawTetriminoO(4256, YELLOW)
    	j endRandomTetrimino

	randomTetriminoS:
    	drawTetriminoS(4256, MAGENTA)
    	j endRandomTetrimino

	randomTetriminoZ:
    	drawTetriminoZ(4224, MAGENTA)
    	j endRandomTetrimino

	randomTetriminoT:
    	drawTetriminoT(4224, ORANGE)
    	j endRandomTetrimino

	endRandomTetrimino:
    jr $ra