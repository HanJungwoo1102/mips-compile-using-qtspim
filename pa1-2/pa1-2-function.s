product:
#-----------------------------------------------------
# Your code "START" here
#-----------------------------------------------------
  addi $sp, $sp, -12
  sw $s2, 8($sp)
  sw $s1, 4($sp)
  sw $s0, 0($sp)

  la $t0, A 
  la $t1, B  
  la $t2, C
  la $t3, DIM
  la $t4, N

  lw $s0, 0($sp)
  lw $s1, 4($sp)
  lw $s2, 8($sp)
  addi $sp, $sp, 12
#-----------------------------------------------------
# Your code "END" here
#-----------------------------------------------------
jr  $ra

printResult:
#-----------------------------------------------------
# Your code "START" here
#-----------------------------------------------------
  addi $sp, $sp, -8                             # print result start-----------------------------------
  sw $s1, 4($sp)
  sw $s0, 0($sp)

  la $t0, B
  la $t1, DIM
  lw $t1, 0($t1)  

  move $s0, $zero                               # i = 0

PRINE_FOR_1:
  slt $t2, $s0, $t1                             # t2 = i < DIM
  beq $t2, $zero, PRINE_FOR_1_END
  move $s1, $zero                               # j = 0

PRINE_FOR_2:
  slt $t2, $s1, $t1                             # t2 = j < DIM
  beq $t2, $zero, PRINE_FOR_2_END

  mult $s0, $t1
  mflo $t2                                      # t2 = DIM x i
  add $t2, $t2, $s1                             # t2 = t2 + j
  sll $t2, $t2, 2                               # t2 = t2 x 4
  add $t2, $t2, $t0                             # t2 = t2 + B
  li $v0, 1
  lw $a0, 0($t2)                                # a0 = B[t2]
  syscall		                  # printf("%d", B[i][j])
  li $v0, 4
  la $a0, SPACE
  syscall		                  # printf("\t")
  addi $s1, $s1, 1            # j += 1
  j PRINE_FOR_2
PRINE_FOR_2_END:
  li $v0, 4
  la $a0, ENTER
  syscall		                  # printf("\n")
  addi $s0, $s0, 1            # i += 1
  j PRINE_FOR_1
PRINE_FOR_1_END:

  lw $s0, 0($sp)
  lw $s1, 4($sp)
  addi $sp, $sp, 8
#-----------------------------------------------------
# Your code "END" here
#-----------------------------------------------------
jr  $ra         # print result end-----------------------------------