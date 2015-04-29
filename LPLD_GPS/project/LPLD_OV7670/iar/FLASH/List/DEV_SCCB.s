///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.1.6676/W32 for ARM       23/Apr/2015  14:23:12
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  G:\test\LPLD_OSKinetis_V3_now02\lib\LPLD\DEV\DEV_SCCB.c
//    Command line =  
//        G:\test\LPLD_OSKinetis_V3_now02\lib\LPLD\DEV\DEV_SCCB.c -D LPLD_K60
//        -lCN
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
//        G:\test\LPLD_OSKinetis_V3_now02\project\LPLD_OV7670\iar\FLASH\List\DEV_SCCB.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN LPLD_GPIO_Init
        EXTERN __aeabi_memcpy4

        PUBLIC LPLD_SCCB_Init
        PUBLIC LPLD_SCCB_ReadReg
        PUBLIC LPLD_SCCB_WriteReg

// G:\test\LPLD_OSKinetis_V3_now02\lib\LPLD\DEV\DEV_SCCB.c
//    1 /**
//    2 * @file DEV_SCCB.c
//    3 * @version 0.1[By LPLD]
//    4 * @date 2013-09-24
//    5 * @brief SCCB设备驱动程序
//    6 *
//    7 * 更改建议:可根据实际硬件修改
//    8 *
//    9 * 版权所有:北京拉普兰德电子技术有限公司
//   10 * http://www.lpld.cn
//   11 * mail:support@lpld.cn
//   12 *
//   13 * @par
//   14 * 本代码由拉普兰德[LPLD]开发并维护，并向所有使用者开放源代码。
//   15 * 开发者可以随意修使用或改源代码。但本段及以上注释应予以保留。
//   16 * 不得更改或删除原版权所有者姓名，二次开发者可以加注二次版权所有者。
//   17 * 但应在遵守此协议的基础上，开放源代码、不得出售代码本身。
//   18 * 拉普兰德不负责由于使用本代码所带来的任何事故、法律责任或相关不良影响。
//   19 * 拉普兰德无义务解释、说明本代码的具体原理、功能、实现方法。
//   20 * 除非拉普兰德[LPLD]授权，开发者不得将本代码用于商业产品。
//   21 */
//   22 #include "DEV_SCCB.h"
//   23 
//   24 static uint8 LPLD_SCCB_Start(void);
//   25 static void LPLD_SCCB_Stop(void);
//   26 static void LPLD_SCCB_Ack(void);
//   27 static void LPLD_SCCB_NoAck(void);
//   28 static uint8 LPLD_SCCB_WaitAck(void);
//   29 static void LPLD_SCCB_SendByte(uint8);
//   30 static uint8 LPLD_SCCB_ReceiveByte(void);
//   31 static void LPLD_SCCB_Delay(uint16);
//   32 
//   33 /*
//   34  * LPLD_SCCB_Init
//   35  * 初始化SCCB所需引脚
//   36  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   37 void LPLD_SCCB_Init(void)
//   38 {
LPLD_SCCB_Init:
        PUSH     {LR}
        SUB      SP,SP,#+28
