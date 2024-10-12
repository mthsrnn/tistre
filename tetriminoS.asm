# drawTetriminoS_0: desenha um tetrimino S de uma determinada cor (rotação 0)
.macro drawTetriminoS_0(%pos, %color)
    move $s7, %pos
    
    add  $a0, $s0, $s7

    addi $a0, $a0, 4096       
    li   $a1, %color           
    jal  drawBlock             

    addi $a0, $a0, 32        
    li   $a1, %color           
    jal  drawBlock             

    addi $a0, $a0, 4032 #4096 - 64       
    li   $a1, %color           
    jal  drawBlock             
    
    addi $a0, $a0, 32       
    li   $a1, %color           
    jal  drawBlock  
           
.end_macro

# drawTetriminoS_1: desenha um tetrimino S de uma determinada cor (rotação 1)
.macro drawTetriminoS_1(%pos, %color)
    move $s7, %pos
    
    add  $a0, $s0, $s7
     
    li   $a1, %color           
    jal  drawBlock             

    addi $a0, $a0, 4096        
    li   $a1, %color           
    jal  drawBlock             

    addi $a0, $a0, 32 #4096 - 64       
    li   $a1, %color           
    jal  drawBlock             
    
    addi $a0, $a0, 4096       
    li   $a1, %color           
    jal  drawBlock  
           
.end_macro

.macro moveTetriminoS_0(%offset)
    drawTetriminoS_0($s1, BLACK)

    add $s1, $s1, %offset

    drawTetriminoS_0($s1, MAGENTA)
    .end_macro

.macro moveTetriminoS_1(%offset)
    drawTetriminoS_1($s1, BLACK)

    add $s1, $s1, %offset

    drawTetriminoS_1($s1, MAGENTA)
.end_macro

.macro collisionCheckS_0(%pos)
    li $v0, 0

	move $s7, %pos
    add $a0, $s1, $s7
    add $a0, $a0, $s0

    addi $a0, $a0, 4096
    jal collisionCheck

    addi $a0, $a0, 32
    jal  collisionCheck 

    addi $a0, $a0, 4032        
    jal  collisionCheck             

    addi $a0, $a0, 32       
    jal  collisionCheck             
    
.end_macro

.macro collisionCheckS_1(%pos)
    li $v0, 0

	move $s7, %pos
    add $a0, $s1, $s7
    add $a0, $a0, $s0

    jal  collisionCheck             

    addi $a0, $a0, 4096        
    jal  collisionCheck             

    addi $a0, $a0, 32       
    jal  collisionCheck             

	addi $a0, $a0, 4096       
    jal  collisionCheck

           
.end_macro