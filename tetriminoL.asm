# drawTetriminoL_0: desenha um tetrimino L de uma determinada cor (rotação 0)
.macro drawTetriminoL_0(%pos, %color)

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

    addi $a0, $a0, 32     
    li   $a1, %color           
    jal  drawBlock    
.end_macro

# drawTetriminoL_1: desenha um tetrimino L de uma determinada cor (rotação 1)
.macro drawTetriminoL_1(%pos, %color)

	move $s7, %pos
    
    add $a0, $s0, $s7

    addi $a0, $a0, 32
    li   $a1, %color           
    jal  drawBlock             

    addi $a0, $a0, 4096        
    li   $a1, %color           
    jal  drawBlock             

    addi $a0, $a0, -32       
    li   $a1, %color           
    jal  drawBlock             

    addi $a0, $a0, -32      
    li   $a1, %color           
    jal  drawBlock             
.end_macro


# drawTetriminoL_2: desenha um tetrimino L de uma determinada cor (rotação 2)
.macro drawTetriminoL_2(%pos, %color)

	move $s7, %pos
    
    add $a0, $s0, $s7

    addi $a0, $a0, -32
    li   $a1, %color           
    jal  drawBlock             

    addi $a0, $a0, 32        
    li   $a1, %color           
    jal  drawBlock             

    addi $a0, $a0, 4096       
    li   $a1, %color           
    jal  drawBlock             

    addi $a0, $a0, 4096     
    li   $a1, %color           
    jal  drawBlock    
.end_macro

# drawTetriminoL_3: desenha um tetrimino L de uma determinada cor (rotação 3)
.macro drawTetriminoL_3(%pos, %color)

	move $s7, %pos
    
    add $a0, $s0, $s7

    addi $a0, $a0, 4064 # 4096 - 32
    li   $a1, %color           
    jal  drawBlock             

    addi $a0, $a0, 32        
    li   $a1, %color           
    jal  drawBlock             

    addi $a0, $a0, 32       
    li   $a1, %color           
    jal  drawBlock             

    addi $a0, $a0, 4032 # 4096 - 32 - 32      
    li   $a1, %color           
    jal  drawBlock             
.end_macro

# MOVIMENTOS

# moveTetriminoL_0: move um tetrimino L para uma determinada posição (rotação 0)
.macro moveTetriminoL_0(%offset)

    add $s1, $s1, %offset

    drawTetriminoL_0($s1, RED)
.end_macro


# moveTetriminoL_1: move um tetrimino L para uma determinada posição (rotação 1)
.macro moveTetriminoL_1(%offset)

    add $s1, $s1, %offset

    drawTetriminoL_1($s1, RED)
.end_macro

# moveTetriminoL_2: move um tetrimino L para uma determinada posição (rotação 2)
.macro moveTetriminoL_2(%offset)

    add $s1, $s1, %offset

    drawTetriminoL_2($s1, RED)
.end_macro

# moveTetriminoL_3: move um tetrimino L para uma determinada posição (rotação 3)
.macro moveTetriminoL_3(%offset)

    add $s1, $s1, %offset

    drawTetriminoL_3($s1, RED)
.end_macro

.macro collisionCheckL_0(%pos)
    li $v0, 0

	move $s7, %pos
    add $a0, $s1, $s7
    add $a0, $a0, $s0

    jal collisionCheck

    addi $a0, $a0, 4096
    jal  collisionCheck 

    addi $a0, $a0, 4096        
    jal  collisionCheck             

    addi $a0, $a0, 32       
    jal  collisionCheck             
    
.end_macro

.macro collisionCheckL_1(%pos)
    li $v0, 0

	move $s7, %pos
    add $a0, $s1, $s7
    add $a0, $a0, $s0

    addi $a0, $a0, 32
    jal  collisionCheck             

    addi $a0, $a0, 4096        
    jal  collisionCheck             

    addi $a0, $a0, -32       
    jal  collisionCheck             

	addi $a0, $a0, -32       
    jal  collisionCheck

           
.end_macro


.macro collisionCheckL_2(%pos)
    li $v0, 0

	move $s7, %pos
    add $a0, $s1, $s7
    add $a0, $a0, $s0

    addi $a0, $a0, -32
    jal collisionCheck

    addi $a0, $a0, 32
    jal  collisionCheck 

    addi $a0, $a0, 4096        
    jal  collisionCheck             

    addi $a0, $a0, 4096       
    jal  collisionCheck            
    
.end_macro

.macro collisionCheckL_3(%pos)
    li $v0, 0

	move $s7, %pos
    add $a0, $s1, $s7
    add $a0, $a0, $s0

    addi $a0, $a0, 4064
    jal  collisionCheck             

    addi $a0, $a0, 32        
    jal  collisionCheck             

    addi $a0, $a0, 32       
    jal  collisionCheck             

	addi $a0, $a0, 4032       
    jal  collisionCheck
           
.end_macro