//   39   GPIO_InitTypeDef ptb;
//   40   /********用户可修改值 开始***********/
//   41   ptb.GPIO_PTx = PTB;
        LDR.N    R0,??DataTable8  ;; 0x400ff040
        STR      R0,[SP, #+4]
//   42   ptb.GPIO_Pins = GPIO_Pin0 | GPIO_Pin1;
        MOVS     R0,#+3
        STR      R0,[SP, #+8]
//   43   /********用户可修改值 结束***********/
//   44   ptb.GPIO_Dir = DIR_OUTPUT;
        MOVS     R0,#+1
        STRB     R0,[SP, #+16]
//   45   ptb.GPIO_Output = OUTPUT_H;
        MOVS     R0,#+1
        STRB     R0,[SP, #+17]
//   46   ptb.GPIO_PinControl = NULL;
        MOVS     R0,#+0
        STR      R0,[SP, #+12]
//   47   LPLD_GPIO_Init(ptb);
        ADD      R1,SP,#+4
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_GPIO_Init
//   48   
//   49   
//   50   
//   51   fifo_wr_out();
        MOVS     R0,#+1
        LDR.N    R1,??DataTable8_1  ;; 0x43fe02cc
        STR      R0,[R1, #+0]
//   52   fifo_wr = 1;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable8_2  ;; 0x43fe004c
        STR      R0,[R1, #+0]
//   53 }
        ADD      SP,SP,#+28
        POP      {PC}             ;; return
//   54 
//   55 /*
//   56  * LPLD_SCCB_WriteReg
//   57  * 写SCCB设备寄存器
//   58  * 
//   59  * 参数:
//   60  *    reg_addr--寄存器地址
//   61  *    data--待写数据 
//   62  *
//   63  * 输出:
//   64  *    1-成功
//   65  *    0-失败
//   66  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   67 uint8 LPLD_SCCB_WriteReg(uint16 reg_addr , uint8 data)
//   68 {
LPLD_SCCB_WriteReg:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
//   69   SCCB_SDA_O=1; 
        MOVS     R0,#+1
        LDR.N    R1,??DataTable8_3  ;; 0x43fe0804
        STR      R0,[R1, #+0]
//   70   
//   71   if(!LPLD_SCCB_Start())
        BL       LPLD_SCCB_Start
        CMP      R0,#+0
        BNE.N    ??LPLD_SCCB_WriteReg_0
//   72   {
//   73     return 0;
        MOVS     R0,#+0
        B.N      ??LPLD_SCCB_WriteReg_1
//   74   }
//   75   LPLD_SCCB_SendByte( SCCB_DEV_ADR );         
??LPLD_SCCB_WriteReg_0:
        MOVS     R0,#+66
        BL       LPLD_SCCB_SendByte
//   76   if( !LPLD_SCCB_WaitAck() )
        BL       LPLD_SCCB_WaitAck
        CMP      R0,#+0
        BNE.N    ??LPLD_SCCB_WriteReg_2
//   77   {
//   78     LPLD_SCCB_Stop(); 
        BL       LPLD_SCCB_Stop
//   79     return 0;
        MOVS     R0,#+0
        B.N      ??LPLD_SCCB_WriteReg_1
//   80   }
//   81   LPLD_SCCB_SendByte((uint8)(reg_addr & 0x00FF));   
??LPLD_SCCB_WriteReg_2:
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LPLD_SCCB_SendByte
//   82   LPLD_SCCB_WaitAck();	
        BL       LPLD_SCCB_WaitAck
//   83   LPLD_SCCB_SendByte(data);
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LPLD_SCCB_SendByte
//   84   LPLD_SCCB_WaitAck();   
        BL       LPLD_SCCB_WaitAck
//   85   LPLD_SCCB_Stop(); 
        BL       LPLD_SCCB_Stop
//   86   return 1;
        MOVS     R0,#+1
??LPLD_SCCB_WriteReg_1:
        POP      {R1,R4,R5,PC}    ;; return
//   87 }									 
//   88 
//   89 
//   90 
//   91 
//   92 /******************************************************************************************************************
//   93 * 函数名：SCCB_ReadByte
//   94 * 描述  ：读取一串数据
//   95 * 输入  ：- data: 存放读出数据 	- length: 待读出长度	- reg_addr: 待读出地址		 - DeviceAddress: 器件类型
//   96 * 输出  ：返回为:=1成功读入,=0失败
//   97 * 注意  ：无        
//   98 **********************************************************************************************************************/ 
//   99 /*
//  100  * LPLD_SCCB_ReadReg
//  101  * 读SCCB设备寄存器
//  102  * 
//  103  * 参数:
//  104  *    reg_addr--寄存器地址
//  105  *    *data--待存读出数据地址
//  106  *    length--读取长度
//  107  *
//  108  * 输出:
//  109  *    1-成功
//  110  *    0-失败
//  111  */          

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  112 uint8 LPLD_SCCB_ReadReg(uint8 reg_addr, uint8* data, uint16 length)
//  113 {	
LPLD_SCCB_ReadReg:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//  114   if(!LPLD_SCCB_Start())
        BL       LPLD_SCCB_Start
        CMP      R0,#+0
        BNE.N    ??LPLD_SCCB_ReadReg_0
//  115   {
//  116     return 0;
        MOVS     R0,#+0
        B.N      ??LPLD_SCCB_ReadReg_1
//  117   }
//  118   LPLD_SCCB_SendByte( SCCB_DEV_ADR ); 
??LPLD_SCCB_ReadReg_0:
        MOVS     R0,#+66
        BL       LPLD_SCCB_SendByte
//  119   if( !LPLD_SCCB_WaitAck() )
        BL       LPLD_SCCB_WaitAck
        CMP      R0,#+0
        BNE.N    ??LPLD_SCCB_ReadReg_2
//  120   {
//  121     LPLD_SCCB_Stop(); 
        BL       LPLD_SCCB_Stop
//  122     return 0;
        MOVS     R0,#+0
        B.N      ??LPLD_SCCB_ReadReg_1
//  123   }
//  124   LPLD_SCCB_SendByte( reg_addr ); 
??LPLD_SCCB_ReadReg_2:
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LPLD_SCCB_SendByte
//  125   LPLD_SCCB_WaitAck();	
        BL       LPLD_SCCB_WaitAck
//  126   LPLD_SCCB_Stop(); 
        BL       LPLD_SCCB_Stop
//  127   
//  128   if(!LPLD_SCCB_Start())
        BL       LPLD_SCCB_Start
        CMP      R0,#+0
        BNE.N    ??LPLD_SCCB_ReadReg_3
//  129   {
//  130     return 0;
        MOVS     R0,#+0
        B.N      ??LPLD_SCCB_ReadReg_1
//  131   }
//  132  LPLD_SCCB_SendByte( SCCB_DEV_ADR + 1 ); 
??LPLD_SCCB_ReadReg_3:
        MOVS     R0,#+67
        BL       LPLD_SCCB_SendByte
//  133   if(!LPLD_SCCB_WaitAck())
        BL       LPLD_SCCB_WaitAck
        CMP      R0,#+0
        BNE.N    ??LPLD_SCCB_ReadReg_4
//  134   {
//  135     LPLD_SCCB_Stop(); 
        BL       LPLD_SCCB_Stop
//  136     return 0;
        MOVS     R0,#+0
        B.N      ??LPLD_SCCB_ReadReg_1
//  137   }
//  138   while(length)
//  139   {
//  140     *data = LPLD_SCCB_ReceiveByte();
//  141     if(length == 1)
//  142     {
//  143       LPLD_SCCB_NoAck();
//  144     }
//  145     else
//  146     {
//  147       LPLD_SCCB_Ack(); 
??LPLD_SCCB_ReadReg_5:
        BL       LPLD_SCCB_Ack
//  148     }
//  149     data++;
??LPLD_SCCB_ReadReg_6:
        ADDS     R5,R5,#+1
//  150     length--;
        SUBS     R6,R6,#+1
??LPLD_SCCB_ReadReg_4:
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        CMP      R6,#+0
        BEQ.N    ??LPLD_SCCB_ReadReg_7
        BL       LPLD_SCCB_ReceiveByte
        STRB     R0,[R5, #+0]
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        CMP      R6,#+1
        BNE.N    ??LPLD_SCCB_ReadReg_5
        BL       LPLD_SCCB_NoAck
        B.N      ??LPLD_SCCB_ReadReg_6
//  151   }
//  152   LPLD_SCCB_Stop();
??LPLD_SCCB_ReadReg_7:
        BL       LPLD_SCCB_Stop
//  153   return 1;
        MOVS     R0,#+1
??LPLD_SCCB_ReadReg_1:
        POP      {R4-R6,PC}       ;; return
//  154 }
//  155 
//  156 /*
//  157  * LPLD_SCCB_Start
//  158  * SCCB起始信号，内部调用
//  159  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  160 static uint8 LPLD_SCCB_Start(void)
//  161 {
LPLD_SCCB_Start:
        PUSH     {R7,LR}
//  162   SCCB_SDA_O=1;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable8_3  ;; 0x43fe0804
        STR      R0,[R1, #+0]
//  163   SCCB_SCL=1;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable8_4  ;; 0x43fe0800
        STR      R0,[R1, #+0]
//  164   SCCB_DELAY();
        MOV      R0,#+800
        BL       LPLD_SCCB_Delay
//  165   
//  166   SCCB_SDA_IN();
        MOVS     R0,#+0
        LDR.N    R1,??DataTable8_5  ;; 0x43fe0a84
        STR      R0,[R1, #+0]
//  167   if(!SCCB_SDA_I)
        LDR.N    R0,??DataTable8_6  ;; 0x43fe0a04
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??LPLD_SCCB_Start_0
//  168   {
//  169     SCCB_SDA_OUT();	
        MOVS     R0,#+1
        LDR.N    R1,??DataTable8_5  ;; 0x43fe0a84
        STR      R0,[R1, #+0]
//  170     return 0;
        MOVS     R0,#+0
        B.N      ??LPLD_SCCB_Start_1
//  171   }
//  172   SCCB_SDA_OUT();	
??LPLD_SCCB_Start_0:
        MOVS     R0,#+1
        LDR.N    R1,??DataTable8_5  ;; 0x43fe0a84
        STR      R0,[R1, #+0]
//  173   SCCB_SDA_O=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable8_3  ;; 0x43fe0804
        STR      R0,[R1, #+0]
//  174   
//  175   SCCB_DELAY();
        MOV      R0,#+800
        BL       LPLD_SCCB_Delay
//  176   
//  177   SCCB_SDA_IN();
        MOVS     R0,#+0
        LDR.N    R1,??DataTable8_5  ;; 0x43fe0a84
        STR      R0,[R1, #+0]
//  178   if(SCCB_SDA_I) 
        LDR.N    R0,??DataTable8_6  ;; 0x43fe0a04
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??LPLD_SCCB_Start_2
//  179   {
//  180     SCCB_SDA_OUT();
        MOVS     R0,#+1
        LDR.N    R1,??DataTable8_5  ;; 0x43fe0a84
        STR      R0,[R1, #+0]
//  181     return 0;
        MOVS     R0,#+0
        B.N      ??LPLD_SCCB_Start_1
//  182   }
//  183   SCCB_SDA_OUT();
??LPLD_SCCB_Start_2:
        MOVS     R0,#+1
        LDR.N    R1,??DataTable8_5  ;; 0x43fe0a84
        STR      R0,[R1, #+0]
//  184   SCCB_SDA_O=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable8_3  ;; 0x43fe0804
        STR      R0,[R1, #+0]
//  185 
//  186   return 1;
        MOVS     R0,#+1
??LPLD_SCCB_Start_1:
        POP      {R1,PC}          ;; return
//  187 }
//  188 
//  189 /*
//  190  * LPLD_SCCB_Stop
//  191  * SCCB停止信号，内部调用
//  192  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  193 static void LPLD_SCCB_Stop(void)
//  194 {
LPLD_SCCB_Stop:
        PUSH     {R7,LR}
//  195   SCCB_SCL = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable8_4  ;; 0x43fe0800
        STR      R0,[R1, #+0]
//  196   SCCB_SDA_O=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable8_3  ;; 0x43fe0804
        STR      R0,[R1, #+0]
//  197   SCCB_DELAY();
        MOV      R0,#+800
        BL       LPLD_SCCB_Delay
//  198   
//  199   SCCB_SCL=1;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable8_4  ;; 0x43fe0800
        STR      R0,[R1, #+0]
//  200   SCCB_DELAY();
        MOV      R0,#+800
        BL       LPLD_SCCB_Delay
//  201   SCCB_SDA_O=1;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable8_3  ;; 0x43fe0804
        STR      R0,[R1, #+0]
//  202   SCCB_DELAY();
        MOV      R0,#+800
        BL       LPLD_SCCB_Delay
//  203 }
        POP      {R0,PC}          ;; return
//  204 
//  205 /*
//  206  * LPLD_SCCB_Stop
//  207  * SCCB应答信号，内部调用
//  208  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  209 static void LPLD_SCCB_Ack(void)
//  210 {	
LPLD_SCCB_Ack:
        PUSH     {R7,LR}
//  211   SCCB_SCL = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable8_4  ;; 0x43fe0800
        STR      R0,[R1, #+0]
//  212   SCCB_DELAY();
        MOV      R0,#+800
        BL       LPLD_SCCB_Delay
//  213   
//  214   SCCB_SDA_O=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable8_3  ;; 0x43fe0804
        STR      R0,[R1, #+0]
//  215   SCCB_DELAY();
        MOV      R0,#+800
        BL       LPLD_SCCB_Delay
//  216   
//  217   SCCB_SCL=1;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable8_4  ;; 0x43fe0800
        STR      R0,[R1, #+0]
//  218   SCCB_DELAY();
        MOV      R0,#+800
        BL       LPLD_SCCB_Delay
//  219   
//  220   SCCB_SCL = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable8_4  ;; 0x43fe0800
        STR      R0,[R1, #+0]
//  221   SCCB_DELAY();
        MOV      R0,#+800
        BL       LPLD_SCCB_Delay
//  222 }
        POP      {R0,PC}          ;; return
//  223 
//  224 /*
//  225  * LPLD_SCCB_NoAck
//  226  * SCCB无应答信号，内部调用
//  227  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  228 static void LPLD_SCCB_NoAck(void)
//  229 {	
LPLD_SCCB_NoAck:
        PUSH     {R7,LR}
//  230   SCCB_SCL = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable8_4  ;; 0x43fe0800
        STR      R0,[R1, #+0]
//  231   SCCB_DELAY();
        MOV      R0,#+800
        BL       LPLD_SCCB_Delay
//  232   SCCB_SDA_O=1;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable8_3  ;; 0x43fe0804
        STR      R0,[R1, #+0]
//  233   SCCB_DELAY();
        MOV      R0,#+800
        BL       LPLD_SCCB_Delay
//  234   SCCB_SCL=1;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable8_4  ;; 0x43fe0800
        STR      R0,[R1, #+0]
//  235   SCCB_DELAY();
        MOV      R0,#+800
        BL       LPLD_SCCB_Delay
//  236   SCCB_SCL = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable8_4  ;; 0x43fe0800
        STR      R0,[R1, #+0]
//  237   SCCB_DELAY();
        MOV      R0,#+800
        BL       LPLD_SCCB_Delay
//  238 }
        POP      {R0,PC}          ;; return
//  239 
//  240 /*
//  241  * LPLD_SCCB_WaitAck
//  242  * SCCB等待应答信号，内部调用
//  243  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  244 static uint8 LPLD_SCCB_WaitAck(void) 	
//  245 {
LPLD_SCCB_WaitAck:
        PUSH     {R7,LR}
//  246   SCCB_SCL = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable8_4  ;; 0x43fe0800
        STR      R0,[R1, #+0]
//  247   SCCB_DELAY();
        MOV      R0,#+800
        BL       LPLD_SCCB_Delay
//  248   SCCB_SDA_O=1;	
        MOVS     R0,#+1
        LDR.N    R1,??DataTable8_3  ;; 0x43fe0804
        STR      R0,[R1, #+0]
//  249   SCCB_DELAY();
        MOV      R0,#+800
        BL       LPLD_SCCB_Delay
//  250   
//  251   SCCB_SCL=1;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable8_4  ;; 0x43fe0800
        STR      R0,[R1, #+0]
//  252   
//  253   SCCB_SDA_IN();
        MOVS     R0,#+0
        LDR.N    R1,??DataTable8_5  ;; 0x43fe0a84
        STR      R0,[R1, #+0]
//  254   SCCB_DELAY();
        MOV      R0,#+800
        BL       LPLD_SCCB_Delay
//  255   
//  256   if(SCCB_SDA_I)
        LDR.N    R0,??DataTable8_6  ;; 0x43fe0a04
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??LPLD_SCCB_WaitAck_0
//  257   {
//  258     SCCB_SDA_OUT();
        MOVS     R0,#+1
        LDR.N    R1,??DataTable8_5  ;; 0x43fe0a84
        STR      R0,[R1, #+0]
//  259     SCCB_SCL = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable8_4  ;; 0x43fe0800
        STR      R0,[R1, #+0]
//  260     return 0;
        MOVS     R0,#+0
        B.N      ??LPLD_SCCB_WaitAck_1
//  261   }
//  262   SCCB_SDA_OUT();
??LPLD_SCCB_WaitAck_0:
        MOVS     R0,#+1
        LDR.N    R1,??DataTable8_5  ;; 0x43fe0a84
        STR      R0,[R1, #+0]
//  263   SCCB_SCL = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable8_4  ;; 0x43fe0800
        STR      R0,[R1, #+0]
//  264   return 1;
        MOVS     R0,#+1
??LPLD_SCCB_WaitAck_1:
        POP      {R1,PC}          ;; return
//  265 }
//  266 
//  267 /*
//  268  * LPLD_SCCB_SendByte
//  269  * SCCB发送数据，内部调用
//  270  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  271 static void LPLD_SCCB_SendByte(uint8 data) 
//  272 {
LPLD_SCCB_SendByte:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
//  273   uint8 i=8;
        MOVS     R5,#+8
        B.N      ??LPLD_SCCB_SendByte_0
//  274   while(i--)
//  275   {
//  276     SCCB_SCL = 0;
//  277     SCCB_DELAY();
//  278     if(data&0x80)
//  279     {
//  280       SCCB_SDA_O=1; 
//  281     }
//  282     else 
//  283     {
//  284       SCCB_SDA_O=0;   
??LPLD_SCCB_SendByte_1:
        MOVS     R0,#+0
        LDR.N    R1,??DataTable8_3  ;; 0x43fe0804
        STR      R0,[R1, #+0]
//  285     }
//  286     data<<=1;
??LPLD_SCCB_SendByte_2:
        LSLS     R4,R4,#+1
//  287     SCCB_DELAY();
        MOV      R0,#+800
        BL       LPLD_SCCB_Delay
//  288     SCCB_SCL=1;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable8_4  ;; 0x43fe0800
        STR      R0,[R1, #+0]
//  289     SCCB_DELAY();
        MOV      R0,#+800
        BL       LPLD_SCCB_Delay
??LPLD_SCCB_SendByte_0:
        MOVS     R0,R5
        SUBS     R5,R0,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??LPLD_SCCB_SendByte_3
        MOVS     R0,#+0
        LDR.N    R1,??DataTable8_4  ;; 0x43fe0800
        STR      R0,[R1, #+0]
        MOV      R0,#+800
        BL       LPLD_SCCB_Delay
        LSLS     R0,R4,#+24
        BPL.N    ??LPLD_SCCB_SendByte_1
        MOVS     R0,#+1
        LDR.N    R1,??DataTable8_3  ;; 0x43fe0804
        STR      R0,[R1, #+0]
        B.N      ??LPLD_SCCB_SendByte_2
//  290   }
//  291   SCCB_SCL = 0;
??LPLD_SCCB_SendByte_3:
        MOVS     R0,#+0
        LDR.N    R1,??DataTable8_4  ;; 0x43fe0800
        STR      R0,[R1, #+0]
//  292 }
        POP      {R0,R4,R5,PC}    ;; return
//  293 
//  294 /*
//  295  * LPLD_SCCB_SendByte
//  296  * SCCB接收数据，内部调用
//  297  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  298 static uint8 LPLD_SCCB_ReceiveByte(void)  
//  299 { 
LPLD_SCCB_ReceiveByte:
        PUSH     {R3-R5,LR}
//  300   uint8 i=8;
        MOVS     R4,#+8
//  301   uint8 ReceiveByte=0;
        MOVS     R5,#+0
//  302   
//  303   SCCB_SDA_O=1;	
        MOVS     R0,#+1
        LDR.N    R1,??DataTable8_3  ;; 0x43fe0804
        STR      R0,[R1, #+0]
//  304   SCCB_DELAY();
        MOV      R0,#+800
        BL       LPLD_SCCB_Delay
//  305   
//  306   SCCB_SDA_IN();	
        MOVS     R0,#+0
        LDR.N    R1,??DataTable8_5  ;; 0x43fe0a84
        STR      R0,[R1, #+0]
        B.N      ??LPLD_SCCB_ReceiveByte_0
//  307   
//  308   while(i--)
//  309   {
//  310     ReceiveByte<<=1;      
??LPLD_SCCB_ReceiveByte_1:
        LSLS     R5,R5,#+1
//  311     SCCB_SCL = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable8_4  ;; 0x43fe0800
        STR      R0,[R1, #+0]
//  312     SCCB_DELAY();
        MOV      R0,#+800
        BL       LPLD_SCCB_Delay
//  313     
//  314     SCCB_SCL=1;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable8_4  ;; 0x43fe0800
        STR      R0,[R1, #+0]
//  315     SCCB_DELAY();	
        MOV      R0,#+800
        BL       LPLD_SCCB_Delay
//  316     
//  317     if(SCCB_SDA_I)
        LDR.N    R0,??DataTable8_6  ;; 0x43fe0a04
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??LPLD_SCCB_ReceiveByte_0
//  318     {
//  319       ReceiveByte|=0x01;
        ORRS     R5,R5,#0x1
//  320     }
//  321     
//  322   }
??LPLD_SCCB_ReceiveByte_0:
        MOVS     R0,R4
        SUBS     R4,R0,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??LPLD_SCCB_ReceiveByte_1
//  323  SCCB_SDA_OUT();
        MOVS     R0,#+1
        LDR.N    R1,??DataTable8_5  ;; 0x43fe0a84
        STR      R0,[R1, #+0]
//  324   SCCB_SCL = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable8_4  ;; 0x43fe0800
        STR      R0,[R1, #+0]
//  325   
//  326   return ReceiveByte;
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4,R5,PC}    ;; return
//  327 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8:
        DC32     0x400ff040

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_1:
        DC32     0x43fe02cc

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_2:
        DC32     0x43fe004c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_3:
        DC32     0x43fe0804

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_4:
        DC32     0x43fe0800

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_5:
        DC32     0x43fe0a84

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_6:
        DC32     0x43fe0a04
//  328 
//  329 /*
//  330  * LPLD_SCCB_SendByte
//  331  * SCCB延时函数，内部调用
//  332  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  333 static void LPLD_SCCB_Delay(uint16 i)
//  334 {	
LPLD_SCCB_Delay:
        B.N      ??LPLD_SCCB_Delay_0
//  335   while(i) 
//  336     i--; 
??LPLD_SCCB_Delay_1:
        SUBS     R0,R0,#+1
??LPLD_SCCB_Delay_0:
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,#+0
        BNE.N    ??LPLD_SCCB_Delay_1
//  337 }
        BX       LR               ;; return

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  338 
//  339 
// 
// 860 bytes in section .text
// 
// 860 bytes of CODE memory
//
//Errors: none
//Warnings: none
