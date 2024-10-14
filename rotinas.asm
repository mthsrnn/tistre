.include "moveTetrimino.asm"
.include "rotateTetrimino.asm"
.include "keyboardParse.asm"
.include "clearLines.asm"
.include "gameOverCheck.asm"
.include "scoring.asm"


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
	addi $sp, $sp, -4
	sw   $ra, 0($sp)

	li $t2, 8
	move $t3, $a0
	move $t5, $a1
		drawBlockLoop:
			sw $t5, 0($t3)
			sw $t5, 4($t3)
			sw $t5, 8($t3)
			sw $t5, 12($t3)
			sw $t5, 16($t3)
			sw $t5, 20($t3)
			sw $t5, 24($t3)
			sw $t5, 28($t3)
			addi $t3, $t3, 512
			addi $t2, $t2, -1
			bgt $t2, 0, drawBlockLoop
	lw   $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
	
deleteBlock:
	addi $sp, $sp, -4
	sw   $ra, 0($sp)

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
	lw   $ra, 0($sp)
	addi $sp, $sp, 4
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

drawNewTetrimino:
	addi $sp, $sp, -16
	sw   $ra, 0($sp)
	sw   $s4, 4($sp)
	sw   $s5, 8($sp)
	sw   $s6, 12($sp)

    move $s4, $a0
	move $s5, $a1

    beq $s4, 0, newTetriminoJ
    beq $s4, 1, newTetriminoL
    beq $s4, 2, newTetriminoI
    beq $s4, 3, newTetriminoO
    beq $s4, 4, newTetriminoS
    beq $s4, 5, newTetriminoZ
    beq $s4, 6, newTetriminoT
    j endNewTetrimino

	newTetriminoJ:
		addi $s5, $s5, -4096
		move $v1, $s5
		move $s1, $s5
		collisionCheckJ_0($zero)
		move $s6, $v0
    	drawTetriminoJ_0($s5, BLUE)
    	j endNewTetrimino

	newTetriminoL:
		addi $s5, $s5, -4096
		move $v1, $s5
		move $s1, $s5
		collisionCheckL_0($zero)
		move $s6, $v0

    	drawTetriminoL_0($s5, RED)
    	j endNewTetrimino

	newTetriminoI:
		move $v1, $s5
		collisionCheckI_0($s5)
		move $s6, $v0
    	move $s1, $s5
		collisionCheckI_0($zero)
		drawTetriminoI_0($s5, CYAN)

    	j endNewTetrimino

	newTetriminoO:
		addi $s5, $s5, -4096
		move $v1, $s5
		move $s1, $s5
		collisionCheckO_0($zero)
		move $s6, $v0
    	drawTetriminoO_0($s5, YELLOW)
    	j endNewTetrimino

	newTetriminoS:
		addi $s5, $s5, -4096
		move $v1, $s5
		move $s1, $s5
		collisionCheckS_0($zero)
		move $s6, $v0
    	drawTetriminoS_0($s5, MAGENTA)
    	j endNewTetrimino

	newTetriminoZ:
		addi $s5, $s5, -4096
		move $v1, $s5
		move $s1, $s5
		collisionCheckZ_0($zero)
		move $s6, $v0
    	drawTetriminoZ_0($s5, GREEN)
    	j endNewTetrimino

	newTetriminoT:
		move $v1, $s5
		move $s1, $s5
		collisionCheckT_0($zero)
		move $s6, $v0
    	drawTetriminoT_0($s5, ORANGE)
    	j endNewTetrimino

	endNewTetrimino:
		move $v1, $s5
		move $v0, $s6
		lw  $s6, 12($sp)
		lw   $s5, 8($sp)
		lw   $s4, 4($sp)
	    lw   $ra, 0($sp)
    	addi $sp, $sp, 16
    	jr   $ra

