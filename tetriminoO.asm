# drawTetriminoO_0: desenha um tetrimino O de uma determinada cor (rotação 0)
.macro drawTetriminoO_0(%pos, %color)
    move $s7, %pos
    
    add $a0, $s0, $s7
         
    addi $a0, $a0, 4064 # 4096 - 32
    li   $a1, %color           
    jal  drawBlock             

    addi $a0, $a0, 32        
    li   $a1, %color           
    jal  drawBlock             

    addi $a0, $a0, 4064 # 4096 - 32       
    li   $a1, %color           
    jal  drawBlock             
    
    addi $a0, $a0, 32       
    li   $a1, %color           
    jal  drawBlock  
           
.end_macro

.macro moveTetriminoO_0(%offset)
    drawTetriminoO_0($s1, BLACK)

    add $s1, $s1, %offset

    drawTetriminoO_0($s1, YELLOW)
.end_macro

.macro collisionCheckO_0(%pos)
    li $v0, 0

	move $s7, %pos
    add $a0, $s1, $s7
    add $a0, $a0, $s0

    addi $a0, $a0, 4064        
    jal  collisionCheck             

    addi $a0, $a0, 32        
    jal  collisionCheck             

    addi $a0, $a0, 4064       
    jal  collisionCheck             

	addi $a0, $a0, 32       
    jal  collisionCheck

           
.end_macro