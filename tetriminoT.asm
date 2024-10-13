# drawTetriminoT_0: desenha um tetrimino T de uma determinada cor (rotação 0)
.macro drawTetriminoT_0(%pos, %color)
    move $s7, %pos
    
    add $a0, $s0, $s7
    li   $a1, %color           
    jal  drawBlock                          

    addi $a0, $a0, 4064 # 4096 - 32       
    li   $a1, %color           
    jal  drawBlock             
    
    addi $a0, $a0, 32       
    li   $a1, %color           
    jal  drawBlock  
    
    addi $a0, $a0, 32       
    li   $a1, %color           
    jal  drawBlock  
           
.end_macro

# drawTetriminoT_1: desenha um tetrimino T de uma determinada cor (rotação 1)
.macro drawTetriminoT_1(%pos, %color)
    move $s7, %pos
    
    add $a0, $s0, $s7
    li   $a1, %color           
    jal  drawBlock                          

    addi $a0, $a0, 4096      
    li   $a1, %color           
    jal  drawBlock             
    
    addi $a0, $a0, 32       
    li   $a1, %color           
    jal  drawBlock  
    
    addi $a0, $a0, 4064 # 4096 - 32       
    li   $a1, %color           
    jal  drawBlock  
           
.end_macro

# drawTetriminoT_2: desenha um tetrimino T de uma determinada cor (rotação 2)
.macro drawTetriminoT_2(%pos, %color)
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
    
    addi $a0, $a0, 4064 # 4096 - 32       
    li   $a1, %color           
    jal  drawBlock  
           
.end_macro

# drawTetriminoT_3: desenha um tetrimino T de uma determinada cor (rotação 3)
.macro drawTetriminoT_3(%pos, %color)
    move $s7, %pos
    
    add $a0, $s0, $s7
    li   $a1, %color           
    jal  drawBlock                          

    addi $a0, $a0, 4096      
    li   $a1, %color           
    jal  drawBlock             
    
    addi $a0, $a0, -32       
    li   $a1, %color           
    jal  drawBlock  
    
    addi $a0, $a0, 4128 # 4096 + 32       
    li   $a1, %color           
    jal  drawBlock  
           
.end_macro


.macro moveTetriminoT_0(%offset)
    drawTetriminoT_0($s1, BLACK)

    add $s1, $s1, %offset

    drawTetriminoT_0($s1, ORANGE)
.end_macro

.macro moveTetriminoT_1(%offset)
    drawTetriminoT_1($s1, BLACK)

    add $s1, $s1, %offset

    drawTetriminoT_1($s1, ORANGE)
.end_macro

.macro moveTetriminoT_2(%offset)
    drawTetriminoT_2($s1, BLACK)

    add $s1, $s1, %offset

    drawTetriminoT_2($s1, ORANGE)
.end_macro

.macro moveTetriminoT_3(%offset)
    drawTetriminoT_3($s1, BLACK)

    add $s1, $s1, %offset

    drawTetriminoT_3($s1, ORANGE)
.end_macro

#colisões

.macro collisionCheckT_0(%pos)
    li $v0, 0

	move $s7, %pos
    add $a0, $s1, $s7
    add $a0, $a0, $s0

    jal collisionCheck

    addi $a0, $a0, 4064
    jal  collisionCheck 

    addi $a0, $a0, 32        
    jal  collisionCheck             

    addi $a0, $a0, 32       
    jal  collisionCheck             
    
.end_macro

.macro collisionCheckT_1(%pos)
    li $v0, 0

	move $s7, %pos
    add $a0, $s1, $s7
    add $a0, $a0, $s0

    jal  collisionCheck             

    addi $a0, $a0, 4096        
    jal  collisionCheck             

    addi $a0, $a0, 32       
    jal  collisionCheck             

	addi $a0, $a0, 4064       
    jal  collisionCheck

           
.end_macro


.macro collisionCheckT_2(%pos)
    li $v0, 0

	move $s7, %pos
    add $a0, $s1, $s7
    add $a0, $a0, $s0

    addi $a0, $a0, 4064
    jal collisionCheck

    addi $a0, $a0, 32
    jal  collisionCheck 

    addi $a0, $a0, 32        
    jal  collisionCheck             

    addi $a0, $a0, 4064       
    jal  collisionCheck            
    
.end_macro

.macro collisionCheckT_3(%pos)
    li $v0, 0

	move $s7, %pos
    add $a0, $s1, $s7
    add $a0, $a0, $s0

    jal  collisionCheck             

    addi $a0, $a0, 4096        
    jal  collisionCheck             

    addi $a0, $a0, -32       
    jal  collisionCheck             

	addi $a0, $a0, 4128       
    jal  collisionCheck
           
.end_macro