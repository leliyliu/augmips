#include <asm.h>
#include <regdef.h>
#include <inst_test.h>

LEAF(n19_jal_ds_test)
    .set noreorder
    lui  s0, 0x1300
    li  s2, 0x00
###test inst
###detect exception
    bne s2, zero, inst_error
    TEST_JAL_DS(lui,   a3,0x8002)
    TEST_JAL_DS(addiu, a2, a3, 0x8123)
    TEST_JAL_DS(sw,    a2, -0x6120(a3))
    TEST_JAL_DS(lw,    a1, -0x6120(a3))
    TEST_JAL_DS(addu,  a0, a2, a1)
    TEST_JAL_DS(or,    t4, s1, s2)
    TEST_JAL_DS(slt,   t5, s2, s3)
    TEST_JAL_DS(slti,  t6, s2, 0x8011)
    TEST_JAL_DS(sltiu, t7, s2, 0x8011)
    TEST_JAL_DS(sll,   t8, s2, 0x11)
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
END(n19_jal_ds_test)
