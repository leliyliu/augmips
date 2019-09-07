#include <asm.h>
#include <regdef.h>
#include <inst_test.h>

LEAF(n20_jr_ds_test)
    .set noreorder
    lui  s0, 0x1400
    li  s2, 0x00
###test inst
    TEST_JR_DS(lui,   t0,0x8002)
    TEST_JR_DS(addiu, t1, t0, 0x8123)
    TEST_JR_DS(sw,    t1, -0x7120(t0))
    TEST_JR_DS(lw,    t2, -0x7120(t0))
    TEST_JR_DS(addu,  t3, t1, t2)
    TEST_JR_DS(or,    t4, s1, s2)
    TEST_JR_DS(slt,   t5, s2, s3)
    TEST_JR_DS(slti,  t6, s2, 0x8011)
    TEST_JR_DS(sltiu, t7, s2, 0x8011)
    TEST_JR_DS(sll,   t8, s2, 0x11)
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
END(n20_jr_ds_test)
