.include "macros.asm"
.include "definicoes.asm"

# CONFIGURAÇÕES
# Mars:	   Settings->Permit extended (pseudo) instructions and formats
#
# Display: Unit Width in Pixels: 2
#		   Unit Height in Pixels: 2
#		   Display Width in Pixels: 256
#		   Display Height in Pixels: 512
#		   Base address for display: 0x10040000(heap)

.text
main:
	lui  $s0, 0x1004					 # endereço do display
	drawHorizontalLine(32768, 0, BLACK)  # limpador de tela vagabundo
	#desenhando o tetrisboard
	drawHorizontalLine(82, 3612, WHITE)  # (4096 (uma coluna) - 512 (uma linha)) + 32 - 4 (borda)
	drawVerticalLine(162, 3612, WHITE)
	drawVerticalLine(162, 3936, WHITE)
	drawHorizontalLine(82, 86044, WHITE)
	
	jal randomTetrimino
	
	li $s4, 16
	loopqueda:
	jal fallingTetrimino
	addi $s4, $s4, -1
	bgt $s4, $zero, loopqueda
	
	li $v0, 10
	syscall
	
.include "rotinas.asm"
