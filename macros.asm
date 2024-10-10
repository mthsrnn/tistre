# drawHorizontalLine: dada a posição do pixel no display, desenha uma linha horizontal com uma cor e tamanho
.macro drawHorizontalLine(%size, %pos, %color)
	addi $a0, $s0, %pos		# posição
    li   $a1, %color 		# cor
	li   $a2, %size			# tamanho
	
	jal drawLineH
.end_macro

# drawVerticalLine: dada a posição do pixel no display, desenha uma linha vertical com uma cor e tamanho
.macro drawVerticalLine(%size, %pos, %color)
	addi $a0, $s0, %pos		# position
	li   $a1, %color 		# color
	li   $a2, %size			# size
	
	jal drawLineV
.end_macro

# drawTetriminoJ: desenha um tetrimino J de uma determinada cor
.macro drawTetriminoJ(%pos, %color)

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

    add $a0, $s0, $s7        
    addi $a0, $a0, 8160 # 8192 - 32
    li   $a1, %color           
    jal  drawBlock             
.end_macro

# drawTetriminoJ: desenha um tetrimino J de uma determinada cor
.macro drawTetriminoL(%pos, %color)

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

    add $a0, $s0, $s7
    addi $a0, $a0, 8224 # 8192 + 32        
    li   $a1, %color           
    jal  drawBlock             
.end_macro

# drawTetriminoI: desenha um tetrimino I de uma determinada cor
.macro drawTetriminoI(%pos, %color)

	move $s7, %pos
    
    add $a0, $s0, $s7        
    li   $a1, %color           
    jal  drawBlock             

    addi $a0, $a0, 4096        
    li   $a1, %color           
    jal  drawBlock             

    add $a0, $a0, 4096       
    li   $a1, %color           
    jal  drawBlock             

	addi $a0, $a0, 4096       
    li   $a1, %color           
    jal  drawBlock
    
    addi $a0, $a0, 4096       
    li   $a1, %color           
    jal  drawBlock  
           
.end_macro

# drawTetriminoZ: desenha um tetrimino Z de uma determinada cor
.macro drawTetriminoZ(%pos, %color)
    move $s7, %pos
    
    add  $a0, $s0, $s7        
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

# drawTetriminoS: desenha um tetrimino S de uma determinada cor
.macro drawTetriminoS(%pos, %color)
    move $s7, %pos
    	
    add $a0, $s0, $s7        
    li   $a1, %color           
    jal  drawBlock             

    addi $a0, $a0, 32        
    li   $a1, %color           
    jal  drawBlock             

    addi $a0, $a0, 4064 # 4096 - 32       
    li   $a1, %color           
    jal  drawBlock             
    
    addi $a0, $a0, -32       
    li   $a1, %color           
    jal  drawBlock  
           
.end_macro

# drawTetriminoS: desenha um tetrimino O de uma determinada cor
.macro drawTetriminoO(%pos, %color)
    move $s7, %pos
    
    add $a0, $s0, $s7
         
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

# drawTetriminoT: desenha um tetrimino T de uma determinada cor
.macro drawTetriminoT(%pos, %color)
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
