rotateTetrimino:
    addi $sp, $sp, -4
    sw   $ra, 0($sp)
       
    beq $s2, 0, rotateTetriminoJ
    beq $s2, 1, rotateTetriminoL
    beq $s2, 2, rotateTetriminoI
    beq $s2, 3, rotateTetriminoO
    beq $s2, 4, rotateTetriminoS
    beq $s2, 5, rotateTetriminoZ
    beq $s2, 6, rotateTetriminoT
    j endRotateTetrimino

	rotateTetriminoJ:
		beq $s3, 0, rotateTetriminoJ_0
		beq $s3, 1, rotateTetriminoJ_1
		beq $s3, 2, rotateTetriminoJ_2
		beq $s3, 3, rotateTetriminoJ_3
		j endRotateTetrimino

	rotateTetriminoL:
		beq $s3, 0, rotateTetriminoL_0
		beq $s3, 1, rotateTetriminoL_1
		beq $s3, 2, rotateTetriminoL_2
		beq $s3, 3, rotateTetriminoL_3
		j endRotateTetrimino

	rotateTetriminoI:
		beq $s3, 0, rotateTetriminoI_0
		beq $s3, 1, rotateTetriminoI_1
		j endRotateTetrimino

	rotateTetriminoO:
		j endRotateTetrimino

	rotateTetriminoS:
		beq $s3, 0, rotateTetriminoS_0
		beq $s3, 1, rotateTetriminoS_1
		j endRotateTetrimino

	rotateTetriminoZ:
		beq $s3, 0, rotateTetriminoZ_0
		beq $s3, 1, rotateTetriminoZ_1
		j endRotateTetrimino

	rotateTetriminoT:
		beq $s3, 0, rotateTetriminoT_0
		beq $s3, 1, rotateTetriminoT_1
		beq $s3, 2, rotateTetriminoT_2
		beq $s3, 3, rotateTetriminoT_3
		j endRotateTetrimino

	rotateTetriminoJ_0:
		drawTetriminoJ_0($s1, BLACK) 

		collisionCheckJ_1($zero)
		bgtz $v0, collisionDetectedRotationJ_0

        li $s3, 1
		drawTetriminoJ_1($s1, BLUE)
		j endRotateTetrimino

		collisionDetectedRotationJ_0:
		drawTetriminoJ_0($s1, BLUE)
		j endRotateTetrimino

	rotateTetriminoJ_1:
		drawTetriminoJ_1($s1, BLACK)

		collisionCheckJ_2($zero)
		bgtz $v0, collisionDetectedRotationJ_1 
        
        li $s3, 2
		drawTetriminoJ_2($s1, BLUE)
		j endRotateTetrimino

		collisionDetectedRotationJ_1:
		drawTetriminoJ_1($s1, BLUE)
		j endRotateTetrimino

	rotateTetriminoJ_2:
		drawTetriminoJ_2($s1, BLACK)

		collisionCheckJ_3($zero)
		bgtz $v0, collisionDetectedRotationJ_2

        li $s3, 3
		drawTetriminoJ_3($s1, BLUE)
		j endRotateTetrimino

		collisionDetectedRotationJ_2:
		drawTetriminoJ_2($s1, BLUE)
		j endRotateTetrimino

	rotateTetriminoJ_3:
		drawTetriminoJ_3($s1, BLACK)

		collisionCheckJ_0($zero)
		bgtz $v0, collisionDetectedRotationJ_3

        li $s3, 0
		drawTetriminoJ_0($s1, BLUE)
		j endRotateTetrimino

		collisionDetectedRotationJ_3:
		drawTetriminoJ_3($s1, BLUE)
		j endRotateTetrimino

	rotateTetriminoL_0:
		drawTetriminoL_0($s1, BLACK)

		collisionCheckL_1($zero)
		bgtz $v0, collisionDetectedRotationL_0 

        li $s3, 1
		drawTetriminoL_1($s1, RED)
		j endRotateTetrimino

		collisionDetectedRotationL_0:
		drawTetriminoL_0($s1, RED)
		j endRotateTetrimino

	rotateTetriminoL_1:
		drawTetriminoL_1($s1, BLACK)

		collisionCheckL_2($zero)
		bgtz $v0, collisionDetectedRotationL_1 

        li $s3, 2
		drawTetriminoL_2($s1, RED)
		j endRotateTetrimino

		collisionDetectedRotationL_1:
		drawTetriminoL_1($s1, RED)
		j endRotateTetrimino

	rotateTetriminoL_2:
		drawTetriminoL_2($s1, BLACK)

		collisionCheckL_3($zero)
		bgtz $v0, collisionDetectedRotationL_2 

        li $s3, 3
		drawTetriminoL_3($s1, RED)
		j endRotateTetrimino

		collisionDetectedRotationL_2:
		drawTetriminoL_2($s1, RED)
		j endRotateTetrimino

	rotateTetriminoL_3:
		drawTetriminoL_3($s1, BLACK)

		collisionCheckL_0($zero)
		bgtz $v0, collisionDetectedRotationL_3 

        li $s3, 0
		drawTetriminoL_0($s1, RED)
		j endRotateTetrimino

		collisionDetectedRotationL_3:
		drawTetriminoL_3($s1, RED)
		j endRotateTetrimino

	rotateTetriminoI_0:
		drawTetriminoI_0($s1, BLACK)

		collisionCheckI_1($zero)
		bgtz $v0, collisionDetectedRotationI_0

        li $s3, 1
		drawTetriminoI_1($s1, CYAN)
		j endRotateTetrimino

		collisionDetectedRotationI_0:
		drawTetriminoI_0($s1, CYAN)
		j endRotateTetrimino

	rotateTetriminoI_1:
		drawTetriminoI_1($s1, BLACK)

		collisionCheckI_0($zero)
		bgtz $v0, collisionDetectedRotationI_1 

        li $s3, 0
		drawTetriminoI_0($s1, CYAN)
		j endRotateTetrimino

		collisionDetectedRotationI_1:
		drawTetriminoI_1($s1, CYAN)
		j endRotateTetrimino

	rotateTetriminoS_0:
		drawTetriminoS_0($s1, BLACK)

		collisionCheckS_1($zero)
		bgtz $v0, collisionDetectedRotationS_0 

        li $s3, 1
		drawTetriminoS_1($s1, MAGENTA)
		j endRotateTetrimino

		collisionDetectedRotationS_0:
		drawTetriminoS_0($s1, MAGENTA)
		j endRotateTetrimino

	rotateTetriminoS_1:
		drawTetriminoS_1($s1, BLACK)

		collisionCheckS_0($zero)
		bgtz $v0, collisionDetectedRotationS_1

        li $s3, 0
		drawTetriminoS_0($s1, MAGENTA)
		j endRotateTetrimino

		collisionDetectedRotationS_1:
		drawTetriminoS_1($s1, MAGENTA)
		j endRotateTetrimino

	rotateTetriminoZ_0:
		drawTetriminoZ_0($s1, BLACK)

		collisionCheckZ_1($zero)
		bgtz $v0, collisionDetectedRotationZ_0
        
        li $s3, 1
		drawTetriminoZ_1($s1, GREEN)
		j endRotateTetrimino

		collisionDetectedRotationZ_0:
		drawTetriminoZ_0($s1, GREEN)
		j endRotateTetrimino

	rotateTetriminoZ_1:
		drawTetriminoZ_1($s1, BLACK)

		collisionCheckZ_0($zero)
		bgtz $v0, collisionDetectedRotationZ_1
        
        li $s3, 0
		drawTetriminoZ_0($s1, GREEN)
		j endRotateTetrimino

		collisionDetectedRotationZ_1:
		drawTetriminoZ_1($s1, GREEN)
		j endRotateTetrimino

	rotateTetriminoT_0:
		drawTetriminoT_0($s1, BLACK)

		collisionCheckT_1($zero)
		bgtz $v0, collisionDetectedRotationT_0

        li $s3, 1
		drawTetriminoT_1($s1, ORANGE)
		j endRotateTetrimino

		collisionDetectedRotationT_0:
		drawTetriminoT_0($s1, ORANGE)
		j endRotateTetrimino

	rotateTetriminoT_1:
		drawTetriminoT_1($s1, BLACK)

		collisionCheckT_2($zero)
		bgtz $v0, collisionDetectedRotationT_1

        li $s3, 2
		drawTetriminoT_2($s1, ORANGE)
		j endRotateTetrimino

		collisionDetectedRotationT_1:
		drawTetriminoT_1($s1, ORANGE)
		j endRotateTetrimino

	rotateTetriminoT_2:
		drawTetriminoT_2($s1, BLACK)

		collisionCheckT_3($zero)
		bgtz $v0, collisionDetectedRotationT_2

        li $s3, 3
		drawTetriminoT_3($s1, ORANGE)
		j endRotateTetrimino

		collisionDetectedRotationT_2:
		drawTetriminoT_2($s1, ORANGE)
		j endRotateTetrimino

	rotateTetriminoT_3:
		drawTetriminoT_3($s1, BLACK)

		collisionCheckT_0($zero)
		bgtz $v0, collisionDetectedRotationT_3

        li $s3, 0
		drawTetriminoT_0($s1, ORANGE)
		j endRotateTetrimino

		collisionDetectedRotationT_3:
		drawTetriminoT_3($s1, ORANGE)
		j endRotateTetrimino
	
	endRotateTetrimino:
		lw   $ra, 0($sp)      
		addi $sp, $sp, 4     
		jr   $ra
