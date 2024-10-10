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

# drawTetrisJ: desenha um tetrimino J de uma determinada cor
.macro drawTetrisJ(%pos, %color)
    
    addi $a0, $s0, %pos        
    li   $a1, %color           
    jal  drawBlock             

    addi $a0, $a0, 4096        
    li   $a1, %color           
    jal  drawBlock             

    addi $a0, $a0, 4096       
    li   $a1, %color           
    jal  drawBlock             

    addi $a0, $s0, %pos       
    addi $a0, $a0, 8192        
    addi $a0, $a0, -32          
    li   $a1, %color           
    jal  drawBlock             
.end_macro

# drawTetrisJ: desenha um tetrimino J de uma determinada cor
.macro drawTetrisL(%pos, %color)
    
    addi $a0, $s0, %pos        
    li   $a1, %color           
    jal  drawBlock             

    addi $a0, $a0, 4096        
    li   $a1, %color           
    jal  drawBlock             

    addi $a0, $a0, 4096       
    li   $a1, %color           
    jal  drawBlock             

    addi $a0, $s0, %pos       
    addi $a0, $a0, 8192        
    addi $a0, $a0, 32          
    li   $a1, %color           
    jal  drawBlock             
.end_macro

# drawTetrisJ: desenha um tetrimino I de uma determinada cor
.macro drawTetrisI(%pos, %color)
    
    addi $a0, $s0, %pos        
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
    
    addi $a0, $a0, 4096       
    li   $a1, %color           
    jal  drawBlock  
           
.end_macro
