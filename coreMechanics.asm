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

.macro gameLoop
	#s0 -> ponteiro para o display
	#s1 -> posição do tetrimino atual
	#s2 -> tipo do tetrimino atual
	#s3 -> rotação do tetrimino atual
	#s4 -> proximo tetrimino
	#s5 -> pontuação

	
	lui  $s0, 0x1004
	li $s5, 0
	# 4288 -> tetrimino no tetrisboard
	# 4528 -> tetrimino na caixa do proximo tetrimino

	randomTetrimino($s4)
	li $s3, 0

	newTetrimino:
	move $a0, $s0
	jal clearLines

	move $a0, $v1
	jal setScore


	move $s2, $s4
	
	randomTetrimino($s4)
    nop #AQUI
	li $a1, 4528
	clearNextTetrimino($a1)
	move $a0, $s4
	jal drawNewTetrimino ############################## ERRO AQUI

	

	move $a3, $s0
	li $a1, 4288
	move $a0, $s2
	li $s3, 0
	jal drawNewTetrimino
	move $s1, $v1
	bnez $v0, gameOver

	
	loop:
	addu $s5, $s5, 1
	bgtu $s5, 100000, fallTetrimino
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
	
	gameOver:
	la $a0, message_GameOver
	lw $a1, data_score
	li $v0, 56
	syscall
	
	j showMenuLabel
.end_macro

.macro showMenu
	la $a0, message_menu
	li $a1, 1
	li $v0, 55
	syscall

	menuWait:
	lw $t0, 0xffff0000
    andi $t0, $t0, 0x0001
    beqz $t0, menuWait

	lw $t1, 0xffff0004

	beq $t1, 'j', main
	beq $t1, 's', exitGame
	j showMenuLabel
.end_macro


.data
message_menu: .asciiz "\n\nBem-vindo ao Tistre, o Tetris mais triste que tem.\n Pressione uma tecla no MMIO Siumlator:\n\nj - Jogar\ns - Sair\n"
message_GameOver: .asciiz "Você perdeu! Pontuação:\n\n"
data_score: .word 0

