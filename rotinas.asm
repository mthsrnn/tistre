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