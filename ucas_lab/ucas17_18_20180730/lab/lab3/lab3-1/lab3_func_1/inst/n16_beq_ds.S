#include <asm.h>
#include <regdef.h>
#include <inst_test.h>

LEAF(n16_beq_ds_test)
    .set noreorder
    lui  s0, 0x1000
    li  s2, 0x00
###test inst
    TEST_BEQ_DS(lui,   t0,0x8002)
    TEST_BEQ_DS(addiu, t1, t0, 0x8123)
    TEST_BEQ_DS(sw,    t1, -0x7120(t0))
    TEST_BEQ_DS(lw,    t2, -0x7120(t0))
    TEST_BEQ_DS(addu,  t3, t1, t2)
    TEST_BEQ_DS(or,    t4, s1, s2)
    TEST_BEQ_DS(slt,   t5, s2, s3)
    TEST_BEQ_DS(slti,  t6, s2, 0x8011)
    TEST_BEQ_DS(sltiu, t7, s2, 0x8011)
    TEST_BEQ_DS(sll,   t8, s2, 0x11)
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
END(n16_beq_ds_test)
