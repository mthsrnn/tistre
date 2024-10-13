gameOverCheck:
    addi $sp, $sp, -12
    sw   $ra, 0($sp)
	sw   $s6, 4($sp)
	sw   $s7, 8($sp),

    li $v0, 0
       
    beq $s2, 0, gameOverCheckJ
    beq $s2, 1, gameOverCheckL
    beq $s2, 2, gameOverCheckI
    beq $s2, 3, gameOverCheckO
    beq $s2, 4, gameOverCheckS
    beq $s2, 5, gameOverCheckZ
    beq $s2, 6, gameOverCheckT
    j endGameOverCheck

	gameOverCheckJ:
		collisionCheckJ_0($zero)
		j endGameOverCheck

	gameOverCheckL:
		collisionCheckL_0($zero)
		j endGameOverCheck

	gameOverCheckI:
		collisionCheckI_0($zero)
		j endGameOverCheck

	gameOverCheckO:
        collisionCheckO_0($zero)
		j endGameOverCheck

	gameOverCheckS:
        collisionCheckS_0($zero)
		j endGameOverCheck

	gameOverCheckZ:
        collisionCheckZ_0($zero)
		j endGameOverCheck

	gameOverCheckT:
		collisionCheckT_0($zero)
		j endGameOverCheck

	
	endGameOverCheck:
		lw   $s7, 8($sp)
		lw   $s6, 4($sp)
		lw   $ra, 0($sp)      
		addi $sp, $sp, 12     
		jr   $ra