        .text
        .globl  main

main:
        ori      $t1, $t2, 0x6F       # put bit pattern into register $t1
        sll      $t2, $t1, 2          # shift left logical by two
        li       $t3, 2
        sllv     $t4, $t1, $t3         # shift left logical by two
