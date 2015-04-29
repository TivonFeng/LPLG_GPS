///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.1.6676/W32 for ARM       18/Apr/2015  17:35:27
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        D:\projects\LPLD_OSKinetis_V3_now02\project\LPLD_OV7670\app\uart.c
//    Command line =  
//        D:\projects\LPLD_OSKinetis_V3_now02\project\LPLD_OV7670\app\uart.c -D
//        LPLD_K60 -lCN
//        D:\projects\LPLD_OSKinetis_V3_now02\project\LPLD_OV7670\iar\FLASH\List\
//        -lB
//        D:\projects\LPLD_OSKinetis_V3_now02\project\LPLD_OV7670\iar\FLASH\List\
//        -o
//        D:\projects\LPLD_OSKinetis_V3_now02\project\LPLD_OV7670\iar\FLASH\Obj\
//        --no_cse --no_unroll --no_inline --no_code_motion --no_tbaa
//        --no_clustering --no_scheduling --debug --endian=little
//        --cpu=Cortex-M4 -e --fpu=None --dlib_config "C:\Program Files
//        (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\INC\c\DLib_Config_Normal.h" -I
//        D:\projects\LPLD_OSKinetis_V3_now02\project\LPLD_OV7670\iar\..\app\
//        -I
//        D:\projects\LPLD_OSKinetis_V3_now02\project\LPLD_OV7670\iar\..\..\..\lib\CPU\
//        -I
//        D:\projects\LPLD_OSKinetis_V3_now02\project\LPLD_OV7670\iar\..\..\..\lib\common\
//        -I
//        D:\projects\LPLD_OSKinetis_V3_now02\project\LPLD_OV7670\iar\..\..\..\lib\LPLD\
//        -I
//        D:\projects\LPLD_OSKinetis_V3_now02\project\LPLD_OV7670\iar\..\..\..\lib\LPLD\HW\
//        -I
//        D:\projects\LPLD_OSKinetis_V3_now02\project\LPLD_OV7670\iar\..\..\..\lib\LPLD\DEV\
//        -I
//        D:\projects\LPLD_OSKinetis_V3_now02\project\LPLD_OV7670\iar\..\..\..\lib\uCOS-II\Ports\
//        -I
//        D:\projects\LPLD_OSKinetis_V3_now02\project\LPLD_OV7670\iar\..\..\..\lib\uCOS-II\Source\
//        -I
//        D:\projects\LPLD_OSKinetis_V3_now02\project\LPLD_OV7670\iar\..\..\..\lib\FatFs\
//        -I
//        D:\projects\LPLD_OSKinetis_V3_now02\project\LPLD_OV7670\iar\..\..\..\lib\FatFs\option\
//        -I
//        D:\projects\LPLD_OSKinetis_V3_now02\project\LPLD_OV7670\iar\..\..\..\lib\USB\common\
//        -I
//        D:\projects\LPLD_OSKinetis_V3_now02\project\LPLD_OV7670\iar\..\..\..\lib\USB\driver\
//        -I
//        D:\projects\LPLD_OSKinetis_V3_now02\project\LPLD_OV7670\iar\..\..\..\lib\USB\descriptor\
//        -I
//        D:\projects\LPLD_OSKinetis_V3_now02\project\LPLD_OV7670\iar\..\..\..\lib\USB\class\
//        -I
//        D:\projects\LPLD_OSKinetis_V3_now02\project\LPLD_OV7670\iar\..\..\..\lib\Security\
//        -I
//        D:\projects\LPLD_OSKinetis_V3_now02\project\LPLD_OV7670\iar\..\..\..\lib\SQC\
//        -Ol -I "C:\Program Files (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\CMSIS\Include\" -D ARM_MATH_CM4
//    List file    =  
//        D:\projects\LPLD_OSKinetis_V3_now02\project\LPLD_OV7670\iar\FLASH\List\uart.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN LPLD_UART_EnableIrq
        EXTERN LPLD_UART_GetChar
        EXTERN LPLD_UART_Init
        EXTERN LPLD_UART_PutChar
        EXTERN __aeabi_memcpy4
        EXTERN strcmp

        PUBLIC E
        PUBLIC GPS_HEAD
        PUBLIC buf
        PUBLIC cparray
        PUBLIC gps_flag
        PUBLIC gps_gga
        PUBLIC gps_test
        PUBLIC step
        PUBLIC step_buf
        PUBLIC t1
        PUBLIC t2
        PUBLIC t3
        PUBLIC t4
        PUBLIC test
        PUBLIC test1
        PUBLIC uart0__flag_rev
        PUBLIC uart0_init_struct
        PUBLIC uart0_isr
        PUBLIC uart0_rev
        PUBLIC uart1_flag_rev
        PUBLIC uart1_init_struct
        PUBLIC uart1_isr
        PUBLIC uart1_rev
        PUBLIC uart2_flag_rev
        PUBLIC uart2_init_struct
        PUBLIC uart2_isr
        PUBLIC uart2_rev
        PUBLIC uart3_flag_rev
        PUBLIC uart3_init_struct
        PUBLIC uart3_isr
        PUBLIC uart3_rev
        PUBLIC uart4_flag_rev
        PUBLIC uart4_init_struct
        PUBLIC uart4_isr
        PUBLIC uart4_rev
        PUBLIC uart5_flag_rev
        PUBLIC uart5_init_struct
        PUBLIC uart5_isr
        PUBLIC uart5_rev
        PUBLIC uart_init
        PUBLIC uart_step

