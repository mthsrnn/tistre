# drawTetriminoJ_0: desenha um tetrimino J de uma determinada cor (rotação 0)
.macro drawTetriminoJ_1(%pos, %color)

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

    addi $a0, $a0, -32
    li   $a1, %color           
    jal  drawBlock             
.end_macro


# drawTetriminoJ_1: desenha um tetrimino J de uma determinada cor (rotação 1)
.macro drawTetriminoJ_2(%pos, %color)

	move $s7, %pos
	
    add $a0, $s0, $s7

    addi $a0, $a0, -32        
    li   $a1, %color           
    jal  drawBlock             

    addi $a0, $a0, 4096        
    li   $a1, %color           
    jal  drawBlock             

    addi $a0, $a0, 32
    li   $a1, %color
    jal  drawBlock      

    addi $a0, $a0, 32
    li   $a1, %color
    jal  drawBlock         
.end_macro

# drawTetriminoJ_2: desenha um tetrimino J de uma determinada cor (rotação 2)
.macro drawTetriminoJ_3(%pos, %color)
	move $s7, %pos
	
    add $a0, $s0, $s7

    addi $a0, $a0, 32        
    li   $a1, %color           
    jal  drawBlock

    addi $a0, $a0, -32        
    li   $a1, %color           
    jal  drawBlock               

    addi $a0, $a0, 4096        
    li   $a1, %color           
    jal  drawBlock             

    addi $a0, $a0, 4096       
    li   $a1, %color           
    jal  drawBlock                     
.end_macro

# drawTetriminoJ_3: desenha um tetrimino J de uma determinada cor (rotação 3)
.macro drawTetriminoJ_0(%pos, %color)

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

    addi $a0, $a0, 4096
    li   $a1, %color
    jal  drawBlock         
.end_macro

# MOVIMENTOS

# moveTetriminoJ_0: move um tetrimino J para uma determinada posição (rotação 0)
.macro moveTetriminoJ_0(%offset)

    add $s1, $s1, %offset

    drawTetriminoJ_0($s1, BLUE)
.end_macro

# moveTetriminoJ_1(%offset): move um tetrimino J para uma determinada posição (rotação 1)
.macro moveTetriminoJ_1(%offset)

    add $s1, $s1, %offset

    drawTetriminoJ_1($s1, BLUE)
.end_macro

# moveTetriminoJ_2: move um tetrimino J para uma determinada posição (rotação 2)
.macro moveTetriminoJ_2(%offset)

    add $s1, $s1, %offset

    drawTetriminoJ_2($s1, BLUE)
.end_macro

# moveTetriminoJ_3: move um tetrimino J para uma determinada posição (rotação 3)
.macro moveTetriminoJ_3(%offset)
    add $s1, $s1, %offset

    drawTetriminoJ_3($s1, BLUE)
.end_macro

#colisões

.macro collisionCheckJ_1(%pos)
    li $v0, 0

	move $s7, %pos
    add $a0, $s1, $s7
    add $a0, $a0, $s0

    jal collisionCheck

    addi $a0, $a0, 4096
    jal  collisionCheck 

    addi $a0, $a0, 4096        
    jal  collisionCheck             

    addi $a0, $a0, -32       
    jal  collisionCheck             
    
.end_macro

.macro collisionCheckJ_2(%pos)
    li $v0, 0

	move $s7, %pos
    add $a0, $s1, $s7
    add $a0, $a0, $s0

    addi $a0, $a0, -32
    jal collisionCheck

    addi $a0, $a0, 4096
    jal  collisionCheck 

    addi $a0, $a0, 32        
    jal  collisionCheck             

    addi $a0, $a0, 32       
    jal  collisionCheck   

.end_macro


.macro collisionCheckJ_3(%pos)
    li $v0, 0

	move $s7, %pos
    add $a0, $s1, $s7
    add $a0, $a0, $s0

    addi $a0, $a0, 32
    jal collisionCheck

    addi $a0, $a0, -32
    jal  collisionCheck 

    addi $a0, $a0, 4096        
    jal  collisionCheck             

    addi $a0, $a0, 4096       
    jal  collisionCheck            
    
.end_macro

.macro collisionCheckJ_0(%pos)
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

	addi $a0, $a0, 4096       
    jal  collisionCheck
           
.end_macro
