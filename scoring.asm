setScore:
    move $t0, $a0

    beq $t0, 0, endSetScore
    beq $t0, 1, scoreSingle
    beq $t0, 2, scoreDouble
    beq $t0, 3, scoreTriple
    beq $t0, 4, scoreTetris
    j endSetScore

    scoreSingle:
    lw $t0, data_score
    addi $t0, $t0, 100
    sw $t0, data_score

    j endSetScore

    scoreDouble:
    lw $t0, data_score
    addi $t0, $t0, 300
    sw $t0, data_score

    j endSetScore

    scoreTriple:
    lw $t0, data_score
    addi $t0, $t0, 500
    sw $t0, data_score

    j endSetScore

    scoreTetris:
    lw $t0, data_score
    addi $t0, $t0, 800
    sw $t0, data_score
    printRandomMessage
    j endSetScore

    endSetScore:
    jr $ra