message_randomquote0: .asciiz "Tetris: a única coisa que você consegue organizar na vida.\n"
message_randomquote1: .asciiz "Quatro linhas apagadas. Seria ótimo se você pudesse apagar seus erros assim, né?\n"
message_randomquote2: .asciiz "Tetris completo! Agora só falta encaixar essa autoestima aí.\n"
message_randomquote3: .asciiz "Eu passei mais tempo jogando esse jogo do que programando-o. Pense nisso.\n"
message_randomquote4: .asciiz "Se o programador tivesse dedicado tanto esforço nisso quanto você dedicou a jogar, esse jogo até teria uma trilha sonora decente.\n"
message_randomquote5: .asciiz "Tetris completo! E olha, você ainda foi mais consistente que o cronograma das aulas.\n"
message_randomquote6: .asciiz "A boa notícia é que o tempo voa; a má notícia é que você é o piloto, e tá indo direto pro nada.\n"
message_randomquote7: .asciiz "Cada segundo que passa é uma peça que poderia ter sido colocada no lugar, mas aqui estamos nós... apenas perdendo tempo.\n"
message_randomquote8: .asciiz "Tetris completo! E você ainda tem a coragem de reclamar que não tem tempo pra nada.\n"
message_randomquote9: .asciiz "Parabéns pelo tetris! Eu quase desisti de implementar essa função.\n"
message_randomquote10: .asciiz "Boa! Não perca nosso próximo jogo: League of Legends em MIPS ASM.\n"
message_randomquote11: .asciiz "Um dia pode vocês.\n"
message_randomquote12: .asciiz "Quem diria que um dia eu estaria aqui, escrevendo mensagens de parabéns pra quem joga Tetris.\n"
message_randomquote13: .asciiz "Você deletou quatro linhas de uma vez só. Sabe o que isso significa? Exatamente, nada.\n"
message_randomquote14: .asciiz "Uma coisa eu digo: é melhor que programar em Java, viu?\n"
message_randomquote15: .asciiz "Impressionante! Você fez em segundos o que levamos horas para debugar no MARS.\n"
message_randomquote16: .asciiz "Belo tetris! Você ganhou um -li $v0, 4 syscall- pra chamar de seu.\n"
message_randomquote17: .asciiz "Derrubou quatro linhas de uma vez! Nem o Grêmio caiu tantas vezes assim.\n"
message_randomquote18: .asciiz "Quando a fase do Tetris passar, vai fazer o quê da vida? Jogar Minecraft?.\n"
message_randomquote19: .asciiz "É TEEEEETRAAA! É TEEEEETRAAAAAAAAA! É TEEEEEEEEEEETRRRAAAAAAAA!.\n"
message_randomquote20: .asciiz "ANÚNCIO: Vendo Chevette tubarão 77. Interessados chamar inbox.\n"
message_randomquote21: .asciiz "Felizmente, desistimos de programar antes de implementar as microtransações.\n"
message_randomquote22: .asciiz "Obrigado por jogar Tistre! Em breve, no Xbox Game Pass.\n"
message_randomquote23: .asciiz "Não perca nosso próximo jogo: Tistre 2 Electric Boogaloo\n"
message_randomquote24: .asciiz "https://www.youtube.com/watch?v=DmH6YPWhaDY\n"
message_randomquote25: .asciiz "https://www.youtube.com/watch?v=2Hu4w0mt39Y\n"
message_randomquote26: .asciiz "BOOM! TETRIS FOR JEFF!\n"
message_randomquote27: .asciiz "https://www.youtube.com/watch?v=Alw5hs0chj0\n"
message_randomquote28: .asciiz "https://www.youtube.com/watch?v=cb7lRInEa6c\n"
message_randomquote29: .asciiz "Em memória de Jonas Neubauer, 1982-2021.\n"
message_randomquote30: .asciiz "Tistre: Feito com Vim, MIPS ASM, uma calculadora CASIO e muito ódio no coração.\n"
message_randomquote31: .asciiz "Era melhor eu ter feito uma agenda.\n"
message_randomquote32: .asciiz "Não perca nosso próximo jogo: Cyberpunk 2077 em MIPS ASM.\n"
message_randomquote33: .asciiz "Não perca nosso próximo jogo: Minecraft em MIPS ASM.\n"
message_randomquote34: .asciiz "Não perca nosso próximo jogo: Among Us em MIPS ASM.\n"
message_randomquote35: .asciiz "Não perca nosso próximo jogo: Fortnite em MIPS ASM.\n"
message_randomquote36: .asciiz "A vida é como o Tetris: você tenta se encaixar, e então desaparece.\n"
message_randomquote37:  .asciiz "Quando o professor nos disse para usar a pilha, não era isso que ele queria dizer.\n"
message_randomquote38: .asciiz "Ainda não sabemos a diferença de uma linguagem regular e uma linguagem livre de contexto. Mas o Tetris está em dia!\n"
message_randomquote39: .asciiz "Ainda não sabemos resolver conflitos de pipeline. Mas o Tetris está em dia!\n"
message_randomquote40: .asciiz "Ainda não sabemos integrar por partes. Mas o Tetris está em dia!\n"
message_randomquote41: .asciiz "Ainda não sabemos o que é um autômato finito. Mas o Tetris está em dia!\n"
message_randomquote42: .asciiz "Ainda não sabemos aplicar o teste da razão. Mas o Tetris está em dia!\n"
message_randomquote43: .asciiz "Imagina se esse trabalho também fosse no papel? A gente ia ter que entregar um monte de almaço.\n"
message_randomquote44: .asciiz "Na União Soviética, os tetriminos encaixam em VOCÊ!\n"
message_randomquote45: .asciiz "Na União Soviética, o Tetris joga VOCÊ!\n"
message_randomquote46: .asciiz "Isso é tão emocionante! Alexa, toque Linkin Park.\n"
message_randomquote47: .asciiz "Vai com calma, o MARS vai acabar travando.\n"
message_randomquote48: .asciiz "Parabeéns! Não sabemos mais o que escrever aqui.\n"
message_randomquote49: .asciiz "Se você acha que isso é ruim, espera até ver o próximo trabalho.\n"
