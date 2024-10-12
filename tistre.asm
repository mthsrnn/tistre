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
		
	li $s5, 0

	li $t0, 4528
	drawTetriminoO_0($t0, CYAN)
	
	newTetrimino:
	jal randomTetrimino
	
	loop:
	addu $s5, $s5, 1
	bgtu $s5, 20000, fallTetrimino
	jal keyboardParse
	beqz $v0, skipMovement
	beq $v0, DOWN, checkCollisionDown
	bnez $v1, movementRotation
	move $a0, $v0
	jal moveTetrimino
	j loop
	
	fallTetrimino:
	li $a0, DOWN
	jal moveTetrimino
	li $s5, 0
	bnez $v0, newTetrimino
	j loop
	
	movementRotation:
	jal rotateTetrimino
	j loop
	
	checkCollisionDown:
	move $a0, $v0
	jal moveTetrimino
	bnez $v0, newTetrimino
	j loop
	
	skipMovement:
	j loop
	
	li $v0, 10
	syscall
	
.include "rotinas.asm"
