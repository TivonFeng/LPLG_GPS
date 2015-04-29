///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.1.6676/W32 for ARM       25/Apr/2015  15:48:28
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        G:\test\LPLD_OSKinetis_V3_now02\project\LPLD_OV7670\app\Interface.c
//    Command line =  
//        G:\test\LPLD_OSKinetis_V3_now02\project\LPLD_OV7670\app\Interface.c
//        -D LPLD_K60 -lCN
//        G:\test\LPLD_OSKinetis_V3_now02\project\LPLD_OV7670\iar\FLASH\List\
//        -lB
//        G:\test\LPLD_OSKinetis_V3_now02\project\LPLD_OV7670\iar\FLASH\List\
//        -o G:\test\LPLD_OSKinetis_V3_now02\project\LPLD_OV7670\iar\FLASH\Obj\
//        --no_cse --no_unroll --no_inline --no_code_motion --no_tbaa
//        --no_clustering --no_scheduling --debug --endian=little
//        --cpu=Cortex-M4 -e --fpu=None --dlib_config
//        E:\iar\arm\INC\c\DLib_Config_Normal.h -I
//        G:\test\LPLD_OSKinetis_V3_now02\project\LPLD_OV7670\iar\..\app\ -I
//        G:\test\LPLD_OSKinetis_V3_now02\project\LPLD_OV7670\iar\..\..\..\lib\CPU\
//        -I
//        G:\test\LPLD_OSKinetis_V3_now02\project\LPLD_OV7670\iar\..\..\..\lib\common\
//        -I
//        G:\test\LPLD_OSKinetis_V3_now02\project\LPLD_OV7670\iar\..\..\..\lib\LPLD\
//        -I
//        G:\test\LPLD_OSKinetis_V3_now02\project\LPLD_OV7670\iar\..\..\..\lib\LPLD\HW\
//        -I
//        G:\test\LPLD_OSKinetis_V3_now02\project\LPLD_OV7670\iar\..\..\..\lib\LPLD\DEV\
//        -I
//        G:\test\LPLD_OSKinetis_V3_now02\project\LPLD_OV7670\iar\..\..\..\lib\uCOS-II\Ports\
//        -I
//        G:\test\LPLD_OSKinetis_V3_now02\project\LPLD_OV7670\iar\..\..\..\lib\uCOS-II\Source\
//        -I
//        G:\test\LPLD_OSKinetis_V3_now02\project\LPLD_OV7670\iar\..\..\..\lib\FatFs\
//        -I
//        G:\test\LPLD_OSKinetis_V3_now02\project\LPLD_OV7670\iar\..\..\..\lib\FatFs\option\
//        -I
//        G:\test\LPLD_OSKinetis_V3_now02\project\LPLD_OV7670\iar\..\..\..\lib\USB\common\
//        -I
//        G:\test\LPLD_OSKinetis_V3_now02\project\LPLD_OV7670\iar\..\..\..\lib\USB\driver\
//        -I
//        G:\test\LPLD_OSKinetis_V3_now02\project\LPLD_OV7670\iar\..\..\..\lib\USB\descriptor\
//        -I
//        G:\test\LPLD_OSKinetis_V3_now02\project\LPLD_OV7670\iar\..\..\..\lib\USB\class\
//        -I
//        G:\test\LPLD_OSKinetis_V3_now02\project\LPLD_OV7670\iar\..\..\..\lib\Security\
//        -I
//        G:\test\LPLD_OSKinetis_V3_now02\project\LPLD_OV7670\iar\..\..\..\lib\SQC\
//        -Ol -I E:\iar\arm\CMSIS\Include\ -D ARM_MATH_CM4
//    List file    =  
//        G:\test\LPLD_OSKinetis_V3_now02\project\LPLD_OV7670\iar\FLASH\List\Interface.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN Getpointer_buf
        EXTERN LPLD_GPIO_Init
        EXTERN LPLD_UART_EnableIrq
        EXTERN LPLD_UART_GetChar
        EXTERN LPLD_UART_Init
        EXTERN LPLD_UART_PutChar
        EXTERN SQC_ME3000_GetPib
        EXTERN SQC_ME3000_Recive
        EXTERN SQC_OV7670_Isr
        EXTERN __aeabi_memcpy4
        EXTERN strchr

        PUBLIC gpio_init
        PUBLIC pta_init
        PUBLIC ptb_init
        PUBLIC ptc_init
        PUBLIC ptd_init
        PUBLIC pte_init
        PUBLIC uart0_init_struct
        PUBLIC uart0_isr
        PUBLIC uart1_init_struct
        PUBLIC uart1_isr
        PUBLIC uart2_init_struct
        PUBLIC uart2_isr
        PUBLIC uart3_init_struct
        PUBLIC uart3_isr
        PUBLIC uart4_init_struct
        PUBLIC uart4_isr
        PUBLIC uart5_init_struct
        PUBLIC uart5_isr
        PUBLIC uart_init

