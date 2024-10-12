.macro drawScreen
	drawHorizontalLine(32768, 0, BLACK)  # limpador de tela vagabundo
	#desenhando o tetrisboard
	drawHorizontalLine(82, 3612, WHITE)  # (4096 (uma coluna) - 512 (uma linha)) + 32 - 4 (borda)
	
	drawVerticalLine(162, 3612, WHITE)
	drawVerticalLine(162, 3936, WHITE)
	drawHorizontalLine(82, 86044, WHITE)
	
	drawHorizontalLine(34, 3948, WHITE)
	drawVerticalLine(34, 3948, WHITE)
	drawVerticalLine(34, 4080, WHITE)
	drawHorizontalLine(34, 20844, WHITE)
	
	# "e viu-se a borda vermelha como enfeite, era uma gambiarra recôndita"
	# "removereis a borda vermelha do display, e cagareis a colisão no game"
	# SALMOS 4:20-21
	drawVerticalLine(256, 0, RED)
	drawVerticalLine(256, 508, RED)
	drawHorizontalLine(128, 0, RED)
	drawHorizontalLine(128, 130560, RED)
.end_macro