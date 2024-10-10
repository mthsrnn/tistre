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
	addi $sp, $sp, -4
	sw   $ra, 0($sp)
    
    li $a0, 0
    li $a1, 6
    li $v0, 42
    syscall
    
    move $s2, $a0
    
    beq $a0, 0, randomTetriminoJ
    beq $a0, 1, randomTetriminoL
    beq $a0, 2, randomTetriminoI
    beq $a0, 3, randomTetriminoO
    beq $a0, 4, randomTetriminoS
    beq $a0, 5, randomTetriminoZ
    beq $a0, 6, randomTetriminoT
    j endRandomTetrimino

	randomTetriminoJ:
		li $s1, 4288
    	drawTetriminoJ($s1, BLUE)
    	j endRandomTetrimino

	randomTetriminoL:
		li $s1, 4256
    	drawTetriminoL($s1, RED)
    	j endRandomTetrimino

	randomTetriminoI:
		li $s1, 4256
    	drawTetriminoI($s0, CYAN)
    	j endRandomTetrimino

	randomTetriminoO:
		li $s1, 4256
    	drawTetriminoO($s1, YELLOW)
    	j endRandomTetrimino

	randomTetriminoS:
		li $s1, 4256
    	drawTetriminoS($s1, MAGENTA)
    	j endRandomTetrimino

	randomTetriminoZ:
		li $s1, 4256
    	drawTetriminoZ($s1, MAGENTA)
    	j endRandomTetrimino

	randomTetriminoT:
		li $s1, 4224
    	drawTetriminoT($s1, ORANGE)
    	j endRandomTetrimino

	endRandomTetrimino:
	    lw   $ra, 0($sp)
    	addi $sp, $sp, 4
    	jr   $ra

fallingTetrimino:
    addi $sp, $sp, -4
    sw   $ra, 0($sp)

    move $t0, $s2            
    beq $t0, 0, fallTetriminoJ
    beq $t0, 1, fallTetriminoL
    beq $t0, 2, fallTetriminoI
    beq $t0, 3, fallTetriminoO
    beq $t0, 4, fallTetriminoS
    beq $t0, 5, fallTetriminoZ
    beq $t0, 6, fallTetriminoT
    j endFallingTetrimino

fallTetriminoJ:
    drawTetriminoJ($s1, BLACK)

    addi $s1, $s1, 4096

    drawTetriminoJ($s1, BLUE)
    j endFallingTetrimino

fallTetriminoL:
    # Delete the current L block
    drawTetriminoL($s1, BLACK)

    # Move the position down by one row
    addi $s1, $s1, 4096

    # Draw the L block at the new position
    drawTetriminoL($s1, RED)
    j endFallingTetrimino

fallTetriminoI:
    # Delete the current I block
    drawTetriminoI($s1, BLACK)

    # Move the position down by one row
    addi $s1, $s1, 4096

    # Draw the I block at the new position
    drawTetriminoI($s1, CYAN)
    j endFallingTetrimino

fallTetriminoO:
    # Delete the current O block
    drawTetriminoO($s1, BLACK)

    # Move the position down by one row
    addi $s1, $s1, 4096

    # Draw the O block at the new position
    drawTetriminoO($s1, YELLOW)
    j endFallingTetrimino

fallTetriminoS:
    # Delete the current S block
    drawTetriminoS($s1, BLACK)

    # Move the position down by one row
    addi $s1, $s1, 4096

    # Draw the S block at the new position
    drawTetriminoS($s1, GREEN)
    j endFallingTetrimino

fallTetriminoZ:
    # Delete the current Z block
    drawTetriminoZ($s1, BLACK)

    # Move the position down by one row
    addi $s1, $s1, 4096

    # Draw the Z block at the new position
    drawTetriminoZ($s1, MAGENTA)
    j endFallingTetrimino

fallTetriminoT:
    # Delete the current T block
    drawTetriminoT($s1, BLACK)

    # Move the position down by one row
    addi $s1, $s1, 4096

    # Draw the T block at the new position
    drawTetriminoT($s1, ORANGE)
    j endFallingTetrimino

endFallingTetrimino:
    lw   $ra, 0($sp)      # Restore the return address
    addi $sp, $sp, 4      # Deallocate space on the stack
    jr   $ra              # Return from the routine