// G:\test\LPLD_OSKinetis_V3_now02\project\LPLD_OV7670\app\Interface.c
//    1 /**
//    2  * @file Interface.c
//    3  * @version 1.0[By finley]
//    4  * @date 2015-04-16
//    5  * @brief 接口初始化函数
//    6  *
//    7  *
//    8  * 版权所有:宿迁学院物联网实验室
//    9  * http://www.sqc.edu.cn
//   10  *
//   11  * @par
//   12  * 本代码由宿迁学院[SQC]开发并维护，并向所有使用者开放源代码。
//   13  * 开发者可以随意修使用或改源代码。但本段及以上注释应予以保留。
//   14  * 不得更改或删除原版权所有者姓名，二次开发者可以加注二次版权所有者。
//   15  * 但应在遵守此协议的基础上，开放源代码、不得出售代码本身。
//   16  * 宿迁学院不负责由于使用本代码所带来的任何事故、法律责任或相关不良影响。
//   17  * 宿迁学院无义务解释、说明本代码的具体原理、功能、实现方法。
//   18  * 除非宿迁学院[SQC]授权，开发者不得将本代码用于商业产品。
//   19  */
//   20 
//   21 
//   22 #include "common.h"
//   23 #include "Interface.h"
//   24 #include "SQC_OV7670.h"
//   25 #include "SQC_ME3000.h"
//   26 #include "SQC_UM220.h"
//   27 #include <stdarg.h>
//   28 
//   29 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   30 UART_InitTypeDef uart0_init_struct;
uart0_init_struct:
        DS8 20

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   31 UART_InitTypeDef uart1_init_struct;
uart1_init_struct:
        DS8 20

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   32 UART_InitTypeDef uart2_init_struct;
uart2_init_struct:
        DS8 20

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   33 UART_InitTypeDef uart3_init_struct;
uart3_init_struct:
        DS8 20

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   34 UART_InitTypeDef uart4_init_struct;
uart4_init_struct:
        DS8 20

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   35 UART_InitTypeDef uart5_init_struct;
uart5_init_struct:
        DS8 20
//   36 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   37 GPIO_InitTypeDef pta_init;
pta_init:
        DS8 20

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   38 GPIO_InitTypeDef ptb_init;
ptb_init:
        DS8 20

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   39 GPIO_InitTypeDef ptc_init;
ptc_init:
        DS8 20

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   40 GPIO_InitTypeDef pte_init;
pte_init:
        DS8 20

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   41 GPIO_InitTypeDef ptd_init;
ptd_init:
        DS8 20
//   42     
//   43 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   44 void uart_init(void)
//   45 {
uart_init:
        PUSH     {R7,LR}
