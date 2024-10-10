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
	lui  $s0, 0x1004						# endereço do display
	drawHorizontalLine(128, 0, WHITE)
	drawVerticalLine(256, 0,WHITE)
	
	li $a1, RED
	addi $a0, $s0, 5000
	jal drawBlock
	
	drawTetrisJ(7000, GREEN)
	drawTetrisL(14000, YELLOW)
	drawTetrisI(24000, CYAN)
	
	li $v0, 10
	syscall
	
.include "rotinas.asm"
