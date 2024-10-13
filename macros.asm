# LEMBRE-SE: macros não são funções, cuidado com excesso de repetição no código

# drawHorizontalLine: dada a posição do pixel no display, desenha uma linha horizontal com uma cor e tamanho
.macro drawHorizontalLine(%size, %pos, %color)
	addi $a0, $s0, %pos		# posição
    li   $a1, %color 		# cor
	li   $a2, %size			# tamanho
	
	jal drawLineH
.end_macro

# drawVerticalLine: dada a posição do pixel no display, desenha uma linha vertical com uma cor e tamanho
.macro drawVerticalLine(%size, %pos, %color)
	addi $a0, $s0, %pos		# position
	li   $a1, %color 		# color
	li   $a2, %size			# size
	
	jal drawLineV
.end_macro

.macro randomTetrimino(%register)
    li $a0, 0
    li $a1, 7
    li $v0, 42
    syscall

	move %register, $a0
.end_macro

.macro clearNextTetrimino(%pos)
    move $s7, %pos
    
    add $a0, $s0, $s7
	addi $a0, $a0, -64	          
    jal  deleteBlock                          

    addi $a0, $a0, 32 # 4096 - 32       
    jal  deleteBlock             
    
    addi $a0, $a0, 32       
    jal  deleteBlock  
    
    addi $a0, $a0, 32       
    jal  deleteBlock  

	addi $a0, $a0, 4096	          
    jal  deleteBlock                          

    addi $a0, $a0, -32 # 4096 - 32       
    jal  deleteBlock             
    
    addi $a0, $a0, -32       
    jal  deleteBlock  
    
    addi $a0, $a0, -32       
    jal  deleteBlock  

	addi $a0, $a0, 4096	          
    jal  deleteBlock                          

    addi $a0, $a0, 32 # 4096 - 32       
    jal  deleteBlock             
    
    addi $a0, $a0, 32       
    jal  deleteBlock  
    
    addi $a0, $a0, 32       
    jal  deleteBlock  

		addi $a0, $a0, 4096	          
    jal  deleteBlock                          

    addi $a0, $a0, -32 # 4096 - 32       
    jal  deleteBlock             
    
    addi $a0, $a0, -32       
    jal  deleteBlock  
    
    addi $a0, $a0, -32       
    jal  deleteBlock  
           
.end_macro

