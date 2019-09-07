#include <asm.h>
#include <regdef.h>
#include <inst_test.h>

LEAF(n17_bne_ds_test)
    .set noreorder
    lui  s0, 0x1100
    li  s2, 0x00
###test inst
    TEST_BNE_DS(lui,   a0,0x8002)
    TEST_BNE_DS(addiu, a1, a0, 0x8123)
    TEST_BNE_DS(sw,    a1, 0x0120(a0) )
    TEST_BNE_DS(lw,    a2, 0x0120(a0) )
    TEST_BNE_DS(addu,  a3, a1, a2)
    TEST_BNE_DS(or,    t1, s1, s2)
    TEST_BNE_DS(slt,   t2, s2, s3)
    TEST_BNE_DS(slti,  t3, s2, 0x8011)
    TEST_BNE_DS(sltiu, t4, s2, 0x8011)
    TEST_BNE_DS(sll,   t5, s2, 0x11)
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
END(n17_bne_ds_test)