//   46 
//   47   
//   48   /*
//   49   UART0   TXD0:PTB17   RXD0:PTB16      USB->UART 
//   50   UART1   TXD1:PTE0    RXD1:PTE1       WIFI
//   51   //UART2   TXD2:PTE0    RXD2:PTE1    
//   52   UART3   TXD3:PTE4    RXD3:PTE5       北斗/GPS
//   53   UART4   TXD4:PTE24   RXD4:PTE25      Zigbee
//   54   UART5   TXD5:PTE8    RXD5:PTE9       GPRS
//   55   */
//   56   /*   init uart0   USB->UART  115200*/
//   57   uart0_init_struct.UART_Uartx = UART0; //使用UART0
        LDR.W    R0,??DataTable7  ;; 0x4006a000
        LDR.W    R1,??DataTable7_1
        STR      R0,[R1, #+0]
//   58   uart0_init_struct.UART_BaudRate = 9600; //设置波特率115200
        MOV      R0,#+9600
        LDR.W    R1,??DataTable7_1
        STR      R0,[R1, #+4]
//   59   uart0_init_struct.UART_RxPin = PTB16;  //接收引脚为PTE16
        MOVS     R0,#+48
        LDR.W    R1,??DataTable7_1
        STRB     R0,[R1, #+9]
//   60   uart0_init_struct.UART_TxPin = PTB17;  //发送引脚为PTE17
        MOVS     R0,#+49
        LDR.W    R1,??DataTable7_1
        STRB     R0,[R1, #+8]
//   61   uart0_init_struct.UART_RxIntEnable = TRUE;    //使能接收中断
        MOVS     R0,#+1
        LDR.W    R1,??DataTable7_1
        STRB     R0,[R1, #+10]
//   62   uart0_init_struct.UART_RxIsr = uart0_isr;      //设置接收中断函数
        ADR.W    R0,uart0_isr
        LDR.W    R1,??DataTable7_1
        STR      R0,[R1, #+12]
//   63   LPLD_UART_Init(uart0_init_struct);//初始化UART 
        LDR.W    R1,??DataTable7_1
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_UART_Init
//   64   LPLD_UART_EnableIrq(uart0_init_struct);//使能UART中断
        LDR.W    R1,??DataTable7_1
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_UART_EnableIrq
//   65   /*   init uart1  WIFI  115200     */
//   66   uart1_init_struct.UART_Uartx = UART1; //使用UART1
        LDR.W    R0,??DataTable7_2  ;; 0x4006b000
        LDR.W    R1,??DataTable7_3
        STR      R0,[R1, #+0]
//   67   uart1_init_struct.UART_BaudRate = 115200; //设置波特率115200
        MOVS     R0,#+115200
        LDR.W    R1,??DataTable7_3
        STR      R0,[R1, #+4]
//   68   uart1_init_struct.UART_RxPin = PTE2;  //接收引脚为PTE2
        MOVS     R0,#+126
        LDR.W    R1,??DataTable7_3
        STRB     R0,[R1, #+9]
//   69   uart1_init_struct.UART_TxPin = PTE0;  //发送引脚为PTE0
        MOVS     R0,#+124
        LDR.W    R1,??DataTable7_3
        STRB     R0,[R1, #+8]
//   70   uart1_init_struct.UART_RxIntEnable = TRUE;    //使能接收中断
        MOVS     R0,#+1
        LDR.W    R1,??DataTable7_3
        STRB     R0,[R1, #+10]
//   71   uart1_init_struct.UART_RxIsr = uart1_isr;      //设置接收中断函数
        ADR.W    R0,uart1_isr
        LDR.W    R1,??DataTable7_3
        STR      R0,[R1, #+12]
//   72   LPLD_UART_Init(uart1_init_struct);//初始化UART 
        LDR.W    R1,??DataTable7_3
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_UART_Init
//   73   LPLD_UART_EnableIrq(uart1_init_struct);//使能UART中断 
        LDR.W    R1,??DataTable7_3
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_UART_EnableIrq
//   74   ////  /*   init uart2  */
//   75   ////  uart2_init_struct.UART_Uartx = UART2; //使用UART2
//   76   ////  uart2_init_struct.UART_BaudRate = 115200; //设置波特率9600
//   77   ////  uart2_init_struct.UART_RxPin = PTE1;  //接收引脚为PTE9
//   78   ////  uart2_init_struct.UART_TxPin = PTE0;  //发送引脚为PTE8
//   79   ////  uart2_init_struct.UART_RxIntEnable = TRUE;    //使能接收中断
//   80   ////  uart2_init_struct.UART_RxIsr = uart2_isr;      //设置接收中断函数
//   81   ////  LPLD_UART_Init(uart2_init_struct);//初始化UART 
//   82   ////  LPLD_UART_EnableIrq(uart2_init_struct);//使能UART中断
//   83   /*   init uart3  北斗/GPS  115200  */
//   84   uart3_init_struct.UART_Uartx = UART3; //使用UART3
        LDR.W    R0,??DataTable7_4  ;; 0x4006d000
        LDR.W    R1,??DataTable7_5
        STR      R0,[R1, #+0]
//   85   uart3_init_struct.UART_BaudRate = 9600; //设置波特率9600
        MOV      R0,#+9600
        LDR.W    R1,??DataTable7_5
        STR      R0,[R1, #+4]
//   86   uart3_init_struct.UART_RxPin = PTE5;  //接收引脚为PTE5
        MOVS     R0,#+129
        LDR.W    R1,??DataTable7_5
        STRB     R0,[R1, #+9]
//   87   uart3_init_struct.UART_TxPin = PTE4;  //发送引脚为PTE4
        MOVS     R0,#+128
        LDR.W    R1,??DataTable7_5
        STRB     R0,[R1, #+8]
//   88   uart3_init_struct.UART_RxIntEnable = TRUE;    //使能接收中断
        MOVS     R0,#+1
        LDR.W    R1,??DataTable7_5
        STRB     R0,[R1, #+10]
//   89   uart3_init_struct.UART_RxIsr = uart3_isr;      //设置接收中断函数
        ADR.W    R0,uart3_isr
        LDR.W    R1,??DataTable7_5
        STR      R0,[R1, #+12]
//   90   LPLD_UART_Init(uart3_init_struct);//初始化UART 
        LDR.W    R1,??DataTable7_5
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_UART_Init
//   91   LPLD_UART_EnableIrq(uart3_init_struct);//使能UART中断
        LDR.W    R1,??DataTable7_5
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_UART_EnableIrq
//   92   /*   init uart4    Zigbee */
//   93   uart4_init_struct.UART_Uartx = UART4; //使用UART4
        LDR.W    R0,??DataTable7_6  ;; 0x400ea000
        LDR.W    R1,??DataTable7_7
        STR      R0,[R1, #+0]
//   94   uart4_init_struct.UART_BaudRate = 115200; //设置波特率115200
        MOVS     R0,#+115200
        LDR.W    R1,??DataTable7_7
        STR      R0,[R1, #+4]
//   95   uart4_init_struct.UART_RxPin = PTE25;  //接收引脚为PTE25
        MOVS     R0,#+149
        LDR.W    R1,??DataTable7_7
        STRB     R0,[R1, #+9]
//   96   uart4_init_struct.UART_TxPin = PTE24;  //发送引脚为PTE24
        MOVS     R0,#+148
        LDR.W    R1,??DataTable7_7
        STRB     R0,[R1, #+8]
//   97   uart4_init_struct.UART_RxIntEnable = TRUE;    //使能接收中断
        MOVS     R0,#+1
        LDR.W    R1,??DataTable7_7
        STRB     R0,[R1, #+10]
//   98   uart4_init_struct.UART_RxIsr = uart4_isr;      //设置接收中断函数
        ADR.W    R0,uart4_isr
        LDR.W    R1,??DataTable7_7
        STR      R0,[R1, #+12]
//   99   LPLD_UART_Init(uart4_init_struct);//初始化UART 
        LDR.W    R1,??DataTable7_7
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_UART_Init
//  100   LPLD_UART_EnableIrq(uart4_init_struct);//使能UART中断
        LDR.W    R1,??DataTable7_7
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_UART_EnableIrq
//  101   /*   init uart5   GPRS  115200 */
//  102   uart5_init_struct.UART_Uartx = UART5; //使用UART5
        LDR.W    R0,??DataTable7_8  ;; 0x400eb000
        LDR.W    R1,??DataTable7_9
        STR      R0,[R1, #+0]
//  103   uart5_init_struct.UART_BaudRate = 115200; //设置波特率115200
        MOVS     R0,#+115200
        LDR.N    R1,??DataTable7_9
        STR      R0,[R1, #+4]
//  104   uart5_init_struct.UART_RxPin = PTE9;  //接收引脚为PTE9
        MOVS     R0,#+133
        LDR.N    R1,??DataTable7_9
        STRB     R0,[R1, #+9]
//  105   uart5_init_struct.UART_TxPin = PTE8;  //发送引脚为PTE8
        MOVS     R0,#+132
        LDR.N    R1,??DataTable7_9
        STRB     R0,[R1, #+8]
//  106   uart5_init_struct.UART_RxIntEnable = TRUE;    //使能接收中断
        MOVS     R0,#+1
        LDR.N    R1,??DataTable7_9
        STRB     R0,[R1, #+10]
//  107   uart5_init_struct.UART_RxIsr = uart5_isr;      //设置接收中断函数
        ADR.W    R0,uart5_isr
        LDR.N    R1,??DataTable7_9
        STR      R0,[R1, #+12]
//  108   LPLD_UART_Init(uart5_init_struct);//初始化UART 
        LDR.N    R1,??DataTable7_9
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_UART_Init
//  109   LPLD_UART_EnableIrq(uart5_init_struct);//使能UART中断
        LDR.N    R1,??DataTable7_9
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_UART_EnableIrq
//  110   
//  111   
//  112 }
        POP      {R0,PC}          ;; return
//  113 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  114 void gpio_init()
//  115 {
gpio_init:
        PUSH     {R7,LR}
//  116   /*
//  117   wrst     PTA6
//  118   rrst     PTA7
//  119   oe       PTA8
//  120   Y0~~Y7   PTA9-16
//  121   RCK      PTA17
//  122   VSYNC    PTA24
//  123   wr       PTA25
//  124   */
//  125   //OV数据口初始化：PTD9~PTD16
//  126   pta_init.GPIO_PTx = PTA;
        LDR.N    R0,??DataTable7_10  ;; 0x400ff000
        LDR.N    R1,??DataTable7_11
        STR      R0,[R1, #+0]
//  127   pta_init.GPIO_Dir = DIR_INPUT;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable7_11
        STRB     R0,[R1, #+12]
//  128   pta_init.GPIO_Pins = GPIO_Pin9_16;
        MOVS     R0,#+130560
        LDR.N    R1,??DataTable7_11
        STR      R0,[R1, #+4]
//  129   // pta_init.GPIO_PinControl = IRQC_DIS | INPUT_PULL_DIS;
//  130   pta_init.GPIO_PinControl = IRQC_DIS | INPUT_PULL_UP;
        MOVS     R0,#+3
        LDR.N    R1,??DataTable7_11
        STR      R0,[R1, #+8]
//  131   LPLD_GPIO_Init(pta_init);
        LDR.N    R1,??DataTable7_11
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_GPIO_Init
//  132   
//  133   pta_init.GPIO_PTx = PTA;
        LDR.N    R0,??DataTable7_10  ;; 0x400ff000
        LDR.N    R1,??DataTable7_11
        STR      R0,[R1, #+0]
//  134   pta_init.GPIO_Dir = DIR_INPUT;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable7_11
        STRB     R0,[R1, #+12]
//  135   pta_init.GPIO_Pins = GPIO_Pin24;
        MOVS     R0,#+16777216
        LDR.N    R1,??DataTable7_11
        STR      R0,[R1, #+4]
//  136   pta_init.GPIO_PinControl = IRQC_RI|INPUT_PULL_DOWN;
        LDR.N    R0,??DataTable7_12  ;; 0x90002
        LDR.N    R1,??DataTable7_11
        STR      R0,[R1, #+8]
//  137   pta_init.GPIO_Isr = SQC_OV7670_Isr;
        LDR.N    R0,??DataTable7_13
        LDR.N    R1,??DataTable7_11
        STR      R0,[R1, #+16]
//  138   LPLD_GPIO_Init(pta_init); 
        LDR.N    R1,??DataTable7_11
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_GPIO_Init
//  139   
//  140   //ov7670_wr   :PTA19
//  141   pta_init.GPIO_PTx = PTA;
        LDR.N    R0,??DataTable7_10  ;; 0x400ff000
        LDR.N    R1,??DataTable7_11
        STR      R0,[R1, #+0]
//  142   pta_init.GPIO_Pins = GPIO_Pin6 |GPIO_Pin7 | GPIO_Pin17  | GPIO_Pin25;
        LDR.N    R0,??DataTable7_14  ;; 0x20200c0
        LDR.N    R1,??DataTable7_11
        STR      R0,[R1, #+4]
//  143   pta_init.GPIO_Dir = OUTPUT_H;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable7_11
        STRB     R0,[R1, #+12]
//  144   pta_init.GPIO_PinControl = IRQC_DIS;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable7_11
        STR      R0,[R1, #+8]
//  145   LPLD_GPIO_Init(pta_init);
        LDR.N    R1,??DataTable7_11
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_GPIO_Init
//  146   
//  147   pta_init.GPIO_PTx = PTA;
        LDR.N    R0,??DataTable7_10  ;; 0x400ff000
        LDR.N    R1,??DataTable7_11
        STR      R0,[R1, #+0]
//  148   pta_init.GPIO_Pins = GPIO_Pin8;
        MOV      R0,#+256
        LDR.N    R1,??DataTable7_11
        STR      R0,[R1, #+4]
//  149   pta_init.GPIO_Dir = OUTPUT_L;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable7_11
        STRB     R0,[R1, #+12]
//  150   pta_init.GPIO_PinControl = IRQC_DIS;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable7_11
        STR      R0,[R1, #+8]
//  151   LPLD_GPIO_Init(pta_init);
        LDR.N    R1,??DataTable7_11
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_GPIO_Init
//  152   
//  153   /*  继电器模块初始化  K1: PTE12    K2:PTE28 */
//  154   pte_init.GPIO_PTx = PTE;
        LDR.N    R0,??DataTable7_15  ;; 0x400ff100
        LDR.N    R1,??DataTable7_16
        STR      R0,[R1, #+0]
//  155   pte_init.GPIO_Pins = GPIO_Pin12 |GPIO_Pin28;
        MOVS     R0,#+268439552
        LDR.N    R1,??DataTable7_16
        STR      R0,[R1, #+4]
//  156   pte_init.GPIO_Dir = OUTPUT_H;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable7_16
        STRB     R0,[R1, #+12]
//  157   pte_init.GPIO_PinControl = IRQC_DIS;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable7_16
        STR      R0,[R1, #+8]
//  158   LPLD_GPIO_Init(pte_init);
        LDR.N    R1,??DataTable7_16
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_GPIO_Init
//  159   
//  160     /*  LED模块初始化  LED1: PTE26    LED2:PTE27 */
//  161   pte_init.GPIO_PTx = PTE;
        LDR.N    R0,??DataTable7_15  ;; 0x400ff100
        LDR.N    R1,??DataTable7_16
        STR      R0,[R1, #+0]
//  162   pte_init.GPIO_Pins = GPIO_Pin26 |GPIO_Pin27;
        MOVS     R0,#+201326592
        LDR.N    R1,??DataTable7_16
        STR      R0,[R1, #+4]
//  163   pte_init.GPIO_Dir = OUTPUT_H;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable7_16
        STRB     R0,[R1, #+12]
//  164   pte_init.GPIO_PinControl = IRQC_DIS;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable7_16
        STR      R0,[R1, #+8]
//  165   LPLD_GPIO_Init(pte_init);
        LDR.N    R1,??DataTable7_16
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_GPIO_Init
//  166   
//  167   
//  168   /* GPRS PTC14 */
//  169   ptc_init.GPIO_PTx = PTC;
        LDR.N    R0,??DataTable7_17  ;; 0x400ff080
        LDR.N    R1,??DataTable7_18
        STR      R0,[R1, #+0]
//  170   ptc_init.GPIO_Pins = GPIO_Pin14 | GPIO_Pin19;
        MOVS     R0,#+540672
        LDR.N    R1,??DataTable7_18
        STR      R0,[R1, #+4]
//  171   ptc_init.GPIO_Dir = OUTPUT_H;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable7_18
        STRB     R0,[R1, #+12]
//  172   ptc_init.GPIO_PinControl = IRQC_DIS;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable7_18
        STR      R0,[R1, #+8]
//  173   LPLD_GPIO_Init(ptc_init);
        LDR.N    R1,??DataTable7_18
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_GPIO_Init
//  174 }
        POP      {R0,PC}          ;; return
//  175 
//  176 /*    uart0  USB->UART中断服务函数    */

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//  177 void uart0_isr(void)
//  178 {
uart0_isr:
        PUSH     {R4,LR}
//  179   int8 recv;
//  180   recv = LPLD_UART_GetChar(UART0);
        LDR.N    R0,??DataTable7  ;; 0x4006a000
        BL       LPLD_UART_GetChar
        MOVS     R4,R0
//  181   LPLD_UART_PutChar(UART0,recv);
        MOVS     R1,R4
        SXTB     R1,R1            ;; SignExt  R1,R1,#+24,#+24
        LDR.N    R0,??DataTable7  ;; 0x4006a000
        BL       LPLD_UART_PutChar
//  182   LPLD_UART_PutChar(UART3,recv);
        MOVS     R1,R4
        SXTB     R1,R1            ;; SignExt  R1,R1,#+24,#+24
        LDR.N    R0,??DataTable7_4  ;; 0x4006d000
        BL       LPLD_UART_PutChar
//  183 }
        POP      {R4,PC}          ;; return
//  184 
//  185 /*    uart1 WIFI中断服务函数    */

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//  186 void uart1_isr(void)
//  187 {
uart1_isr:
        PUSH     {R7,LR}
//  188   int8 recv;
//  189   recv = LPLD_UART_GetChar(UART1);
        LDR.N    R0,??DataTable7_2  ;; 0x4006b000
        BL       LPLD_UART_GetChar
//  190   LPLD_UART_PutChar(UART0, recv);
        MOVS     R1,R0
        SXTB     R1,R1            ;; SignExt  R1,R1,#+24,#+24
        LDR.N    R0,??DataTable7  ;; 0x4006a000
        BL       LPLD_UART_PutChar
//  191   
//  192 }
        POP      {R0,PC}          ;; return
//  193 
//  194 /*    uart2 中断服务函数    */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  195 void uart2_isr(void)
//  196 {
uart2_isr:
        PUSH     {R7,LR}
//  197   int8 recv;
//  198   recv = LPLD_UART_GetChar(UART2);
        LDR.N    R0,??DataTable7_19  ;; 0x4006c000
        BL       LPLD_UART_GetChar
//  199   LPLD_UART_PutChar(UART0, recv);
        MOVS     R1,R0
        SXTB     R1,R1            ;; SignExt  R1,R1,#+24,#+24
        LDR.N    R0,??DataTable7  ;; 0x4006a000
        BL       LPLD_UART_PutChar
//  200 }
        POP      {R0,PC}          ;; return
//  201 
//  202 /*    uart3  北斗/GPS中断服务函数    */

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//  203 void uart3_isr(void)
//  204 {
uart3_isr:
        PUSH     {R4,LR}
//  205   
//  206   uint8 recv;
//  207   struct UM220_BUF *buf;
//  208   buf=Getpointer_buf();
        BL       Getpointer_buf
        MOVS     R4,R0
//  209   recv = LPLD_UART_GetChar(UART3);
        LDR.N    R0,??DataTable7_4  ;; 0x4006d000
        BL       LPLD_UART_GetChar
//  210   
//  211 
//  212 if(buf->gps_HeadFlag==1)
        LDRB     R1,[R4, #+1026]
        CMP      R1,#+1
        BNE.N    ??uart3_isr_0
//  213   {
//  214    buf->gps_Rxbuf[buf->gps_buf_len]=recv;
        LDRH     R1,[R4, #+1024]
        STRB     R0,[R1, R4]
//  215    //LPLD_UART_PutChar(UART0,buf->gps_Rxbuf[buf->gps_buf_len]);
//  216     buf->gps_buf_len++;
        LDRH     R1,[R4, #+1024]
        ADDS     R1,R1,#+1
        STRH     R1,[R4, #+1024]
//  217     if(buf->gps_Rxbuf[buf->gps_buf_len-1]=='\n'
//  218        &&buf->gps_Rxbuf[buf->gps_buf_len-2]=='\r')
        LDRH     R1,[R4, #+1024]
        ADDS     R1,R1,R4
        LDRSB    R1,[R1, #-1]
        CMP      R1,#+10
        BNE.N    ??uart3_isr_0
        LDRH     R1,[R4, #+1024]
        ADDS     R1,R1,R4
        LDRSB    R1,[R1, #-2]
        CMP      R1,#+13
        BNE.N    ??uart3_isr_0
//  219     {
//  220       
//  221       buf->gps_HeadFlag=0;
        MOVS     R1,#+0
        STRB     R1,[R4, #+1026]
//  222       
//  223       
//  224     }
//  225   }
//  226 if(recv=='$')
??uart3_isr_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+36
        BNE.N    ??uart3_isr_1
//  227   {
//  228     buf->gps_HeadFlag=1;
        MOVS     R1,#+1
        STRB     R1,[R4, #+1026]
//  229     buf->gps_buf_len=0;  
        MOVS     R1,#+0
        STRH     R1,[R4, #+1024]
//  230     buf->gps_Rxbuf[buf->gps_buf_len]=recv;
        LDRH     R1,[R4, #+1024]
        STRB     R0,[R1, R4]
//  231     //LPLD_UART_PutChar(UART0,buf->gps_Rxbuf[buf->gps_buf_len]);
//  232     buf->gps_buf_len++;
        LDRH     R0,[R4, #+1024]
        ADDS     R0,R0,#+1
        STRH     R0,[R4, #+1024]
//  233    }
//  234 
//  235 }
??uart3_isr_1:
        POP      {R4,PC}          ;; return
//  236 
//  237 /*    uart4 Zigbee中断服务函数    */

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//  238 void uart4_isr(void)
//  239 {
uart4_isr:
        PUSH     {R7,LR}
//  240   int8 recv;
//  241   recv = LPLD_UART_GetChar(UART4);
        LDR.N    R0,??DataTable7_6  ;; 0x400ea000
        BL       LPLD_UART_GetChar
//  242   LPLD_UART_PutChar(UART0, recv);
        MOVS     R1,R0
        SXTB     R1,R1            ;; SignExt  R1,R1,#+24,#+24
        LDR.N    R0,??DataTable7  ;; 0x4006a000
        BL       LPLD_UART_PutChar
//  243 }
        POP      {R0,PC}          ;; return
//  244 
//  245 /*    uart5  GPRS中断服务函数    */

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//  246 void uart5_isr(void)
//  247 {
uart5_isr:
        PUSH     {R4,LR}
//  248   int8 recv;
//  249   struct _ME3000_PIB * pib;
//  250   pib = SQC_ME3000_GetPib();
        BL       SQC_ME3000_GetPib
        MOVS     R4,R0
//  251   recv = LPLD_UART_GetChar(UART5);
        LDR.N    R0,??DataTable7_8  ;; 0x400eb000
        BL       LPLD_UART_GetChar
//  252   if(recv == '+')
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        CMP      R0,#+43
        BNE.N    ??uart5_isr_0
//  253   {
//  254     pib->Rxflag = 1;
        MOVS     R1,#+1
        STRB     R1,[R4, #+1026]
//  255     pib->Rxlen = 0;
        MOVS     R1,#+0
        STRH     R1,[R4, #+1024]
//  256     pib->Rxbuf[pib->Rxlen] = recv;
        LDRH     R1,[R4, #+1024]
        STRB     R0,[R1, R4]
//  257     pib->Rxlen ++;
        LDRH     R0,[R4, #+1024]
        ADDS     R0,R0,#+1
        STRH     R0,[R4, #+1024]
//  258     return;
        B.N      ??uart5_isr_1
//  259   }
//  260   if(recv == '>' && pib->Rxflag == 0)
??uart5_isr_0:
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        CMP      R0,#+62
        BNE.N    ??uart5_isr_2
        LDRB     R1,[R4, #+1026]
        CMP      R1,#+0
        BNE.N    ??uart5_isr_2
//  261   {
//  262     pib->Rxflag = 3;
        MOVS     R0,#+3
        STRB     R0,[R4, #+1026]
//  263     pib->Rxlen = 0;
        MOVS     R0,#+0
        STRH     R0,[R4, #+1024]
//  264     return;
        B.N      ??uart5_isr_1
//  265   }
//  266   if(pib->Rxflag == 1)
??uart5_isr_2:
        LDRB     R1,[R4, #+1026]
        CMP      R1,#+1
        BNE.N    ??uart5_isr_3
//  267   {
//  268     pib->Rxbuf[pib->Rxlen] = recv;
        LDRH     R1,[R4, #+1024]
        STRB     R0,[R1, R4]
//  269     pib->Rxlen ++;
        LDRH     R0,[R4, #+1024]
        ADDS     R0,R0,#+1
        STRH     R0,[R4, #+1024]
//  270     if(    pib->Rxbuf[pib->Rxlen-1] == 0x0A
//  271         && pib->Rxbuf[pib->Rxlen-2] == 0x0D)
        LDRH     R0,[R4, #+1024]
        ADDS     R0,R0,R4
        LDRB     R0,[R0, #-1]
        CMP      R0,#+10
        BNE.N    ??uart5_isr_4
        LDRH     R0,[R4, #+1024]
        ADDS     R0,R0,R4
        LDRB     R0,[R0, #-2]
        CMP      R0,#+13
        BNE.N    ??uart5_isr_4
//  272         //&& pib->Rxbuf[pib->Rxlen-3] == 0x4B
//  273         //&& pib->Rxbuf[pib->Rxlen-4] == 0x4F)
//  274     {
//  275       pib->Rxbuf[pib->Rxlen] = 0;
        MOVS     R0,#+0
        LDRH     R1,[R4, #+1024]
        STRB     R0,[R1, R4]
//  276       if(strchr(pib->Rxbuf,':') == 0)
        MOVS     R1,#+58
        MOVS     R0,R4
        BL       strchr
        CMP      R0,#+0
        BNE.N    ??uart5_isr_5
//  277       {
//  278         pib->Rxflag =0;
        MOVS     R0,#+0
        STRB     R0,[R4, #+1026]
//  279         pib->Rxlen = 0;
        MOVS     R0,#+0
        STRH     R0,[R4, #+1024]
//  280         return;
        B.N      ??uart5_isr_1
//  281       }
//  282       else
//  283       {
//  284         if(!SQC_ME3000_Recive(pib->Rxbuf,pib->Rxlen))
??uart5_isr_5:
        LDRH     R1,[R4, #+1024]
        MOVS     R0,R4
        BL       SQC_ME3000_Recive
        CMP      R0,#+0
        BNE.N    ??uart5_isr_6
//  285         {
//  286           pib->Rxflag =2;
        MOVS     R0,#+2
        STRB     R0,[R4, #+1026]
//  287           return;
        B.N      ??uart5_isr_1
//  288         }
//  289         else
//  290         {
//  291           pib->Rxflag =0;
??uart5_isr_6:
        MOVS     R0,#+0
        STRB     R0,[R4, #+1026]
//  292           pib->Rxlen = 0;
        MOVS     R0,#+0
        STRH     R0,[R4, #+1024]
//  293           return;
        B.N      ??uart5_isr_1
//  294         }      
//  295       }
//  296     }          
//  297     return;
??uart5_isr_4:
        B.N      ??uart5_isr_1
//  298   }
//  299   
//  300     
//  301   
//  302 }
??uart5_isr_3:
??uart5_isr_1:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7:
        DC32     0x4006a000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_1:
        DC32     uart0_init_struct

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_2:
        DC32     0x4006b000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_3:
        DC32     uart1_init_struct

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_4:
        DC32     0x4006d000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_5:
        DC32     uart3_init_struct

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_6:
        DC32     0x400ea000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_7:
        DC32     uart4_init_struct

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_8:
        DC32     0x400eb000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_9:
        DC32     uart5_init_struct

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_10:
        DC32     0x400ff000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_11:
        DC32     pta_init

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_12:
        DC32     0x90002

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_13:
        DC32     SQC_OV7670_Isr

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_14:
        DC32     0x20200c0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_15:
        DC32     0x400ff100

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_16:
        DC32     pte_init

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_17:
        DC32     0x400ff080

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_18:
        DC32     ptc_init

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_19:
        DC32     0x4006c000

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  303 
//  304 
// 
//   220 bytes in section .bss
// 1 260 bytes in section .text
// 
// 1 260 bytes of CODE memory
//   220 bytes of DATA memory
//
//Errors: none
//Warnings: 1