.macro printRandomMessage

    li $a0, 0
    li $a1, 50
    li $v0, 42
    syscall

    beq $a0, 0, printRandomMessage0
    beq $a0, 1, printRandomMessage1
    beq $a0, 2, printRandomMessage2
    beq $a0, 3, printRandomMessage3
    beq $a0, 4, printRandomMessage4
    beq $a0, 5, printRandomMessage5
    beq $a0, 6, printRandomMessage6
    beq $a0, 7, printRandomMessage7
    beq $a0, 8, printRandomMessage8
    beq $a0, 9, printRandomMessage9
    beq $a0, 10, printRandomMessage10
    beq $a0, 11, printRandomMessage11
    beq $a0, 12, printRandomMessage12
    beq $a0, 13, printRandomMessage13
    beq $a0, 14, printRandomMessage14
    beq $a0, 15, printRandomMessage15
    beq $a0, 16, printRandomMessage16
    beq $a0, 17, printRandomMessage17
    beq $a0, 18, printRandomMessage18
    beq $a0, 19, printRandomMessage19
    beq $a0, 20, printRandomMessage20
    beq $a0, 21, printRandomMessage21
    beq $a0, 22, printRandomMessage22
    beq $a0, 23, printRandomMessage23
    beq $a0, 24, printRandomMessage24
    beq $a0, 25, printRandomMessage25
    beq $a0, 26, printRandomMessage26
    beq $a0, 27, printRandomMessage27
    beq $a0, 28, printRandomMessage28
    beq $a0, 29, printRandomMessage29
    beq $a0, 30, printRandomMessage30
    beq $a0, 31, printRandomMessage31
    beq $a0, 32, printRandomMessage32
    beq $a0, 33, printRandomMessage33
    beq $a0, 34, printRandomMessage34
    beq $a0, 35, printRandomMessage35
    beq $a0, 36, printRandomMessage36
    beq $a0, 37, printRandomMessage37
    beq $a0, 38, printRandomMessage38
    beq $a0, 39, printRandomMessage39
    beq $a0, 40, printRandomMessage40
    beq $a0, 41, printRandomMessage41
    beq $a0, 42, printRandomMessage42
    beq $a0, 43, printRandomMessage43
    beq $a0, 44, printRandomMessage44
    beq $a0, 45, printRandomMessage45
    beq $a0, 46, printRandomMessage46
    beq $a0, 47, printRandomMessage47
    beq $a0, 48, printRandomMessage48
    beq $a0, 49, printRandomMessage49
    j printRandomMessage0

    printRandomMessage0:
    la $a0, message_randomquote0
    j endPrintRandomMessage

    printRandomMessage1:
    la $a0, message_randomquote1
    j endPrintRandomMessage

    printRandomMessage2:
    la $a0, message_randomquote2
    j endPrintRandomMessage

    printRandomMessage3:
    la $a0, message_randomquote3
    j endPrintRandomMessage

    printRandomMessage4:
    la $a0, message_randomquote4
    j endPrintRandomMessage

    printRandomMessage5:
    la $a0, message_randomquote5
    j endPrintRandomMessage

    printRandomMessage6:
    la $a0, message_randomquote6
    j endPrintRandomMessage

    printRandomMessage7:
    la $a0, message_randomquote7
    j endPrintRandomMessage

    printRandomMessage8:
    la $a0, message_randomquote8
    j endPrintRandomMessage

    printRandomMessage9:
    la $a0, message_randomquote9
    j endPrintRandomMessage

    printRandomMessage10:
    la $a0, message_randomquote10
    j endPrintRandomMessage

    printRandomMessage11:
    la $a0, message_randomquote11
    j endPrintRandomMessage

    printRandomMessage12:
    la $a0, message_randomquote12
    j endPrintRandomMessage

    printRandomMessage13:
    la $a0, message_randomquote13
    j endPrintRandomMessage

    printRandomMessage14:
    la $a0, message_randomquote14
    j endPrintRandomMessage

    printRandomMessage15:
    la $a0, message_randomquote15
    j endPrintRandomMessage

    printRandomMessage16:
    la $a0, message_randomquote16
    j endPrintRandomMessage

    printRandomMessage17:
    la $a0, message_randomquote17
    j endPrintRandomMessage

    printRandomMessage18:
    la $a0, message_randomquote18
    j endPrintRandomMessage

    printRandomMessage19:
    la $a0, message_randomquote19
    j endPrintRandomMessage

    printRandomMessage20:
    la $a0, message_randomquote20
    j endPrintRandomMessage

    printRandomMessage21:
    la $a0, message_randomquote21
    j endPrintRandomMessage

    printRandomMessage22:
    la $a0, message_randomquote22
    j endPrintRandomMessage

    printRandomMessage23:
    la $a0, message_randomquote23
    j endPrintRandomMessage

    printRandomMessage24:
    la $a0, message_randomquote24
    j endPrintRandomMessage

    printRandomMessage25:
    la $a0, message_randomquote25
    j endPrintRandomMessage

    printRandomMessage26:
    la $a0, message_randomquote26
    j endPrintRandomMessage

    printRandomMessage27:
    la $a0, message_randomquote27
    j endPrintRandomMessage

    printRandomMessage28:
    la $a0, message_randomquote28
    j endPrintRandomMessage

    printRandomMessage29:
    la $a0, message_randomquote29
    j endPrintRandomMessage

    printRandomMessage30:
    la $a0, message_randomquote30
    j endPrintRandomMessage

    printRandomMessage31:
    la $a0, message_randomquote31
    j endPrintRandomMessage

    printRandomMessage32:
    la $a0, message_randomquote32
    j endPrintRandomMessage

    printRandomMessage33:
    la $a0, message_randomquote33
    j endPrintRandomMessage

    printRandomMessage34:
    la $a0, message_randomquote34
    j endPrintRandomMessage

    printRandomMessage35:
    la $a0, message_randomquote35
    j endPrintRandomMessage

    printRandomMessage36:
    la $a0, message_randomquote36
    j endPrintRandomMessage

    printRandomMessage37:
    la $a0, message_randomquote37
    j endPrintRandomMessage

    printRandomMessage38:
    la $a0, message_randomquote38
    j endPrintRandomMessage

    printRandomMessage39:
    la $a0, message_randomquote39
    j endPrintRandomMessage

    printRandomMessage40:
    la $a0, message_randomquote40
    j endPrintRandomMessage

    printRandomMessage41:
    la $a0, message_randomquote41
    j endPrintRandomMessage

    printRandomMessage42:
    la $a0, message_randomquote42
    j endPrintRandomMessage

    printRandomMessage43:
    la $a0, message_randomquote43
    j endPrintRandomMessage

    printRandomMessage44:
    la $a0, message_randomquote44
    j endPrintRandomMessage

    printRandomMessage45:
    la $a0, message_randomquote45
    j endPrintRandomMessage

    printRandomMessage46:
    la $a0, message_randomquote46
    j endPrintRandomMessage

    printRandomMessage47:
    la $a0, message_randomquote47
    j endPrintRandomMessage

    printRandomMessage48:
    la $a0, message_randomquote48
    j endPrintRandomMessage

    printRandomMessage49:
    la $a0, message_randomquote49
    j endPrintRandomMessage

endPrintRandomMessage:
    li $v0, 4
    syscall
.end_macro