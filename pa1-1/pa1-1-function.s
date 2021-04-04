GCD:
#-----------------------------------------------------
# Your code "START" here
#-----------------------------------------------------
addi $sp, $sp, -8
sw $s1, 4($sp)
sw $s0, 0($sp)
slt $t0, $a0, $a1
bne $t0, $zero, PA1_1_GCD_IF_ELSE         # if not (n < m) -> else
add $s1, $a0, $zero                       # j = n
j PA1_1_GCD_IF_EXIT

PA1_1_GCD_IF_ELSE:
add $s1, $a1, $zero                       # j = m

PA1_1_GCD_IF_EXIT:
add $s0, $s1, $zero                       # i = j

PA1_1_GCD_FOR:
slt $t0, $zero, $s0
beq $t0, $zero, PA1_1_GCD_FOR_EXIT        # if (0 < i)
div $a0, $s0                              
mfhi $t0                                  # $t0 = n % i
bne $t0, $zero PA1_1_GCD_IF_EXIT_2                           
div $a1, $s0
mfhi $t0                                  # $t0 = m % i
bne $t0, $zero PA1_1_GCD_IF_EXIT_2    
add $v0, $s0, $zero                       # ret = i
j PA1_1_GCD_FOR_EXIT                      # break

PA1_1_GCD_IF_EXIT_2:
addi $s0, $s0, -1                         # i += -1
j PA1_1_GCD_FOR

PA1_1_GCD_FOR_EXIT:
lw $s0, 0($sp)
lw $s1, 4($sp)
addi $sp, $sp, 8
#-----------------------------------------------------
# Your code "END" here
#-----------------------------------------------------
jr  $ra

LCM:
#-----------------------------------------------------
# Your code "START" here
#-----------------------------------------------------
addi $sp, $sp, -8
sw $s1, 4($sp)
sw $s0, 0($sp)
slt $t0, $a1, $a0
bne $t0, $zero, PA1_1_LCM_IF_ELSE         # if not (n > m) -> else 로
add $s1, $a0, $zero                       # j = n
j PA1_1_LCM_IF_EXIT

PA1_1_LCM_IF_ELSE:
add $s1, $a1, $zero                       # j = m

PA1_1_LCM_IF_EXIT:
add $s0, $s1, $zero                       # i = j

PA1_1_LCM_FOR:
div $s0, $a0                              
mfhi $t0                                  # $t0 = i % n
bne $t0, $zero PA1_1_GCD_IF_EXIT_2                           
div $s0, $a1
mfhi $t0                                  # $t0 = i % m
bne $t0, $zero PA1_1_GCD_IF_EXIT_2    
add $v0, $s0, $zero                       # ret = i
j PA1_1_LCM_FOR_EXIT                      # break

PA1_1_LCM_IF_EXIT_2:
add $s0, $s0, $s1                         # i += j
j PA1_1_LCM_FOR

PA1_1_LCM_FOR_EXIT:
lw $s0, 0($sp)
lw $s1, 4($sp)
addi $sp, $sp, 8
#-----------------------------------------------------
# Your code "END" here
#-----------------------------------------------------
jr  $ra