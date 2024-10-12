# drawTetriminoZ_0: desenha um tetrimino Z de uma determinada cor (rotação 0)
.macro drawTetriminoZ_0(%pos, %color)
    move $s7, %pos
    
    add  $a0, $s0, $s7

    addi $a0, $a0, 4064 # 4096 - 32       
    li   $a1, %color           
    jal  drawBlock             

    addi $a0, $a0, 32        
    li   $a1, %color           
    jal  drawBlock             

    addi $a0, $a0, 4096       
    li   $a1, %color           
    jal  drawBlock             
    
    addi $a0, $a0, 32       
    li   $a1, %color           
    jal  drawBlock  
           
.end_macro

# drawTetriminoZ_1: desenha um tetrimino Z de uma determinada cor (rotação 1)
.macro drawTetriminoZ_1(%pos, %color)
    move $s7, %pos
    
    add  $a0, $s0, $s7

    addi $a0, $a0, 64 # 32 + 32       
    li   $a1, %color           
    jal  drawBlock             

    addi $a0, $a0, 4096        
    li   $a1, %color           
    jal  drawBlock             

    addi $a0, $a0, -32       
    li   $a1, %color           
    jal  drawBlock             
    
    addi $a0, $a0, 4096       
    li   $a1, %color           
    jal  drawBlock  
           
.end_macro

.macro moveTetriminoZ_0(%offset)
    drawTetriminoZ_0($s1, BLACK)

    add $s1, $s1, %offset

    drawTetriminoZ_0($s1, GREEN)
.end_macro

.macro moveTetriminoZ_1(%offset)
    drawTetriminoZ_1($s1, BLACK)

    add $s1, $s1, %offset

    drawTetriminoZ_1($s1, GREEN)
.end_macro

.macro collisionCheckZ_0(%pos)
    li $v0, 0

	move $s7, %pos
    add $a0, $s1, $s7
    add $a0, $a0, $s0

    addi $a0, $a0, 4064
    jal collisionCheck

    addi $a0, $a0, 32
    jal  collisionCheck 

    addi $a0, $a0, 4096        
    jal  collisionCheck             

    addi $a0, $a0, 32       
    jal  collisionCheck             
    
.end_macro

.macro collisionCheckZ_1(%pos)
    li $v0, 0

	move $s7, %pos
    add $a0, $s1, $s7
    add $a0, $a0, $s0

    addi $a0, $a0, 64        
    jal  collisionCheck             

    addi $a0, $a0, 4096        
    jal  collisionCheck             

    addi $a0, $a0, -32       
    jal  collisionCheck             

	addi $a0, $a0, 4096       
    jal  collisionCheck

           
.end_macro