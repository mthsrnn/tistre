.include "macros.asm"
.include "definicoes.asm"
.include "tetriminoJ.asm"
.include "tetriminoL.asm"
.include "tetriminoT.asm"
.include "tetriminoZ.asm"
.include "tetriminoS.asm"
.include "tetriminoI.asm"
.include "tetriminoO.asm"

# CONFIGURAÇÕES
# Mars:	   Settings->Permit extended (pseudo) instructions and formats
#
# Display: Unit Width in Pixels: 2
#		   Unit Height in Pixels: 2
#		   Display Width in Pixels: 256
#		   Display Height in Pixels: 512
#		   Base address for display: 0x10040000(heap)
#
# Display: Unit Width in Pixels: 4
#		   Unit Height in Pixels: 4
#		   Display Width in Pixels: 512
#		   Display Height in Pixels: 1024
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
	
	# "e viu-se a borda vermelha como enfeite, era uma gambiarra recôndita"
	# "removereis a borda vermelha do display, e cagareis a colisão no game"
	# SALMOS 4:20-21
	drawVerticalLine(256, 0, RED)
	drawVerticalLine(256, 508, RED)
	drawHorizontalLine(128, 0, RED)
	drawHorizontalLine(128, 130560, RED)
	
	li $s1, 4288
	
	loop2:
	jal randomTetrimino
	li $s5, 22
	loop:
	li $a0, DOWN
	jal moveTetrimino
	addi $s5, $s5, -1
	bgtz $v0, loop2
	bgtz $s5, loop

	
	li $v0, 10
	syscall
	
.include "rotinas.asm"
