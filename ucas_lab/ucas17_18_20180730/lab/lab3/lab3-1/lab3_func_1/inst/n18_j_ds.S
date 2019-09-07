#include <asm.h>
#include <regdef.h>
#include <inst_test.h>

LEAF(n18_j_ds_test)
    .set noreorder
    lui  s0, 0x1200
    li  s2, 0x00
###test inst
    TEST_J_DS(lui,   t0,0x8002)
    TEST_J_DS(addiu, t1, t0, 0x8123)
    TEST_J_DS(sw,    t1, 0x7120(t0))
    TEST_J_DS(lw,    t2, 0x7120(t0))
    TEST_J_DS(addu,  t3, t1, t2)
    TEST_J_DS(or,    t9, s1, s2)
    TEST_J_DS(slt,   t8, s2, s3)
    TEST_J_DS(slti,  t7, s2, 0x8011)
    TEST_J_DS(sltiu, t6, s2, 0x8011)
    TEST_J_DS(sll,   t5, s2, 0x11)
###detect exception
    bne s2, zero, inst_error
    nop
###score ++
    addiu s3, s3, 1
    NOP
    NOP
    NOP
###output s0|s3
inst_error:  
    or t0, s0, s3 
    NOP
    NOP
    NOP
    sw t0, 0(s1)
    jr ra
    nop
END(n18_j_ds_test)
