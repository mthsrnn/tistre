.include "moveTetrimino.asm"
.include "rotateTetrimino.asm"
.include "keyboardParse.asm"


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

collisionCheck:
	addi $sp, $sp, -4
	sw   $ra, 0($sp)

    lw $t1, 0($a0)
    beq $t1, BLACK, collisionCheckEnd

	#li $a1, RED
	#jal drawBlock

	addi $v0, $v0, 1

	collisionCheckEnd:
	lw   $ra, 0($sp)
	addi $sp, $sp, 4
    jr $ra

randomTetrimino:
	addi $sp, $sp, -4
	sw   $ra, 0($sp)
    
    li $a0, 0
    li $a1, 6
    li $v0, 42
    syscall

    move $s2, $a0
	li $s1, 4288
	li $s3, 0 # guarda a rotação atual do tetrimino
    
    beq $a0, 0, randomTetriminoJ
    beq $a0, 1, randomTetriminoL
    beq $a0, 2, randomTetriminoI
    beq $a0, 3, randomTetriminoO
    beq $a0, 4, randomTetriminoS
    beq $a0, 5, randomTetriminoZ
    beq $a0, 6, randomTetriminoT
    j endRandomTetrimino

	randomTetriminoJ:
		addi $s1, $s1, -4096
    	drawTetriminoJ_0($s1, BLUE)
    	j endRandomTetrimino

	randomTetriminoL:
    	drawTetriminoL_0($s1, RED)
    	j endRandomTetrimino

	randomTetriminoI:
    	drawTetriminoI_0($s1, CYAN)
    	j endRandomTetrimino

	randomTetriminoO:
		addi $s1, $s1, -4096
    	drawTetriminoO_0($s1, YELLOW)
    	j endRandomTetrimino

	randomTetriminoS:
		addi $s1, $s1, -4096
    	drawTetriminoS_0($s1, MAGENTA)
    	j endRandomTetrimino

	randomTetriminoZ:
		addi $s1, $s1, -4096
    	drawTetriminoZ_0($s1, GREEN)
    	j endRandomTetrimino

	randomTetriminoT:
    	drawTetriminoT_0($s1, ORANGE)
    	j endRandomTetrimino

	endRandomTetrimino:
	    lw   $ra, 0($sp)
    	addi $sp, $sp, 4
    	jr   $ra

