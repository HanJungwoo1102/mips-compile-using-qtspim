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
  addi $sp, $sp, -8
  sw $s1, 4($sp)
  sw $s0, 0($sp)

  la $t0, B  
  la $t1, DIM

  move $s0, $zero                               # i = 0
  slt $t2, $s0, $t1                             # t2 = i < DIM
  bne $t2, $zero, PRINE_FOR_1_END

  move $s1, $zero                               # j = 0
  slt $t2, $s1, $t1                             # t2 = j < DIM
  bne $t2, $zero, PRINE_FOR_2_END


PRINE_FOR_2_END:
  li $v0, 4
  la $a0, ENTER
  syscall		                  # printf("\n")
PRINE_FOR_1_END:

  lw $s0, 0($sp)
  lw $s1, 4($sp)
  addi $sp, $sp, 8
#-----------------------------------------------------
# Your code "END" here
#-----------------------------------------------------
jr  $ra