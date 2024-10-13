.include "macros.asm"
.include "definicoes.asm"
.include "tetriminoJ.asm"
.include "tetriminoL.asm"
.include "tetriminoT.asm"
.include "tetriminoZ.asm"
.include "tetriminoS.asm"
.include "tetriminoI.asm"
.include "tetriminoO.asm"
.include "coreMechanics.asm"

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
	lui  $s0, 0x1004					# Endereço do display
	#li $s1, 4288						# Endereço do tetrimino inicial (definido aqui para debug) 
	drawScreen							# Renderiza as bordas da tela do jogo (também limpa tudo)
	
	gameLoop
	
	li $v0, 10
	syscall
	
.include "rotinas.asm"
