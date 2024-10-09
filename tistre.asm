.include "macros.asm"
.include "rotinas.asm"
.include "definicoes.asm"

.text
main:
	lui  $s0, 0x1004						# endereço do display
	drawHorizontalLine(10, 0, 0xffffff)
	
	li $v0, 10
	syscall