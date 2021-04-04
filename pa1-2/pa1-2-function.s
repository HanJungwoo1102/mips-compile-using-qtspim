product:
#-----------------------------------------------------
# Your code "START" here
#-----------------------------------------------------
  addi $sp, $sp, -16                                  # product start-----------------------------------
  sw $ra, 12($sp)
  sw $s2, 8($sp)
  sw $s1, 4($sp)
  sw $s0, 0($sp)

  la $t0, A 
  la $t1, B  
  la $t2, C
  la $t3, DIM
  lw $t3, 0($t3)

  addi $t4, $zero, 1
  beq $a0, $t4, PRODUCT_END 
  move $s0, $zero                               # i = 0

PRODUCT_FOR_1:
  slt $t4, $s0, $t3
  beq $t4, $zero, PRODUCT_FOR_1_END
  move $s1, $zero                               # j = 0

PRODUCT_FOR_2:
  slt $t4, $s1, $t3
  beq $t4, $zero, PRODUCT_FOR_2_END
  move $s2, $zero                               # k = 0

PRODUCT_FOR_3:
  slt $t4, $s2, $t3
  beq $t4, $zero, PRODUCT_FOR_3_END

  mult $s0, $t3
  mflo $t4
  add $t4, $t4, $s2                             
  sll $t4, $t4, 2
  add $t4, $t4, $t0                             # t4 = A + (DIM * i + k) * 4
  lw $t4, 0($t4)       

  mult $s2, $t3
  mflo $t5
  add $t5, $t5, $s1                             
  sll $t5, $t5, 2
  add $t5, $t5, $t1                             # t5 = B + (DIM * k + j) * 4
  lw $t5, 0($t5)    

  mult $t4, $t5                                 # t4 = t4 * t5
  mflo $t4

  mult $s0, $t3
  mflo $t6
  add $t6, $t6, $s1                             
  sll $t6, $t6, 2
  add $t6, $t6, $t2                             # t6 = C + (DIM * i + j) * 4
  lw $t5, 0($t6)                                # t5 = C[t6]

  add $t4, $t4, $t5                             # t4 = t4 + t5
  sw $t4, 0($t6)                                # C[t6] = t4

  addi $s2, $s2, 1
  j PRODUCT_FOR_3

PRODUCT_FOR_3_END:
  addi $s1, $s1, 1
  j PRODUCT_FOR_2

PRODUCT_FOR_2_END:
  addi $s0, $s0, 1
  j PRODUCT_FOR_1

PRODUCT_FOR_1_END:
  move $s0, $zero                               # i = 0

PRODUCT_FOR_4:
  slt $t4, $s0, $t3
  beq $t4, $zero, PRODUCT_FOR_4_END
  move $s1, $zero                               # j = 0

PRODUCT_FOR_5:
  slt $t4, $s1, $t3
  beq $t4, $zero, PRODUCT_FOR_5_END

  mult $s0, $t3
  mflo $t4
  add $t4, $t4, $s1                             
  sll $t4, $t4, 2
  add $t4, $t4, $t1                             # t4 = B + (DIM * i + j) * 4

  mult $s0, $t3
  mflo $t0
  add $t0, $t0, $s1                             
  sll $t0, $t0, 2
  add $t0, $t0, $t2                             # t0 = C + (DIM * i + j) * 4
  lw $t5, 0($t0)                                # t5 = C[t0]

  sw $t5, 0($t4)
  sw $zero, 0($t0)                            

  addi $s1, $s1, 1
  j PRODUCT_FOR_5

PRODUCT_FOR_5_END:
  addi $s0, $s0, 1
  j PRODUCT_FOR_4

PRODUCT_FOR_4_END:
  addi  $a0, $a0, -1 
  jal product

PRODUCT_END:
  lw $s0, 0($sp)
  lw $s1, 4($sp)
  lw $s2, 8($sp)
  lw $ra, 12($sp)
  addi $sp, $sp, 16
#-----------------------------------------------------
# Your code "END" here
#-----------------------------------------------------
jr  $ra                                               # product end-----------------------------------

printResult:
#-----------------------------------------------------
# Your code "START" here
#-----------------------------------------------------
  addi $sp, $sp, -8                             
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
jr  $ra