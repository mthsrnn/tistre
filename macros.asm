.macro drawHorizontalLine(%size, %pos, %color)
	addi $a0, $s0, %pos		# posição
    li   $a1, %color 		# cor
	li   $a2, 10			# tamanho
	
	jal drawLineH
.end_macro