// D:\projects\LPLD_OSKinetis_V3_now02\project\LPLD_OV7670\app\uart.c
//    1 #include "common.h"
//    2 #include "uart.h"
//    3 #include <stdarg.h>
//    4 
//    5 
//    6 void cpshuzu (int8 *s, const int8 *fmt, uint8 start,uint8 stop);
//    7 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    8 UART_InitTypeDef uart0_init_struct;
uart0_init_struct:
        DS8 20

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    9 UART_InitTypeDef uart1_init_struct;
uart1_init_struct:
        DS8 20

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   10 UART_InitTypeDef uart2_init_struct;
uart2_init_struct:
        DS8 20

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   11 UART_InitTypeDef uart3_init_struct;
uart3_init_struct:
        DS8 20

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   12 UART_InitTypeDef uart4_init_struct;
uart4_init_struct:
        DS8 20

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   13 UART_InitTypeDef uart5_init_struct;
uart5_init_struct:
        DS8 20
//   14 
//   15 void uart0_isr(void);
//   16 void uart1_isr(void);
//   17 void uart2_isr(void);
//   18 void uart3_isr(void);
//   19 void uart4_isr(void);
//   20 void uart5_isr(void);
//   21 
//   22 

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   23 uint8 gps_flag=1,step=0,t1=0,t2=0,t3=0,t4=0;
gps_flag:
        DATA
        DC8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
step:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
t1:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
t2:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
t3:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
t4:
        DS8 1
//   24 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   25 uint8 GPS_HEAD[5],E,test[80],gps_test[80],gps_gga[80];
GPS_HEAD:
        DS8 8

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
E:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
test:
        DS8 80

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
gps_test:
        DS8 80

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
gps_gga:
        DS8 80
//   26 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   27 uint8 uart_step=0,step_buf=0,test1=0;
uart_step:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
step_buf:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
test1:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   28 int8 buf[20];
buf:
        DS8 20

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   29 uint8 uart0_rev[100],uart1_rev[100],uart2_rev[100],uart3_rev[100],\ 
uart0_rev:
        DS8 100

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
uart1_rev:
        DS8 100

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
uart2_rev:
        DS8 100

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
uart3_rev:
        DS8 100

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   30 uart4_rev[100],uart5_rev[100];
uart4_rev:
        DS8 100

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
uart5_rev:
        DS8 100

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   31 uint8 uart0__flag_rev,uart1_flag_rev,uart2_flag_rev,uart3_flag_rev,\ 
uart0__flag_rev:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
uart1_flag_rev:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
uart2_flag_rev:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
uart3_flag_rev:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   32 uart4_flag_rev,uart5_flag_rev;
uart4_flag_rev:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
uart5_flag_rev:
        DS8 1
