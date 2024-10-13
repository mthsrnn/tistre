# drawTetriminoI_0: desenha um tetrimino I de uma determinada cor (rotação 0)
.macro drawTetriminoI_0(%pos, %color)

	move $s7, %pos
    add $a0, $s0, $s7
        
    li   $a1, %color           
    jal  drawBlock             

    addi $a0, $a0, 4096        
    li   $a1, %color           
    jal  drawBlock             

    addi $a0, $a0, 4096       
    li   $a1, %color           
    jal  drawBlock             

	addi $a0, $a0, 4096       
    li   $a1, %color           
    jal  drawBlock
           
.end_macro

# drawTetriminoI_1: desenha um tetrimino I de uma determinada cor (rotação 1)
.macro drawTetriminoI_1(%pos, %color)

	move $s7, %pos
    add $a0, $s0, $s7
    
    addi $a0, $a0, 8128
    li   $a1, %color           
    jal  drawBlock             

    addi $a0, $a0, 32        
    li   $a1, %color           
    jal  drawBlock             

    addi $a0, $a0, 32       
    li   $a1, %color           
    jal  drawBlock             

	addi $a0, $a0, 32       
    li   $a1, %color           
    jal  drawBlock
           
.end_macro

#MOVIMENTOS

.macro moveTetriminoI_0(%offset)
    add $s1, $s1, %offset

    drawTetriminoI_0($s1, CYAN)
.end_macro

.macro moveTetriminoI_1(%offset)
    add $s1, $s1, %offset

    drawTetriminoI_1($s1, CYAN)
.end_macro


#COLISÕES

.macro collisionCheckI_0(%pos)
    li $v0, 0

	move $s7, %pos
    add $a0, $s1, $s7
    add $a0, $a0, $s0

    jal collisionCheck

    addi $a0, $a0, 4096
    jal  collisionCheck 

    addi $a0, $a0, 4096        
    jal  collisionCheck             

    addi $a0, $a0, 4096       
    jal  collisionCheck             
    
.end_macro

.macro collisionCheckI_1(%pos)
    li $v0, 0

	move $s7, %pos
    add $a0, $s1, $s7
    add $a0, $a0, $s0

    addi $a0, $a0, 8128
    jal  collisionCheck             

    addi $a0, $a0, 32        
    jal  collisionCheck             

    addi $a0, $a0, 32       
    jal  collisionCheck             

	addi $a0, $a0, 32       
    jal  collisionCheck
           
.end_macro
