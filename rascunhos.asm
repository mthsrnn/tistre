move $a0, $s0
	addi $a0, $a0, 32
	addi $a0, $a0, 4096
	li $s3, 10
	li $a1, WHITE
	loopaux:	
    jal  drawBlock
    addi $a0, $a0, 32
    addi $s3, $s3, -1
    addi $a1, $a1, -10000
    bgt $s3, $zero, loopaux
    
	move $a0, $s0
	addi $a0, $a0, 32
	addi $a0, $a0, 4096
	li $s3, 20
	li $a1, WHITE
	loopaux2:	
    jal  drawBlock
    addi $a0, $a0, 4096
    addi $s3, $s3, -1
    addi $a1, $a1, -10000
    bgt $s3, $zero, loopaux2