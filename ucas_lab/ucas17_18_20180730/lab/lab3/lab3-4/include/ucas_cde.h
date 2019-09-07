
/*************************************************************************
    > Filename: ucas_cde.h
    > Author: xingjinzhang
    > Mail: xingjinzhang@loongson.cn
    > Date: 2017-09-24
 ************************************************************************/

//soc confreg
#define CONFREG_NULL            0xffff8ffc

#define CONFREG_CR0             0xffff8000
#define CONFREG_CR1             0xffff8004
#define CONFREG_CR2             0xffff8008
#define CONFREG_CR3             0xffff800c
#define CONFREG_CR4             0xffff8010
#define CONFREG_CR5             0xffff8014
#define CONFREG_CR6             0xffff8018
#define CONFREG_CR7             0xffff801c

#define UART_ADDR               0xfffffff0
#define SIMU_FLAG_ADDR          0xfffffff4
#define OPEN_TRACE_ADDR         0xfffffff8
#define NUM_MONITOR_ADDR        0xfffffffc
#define LED_ADDR                0xfffff000
#define LED_RG0_ADDR            0xfffff004
#define LED_RG1_ADDR            0xfffff008
#define NUM_ADDR                0xfffff010

//#define disable_trace_cmp  *((volatile int *)OPEN_TRACE_ADDR) = 0; \
//                           *((volatile int *)CONFREG_NULL   ) = 0; \
//                           *((volatile int *)CONFREG_NULL   ) = 0
//#define enable_trace_cmp   *((volatile int *)OPEN_TRACE_ADDR) = 1; \
//                           *((volatile int *)CONFREG_NULL   ) = 0; \
                           *((volatile int *)CONFREG_NULL   ) = 0
#define trace_cmp_flag     *((volatile int *)OPEN_TRACE_ADDR)
#define disable_trace_cmp  asm volatile( \
                               ".set noreorder;" \
                               "sw $0,-0x7004($0)\n\t" \
                               "sw $0,-0x7004($0)\n\t" \
                               "sw $0,-8($0)\n\t" \
                               "sw $0,-0x7004($0)\n\t" \
                               "sw $0,-0x7004($0)\n\t" \
                               ".set reorder" \
                               )
#define enable_trace_cmp  asm volatile( \
                               "addiu $25, $0, 0x1\n\t" \
                               ".set noreorder;" \
                               "sw $0,-0x7004($0)\n\t" \
                               "sw $0,-0x7004($0)\n\t" \
                               "sw $25,-8($0)\n\t" \
                               "sw $0,-0x7004($0)\n\t" \
                               "sw $0,-0x7004($0)\n\t" \
                               ".set reorder" \
                               :::"$25" \
                               )
                               
#define write_confreg_cr(num,data) *((volatile int *)(CONFREG_CR0+4*num)) = data
#define read_confreg_cr(num,data) data=*((volatile int *)(CONFREG_CR0+4*num))
#define NOP  addu zero, zero, zero
#define LI(reg, imm) \
    lui reg , ((imm>>16) + (imm&0x00008000)>>15)&0x0000ffff; \
    NOP; \
    NOP; \
    NOP; \
    addiu reg, reg, (imm & 0x0000ffff)


