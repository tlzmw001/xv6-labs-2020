# Initial process that execs /init.
# This code runs in user space.

#include "syscall.h"

# exec(init, argv)
.globl start
start:
        la a0, init      # 将init中的地址加载到a0，a0用于存放返回值
        la a1, argv      # argv中的地址加载到a1
        li a7, SYS_exec  # exec系统调用对应的数字加载到a7
        ecall            # 将控制权交给操作系统

# for(;;) exit();
exit:
        li a7, SYS_exit
        ecall
        jal exit

# char init[] = "/init\0";
init:
  .string "/init\0"

# char *argv[] = { init, 0 };
.p2align 2
argv:
  .long init
  .long 0
