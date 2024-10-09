.text
drawLineH:
	move $t2, $a2
	move $t3, $a0
	drawLineHLoop:
	sw   $a1, ($t3)
	addi  $t3, $t3, 4
	addi $t2, $t2, -1
	bgt  $t2, 0, drawLineHLoop
	jr $ra