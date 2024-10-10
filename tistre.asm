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
	lui  $s0, 0x1004					# endereço do display
	drawHorizontalLine(131072, 0 ,BLACK)  # limpador de tela vagabundo
	#desenhando o tetrisboard
	drawHorizontalLine(82, 3612, WHITE) # (4096 (uma coluna) - 512 (uma linha)) + 32 - 4 (borda)
	drawVerticalLine(162, 3612, WHITE)
	drawVerticalLine(162, 3936, WHITE)
	drawHorizontalLine(82, 86044, WHITE)
	
	jal randomTetrimino
	
	 li $t0, 10           # Number of blocks in a row
     move $t1, $s0        # Starting position of the row
     addi $t1, $t1, 4096
     addi $t1, $t1, 32
	
	deleteRowLoop:
    move $a0, $t1        # Set the position for deleteBlock
    jal drawBlock      # Call deleteBlock to delete the block at the current position
    addi $t1, $t1, 32    # Move to the next block (8 pixels * 4 bytes per pixel)
    addi $t0, $t0, -1    # Decrement the block counter
    bgt  $t0, 0, deleteRowLoop # Loop until all blocks are deleted
	
	li $v0, 10
	syscall
	
.include "rotinas.asm"
