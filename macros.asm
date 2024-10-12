# LEMBRE-SE: macros não são funções, cuidado com excesso de repetição no código

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