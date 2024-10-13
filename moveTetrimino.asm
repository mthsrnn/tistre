moveTetrimino:
    addi $sp, $sp, -12
    sw   $ra, 0($sp)
	sw   $s6, 4($sp)
	sw   $s7, 8($sp)

	move $s6, $a0
       
    beq $s2, 0, moveTetriminoJ
    beq $s2, 1, moveTetriminoL
    beq $s2, 2, moveTetriminoI
    beq $s2, 3, moveTetriminoO
    beq $s2, 4, moveTetriminoS
    beq $s2, 5, moveTetriminoZ
    beq $s2, 6, moveTetriminoT
    j endMoveTetrimino

	moveTetriminoJ:
		beq $s3, 0, moveTetriminoJ_0
		beq $s3, 1, moveTetriminoJ_1
		beq $s3, 2, moveTetriminoJ_2
		beq $s3, 3, moveTetriminoJ_3
		j endMoveTetrimino

	moveTetriminoL:
		beq $s3, 0, moveTetriminoL_0
		beq $s3, 1, moveTetriminoL_1
		beq $s3, 2, moveTetriminoL_2
		beq $s3, 3, moveTetriminoL_3
		j endMoveTetrimino

	moveTetriminoI:
		beq $s3, 0, moveTetriminoI_0
		beq $s3, 1, moveTetriminoI_1
		j endMoveTetrimino

	moveTetriminoO:
		drawTetriminoO_0($s1, BLACK)

		collisionCheckO_0($s6)
		bgtz $v0, collisionDetectedO_0 

		moveTetriminoO_0($s6)
		j endMoveTetrimino

		collisionDetectedO_0:
		drawTetriminoO_0($s1, YELLOW)
		j endMoveTetrimino

	moveTetriminoS:
		beq $s3, 0, moveTetriminoS_0
		beq $s3, 1, moveTetriminoS_1
		j endMoveTetrimino

	moveTetriminoZ:
		beq $s3, 0, moveTetriminoZ_0
		beq $s3, 1, moveTetriminoZ_1
		j endMoveTetrimino

	moveTetriminoT:
		beq $s3, 0, moveTetriminoT_0
		beq $s3, 1, moveTetriminoT_1
		beq $s3, 2, moveTetriminoT_2
		beq $s3, 3, moveTetriminoT_3
		j endMoveTetrimino

	moveTetriminoJ_0:
		drawTetriminoJ_0($s1, BLACK)

		collisionCheckJ_0($s6)
		bgtz $v0, collisionDetectedJ_0 

		moveTetriminoJ_0($s6)
		j endMoveTetrimino

		collisionDetectedJ_0:
		drawTetriminoJ_0($s1, BLUE)
		j endMoveTetrimino

	moveTetriminoJ_1:
		drawTetriminoJ_1($s1, BLACK)

		collisionCheckJ_1($s6)
		bgtz $v0, collisionDetectedJ_1 

		moveTetriminoJ_1($s6)
		j endMoveTetrimino

		collisionDetectedJ_1:
		drawTetriminoJ_1($s1, BLUE)
		j endMoveTetrimino

	moveTetriminoJ_2:
		drawTetriminoJ_2($s1, BLACK)

		collisionCheckJ_2($s6)
		bgtz $v0, collisionDetectedJ_2

		moveTetriminoJ_2($s6)
		j endMoveTetrimino

		collisionDetectedJ_2:
		drawTetriminoJ_2($s1, BLUE)
		j endMoveTetrimino

	moveTetriminoJ_3:
		drawTetriminoJ_3($s1, BLACK)

		collisionCheckJ_3($s6)
		bgtz $v0, collisionDetectedJ_3

		moveTetriminoJ_3($s6)
		j endMoveTetrimino

		collisionDetectedJ_3:
		drawTetriminoJ_3($s1, BLUE)
		j endMoveTetrimino

	moveTetriminoL_0:
		drawTetriminoL_0($s1, BLACK)

		collisionCheckL_0($s6)
		bgtz $v0, collisionDetectedL_0 

		moveTetriminoL_0($s6)
		j endMoveTetrimino

		collisionDetectedL_0:
		drawTetriminoL_0($s1, RED)
		j endMoveTetrimino

	moveTetriminoL_1:
		drawTetriminoL_1($s1, BLACK)

		collisionCheckL_1($s6)
		bgtz $v0, collisionDetectedL_1 

		moveTetriminoL_1($s6)
		j endMoveTetrimino

		collisionDetectedL_1:
		drawTetriminoL_1($s1, RED)
		j endMoveTetrimino

	moveTetriminoL_2:
		drawTetriminoL_2($s1, BLACK)

		collisionCheckL_2($s6)
		bgtz $v0, collisionDetectedL_2 

		moveTetriminoL_2($s6)
		j endMoveTetrimino

		collisionDetectedL_2:
		drawTetriminoL_2($s1, RED)
		j endMoveTetrimino

	moveTetriminoL_3:
		drawTetriminoL_3($s1, BLACK)

		collisionCheckL_3($s6)
		bgtz $v0, collisionDetectedL_3 

		moveTetriminoL_3($s6)
		j endMoveTetrimino

		collisionDetectedL_3:
		drawTetriminoL_3($s1, RED)
		j endMoveTetrimino

	moveTetriminoI_0:
		drawTetriminoI_0($s1, BLACK)

		collisionCheckI_0($s6)
		bgtz $v0, collisionDetectedI_0

		moveTetriminoI_0($s6)
		j endMoveTetrimino

		collisionDetectedI_0:
		drawTetriminoI_0($s1, CYAN)
		j endMoveTetrimino

	moveTetriminoI_1:
		drawTetriminoI_1($s1, BLACK)

		collisionCheckI_1($s6)
		bgtz $v0, collisionDetectedI_1 

		moveTetriminoI_1($s6)
		j endMoveTetrimino

		collisionDetectedI_1:
		drawTetriminoI_1($s1, CYAN)
		j endMoveTetrimino

	moveTetriminoS_0:
		drawTetriminoS_0($s1, BLACK)

		collisionCheckS_0($s6)
		bgtz $v0, collisionDetectedS_0 

		moveTetriminoS_0($s6)
		j endMoveTetrimino

		collisionDetectedS_0:
		drawTetriminoS_0($s1, MAGENTA)
		j endMoveTetrimino

	moveTetriminoS_1:
		drawTetriminoS_1($s1, BLACK)

		collisionCheckS_1($s6)
		bgtz $v0, collisionDetectedS_1

		moveTetriminoS_1($s6)
		j endMoveTetrimino

		collisionDetectedS_1:
		drawTetriminoS_1($s1, MAGENTA)
		j endMoveTetrimino

	moveTetriminoZ_0:
		drawTetriminoZ_0($s1, BLACK)

		collisionCheckZ_0($s6)
		bgtz $v0, collisionDetectedZ_0

		moveTetriminoZ_0($s6)
		j endMoveTetrimino

		collisionDetectedZ_0:
		drawTetriminoZ_0($s1, GREEN)
		j endMoveTetrimino

	moveTetriminoZ_1:
		drawTetriminoZ_1($s1, BLACK)

		collisionCheckZ_1($s6)
		bgtz $v0, collisionDetectedZ_1

		moveTetriminoZ_1($s6)
		j endMoveTetrimino

		collisionDetectedZ_1:
		drawTetriminoZ_1($s1, GREEN)
		j endMoveTetrimino

	moveTetriminoT_0:
		drawTetriminoT_0($s1, BLACK)

		collisionCheckT_0($s6)
		bgtz $v0, collisionDetectedT_0

		moveTetriminoT_0($s6)
		j endMoveTetrimino

		collisionDetectedT_0:
		drawTetriminoT_0($s1, ORANGE)
		j endMoveTetrimino

	moveTetriminoT_1:
		drawTetriminoT_1($s1, BLACK)

		collisionCheckT_1($s6)
		bgtz $v0, collisionDetectedT_1

		moveTetriminoT_1($s6)
		j endMoveTetrimino

		collisionDetectedT_1:
		drawTetriminoT_1($s1, ORANGE)
		j endMoveTetrimino

	moveTetriminoT_2:
		drawTetriminoT_2($s1, BLACK)

		collisionCheckT_2($s6)
		bgtz $v0, collisionDetectedT_2

		moveTetriminoT_2($s6)
		j endMoveTetrimino

		collisionDetectedT_2:
		drawTetriminoT_2($s1, ORANGE)
		j endMoveTetrimino

	moveTetriminoT_3:
		drawTetriminoT_3($s1, BLACK)

		collisionCheckT_3($s6)
		bgtz $v0, collisionDetectedT_3

		moveTetriminoT_3($s6)
		j endMoveTetrimino

		collisionDetectedT_3:
		drawTetriminoT_3($s1, ORANGE)
		j endMoveTetrimino
	
	endMoveTetrimino:
		lw   $s7, 8($sp)
		lw   $s6, 4($sp)
		lw   $ra, 0($sp)      
		addi $sp, $sp, 12     
		jr   $ra