//   33     
//   34 //enum {
//   35 //UART0；
//   36 //UART1；
//   37 //UART2；
//   38 //UART3；
//   39 //UART4；
//   40 //UART5；
//   41 //}
//   42 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   43 void uart_init(void)
//   44 {
uart_init:
        PUSH     {R7,LR}
//   45 
//   46   
//   47   /*
//   48   UART0   TXD0:PTB17   RXD0:PTB16      USB->UART 
//   49   UART1   TXD1:PTE0    RXD1:PTE1       WIFI
//   50   //UART2   TXD2:PTE0    RXD2:PTE1    
//   51   UART3   TXD3:PTE4    RXD3:PTE5       北斗/GPS
//   52   UART4   TXD4:PTE24   RXD4:PTE25      Zigbee
//   53   UART5   TXD5:PTE8    RXD5:PTE9       GPRS
//   54   */
//   55   /*   init uart0   USB->UART  115200*/
//   56   uart0_init_struct.UART_Uartx = UART0; //使用UART0
        LDR.N    R0,??DataTable6  ;; 0x4006a000
        LDR.N    R1,??DataTable6_1
        STR      R0,[R1, #+0]
//   57   uart0_init_struct.UART_BaudRate = 115200; //设置波特率115200
        MOVS     R0,#+115200
        LDR.N    R1,??DataTable6_1
        STR      R0,[R1, #+4]
//   58   uart0_init_struct.UART_RxPin = PTB16;  //接收引脚为PTE16
        MOVS     R0,#+48
        LDR.N    R1,??DataTable6_1
        STRB     R0,[R1, #+9]
//   59   uart0_init_struct.UART_TxPin = PTB17;  //发送引脚为PTE17
        MOVS     R0,#+49
        LDR.N    R1,??DataTable6_1
        STRB     R0,[R1, #+8]
//   60   uart0_init_struct.UART_RxIntEnable = TRUE;    //使能接收中断
        MOVS     R0,#+1
        LDR.N    R1,??DataTable6_1
        STRB     R0,[R1, #+10]
//   61   uart0_init_struct.UART_RxIsr = uart0_isr;      //设置接收中断函数
        ADR.W    R0,uart0_isr
        LDR.N    R1,??DataTable6_1
        STR      R0,[R1, #+12]
//   62   LPLD_UART_Init(uart0_init_struct);//初始化UART 
        LDR.N    R1,??DataTable6_1
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_UART_Init
//   63   LPLD_UART_EnableIrq(uart0_init_struct);//使能UART中断
        LDR.N    R1,??DataTable6_1
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_UART_EnableIrq
//   64   /*   init uart1  WIFI  115200     */
//   65   uart1_init_struct.UART_Uartx = UART1; //使用UART1
        LDR.N    R0,??DataTable6_2  ;; 0x4006b000
        LDR.N    R1,??DataTable6_3
        STR      R0,[R1, #+0]
//   66   uart1_init_struct.UART_BaudRate = 115200; //设置波特率115200
        MOVS     R0,#+115200
        LDR.N    R1,??DataTable6_3
        STR      R0,[R1, #+4]
//   67   uart1_init_struct.UART_RxPin = PTE2;  //接收引脚为PTE2
        MOVS     R0,#+126
        LDR.N    R1,??DataTable6_3
        STRB     R0,[R1, #+9]
//   68   uart1_init_struct.UART_TxPin = PTE0;  //发送引脚为PTE0
        MOVS     R0,#+124
        LDR.N    R1,??DataTable6_3
        STRB     R0,[R1, #+8]
//   69   uart1_init_struct.UART_RxIntEnable = TRUE;    //使能接收中断
        MOVS     R0,#+1
        LDR.N    R1,??DataTable6_3
        STRB     R0,[R1, #+10]
//   70   uart1_init_struct.UART_RxIsr = uart1_isr;      //设置接收中断函数
        ADR.W    R0,uart1_isr
        LDR.N    R1,??DataTable6_3
        STR      R0,[R1, #+12]
//   71   LPLD_UART_Init(uart1_init_struct);//初始化UART 
        LDR.N    R1,??DataTable6_3
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_UART_Init
//   72   LPLD_UART_EnableIrq(uart1_init_struct);//使能UART中断 
        LDR.N    R1,??DataTable6_3
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_UART_EnableIrq
//   73   ////  /*   init uart2  */
//   74   ////  uart2_init_struct.UART_Uartx = UART2; //使用UART2
//   75   ////  uart2_init_struct.UART_BaudRate = 115200; //设置波特率9600
//   76   ////  uart2_init_struct.UART_RxPin = PTE1;  //接收引脚为PTE9
//   77   ////  uart2_init_struct.UART_TxPin = PTE0;  //发送引脚为PTE8
//   78   ////  uart2_init_struct.UART_RxIntEnable = TRUE;    //使能接收中断
//   79   ////  uart2_init_struct.UART_RxIsr = uart2_isr;      //设置接收中断函数
//   80   ////  LPLD_UART_Init(uart2_init_struct);//初始化UART 
//   81   ////  LPLD_UART_EnableIrq(uart2_init_struct);//使能UART中断
//   82   /*   init uart3  北斗/GPS  115200  */
//   83   uart3_init_struct.UART_Uartx = UART3; //使用UART3
        LDR.N    R0,??DataTable6_4  ;; 0x4006d000
        LDR.N    R1,??DataTable6_5
        STR      R0,[R1, #+0]
//   84   uart3_init_struct.UART_BaudRate = 9600; //设置波特率9600
        MOV      R0,#+9600
        LDR.N    R1,??DataTable6_5
        STR      R0,[R1, #+4]
//   85   uart3_init_struct.UART_RxPin = PTE5;  //接收引脚为PTE5
        MOVS     R0,#+129
        LDR.N    R1,??DataTable6_5
        STRB     R0,[R1, #+9]
//   86   uart3_init_struct.UART_TxPin = PTE4;  //发送引脚为PTE4
        MOVS     R0,#+128
        LDR.N    R1,??DataTable6_5
        STRB     R0,[R1, #+8]
//   87   uart3_init_struct.UART_RxIntEnable = TRUE;    //使能接收中断
        MOVS     R0,#+1
        LDR.N    R1,??DataTable6_5
        STRB     R0,[R1, #+10]
//   88   uart3_init_struct.UART_RxIsr = uart3_isr;      //设置接收中断函数
        ADR.W    R0,uart3_isr
        LDR.N    R1,??DataTable6_5
        STR      R0,[R1, #+12]
//   89   LPLD_UART_Init(uart3_init_struct);//初始化UART 
        LDR.N    R1,??DataTable6_5
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_UART_Init
//   90   LPLD_UART_EnableIrq(uart3_init_struct);//使能UART中断
        LDR.N    R1,??DataTable6_5
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_UART_EnableIrq
//   91   /*   init uart4    Zigbee */
//   92   uart4_init_struct.UART_Uartx = UART4; //使用UART4
        LDR.N    R0,??DataTable6_6  ;; 0x400ea000
        LDR.N    R1,??DataTable6_7
        STR      R0,[R1, #+0]
//   93   uart4_init_struct.UART_BaudRate = 115200; //设置波特率115200
        MOVS     R0,#+115200
        LDR.N    R1,??DataTable6_7
        STR      R0,[R1, #+4]
//   94   uart4_init_struct.UART_RxPin = PTE25;  //接收引脚为PTE25
        MOVS     R0,#+149
        LDR.N    R1,??DataTable6_7
        STRB     R0,[R1, #+9]
//   95   uart4_init_struct.UART_TxPin = PTE24;  //发送引脚为PTE24
        MOVS     R0,#+148
        LDR.N    R1,??DataTable6_7
        STRB     R0,[R1, #+8]
//   96   uart4_init_struct.UART_RxIntEnable = TRUE;    //使能接收中断
        MOVS     R0,#+1
        LDR.N    R1,??DataTable6_7
        STRB     R0,[R1, #+10]
//   97   uart4_init_struct.UART_RxIsr = uart4_isr;      //设置接收中断函数
        ADR.W    R0,uart4_isr
        LDR.N    R1,??DataTable6_7
        STR      R0,[R1, #+12]
//   98   LPLD_UART_Init(uart4_init_struct);//初始化UART 
        LDR.N    R1,??DataTable6_7
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_UART_Init
//   99   LPLD_UART_EnableIrq(uart4_init_struct);//使能UART中断
        LDR.N    R1,??DataTable6_7
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_UART_EnableIrq
//  100   /*   init uart5   GPRS  115200 */
//  101   uart5_init_struct.UART_Uartx = UART5; //使用UART5
        LDR.N    R0,??DataTable6_8  ;; 0x400eb000
        LDR.N    R1,??DataTable6_9
        STR      R0,[R1, #+0]
//  102   uart5_init_struct.UART_BaudRate = 115200; //设置波特率115200
        MOVS     R0,#+115200
        LDR.N    R1,??DataTable6_9
        STR      R0,[R1, #+4]
//  103   uart5_init_struct.UART_RxPin = PTE9;  //接收引脚为PTE9
        MOVS     R0,#+133
        LDR.N    R1,??DataTable6_9
        STRB     R0,[R1, #+9]
//  104   uart5_init_struct.UART_TxPin = PTE8;  //发送引脚为PTE8
        MOVS     R0,#+132
        LDR.N    R1,??DataTable6_9
        STRB     R0,[R1, #+8]
//  105   uart5_init_struct.UART_RxIntEnable = TRUE;    //使能接收中断
        MOVS     R0,#+1
        LDR.N    R1,??DataTable6_9
        STRB     R0,[R1, #+10]
//  106   uart5_init_struct.UART_RxIsr = uart5_isr;      //设置接收中断函数
        ADR.W    R0,uart5_isr
        LDR.N    R1,??DataTable6_9
        STR      R0,[R1, #+12]
//  107   LPLD_UART_Init(uart5_init_struct);//初始化UART 
        LDR.N    R1,??DataTable6_9
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_UART_Init
//  108   LPLD_UART_EnableIrq(uart5_init_struct);//使能UART中断
        LDR.N    R1,??DataTable6_9
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_UART_EnableIrq
//  109   
//  110   
//  111 }
        POP      {R0,PC}          ;; return
//  112 
//  113 
//  114 
//  115 /*    uart0  USB->UART中断服务函数    */

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//  116 void uart0_isr(void)
//  117 {
uart0_isr:
        PUSH     {R7,LR}
//  118   int8 recv;
//  119   recv = LPLD_UART_GetChar(UART0);
        LDR.N    R0,??DataTable6  ;; 0x4006a000
        BL       LPLD_UART_GetChar
//  120   
//  121   LPLD_UART_PutChar(UART5, recv);
        MOVS     R1,R0
        SXTB     R1,R1            ;; SignExt  R1,R1,#+24,#+24
        LDR.N    R0,??DataTable6_8  ;; 0x400eb000
        BL       LPLD_UART_PutChar
//  122 }
        POP      {R0,PC}          ;; return
//  123 
//  124 /*    uart1 WIFI中断服务函数    */

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//  125 void uart1_isr(void)
//  126 {
uart1_isr:
        PUSH     {R7,LR}
//  127   int8 recv;
//  128   recv = LPLD_UART_GetChar(UART1);
        LDR.N    R0,??DataTable6_2  ;; 0x4006b000
        BL       LPLD_UART_GetChar
//  129   LPLD_UART_PutChar(UART0, recv);
        MOVS     R1,R0
        SXTB     R1,R1            ;; SignExt  R1,R1,#+24,#+24
        LDR.N    R0,??DataTable6  ;; 0x4006a000
        BL       LPLD_UART_PutChar
//  130   
//  131 }
        POP      {R0,PC}          ;; return
//  132 
//  133 /*    uart2 中断服务函数    */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  134 void uart2_isr(void)
//  135 {
uart2_isr:
        PUSH     {R7,LR}
//  136   int8 recv;
//  137   recv = LPLD_UART_GetChar(UART2);
        LDR.N    R0,??DataTable6_10  ;; 0x4006c000
        BL       LPLD_UART_GetChar
//  138   LPLD_UART_PutChar(UART0, recv);
        MOVS     R1,R0
        SXTB     R1,R1            ;; SignExt  R1,R1,#+24,#+24
        LDR.N    R0,??DataTable6  ;; 0x4006a000
        BL       LPLD_UART_PutChar
//  139 }
        POP      {R0,PC}          ;; return
//  140 
//  141 /*    uart3  北斗/GPS中断服务函数    */

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//  142 void uart3_isr(void)
//  143 {
uart3_isr:
        PUSH     {R4,LR}
//  144   int8 recv;
//  145   recv = LPLD_UART_GetChar(UART3);
        LDR.N    R0,??DataTable6_4  ;; 0x4006d000
        BL       LPLD_UART_GetChar
        MOVS     R4,R0
//  146   
//  147   if(1==step)
        LDR.N    R0,??DataTable6_11
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??uart3_isr_0
//  148   {
//  149     /*接收数据头*/
//  150     GPS_HEAD[t1] = recv;  
        LDR.N    R0,??DataTable6_12
        LDRB     R0,[R0, #+0]
        LDR.N    R1,??DataTable6_13
        STRB     R4,[R0, R1]
//  151     t1++;
        LDR.N    R0,??DataTable6_12
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable6_12
        STRB     R0,[R1, #+0]
//  152     if(t1==5)
        LDR.N    R0,??DataTable6_12
        LDRB     R0,[R0, #+0]
        CMP      R0,#+5
        BNE.N    ??uart3_isr_0
//  153       step=2;    
        MOVS     R0,#+2
        LDR.N    R1,??DataTable6_11
        STRB     R0,[R1, #+0]
//  154   } 
//  155   
//  156   if(step == 3)
??uart3_isr_0:
        LDR.N    R0,??DataTable6_11
        LDRB     R0,[R0, #+0]
        CMP      R0,#+3
        BNE.N    ??uart3_isr_1
//  157   {
//  158     if('$' == recv) 
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+36
        BNE.N    ??uart3_isr_2
//  159     {
//  160       step=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_11
        STRB     R0,[R1, #+0]
//  161       gps_flag=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_14
        STRB     R0,[R1, #+0]
        B.N      ??uart3_isr_1
//  162     }
//  163     else 
//  164     {
//  165       gps_gga[t3]=recv;
??uart3_isr_2:
        LDR.N    R0,??DataTable6_15
        LDRB     R0,[R0, #+0]
        LDR.N    R1,??DataTable6_16
        STRB     R4,[R0, R1]
//  166       t3++;
        LDR.N    R0,??DataTable6_15
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable6_15
        STRB     R0,[R1, #+0]
//  167     } 
//  168     
//  169   }
//  170   if(step == 2  && !strcmp(GPS_HEAD,"GNGGA"))
??uart3_isr_1:
        LDR.N    R0,??DataTable6_11
        LDRB     R0,[R0, #+0]
        CMP      R0,#+2
        BNE.N    ??uart3_isr_3
        LDR.N    R1,??DataTable6_17
        LDR.N    R0,??DataTable6_13
        BL       strcmp
        CMP      R0,#+0
        BNE.N    ??uart3_isr_3
//  171   {
//  172     step = 3;
        MOVS     R0,#+3
        LDR.N    R1,??DataTable6_11
        STRB     R0,[R1, #+0]
//  173     t3=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_15
        STRB     R0,[R1, #+0]
//  174   }
//  175   
//  176   if('$' == recv && gps_flag)
??uart3_isr_3:
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+36
        BNE.N    ??uart3_isr_4
        LDR.N    R0,??DataTable6_14
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??uart3_isr_4
//  177   {
//  178     step=1;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable6_11
        STRB     R0,[R1, #+0]
//  179     t2=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_18
        STRB     R0,[R1, #+0]
//  180     t1=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_12
        STRB     R0,[R1, #+0]
//  181   }  
//  182   test[t2] = recv;
??uart3_isr_4:
        LDR.N    R0,??DataTable6_18
        LDRB     R0,[R0, #+0]
        LDR.N    R1,??DataTable6_19
        STRB     R4,[R0, R1]
//  183   t2++;    
        LDR.N    R0,??DataTable6_18
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable6_18
        STRB     R0,[R1, #+0]
//  184  // LPLD_UART_PutChar(UART0, recv);
//  185   
//  186 }
        POP      {R4,PC}          ;; return
//  187 
//  188 /*    uart4 Zigbee中断服务函数    */

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//  189 void uart4_isr(void)
//  190 {
uart4_isr:
        PUSH     {R4,LR}
//  191   int8 recv;
//  192   uart_step=1;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable6_20
        STRB     R0,[R1, #+0]
//  193   recv = LPLD_UART_GetChar(UART4);
        LDR.N    R0,??DataTable6_6  ;; 0x400ea000
        BL       LPLD_UART_GetChar
        MOVS     R4,R0
//  194   LPLD_UART_PutChar(UART0, recv);
        MOVS     R1,R4
        SXTB     R1,R1            ;; SignExt  R1,R1,#+24,#+24
        LDR.N    R0,??DataTable6  ;; 0x4006a000
        BL       LPLD_UART_PutChar
//  195   buf[step_buf] = recv;
        LDR.N    R0,??DataTable6_21
        LDRB     R0,[R0, #+0]
        LDR.N    R1,??DataTable6_22
        STRB     R4,[R0, R1]
//  196   step_buf++;  
        LDR.N    R0,??DataTable6_21
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable6_21
        STRB     R0,[R1, #+0]
//  197   test1 = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_23
        STRB     R0,[R1, #+0]
//  198 }
        POP      {R4,PC}          ;; return
//  199 
//  200 /*    uart5  GPRS中断服务函数    */

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//  201 void uart5_isr(void)
//  202 {
uart5_isr:
        PUSH     {R7,LR}
//  203   int8 recv;
//  204   recv = LPLD_UART_GetChar(UART5);
        LDR.N    R0,??DataTable6_8  ;; 0x400eb000
        BL       LPLD_UART_GetChar
//  205   LPLD_UART_PutChar(UART0, recv);
        MOVS     R1,R0
        SXTB     R1,R1            ;; SignExt  R1,R1,#+24,#+24
        LDR.N    R0,??DataTable6  ;; 0x4006a000
        BL       LPLD_UART_PutChar
//  206   
//  207 }
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6:
        DC32     0x4006a000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_1:
        DC32     uart0_init_struct

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_2:
        DC32     0x4006b000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_3:
        DC32     uart1_init_struct

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_4:
        DC32     0x4006d000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_5:
        DC32     uart3_init_struct

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_6:
        DC32     0x400ea000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_7:
        DC32     uart4_init_struct

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_8:
        DC32     0x400eb000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_9:
        DC32     uart5_init_struct

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_10:
        DC32     0x4006c000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_11:
        DC32     step

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_12:
        DC32     t1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_13:
        DC32     GPS_HEAD

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_14:
        DC32     gps_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_15:
        DC32     t3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_16:
        DC32     gps_gga

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_17:
        DC32     `?<Constant "GNGGA">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_18:
        DC32     t2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_19:
        DC32     test

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_20:
        DC32     uart_step

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_21:
        DC32     step_buf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_22:
        DC32     buf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_23:
        DC32     test1
//  208 
//  209 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  210 void cparray (int8 *s, const int8 *fmt, uint8 start,uint8 stop)
//  211 {
cparray:
        PUSH     {R4}
//  212   uint16 sto,i=0;
        MOVS     R4,#+0
//  213   fmt+=start;
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        ADDS     R1,R2,R1
//  214 //  sto=fmt+stop
//  215   
//  216     for(i=0;i<stop;i++)
        MOVS     R2,#+0
        MOVS     R4,R2
        B.N      ??cparray_0
//  217     {
//  218       *s++ = *fmt++;
??cparray_1:
        LDRB     R2,[R1, #+0]
        STRB     R2,[R0, #+0]
        ADDS     R1,R1,#+1
        ADDS     R0,R0,#+1
//  219     }
        ADDS     R4,R4,#+1
??cparray_0:
        MOVS     R2,R3
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        CMP      R4,R2
        BCC.N    ??cparray_1
//  220     
//  221 }
        POP      {R4}
        BX       LR               ;; return

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "GNGGA">`:
        DATA
        DC8 "GNGGA"
        DC8 0, 0

        END
//  222 
//  223 
// 
// 1 003 bytes in section .bss
//     1 byte  in section .data
//     8 bytes in section .rodata
//   832 bytes in section .text
// 
//   832 bytes of CODE  memory
//     8 bytes of CONST memory
// 1 004 bytes of DATA  memory
//
//Errors: none
//Warnings: 2
