clearLines:
    addi $sp, $sp, -36

    sw $s0, 0($sp)
    sw $s1, 4($sp)
    sw $s2, 8($sp)
    sw $s3, 12($sp)
    sw $s4, 16($sp)
    sw $s5, 20($sp)
    sw $s6, 24($sp)
    sw $s7, 28($sp)
    sw $ra, 32($sp)

    move $s0, $a0
    addi $s0, $s0, 8224 #4096+32
    move $s3, $s0

    li $s6, 0
    li $s1, 19
    li $s4, 0

    clearLinesLoop:
        li $s2, 10
        clearLinesInnerLoop:
            move $a0, $s0
            jal collisionCheck
            add $s4, $s4, $v0 
            li $v0, 0
            addi $s2, $s2, -1
            addi $s0, $s0, 32
            bgt $s2, $zero, clearLinesInnerLoop 
        bne $s4, 10, skipDeleteLine

        move $a0, $s3
        move $a1, $s1
        addi $s6, $s6, 1
        jal deleteLines

        skipDeleteLine:
        li $v0, 0
        li $s4, 0
        addi $s3, $s3, 4096
        move $s0, $s3
        addi $s1, $s1, -1
        bgt $s1, $zero, clearLinesLoop
        
    clearLinesEnd:
        mul $v0, $s6, 100 #SE DER PRA BREACAR, BRECA AQUI

        lw $ra, 32($sp)
        lw $s7, 28($sp)
        lw $s6, 24($sp)
        lw $s5, 20($sp)
        lw $s4, 16($sp)
        lw $s3, 12($sp)
        lw $s2, 8($sp)
        lw $s1, 4($sp)
        lw $s0, 0($sp)

        addi $sp, $sp, 36

        jr $ra

deleteLines:
    addi $sp, $sp, -36

    sw $s0, 0($sp)
    sw $s1, 4($sp)
    sw $s2, 8($sp)
    sw $s3, 12($sp)
    sw $s4, 16($sp)
    sw $s5, 20($sp)
    sw $s6, 24($sp)
    sw $s7, 28($sp)
    sw $ra, 32($sp)
    sw   $ra, 0($sp)

    move $s0, $a0
    move $s1, $a1

    deleteLinesLoop:
    li $s5, 10
    deleteLinesInnerLoop:
        move $a0, $s0
        jal copyBlockFromAbove
        addi $s0, $s0, 32
        addi $s5, $s5, -1
        bgt $s5, $zero, deleteLinesInnerLoop
    addi $s1, $s1, 1
    addi $s0, $s0, -320
    addi $s0, $s0, -4096
    blt $s1, 19, deleteLinesLoop

    lw $ra, 32($sp)
    lw $s7, 28($sp)
    lw $s6, 24($sp)
    lw $s5, 20($sp)
    lw $s4, 16($sp)
    lw $s3, 12($sp)
    lw $s2, 8($sp)
    lw $s1, 4($sp)
    lw $s0, 0($sp)

    addi $sp, $sp, 36

    jr $ra


copyBlockFromAbove:
    addi $sp, $sp, -12
    sw   $s0, 0($sp)
    sw   $s1, 4($sp)
    sw   $ra, 8($sp)


    move $s0, $a0
    move $s1, $a0
    addi $s1, $s1, -4096
    
    move $a0, $s0
    lw $a1, 0($s1)
    lw $t0, 0($s0)
    beq $a1, $t0, skipDrawing
    jal drawBlock

    skipDrawing:
    move $a0, $s1
    jal deleteBlock

    lw $ra, 8($sp)
    lw $s1, 4($sp)
    lw $s0, 0($sp)
    addi $sp, $sp, 12
    jr $ra
    
