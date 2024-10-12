keyboardParse:

    li $v0, 0
    li $v1, 0


    lw $t0, 0xffff0000
    andi $t0, $t0, 0x0001
    beqz $t0, endKeyboardParse

    lw $t1, 0xffff0004

    beq $t1, 'a', keyboardParseLeft
    beq $t1, 'd', keyboardParseRight
    beq $t1, 's', keyboardParseDown
    beq $t1, 'w', keyboardParseRotate

    j endKeyboardParse

    keyboardParseLeft:
        li $v1, 0
        li $v0, LEFT
        j endKeyboardParse

    keyboardParseRight:
        li $v1, 0
        li $v0, RIGHT
        j endKeyboardParse

    keyboardParseDown:
        li $v1, 0
        li $v0, DOWN
        j endKeyboardParse

    keyboardParseRotate:
        li $v0, 1
        li $v1, 1
        j endKeyboardParse

    endKeyboardParse:
    jr $ra