///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.1.6676/W32 for ARM       23/Apr/2015  14:23:25
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  G:\test\LPLD_OSKinetis_V3_now02\lib\SQC\SQC_OV7670.c
//    Command line =  
//        G:\test\LPLD_OSKinetis_V3_now02\lib\SQC\SQC_OV7670.c -D LPLD_K60 -lCN
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
//        G:\test\LPLD_OSKinetis_V3_now02\project\LPLD_OV7670\iar\FLASH\List\SQC_OV7670.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN LPLD_GPIO_Input_8b
        EXTERN LPLD_LCD_SetPoint
        EXTERN LPLD_SCCB_Init
        EXTERN LPLD_SCCB_ReadReg
        EXTERN LPLD_SCCB_WriteReg
        EXTERN delay

        PUBLIC SQC_OV7670_Init
        PUBLIC SQC_OV7670_Isr
        PUBLIC SQC_OV7670_Readfifo
        PUBLIC SQC_OV7670_Setreg
        PUBLIC SQC_OV7670_Show

// G:\test\LPLD_OSKinetis_V3_now02\lib\SQC\SQC_OV7670.c
//    1 /**
//    2  * @file SQC_OV7670.c
//    3  * @version 1.0[By finley]
//    4  * @date 2015-04-16
//    5  * @brief 摄像头模块相关函数
//    6  *
//    7  * 更改建议:不建议修改
//    8  *
//    9  * 版权所有:宿迁学院物联网实验室
//   10  * http://www.sqc.edu.cn
//   11  *
//   12  * @par
//   13  * 本代码由宿迁学院[SQC]开发并维护，并向所有使用者开放源代码。
//   14  * 开发者可以随意修使用或改源代码。但本段及以上注释应予以保留。
//   15  * 不得更改或删除原版权所有者姓名，二次开发者可以加注二次版权所有者。
//   16  * 但应在遵守此协议的基础上，开放源代码、不得出售代码本身。
//   17  * 宿迁学院不负责由于使用本代码所带来的任何事故、法律责任或相关不良影响。
//   18  * 宿迁学院无义务解释、说明本代码的具体原理、功能、实现方法。
//   19  * 除非宿迁学院[SQC]授权，开发者不得将本代码用于商业产品。
//   20  */
//   21 #include "common.h"

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// static __interwork __softfp void NVIC_EnableIRQ(IRQn_Type)
NVIC_EnableIRQ:
        MOVS     R1,#+1
        ANDS     R2,R0,#0x1F
        LSLS     R1,R1,R2
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        LSRS     R0,R0,#+5
        LDR.W    R2,??DataTable2  ;; 0xe000e100
        STR      R1,[R2, R0, LSL #+2]
        BX       LR               ;; return
//   22 #include "SQC_OV7670.h"
//   23 #include "DEV_SCCB.h"
//   24 #include "DEV_LCD.h"
//   25 #include "HW_GPIO.h"
//   26 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   27 static uint8 Is_DispPhoto = 0;               //图像发送标志
Is_DispPhoto:
        DS8 1
//   28 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   29 uint8 SQC_OV7670_Init(void)
//   30 {
SQC_OV7670_Init:
        PUSH     {R4,LR}
        SUB      SP,SP,#+8
//   31   uint16 i = 0;
        MOVS     R4,#+0
//   32   uint8 device_id = 0;
        MOVS     R0,#+0
        STRB     R0,[SP, #+0]
//   33   
//   34   LPLD_SCCB_Init();
        BL       LPLD_SCCB_Init
//   35   
//   36   delay();
        BL       delay
//   37   
//   38   //复位OV7670寄存器
//   39   while( 0 == LPLD_SCCB_WriteReg(0x12, 0x80 )) 
??SQC_OV7670_Init_0:
        MOVS     R1,#+128
        MOVS     R0,#+18
        BL       LPLD_SCCB_WriteReg
        CMP      R0,#+0
        BNE.N    ??SQC_OV7670_Init_1
//   40   {
//   41     i++;
        ADDS     R4,R4,#+1
//   42     if(i == 500)
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        CMP      R4,#+500
        BNE.N    ??SQC_OV7670_Init_0
//   43     {
//   44       return 0 ;
        MOVS     R0,#+0
        B.N      ??SQC_OV7670_Init_2
//   45     }    
//   46   }
//   47   delay();
??SQC_OV7670_Init_1:
        BL       delay
//   48   
//   49   //读取设备ID
//   50   while( 0 == LPLD_SCCB_ReadReg(0x1C, &device_id, 1));	
??SQC_OV7670_Init_3:
        MOVS     R2,#+1
        ADD      R1,SP,#+0
        MOVS     R0,#+28
        BL       LPLD_SCCB_ReadReg
        CMP      R0,#+0
        BEQ.N    ??SQC_OV7670_Init_3
//   51   
//   52   //如果为OV7670
//   53   if(device_id == 0x7F)
        LDRB     R0,[SP, #+0]
        CMP      R0,#+127
        BNE.N    ??SQC_OV7670_Init_4
//   54   {  
//   55     SQC_OV7670_Setreg();
        BL       SQC_OV7670_Setreg
//   56     //while( 0 == LPLD_SCCB_WriteReg(0x1E, 0x21) );
//   57     // while( 0 == LPLD_SCCB_WriteReg(0x3E, 0x19) );	
//   58     //while( 0 == LPLD_SCCB_WriteReg(0x73, 0x09) );	
//   59     //while( 0 == LPLD_SCCB_WriteReg(0x15, 0x20) );	
//   60   }
//   61   else
//   62   {
//   63     return 0;
//   64   }
//   65   
//   66   return 1;
        MOVS     R0,#+1
        B.N      ??SQC_OV7670_Init_2
??SQC_OV7670_Init_4:
        MOVS     R0,#+0
??SQC_OV7670_Init_2:
        POP      {R1,R2,R4,PC}    ;; return
//   67 }
//   68 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   69 void SQC_OV7670_Setreg(void)
//   70 {
SQC_OV7670_Setreg:
        PUSH     {R7,LR}
//   71   LPLD_SCCB_WriteReg(0x3a, 0x04);
        MOVS     R1,#+4
        MOVS     R0,#+58
        BL       LPLD_SCCB_WriteReg
//   72   LPLD_SCCB_WriteReg(0x40, 0xd0);
        MOVS     R1,#+208
        MOVS     R0,#+64
        BL       LPLD_SCCB_WriteReg
//   73   LPLD_SCCB_WriteReg(0x12, 0x14);
        MOVS     R1,#+20
        MOVS     R0,#+18
        BL       LPLD_SCCB_WriteReg
//   74   LPLD_SCCB_WriteReg(0x32, 0x80);
        MOVS     R1,#+128
        MOVS     R0,#+50
        BL       LPLD_SCCB_WriteReg
//   75   LPLD_SCCB_WriteReg(0x17, 0x16);
        MOVS     R1,#+22
        MOVS     R0,#+23
        BL       LPLD_SCCB_WriteReg
//   76   LPLD_SCCB_WriteReg(0x18, 0x04);
        MOVS     R1,#+4
        MOVS     R0,#+24
        BL       LPLD_SCCB_WriteReg
//   77   LPLD_SCCB_WriteReg(0x19, 0x02);
        MOVS     R1,#+2
        MOVS     R0,#+25
        BL       LPLD_SCCB_WriteReg
//   78   LPLD_SCCB_WriteReg(0x1a, 0x7b);
        MOVS     R1,#+123
        MOVS     R0,#+26
        BL       LPLD_SCCB_WriteReg
//   79   LPLD_SCCB_WriteReg(0x03, 0x06);
        MOVS     R1,#+6
        MOVS     R0,#+3
        BL       LPLD_SCCB_WriteReg
//   80   LPLD_SCCB_WriteReg(0x0c, 0x04);
        MOVS     R1,#+4
        MOVS     R0,#+12
        BL       LPLD_SCCB_WriteReg
//   81   LPLD_SCCB_WriteReg(0x3e, 0x00);
        MOVS     R1,#+0
        MOVS     R0,#+62
        BL       LPLD_SCCB_WriteReg
//   82   LPLD_SCCB_WriteReg(0x70, 0x3a);
        MOVS     R1,#+58
        MOVS     R0,#+112
        BL       LPLD_SCCB_WriteReg
//   83   LPLD_SCCB_WriteReg(0x71, 0x35);
        MOVS     R1,#+53
        MOVS     R0,#+113
        BL       LPLD_SCCB_WriteReg
//   84   LPLD_SCCB_WriteReg(0x72, 0x11);
        MOVS     R1,#+17
        MOVS     R0,#+114
        BL       LPLD_SCCB_WriteReg
//   85   LPLD_SCCB_WriteReg(0x73, 0x00);
        MOVS     R1,#+0
        MOVS     R0,#+115
        BL       LPLD_SCCB_WriteReg
//   86   LPLD_SCCB_WriteReg(0xa2, 0x02);
        MOVS     R1,#+2
        MOVS     R0,#+162
        BL       LPLD_SCCB_WriteReg
//   87   LPLD_SCCB_WriteReg(0x11, 0x81);
        MOVS     R1,#+129
        MOVS     R0,#+17
        BL       LPLD_SCCB_WriteReg
//   88   
//   89   LPLD_SCCB_WriteReg(0x7a, 0x20);
        MOVS     R1,#+32
        MOVS     R0,#+122
        BL       LPLD_SCCB_WriteReg
//   90   LPLD_SCCB_WriteReg(0x7b, 0x1c);
        MOVS     R1,#+28
        MOVS     R0,#+123
        BL       LPLD_SCCB_WriteReg
//   91   LPLD_SCCB_WriteReg(0x7c, 0x28);
        MOVS     R1,#+40
        MOVS     R0,#+124
        BL       LPLD_SCCB_WriteReg
//   92   LPLD_SCCB_WriteReg(0x7d, 0x3c);
        MOVS     R1,#+60
        MOVS     R0,#+125
        BL       LPLD_SCCB_WriteReg
//   93   LPLD_SCCB_WriteReg(0x7e, 0x55);
        MOVS     R1,#+85
        MOVS     R0,#+126
        BL       LPLD_SCCB_WriteReg
//   94   LPLD_SCCB_WriteReg(0x7f, 0x68);
        MOVS     R1,#+104
        MOVS     R0,#+127
        BL       LPLD_SCCB_WriteReg
//   95   LPLD_SCCB_WriteReg(0x80, 0x76);
        MOVS     R1,#+118
        MOVS     R0,#+128
        BL       LPLD_SCCB_WriteReg
//   96   LPLD_SCCB_WriteReg(0x81, 0x80);
        MOVS     R1,#+128
        MOVS     R0,#+129
        BL       LPLD_SCCB_WriteReg
//   97   LPLD_SCCB_WriteReg(0x82, 0x88);
        MOVS     R1,#+136
        MOVS     R0,#+130
        BL       LPLD_SCCB_WriteReg
//   98   LPLD_SCCB_WriteReg(0x83, 0x8f);
        MOVS     R1,#+143
        MOVS     R0,#+131
        BL       LPLD_SCCB_WriteReg
//   99   LPLD_SCCB_WriteReg(0x84, 0x96);
        MOVS     R1,#+150
        MOVS     R0,#+132
        BL       LPLD_SCCB_WriteReg
//  100   LPLD_SCCB_WriteReg(0x85, 0xa3);
        MOVS     R1,#+163
        MOVS     R0,#+133
        BL       LPLD_SCCB_WriteReg
//  101   LPLD_SCCB_WriteReg(0x86, 0xaf);
        MOVS     R1,#+175
        MOVS     R0,#+134
        BL       LPLD_SCCB_WriteReg
//  102   LPLD_SCCB_WriteReg(0x87, 0xc4);
        MOVS     R1,#+196
        MOVS     R0,#+135
        BL       LPLD_SCCB_WriteReg
//  103   LPLD_SCCB_WriteReg(0x88, 0xd7);
        MOVS     R1,#+215
        MOVS     R0,#+136
        BL       LPLD_SCCB_WriteReg
//  104   LPLD_SCCB_WriteReg(0x89, 0xe8);
        MOVS     R1,#+232
        MOVS     R0,#+137
        BL       LPLD_SCCB_WriteReg
//  105   
//  106   LPLD_SCCB_WriteReg(0x13, 0xe0);
        MOVS     R1,#+224
        MOVS     R0,#+19
        BL       LPLD_SCCB_WriteReg
//  107   LPLD_SCCB_WriteReg(0x00, 0x00);
        MOVS     R1,#+0
        MOVS     R0,#+0
        BL       LPLD_SCCB_WriteReg
//  108   
//  109   LPLD_SCCB_WriteReg(0x10, 0x00);
        MOVS     R1,#+0
        MOVS     R0,#+16
        BL       LPLD_SCCB_WriteReg
//  110   LPLD_SCCB_WriteReg(0x0d, 0x00);
        MOVS     R1,#+0
        MOVS     R0,#+13
        BL       LPLD_SCCB_WriteReg
//  111   LPLD_SCCB_WriteReg(0x14, 0x28);
        MOVS     R1,#+40
        MOVS     R0,#+20
        BL       LPLD_SCCB_WriteReg
//  112   LPLD_SCCB_WriteReg(0xa5, 0x05);
        MOVS     R1,#+5
        MOVS     R0,#+165
        BL       LPLD_SCCB_WriteReg
//  113   LPLD_SCCB_WriteReg(0xab, 0x07);
        MOVS     R1,#+7
        MOVS     R0,#+171
        BL       LPLD_SCCB_WriteReg
//  114   LPLD_SCCB_WriteReg(0x24, 0x75);
        MOVS     R1,#+117
        MOVS     R0,#+36
        BL       LPLD_SCCB_WriteReg
//  115   LPLD_SCCB_WriteReg(0x25, 0x63);
        MOVS     R1,#+99
        MOVS     R0,#+37
        BL       LPLD_SCCB_WriteReg
//  116   LPLD_SCCB_WriteReg(0x26, 0xA5);
        MOVS     R1,#+165
        MOVS     R0,#+38
        BL       LPLD_SCCB_WriteReg
//  117   LPLD_SCCB_WriteReg(0x9f, 0x78);
        MOVS     R1,#+120
        MOVS     R0,#+159
        BL       LPLD_SCCB_WriteReg
//  118   LPLD_SCCB_WriteReg(0xa0, 0x68);
        MOVS     R1,#+104
        MOVS     R0,#+160
        BL       LPLD_SCCB_WriteReg
//  119   LPLD_SCCB_WriteReg(0xa1, 0x03);
        MOVS     R1,#+3
        MOVS     R0,#+161
        BL       LPLD_SCCB_WriteReg
//  120   LPLD_SCCB_WriteReg(0xa6, 0xdf);
        MOVS     R1,#+223
        MOVS     R0,#+166
        BL       LPLD_SCCB_WriteReg
//  121   LPLD_SCCB_WriteReg(0xa7, 0xdf);
        MOVS     R1,#+223
        MOVS     R0,#+167
        BL       LPLD_SCCB_WriteReg
//  122   LPLD_SCCB_WriteReg(0xa8, 0xf0);
        MOVS     R1,#+240
        MOVS     R0,#+168
        BL       LPLD_SCCB_WriteReg
//  123   LPLD_SCCB_WriteReg(0xa9, 0x90);
        MOVS     R1,#+144
        MOVS     R0,#+169
        BL       LPLD_SCCB_WriteReg
//  124   LPLD_SCCB_WriteReg(0xaa, 0x94);
        MOVS     R1,#+148
        MOVS     R0,#+170
        BL       LPLD_SCCB_WriteReg
//  125   LPLD_SCCB_WriteReg(0x13, 0xe5);
        MOVS     R1,#+229
        MOVS     R0,#+19
        BL       LPLD_SCCB_WriteReg
//  126   
//  127   LPLD_SCCB_WriteReg(0x0e, 0x61);
        MOVS     R1,#+97
        MOVS     R0,#+14
        BL       LPLD_SCCB_WriteReg
//  128   LPLD_SCCB_WriteReg(0x0f, 0x4b);
        MOVS     R1,#+75
        MOVS     R0,#+15
        BL       LPLD_SCCB_WriteReg
//  129   LPLD_SCCB_WriteReg(0x16, 0x02);
        MOVS     R1,#+2
        MOVS     R0,#+22
        BL       LPLD_SCCB_WriteReg
//  130   LPLD_SCCB_WriteReg(0x1e, 0x07);
        MOVS     R1,#+7
        MOVS     R0,#+30
        BL       LPLD_SCCB_WriteReg
//  131   LPLD_SCCB_WriteReg(0x21, 0x02);
        MOVS     R1,#+2
        MOVS     R0,#+33
        BL       LPLD_SCCB_WriteReg
//  132   LPLD_SCCB_WriteReg(0x22, 0x91);
        MOVS     R1,#+145
        MOVS     R0,#+34
        BL       LPLD_SCCB_WriteReg
//  133   LPLD_SCCB_WriteReg(0x29, 0x07);
        MOVS     R1,#+7
        MOVS     R0,#+41
        BL       LPLD_SCCB_WriteReg
//  134   LPLD_SCCB_WriteReg(0x33, 0x0b);
        MOVS     R1,#+11
        MOVS     R0,#+51
        BL       LPLD_SCCB_WriteReg
//  135   LPLD_SCCB_WriteReg(0x35, 0x0b);
        MOVS     R1,#+11
        MOVS     R0,#+53
        BL       LPLD_SCCB_WriteReg
//  136   LPLD_SCCB_WriteReg(0x37, 0x1d);
        MOVS     R1,#+29
        MOVS     R0,#+55
        BL       LPLD_SCCB_WriteReg
//  137   LPLD_SCCB_WriteReg(0x38, 0x71);
        MOVS     R1,#+113
        MOVS     R0,#+56
        BL       LPLD_SCCB_WriteReg
//  138   LPLD_SCCB_WriteReg(0x39, 0x2a);
        MOVS     R1,#+42
        MOVS     R0,#+57
        BL       LPLD_SCCB_WriteReg
//  139   LPLD_SCCB_WriteReg(0x3c, 0x78);
        MOVS     R1,#+120
        MOVS     R0,#+60
        BL       LPLD_SCCB_WriteReg
//  140   LPLD_SCCB_WriteReg(0x4d, 0x40);
        MOVS     R1,#+64
        MOVS     R0,#+77
        BL       LPLD_SCCB_WriteReg
//  141   LPLD_SCCB_WriteReg(0x4e, 0x20);
        MOVS     R1,#+32
        MOVS     R0,#+78
        BL       LPLD_SCCB_WriteReg
//  142   LPLD_SCCB_WriteReg(0x69, 0x00);
        MOVS     R1,#+0
        MOVS     R0,#+105
        BL       LPLD_SCCB_WriteReg
//  143   LPLD_SCCB_WriteReg(0x6b, 0x60);
        MOVS     R1,#+96
        MOVS     R0,#+107
        BL       LPLD_SCCB_WriteReg
//  144   LPLD_SCCB_WriteReg(0x74, 0x19);
        MOVS     R1,#+25
        MOVS     R0,#+116
        BL       LPLD_SCCB_WriteReg
//  145   LPLD_SCCB_WriteReg(0x8d, 0x4f);
        MOVS     R1,#+79
        MOVS     R0,#+141
        BL       LPLD_SCCB_WriteReg
//  146   LPLD_SCCB_WriteReg(0x8e, 0x00);
        MOVS     R1,#+0
        MOVS     R0,#+142
        BL       LPLD_SCCB_WriteReg
//  147   LPLD_SCCB_WriteReg(0x8f, 0x00);
        MOVS     R1,#+0
        MOVS     R0,#+143
        BL       LPLD_SCCB_WriteReg
//  148   LPLD_SCCB_WriteReg(0x90, 0x00);
        MOVS     R1,#+0
        MOVS     R0,#+144
        BL       LPLD_SCCB_WriteReg
//  149   LPLD_SCCB_WriteReg(0x91, 0x00);
        MOVS     R1,#+0
        MOVS     R0,#+145
        BL       LPLD_SCCB_WriteReg
//  150   LPLD_SCCB_WriteReg(0x92, 0x00);
        MOVS     R1,#+0
        MOVS     R0,#+146
        BL       LPLD_SCCB_WriteReg
//  151   LPLD_SCCB_WriteReg(0x96, 0x00);
        MOVS     R1,#+0
        MOVS     R0,#+150
        BL       LPLD_SCCB_WriteReg
//  152   LPLD_SCCB_WriteReg(0x9a, 0x80);
        MOVS     R1,#+128
        MOVS     R0,#+154
        BL       LPLD_SCCB_WriteReg
//  153   LPLD_SCCB_WriteReg(0xb0, 0x84);
        MOVS     R1,#+132
        MOVS     R0,#+176
        BL       LPLD_SCCB_WriteReg
//  154   LPLD_SCCB_WriteReg(0xb1, 0x0c);
        MOVS     R1,#+12
        MOVS     R0,#+177
        BL       LPLD_SCCB_WriteReg
//  155   LPLD_SCCB_WriteReg(0xb2, 0x0e);
        MOVS     R1,#+14
        MOVS     R0,#+178
        BL       LPLD_SCCB_WriteReg
//  156   LPLD_SCCB_WriteReg(0xb3, 0x82);
        MOVS     R1,#+130
        MOVS     R0,#+179
        BL       LPLD_SCCB_WriteReg
//  157   LPLD_SCCB_WriteReg(0xb8, 0x0a);
        MOVS     R1,#+10
        MOVS     R0,#+184
        BL       LPLD_SCCB_WriteReg
//  158   
//  159   
//  160   
//  161   LPLD_SCCB_WriteReg(0x43, 0x14);
        MOVS     R1,#+20
        MOVS     R0,#+67
        BL       LPLD_SCCB_WriteReg
//  162   LPLD_SCCB_WriteReg(0x44, 0xf0);
        MOVS     R1,#+240
        MOVS     R0,#+68
        BL       LPLD_SCCB_WriteReg
//  163   LPLD_SCCB_WriteReg(0x45, 0x34);
        MOVS     R1,#+52
        MOVS     R0,#+69
        BL       LPLD_SCCB_WriteReg
//  164   LPLD_SCCB_WriteReg(0x46, 0x58);
        MOVS     R1,#+88
        MOVS     R0,#+70
        BL       LPLD_SCCB_WriteReg
//  165   LPLD_SCCB_WriteReg(0x47, 0x28);
        MOVS     R1,#+40
        MOVS     R0,#+71
        BL       LPLD_SCCB_WriteReg
//  166   LPLD_SCCB_WriteReg(0x48, 0x3a);
        MOVS     R1,#+58
        MOVS     R0,#+72
        BL       LPLD_SCCB_WriteReg
//  167   LPLD_SCCB_WriteReg(0x59, 0x88);
        MOVS     R1,#+136
        MOVS     R0,#+89
        BL       LPLD_SCCB_WriteReg
//  168   LPLD_SCCB_WriteReg(0x5a, 0x88);
        MOVS     R1,#+136
        MOVS     R0,#+90
        BL       LPLD_SCCB_WriteReg
//  169   LPLD_SCCB_WriteReg(0x5b, 0x44);
        MOVS     R1,#+68
        MOVS     R0,#+91
        BL       LPLD_SCCB_WriteReg
//  170   LPLD_SCCB_WriteReg(0x5c, 0x67);
        MOVS     R1,#+103
        MOVS     R0,#+92
        BL       LPLD_SCCB_WriteReg
//  171   LPLD_SCCB_WriteReg(0x5d, 0x49);
        MOVS     R1,#+73
        MOVS     R0,#+93
        BL       LPLD_SCCB_WriteReg
//  172   LPLD_SCCB_WriteReg(0x5e, 0x0e);
        MOVS     R1,#+14
        MOVS     R0,#+94
        BL       LPLD_SCCB_WriteReg
//  173   LPLD_SCCB_WriteReg(0x64, 0x04);
        MOVS     R1,#+4
        MOVS     R0,#+100
        BL       LPLD_SCCB_WriteReg
//  174   LPLD_SCCB_WriteReg(0x65, 0x20);
        MOVS     R1,#+32
        MOVS     R0,#+101
        BL       LPLD_SCCB_WriteReg
//  175   LPLD_SCCB_WriteReg(0x66, 0x05);
        MOVS     R1,#+5
        MOVS     R0,#+102
        BL       LPLD_SCCB_WriteReg
//  176   LPLD_SCCB_WriteReg(0x94, 0x04);
        MOVS     R1,#+4
        MOVS     R0,#+148
        BL       LPLD_SCCB_WriteReg
//  177   LPLD_SCCB_WriteReg(0x95, 0x08);
        MOVS     R1,#+8
        MOVS     R0,#+149
        BL       LPLD_SCCB_WriteReg
//  178   LPLD_SCCB_WriteReg(0x6c, 0x0a);
        MOVS     R1,#+10
        MOVS     R0,#+108
        BL       LPLD_SCCB_WriteReg
//  179   LPLD_SCCB_WriteReg(0x6d, 0x55);
        MOVS     R1,#+85
        MOVS     R0,#+109
        BL       LPLD_SCCB_WriteReg
//  180   LPLD_SCCB_WriteReg(0x6e, 0x11);
        MOVS     R1,#+17
        MOVS     R0,#+110
        BL       LPLD_SCCB_WriteReg
//  181   LPLD_SCCB_WriteReg(0x6f, 0x9f);
        MOVS     R1,#+159
        MOVS     R0,#+111
        BL       LPLD_SCCB_WriteReg
//  182   LPLD_SCCB_WriteReg(0x6a, 0x40);
        MOVS     R1,#+64
        MOVS     R0,#+106
        BL       LPLD_SCCB_WriteReg
//  183   LPLD_SCCB_WriteReg(0x01, 0x40);
        MOVS     R1,#+64
        MOVS     R0,#+1
        BL       LPLD_SCCB_WriteReg
//  184   LPLD_SCCB_WriteReg(0x02, 0x40);
        MOVS     R1,#+64
        MOVS     R0,#+2
        BL       LPLD_SCCB_WriteReg
//  185   LPLD_SCCB_WriteReg(0x13, 0xe7);
        MOVS     R1,#+231
        MOVS     R0,#+19
        BL       LPLD_SCCB_WriteReg
//  186   LPLD_SCCB_WriteReg(0x15, 0x00);  
        MOVS     R1,#+0
        MOVS     R0,#+21
        BL       LPLD_SCCB_WriteReg
//  187   
//  188   
//  189   LPLD_SCCB_WriteReg(0x4f, 0x80);
        MOVS     R1,#+128
        MOVS     R0,#+79
        BL       LPLD_SCCB_WriteReg
//  190   LPLD_SCCB_WriteReg(0x50, 0x80);
        MOVS     R1,#+128
        MOVS     R0,#+80
        BL       LPLD_SCCB_WriteReg
//  191   LPLD_SCCB_WriteReg(0x51, 0x00);
        MOVS     R1,#+0
        MOVS     R0,#+81
        BL       LPLD_SCCB_WriteReg
//  192   LPLD_SCCB_WriteReg(0x52, 0x22);
        MOVS     R1,#+34
        MOVS     R0,#+82
        BL       LPLD_SCCB_WriteReg
//  193   LPLD_SCCB_WriteReg(0x53, 0x5e);
        MOVS     R1,#+94
        MOVS     R0,#+83
        BL       LPLD_SCCB_WriteReg
//  194   LPLD_SCCB_WriteReg(0x54, 0x80);
        MOVS     R1,#+128
        MOVS     R0,#+84
        BL       LPLD_SCCB_WriteReg
//  195   LPLD_SCCB_WriteReg(0x58, 0x9e);
        MOVS     R1,#+158
        MOVS     R0,#+88
        BL       LPLD_SCCB_WriteReg
//  196   
//  197   LPLD_SCCB_WriteReg(0x41, 0x08);
        MOVS     R1,#+8
        MOVS     R0,#+65
        BL       LPLD_SCCB_WriteReg
//  198   LPLD_SCCB_WriteReg(0x3f, 0x00);
        MOVS     R1,#+0
        MOVS     R0,#+63
        BL       LPLD_SCCB_WriteReg
//  199   LPLD_SCCB_WriteReg(0x75, 0x05);
        MOVS     R1,#+5
        MOVS     R0,#+117
        BL       LPLD_SCCB_WriteReg
//  200   LPLD_SCCB_WriteReg(0x76, 0xe1);
        MOVS     R1,#+225
        MOVS     R0,#+118
        BL       LPLD_SCCB_WriteReg
//  201   LPLD_SCCB_WriteReg(0x4c, 0x00);
        MOVS     R1,#+0
        MOVS     R0,#+76
        BL       LPLD_SCCB_WriteReg
//  202   LPLD_SCCB_WriteReg(0x77, 0x01);
        MOVS     R1,#+1
        MOVS     R0,#+119
        BL       LPLD_SCCB_WriteReg
//  203   LPLD_SCCB_WriteReg(0x3d, 0xc2);	
        MOVS     R1,#+194
        MOVS     R0,#+61
        BL       LPLD_SCCB_WriteReg
//  204   LPLD_SCCB_WriteReg(0x4b, 0x09);
        MOVS     R1,#+9
        MOVS     R0,#+75
        BL       LPLD_SCCB_WriteReg
//  205   LPLD_SCCB_WriteReg(0xc9, 0x60);
        MOVS     R1,#+96
        MOVS     R0,#+201
        BL       LPLD_SCCB_WriteReg
//  206   LPLD_SCCB_WriteReg(0x41, 0x38);
        MOVS     R1,#+56
        MOVS     R0,#+65
        BL       LPLD_SCCB_WriteReg
//  207   LPLD_SCCB_WriteReg(0x56, 0x40);
        MOVS     R1,#+64
        MOVS     R0,#+86
        BL       LPLD_SCCB_WriteReg
//  208   
//  209   LPLD_SCCB_WriteReg(0x34, 0x11);
        MOVS     R1,#+17
        MOVS     R0,#+52
        BL       LPLD_SCCB_WriteReg
//  210   LPLD_SCCB_WriteReg(0x3b, 0x02); 
        MOVS     R1,#+2
        MOVS     R0,#+59
        BL       LPLD_SCCB_WriteReg
//  211   
//  212   LPLD_SCCB_WriteReg(0xa4, 0x89);
        MOVS     R1,#+137
        MOVS     R0,#+164
        BL       LPLD_SCCB_WriteReg
//  213   LPLD_SCCB_WriteReg(0x96, 0x00);
        MOVS     R1,#+0
        MOVS     R0,#+150
        BL       LPLD_SCCB_WriteReg
//  214   LPLD_SCCB_WriteReg(0x97, 0x30);
        MOVS     R1,#+48
        MOVS     R0,#+151
        BL       LPLD_SCCB_WriteReg
//  215   LPLD_SCCB_WriteReg(0x98, 0x20);
        MOVS     R1,#+32
        MOVS     R0,#+152
        BL       LPLD_SCCB_WriteReg
//  216   LPLD_SCCB_WriteReg(0x99, 0x30);
        MOVS     R1,#+48
        MOVS     R0,#+153
        BL       LPLD_SCCB_WriteReg
//  217   LPLD_SCCB_WriteReg(0x9a, 0x84);
        MOVS     R1,#+132
        MOVS     R0,#+154
        BL       LPLD_SCCB_WriteReg
//  218   LPLD_SCCB_WriteReg(0x9b, 0x29);
        MOVS     R1,#+41
        MOVS     R0,#+155
        BL       LPLD_SCCB_WriteReg
//  219   LPLD_SCCB_WriteReg(0x9c, 0x03);
        MOVS     R1,#+3
        MOVS     R0,#+156
        BL       LPLD_SCCB_WriteReg
//  220   LPLD_SCCB_WriteReg(0x9d, 0x4c);
        MOVS     R1,#+76
        MOVS     R0,#+157
        BL       LPLD_SCCB_WriteReg
//  221   LPLD_SCCB_WriteReg(0x9e, 0x3f);
        MOVS     R1,#+63
        MOVS     R0,#+158
        BL       LPLD_SCCB_WriteReg
//  222   LPLD_SCCB_WriteReg(0x78, 0x04);
        MOVS     R1,#+4
        MOVS     R0,#+120
        BL       LPLD_SCCB_WriteReg
//  223   
//  224   LPLD_SCCB_WriteReg(0x79, 0x01);
        MOVS     R1,#+1
        MOVS     R0,#+121
        BL       LPLD_SCCB_WriteReg
//  225   LPLD_SCCB_WriteReg(0xc8, 0xf0);
        MOVS     R1,#+240
        MOVS     R0,#+200
        BL       LPLD_SCCB_WriteReg
//  226   LPLD_SCCB_WriteReg(0x79, 0x0f);
        MOVS     R1,#+15
        MOVS     R0,#+121
        BL       LPLD_SCCB_WriteReg
//  227   LPLD_SCCB_WriteReg(0xc8, 0x00);
        MOVS     R1,#+0
        MOVS     R0,#+200
        BL       LPLD_SCCB_WriteReg
//  228   LPLD_SCCB_WriteReg(0x79, 0x10);
        MOVS     R1,#+16
        MOVS     R0,#+121
        BL       LPLD_SCCB_WriteReg
//  229   LPLD_SCCB_WriteReg(0xc8, 0x7e);
        MOVS     R1,#+126
        MOVS     R0,#+200
        BL       LPLD_SCCB_WriteReg
//  230   LPLD_SCCB_WriteReg(0x79, 0x0a);
        MOVS     R1,#+10
        MOVS     R0,#+121
        BL       LPLD_SCCB_WriteReg
//  231   LPLD_SCCB_WriteReg(0xc8, 0x80);
        MOVS     R1,#+128
        MOVS     R0,#+200
        BL       LPLD_SCCB_WriteReg
//  232   LPLD_SCCB_WriteReg(0x79, 0x0b);
        MOVS     R1,#+11
        MOVS     R0,#+121
        BL       LPLD_SCCB_WriteReg
//  233   LPLD_SCCB_WriteReg(0xc8, 0x01);
        MOVS     R1,#+1
        MOVS     R0,#+200
        BL       LPLD_SCCB_WriteReg
//  234   LPLD_SCCB_WriteReg(0x79, 0x0c);
        MOVS     R1,#+12
        MOVS     R0,#+121
        BL       LPLD_SCCB_WriteReg
//  235   LPLD_SCCB_WriteReg(0xc8, 0x0f);
        MOVS     R1,#+15
        MOVS     R0,#+200
        BL       LPLD_SCCB_WriteReg
//  236   LPLD_SCCB_WriteReg(0x79, 0x0d);
        MOVS     R1,#+13
        MOVS     R0,#+121
        BL       LPLD_SCCB_WriteReg
//  237   LPLD_SCCB_WriteReg(0xc8, 0x20);
        MOVS     R1,#+32
        MOVS     R0,#+200
        BL       LPLD_SCCB_WriteReg
//  238   LPLD_SCCB_WriteReg(0x79, 0x09);
        MOVS     R1,#+9
        MOVS     R0,#+121
        BL       LPLD_SCCB_WriteReg
//  239   LPLD_SCCB_WriteReg(0xc8, 0x80);
        MOVS     R1,#+128
        MOVS     R0,#+200
        BL       LPLD_SCCB_WriteReg
//  240   LPLD_SCCB_WriteReg(0x79, 0x02);
        MOVS     R1,#+2
        MOVS     R0,#+121
        BL       LPLD_SCCB_WriteReg
//  241   LPLD_SCCB_WriteReg(0xc8, 0xc0);
        MOVS     R1,#+192
        MOVS     R0,#+200
        BL       LPLD_SCCB_WriteReg
//  242   LPLD_SCCB_WriteReg(0x79, 0x03);
        MOVS     R1,#+3
        MOVS     R0,#+121
        BL       LPLD_SCCB_WriteReg
//  243   LPLD_SCCB_WriteReg(0xc8, 0x40);
        MOVS     R1,#+64
        MOVS     R0,#+200
        BL       LPLD_SCCB_WriteReg
//  244   LPLD_SCCB_WriteReg(0x79, 0x05);
        MOVS     R1,#+5
        MOVS     R0,#+121
        BL       LPLD_SCCB_WriteReg
//  245   LPLD_SCCB_WriteReg(0xc8, 0x30);
        MOVS     R1,#+48
        MOVS     R0,#+200
        BL       LPLD_SCCB_WriteReg
//  246   LPLD_SCCB_WriteReg(0x79, 0x26); 
        MOVS     R1,#+38
        MOVS     R0,#+121
        BL       LPLD_SCCB_WriteReg
//  247   LPLD_SCCB_WriteReg(0x09, 0x00);	
        MOVS     R1,#+0
        MOVS     R0,#+9
        BL       LPLD_SCCB_WriteReg
//  248   
//  249   
//  250   
//  251   //     /*以下为OV7670 QVGA RGB565参数  */
//  252   //  	LPLD_SCCB_WriteReg(0x3a, 0x04);//
//  253   //	LPLD_SCCB_WriteReg(0x40, 0x10);
//  254   //	LPLD_SCCB_WriteReg(0x12, 0x14);//QVGA,RGB输出
//  255   //
//  256   //	//输出窗口设置
//  257   //	LPLD_SCCB_WriteReg(0x32, 0x80);
//  258   //	LPLD_SCCB_WriteReg(0x17, 0x16);         
//  259   //	LPLD_SCCB_WriteReg(0x18, 0x04);//5
//  260   //	LPLD_SCCB_WriteReg(0x19, 0x02);
//  261   //	LPLD_SCCB_WriteReg(0x1a, 0x7a);//0x7a,
//  262   // 	LPLD_SCCB_WriteReg(0x03, 0x0a);//0x0a,
//  263   //
//  264   //
//  265   //	LPLD_SCCB_WriteReg(0x0c, 0x0c);
//  266   //	LPLD_SCCB_WriteReg(0x15, 0x00);
//  267   //	LPLD_SCCB_WriteReg(0x3e, 0x00);//10
//  268   //	LPLD_SCCB_WriteReg(0x70, 0x00);
//  269   //	LPLD_SCCB_WriteReg(0x71, 0x01);
//  270   //	LPLD_SCCB_WriteReg(0x72, 0x11);
//  271   //	LPLD_SCCB_WriteReg(0x73, 0x09);//
//  272   //        
//  273   //	LPLD_SCCB_WriteReg(0xa2, 0x02);//15
//  274   //	LPLD_SCCB_WriteReg(0x11, 0x00);//时钟分频设置,0,不分频.
//  275   //	LPLD_SCCB_WriteReg(0x7a, 0x20);
//  276   //	LPLD_SCCB_WriteReg(0x7b, 0x1c);
//  277   //	LPLD_SCCB_WriteReg(0x7c, 0x28);
//  278   //        
//  279   //	LPLD_SCCB_WriteReg(0x7d, 0x3c);//20
//  280   //	LPLD_SCCB_WriteReg(0x7e, 0x55);
//  281   //	LPLD_SCCB_WriteReg(0x7f, 0x68);
//  282   //	LPLD_SCCB_WriteReg(0x80, 0x76);
//  283   //	LPLD_SCCB_WriteReg(0x81, 0x80);
//  284   //        
//  285   //	LPLD_SCCB_WriteReg(0x82, 0x88);
//  286   //	LPLD_SCCB_WriteReg(0x83, 0x8f);
//  287   //	LPLD_SCCB_WriteReg(0x84, 0x96);
//  288   //	LPLD_SCCB_WriteReg(0x85, 0xa3);
//  289   //	LPLD_SCCB_WriteReg(0x86, 0xaf);
//  290   //        
//  291   //	LPLD_SCCB_WriteReg(0x87, 0xc4);//30
//  292   //	LPLD_SCCB_WriteReg(0x88, 0xd7);
//  293   //	LPLD_SCCB_WriteReg(0x89, 0xe8);
//  294   //	LPLD_SCCB_WriteReg(0x13, 0xe0);
//  295   //	LPLD_SCCB_WriteReg(0x00, 0x00);//AGC
//  296   //        
//  297   //	LPLD_SCCB_WriteReg(0x10, 0x00);
//  298   //	LPLD_SCCB_WriteReg(0x0d, 0x00); 
//  299   //	LPLD_SCCB_WriteReg(0x14, 0x20);//0x38, limit the max gain
//  300   //	LPLD_SCCB_WriteReg(0xa5, 0x05);
//  301   //	LPLD_SCCB_WriteReg(0xab, 0x07);
//  302   //        
//  303   //	LPLD_SCCB_WriteReg(0x24, 0x75);//40
//  304   //	LPLD_SCCB_WriteReg(0x25, 0x63);
//  305   //	LPLD_SCCB_WriteReg(0x26, 0xA5);
//  306   //	LPLD_SCCB_WriteReg(0x9f, 0x78);
//  307   //	LPLD_SCCB_WriteReg(0xa0, 0x68);
//  308   //        
//  309   //	LPLD_SCCB_WriteReg(0xa1, 0x03);//0x0b,
//  310   //	LPLD_SCCB_WriteReg(0xa6, 0xdf);//0xd8,
//  311   //	LPLD_SCCB_WriteReg(0xa7, 0xdf);//0xd8,
//  312   //	LPLD_SCCB_WriteReg(0xa8, 0xf0);
//  313   //	LPLD_SCCB_WriteReg(0xa9, 0x90);
//  314   //        
//  315   //	LPLD_SCCB_WriteReg(0xaa, 0x94);//50
//  316   //	LPLD_SCCB_WriteReg(0x13, 0xe5);
//  317   //	LPLD_SCCB_WriteReg(0x0e, 0x61);
//  318   //	LPLD_SCCB_WriteReg(0x0f, 0x4b);
//  319   //	LPLD_SCCB_WriteReg(0x16, 0x02);
//  320   //        
//  321   //	LPLD_SCCB_WriteReg(0x1e, 0x27);//图像输出镜像控制.0x07,
//  322   //	LPLD_SCCB_WriteReg(0x21, 0x02);
//  323   //	LPLD_SCCB_WriteReg(0x22, 0x91);
//  324   //	LPLD_SCCB_WriteReg(0x29, 0x07);
//  325   //	LPLD_SCCB_WriteReg(0x33, 0x0b);
//  326   //        
//  327   //	LPLD_SCCB_WriteReg(0x35, 0x0b);//60
//  328   //	LPLD_SCCB_WriteReg(0x37, 0x1d);
//  329   //	LPLD_SCCB_WriteReg(0x38, 0x71);
//  330   //	LPLD_SCCB_WriteReg(0x39, 0x2a);
//  331   //	LPLD_SCCB_WriteReg(0x3c, 0x78);
//  332   //        
//  333   //	LPLD_SCCB_WriteReg(0x4d, 0x40);
//  334   //	LPLD_SCCB_WriteReg(0x4e, 0x20);
//  335   //	LPLD_SCCB_WriteReg(0x69, 0x5d);
//  336   //	LPLD_SCCB_WriteReg(0x6b, 0x40);//PLL*4=48Mhz
//  337   //	LPLD_SCCB_WriteReg(0x74, 0x19);
//  338   //	LPLD_SCCB_WriteReg(0x8d, 0x4f);
//  339   //        
//  340   //	LPLD_SCCB_WriteReg(0x8e, 0x00);//70
//  341   //	LPLD_SCCB_WriteReg(0x8f, 0x00);
//  342   //	LPLD_SCCB_WriteReg(0x90, 0x00);
//  343   //	LPLD_SCCB_WriteReg(0x91, 0x00);
//  344   //	LPLD_SCCB_WriteReg(0x92, 0x00);//0x19,//0x66
//  345   //        
//  346   //	LPLD_SCCB_WriteReg(0x96, 0x00);
//  347   //	LPLD_SCCB_WriteReg(0x9a, 0x80);
//  348   //	LPLD_SCCB_WriteReg(0xb0, 0x84);
//  349   //	LPLD_SCCB_WriteReg(0xb1, 0x0c);
//  350   //	LPLD_SCCB_WriteReg(0xb2, 0x0e);
//  351   //        
//  352   //	LPLD_SCCB_WriteReg(0xb3, 0x82);//80
//  353   //	LPLD_SCCB_WriteReg(0xb8, 0x0a);
//  354   //	LPLD_SCCB_WriteReg(0x43, 0x14);
//  355   //	LPLD_SCCB_WriteReg(0x44, 0xf0);
//  356   //	LPLD_SCCB_WriteReg(0x45, 0x34);
//  357   //        
//  358   //	LPLD_SCCB_WriteReg(0x46, 0x58);
//  359   //	LPLD_SCCB_WriteReg(0x47, 0x28);
//  360   //	LPLD_SCCB_WriteReg(0x48, 0x3a);
//  361   //	LPLD_SCCB_WriteReg(0x59, 0x88);
//  362   //	LPLD_SCCB_WriteReg(0x5a, 0x88);
//  363   //        
//  364   //	LPLD_SCCB_WriteReg(0x5b, 0x44);//90
//  365   //	LPLD_SCCB_WriteReg(0x5c, 0x67);
//  366   //	LPLD_SCCB_WriteReg(0x5d, 0x49);
//  367   //	LPLD_SCCB_WriteReg(0x5e, 0x0e);
//  368   //	LPLD_SCCB_WriteReg(0x64, 0x04);
//  369   //	LPLD_SCCB_WriteReg(0x65, 0x20);
//  370   //        
//  371   //	LPLD_SCCB_WriteReg(0x66, 0x05);
//  372   //	LPLD_SCCB_WriteReg(0x94, 0x04);
//  373   //	LPLD_SCCB_WriteReg(0x95, 0x08);
//  374   //	LPLD_SCCB_WriteReg(0x6c, 0x0a);
//  375   //	LPLD_SCCB_WriteReg(0x6d, 0x55);
//  376   //        
//  377   //        
//  378   //	LPLD_SCCB_WriteReg(0x4f, 0x80);
//  379   //	LPLD_SCCB_WriteReg(0x50, 0x80);
//  380   //	LPLD_SCCB_WriteReg(0x51, 0x00);
//  381   //	LPLD_SCCB_WriteReg(0x52, 0x22);
//  382   //	LPLD_SCCB_WriteReg(0x53, 0x5e);
//  383   //	LPLD_SCCB_WriteReg(0x54, 0x80);
//  384   //        
//  385   //	//LPLD_SCCB_WriteReg(0x54, 0x40);//110
//  386   //        
//  387   //        
//  388   //	LPLD_SCCB_WriteReg(0x09, 0x03);//驱动能力最大
//  389   //
//  390   //	LPLD_SCCB_WriteReg(0x6e, 0x11);//100
//  391   //	LPLD_SCCB_WriteReg(0x6f, 0x9f);//0x9e for advance AWB
//  392   //    LPLD_SCCB_WriteReg(0x55, 0x00);//亮度
//  393   //    LPLD_SCCB_WriteReg(0x56, 0x40);//对比度
//  394   //    LPLD_SCCB_WriteReg(0x57, 0x80);//0x40,  change according to Jim's request	
//  395   //  
//  396   //  
//  397   
//  398   //    LPLD_SCCB_WriteReg(0x3a, 0x04);
//  399   //  
//  400   //    LPLD_SCCB_WriteReg(0x40, 0x10);
//  401   //    LPLD_SCCB_WriteReg(0x12, 0x14);
//  402   //    LPLD_SCCB_WriteReg(0x32, 0x80);
//  403   //    LPLD_SCCB_WriteReg(0x17, 0x16);
//  404   //    LPLD_SCCB_WriteReg(0x18, 0x04);
//  405   //    LPLD_SCCB_WriteReg(0x19, 0x02);
//  406   //    LPLD_SCCB_WriteReg(0x1a, 0x7a);
//  407   //    LPLD_SCCB_WriteReg(0x03, 0x0a);
//  408 //    LPLD_SCCB_WriteReg(0x0c, 0x0c);
//  409 //    LPLD_SCCB_WriteReg(0x15, 0x00);
//  410 //    LPLD_SCCB_WriteReg(0x3e, 0x00);
//  411 //    LPLD_SCCB_WriteReg(0x70, 0x00);
//  412 //    LPLD_SCCB_WriteReg(0x71, 0x35);
//  413 //    LPLD_SCCB_WriteReg(0x72, 0x11);
//  414 //    LPLD_SCCB_WriteReg(0x73, 0x09);
//  415 //    LPLD_SCCB_WriteReg(0xa2, 0x02);//+++++++++++++++++++++++  
//  416 //    LPLD_SCCB_WriteReg(0x11, 0x00);
//  417 //    LPLD_SCCB_WriteReg(0x7a, 0x20);
//  418 //    LPLD_SCCB_WriteReg(0x7b, 0x1c);
//  419 //    LPLD_SCCB_WriteReg(0x7c, 0x28);
//  420 //    LPLD_SCCB_WriteReg(0x7d, 0x3c);
//  421 //    LPLD_SCCB_WriteReg(0x7e, 0x55);
//  422 //    LPLD_SCCB_WriteReg(0x7f, 0x68);
//  423 //    LPLD_SCCB_WriteReg(0x80, 0x76);
//  424 //    LPLD_SCCB_WriteReg(0x81, 0x80);
//  425 //    LPLD_SCCB_WriteReg(0x82, 0x88);
//  426 //    LPLD_SCCB_WriteReg(0x83, 0x8f);
//  427 //    LPLD_SCCB_WriteReg(0x84, 0x96);
//  428 //    LPLD_SCCB_WriteReg(0x85, 0xa3);
//  429 //    LPLD_SCCB_WriteReg(0x86, 0xaf);
//  430 //    LPLD_SCCB_WriteReg(0x87, 0xc4);
//  431 //    LPLD_SCCB_WriteReg(0x88, 0xd7);
//  432 //    LPLD_SCCB_WriteReg(0x89, 0xe8);
//  433 //    LPLD_SCCB_WriteReg(0x13, 0xe0);
//  434 //    LPLD_SCCB_WriteReg(0x00, 0x00);
//  435 //    LPLD_SCCB_WriteReg(0x10, 0x00);
//  436 //    LPLD_SCCB_WriteReg(0x0d, 0x00);
//  437 //    LPLD_SCCB_WriteReg(0x14, 0x20);
//  438 //    LPLD_SCCB_WriteReg(0xa5, 0x05);
//  439 //    LPLD_SCCB_WriteReg(0xab, 0x07);
//  440 //    LPLD_SCCB_WriteReg(0x24, 0x75);
//  441 //    LPLD_SCCB_WriteReg(0x25, 0x63);
//  442 //    LPLD_SCCB_WriteReg(0x26, 0xA5);
//  443 //    LPLD_SCCB_WriteReg(0x9f, 0x78);
//  444 //    LPLD_SCCB_WriteReg(0xa0, 0x68);
//  445 //    LPLD_SCCB_WriteReg(0xa1, 0x03);
//  446 //    LPLD_SCCB_WriteReg(0xa6, 0xdf);
//  447 //    LPLD_SCCB_WriteReg(0xa7, 0xdf);
//  448 //    LPLD_SCCB_WriteReg(0xa8, 0xf0);
//  449 //    LPLD_SCCB_WriteReg(0xa9, 0x90);
//  450 //    LPLD_SCCB_WriteReg(0xaa, 0x94); 
//  451 //    LPLD_SCCB_WriteReg(0x13, 0xe5);
//  452 //    LPLD_SCCB_WriteReg(0x0e, 0x61);
//  453 //    LPLD_SCCB_WriteReg(0x0f, 0x4b);
//  454 //    LPLD_SCCB_WriteReg(0x16, 0x02);
//  455 //    LPLD_SCCB_WriteReg(0x1e, 0x27);
//  456 //    LPLD_SCCB_WriteReg(0x21, 0x02);
//  457 //    LPLD_SCCB_WriteReg(0x22, 0x91);
//  458 //    LPLD_SCCB_WriteReg(0x29, 0x07);
//  459 //    LPLD_SCCB_WriteReg(0x33, 0x0b);
//  460 //    LPLD_SCCB_WriteReg(0x35, 0x0b);
//  461 //    LPLD_SCCB_WriteReg(0x37, 0x1d);
//  462 //    LPLD_SCCB_WriteReg(0x38, 0x71);
//  463 //    LPLD_SCCB_WriteReg(0x39, 0x2a);
//  464 //    LPLD_SCCB_WriteReg(0x3c, 0x78);
//  465 //    LPLD_SCCB_WriteReg(0x4d, 0x40);
//  466 //    LPLD_SCCB_WriteReg(0x4e, 0x20);
//  467 //    LPLD_SCCB_WriteReg(0x69, 0x5d);
//  468 //    LPLD_SCCB_WriteReg(0x6b, 0x40);
//  469 //    LPLD_SCCB_WriteReg(0x74, 0x19);
//  470 //    LPLD_SCCB_WriteReg(0x8d, 0x4f);
//  471 //    LPLD_SCCB_WriteReg(0x8e, 0x00);
//  472 //    LPLD_SCCB_WriteReg(0x8f, 0x00);
//  473 //    LPLD_SCCB_WriteReg(0x90, 0x00);
//  474 //    LPLD_SCCB_WriteReg(0x91, 0x00);
//  475 //    LPLD_SCCB_WriteReg(0x92, 0x00);
//  476 //    LPLD_SCCB_WriteReg(0x96, 0x00);
//  477 //    LPLD_SCCB_WriteReg(0x9a, 0x80);
//  478 //    LPLD_SCCB_WriteReg(0xb0, 0x84);
//  479 //    LPLD_SCCB_WriteReg(0xb1, 0x0c);
//  480 //    LPLD_SCCB_WriteReg(0xb2, 0x0e);
//  481 //    LPLD_SCCB_WriteReg(0xb3, 0x82); 
//  482 //    LPLD_SCCB_WriteReg(0xb8, 0x0a);
//  483 //    LPLD_SCCB_WriteReg(0x43, 0x14);
//  484 //    LPLD_SCCB_WriteReg(0x44, 0xf0);
//  485 //    LPLD_SCCB_WriteReg(0x45, 0x34);
//  486 //    LPLD_SCCB_WriteReg(0x46, 0x58);
//  487 //    LPLD_SCCB_WriteReg(0x47, 0x28);
//  488 //    LPLD_SCCB_WriteReg(0x48, 0x3a);
//  489 //    LPLD_SCCB_WriteReg(0x59, 0x88);
//  490 //    LPLD_SCCB_WriteReg(0x5a, 0x88);
//  491 //    LPLD_SCCB_WriteReg(0x5b, 0x44);
//  492 //    LPLD_SCCB_WriteReg(0x5c, 0x67);
//  493 //    LPLD_SCCB_WriteReg(0x5d, 0x49);
//  494 //    LPLD_SCCB_WriteReg(0x5e, 0x0e);
//  495 //    LPLD_SCCB_WriteReg(0x64, 0x04);
//  496 //    LPLD_SCCB_WriteReg(0x65, 0x20);
//  497 //    LPLD_SCCB_WriteReg(0x66, 0x05);
//  498 //    LPLD_SCCB_WriteReg(0x94, 0x04);
//  499 //    LPLD_SCCB_WriteReg(0x95, 0x08);
//  500 //    LPLD_SCCB_WriteReg(0x6c, 0x0a);
//  501 //    LPLD_SCCB_WriteReg(0x6d, 0x55);
//  502 //    LPLD_SCCB_WriteReg(0x4f, 0x80);
//  503 //    LPLD_SCCB_WriteReg(0x50, 0x80);
//  504 //    LPLD_SCCB_WriteReg(0x51, 0x00);
//  505 //    LPLD_SCCB_WriteReg(0x52, 0x22);
//  506 //    LPLD_SCCB_WriteReg(0x53, 0x5e);
//  507 //    LPLD_SCCB_WriteReg(0x54, 0x80);  
//  508 //    LPLD_SCCB_WriteReg(0x09, 0x03);
//  509 //    LPLD_SCCB_WriteReg(0x6e, 0x11);
//  510 //    LPLD_SCCB_WriteReg(0x6f, 0x9f);
//  511 //    LPLD_SCCB_WriteReg(0x55, 0x00);
//  512 //    LPLD_SCCB_WriteReg(0x56, 0x40);
//  513 //    LPLD_SCCB_WriteReg(0x57, 0x80);
//  514 //    LPLD_SCCB_WriteReg(0x14, 0x61);
//  515 //    LPLD_SCCB_WriteReg(0x70, 0x00);
//  516 //    LPLD_SCCB_WriteReg(0x71, 0xb0);
//  517   
//  518   
//  519   
//  520   
//  521 //  LPLD_SCCB_WriteReg(0x3a, 0x04);
//  522 //  LPLD_SCCB_WriteReg(0x40, 0xd0);
//  523 //  LPLD_SCCB_WriteReg(0x12, 0x14);
//  524 //  LPLD_SCCB_WriteReg(0x32, 0x80);
//  525 //  LPLD_SCCB_WriteReg(0x17, 0x16);
//  526 //  LPLD_SCCB_WriteReg(0x18, 0x04);
//  527 //  LPLD_SCCB_WriteReg(0x19, 0x02);
//  528 //  LPLD_SCCB_WriteReg(0x1a, 0x7b);
//  529 //  LPLD_SCCB_WriteReg(0x03, 0x06);
//  530 //  LPLD_SCCB_WriteReg(0x0c, 0x04);
//  531 //  LPLD_SCCB_WriteReg(0x3e, 0x00);
//  532 //  LPLD_SCCB_WriteReg(0x70, 0x3a);
//  533 //  LPLD_SCCB_WriteReg(0x71, 0x35);
//  534 //  LPLD_SCCB_WriteReg(0x72, 0x11);
//  535 //  LPLD_SCCB_WriteReg(0x73, 0x00);
//  536 //  LPLD_SCCB_WriteReg(0xa2, 0x02);
//  537 //  LPLD_SCCB_WriteReg(0x11, 0x00);  //++++++++++++++++  0x81
//  538 //  
//  539 //  LPLD_SCCB_WriteReg(0x7a, 0x20);
//  540 //  LPLD_SCCB_WriteReg(0x7b, 0x1c);
//  541 //  LPLD_SCCB_WriteReg(0x7c, 0x28);
//  542 //  LPLD_SCCB_WriteReg(0x7d, 0x3c);
//  543 //  LPLD_SCCB_WriteReg(0x7e, 0x55);
//  544 //  LPLD_SCCB_WriteReg(0x7f, 0x68);
//  545 //  LPLD_SCCB_WriteReg(0x80, 0x76);
//  546 //  LPLD_SCCB_WriteReg(0x81, 0x80);
//  547 //  LPLD_SCCB_WriteReg(0x82, 0x88);
//  548 //  LPLD_SCCB_WriteReg(0x83, 0x8f);
//  549 //  LPLD_SCCB_WriteReg(0x84, 0x96);
//  550 //  LPLD_SCCB_WriteReg(0x85, 0xa3);
//  551 //  LPLD_SCCB_WriteReg(0x86, 0xaf);
//  552 //  LPLD_SCCB_WriteReg(0x87, 0xc4);
//  553 //  LPLD_SCCB_WriteReg(0x88, 0xd7);
//  554 //  LPLD_SCCB_WriteReg(0x89, 0xe8);
//  555 //  
//  556 //  LPLD_SCCB_WriteReg(0x13, 0xe0);
//  557 //  LPLD_SCCB_WriteReg(0x00, 0x00);
//  558 //  
//  559 //  LPLD_SCCB_WriteReg(0x10, 0x00);
//  560 //  LPLD_SCCB_WriteReg(0x0d, 0x00);
//  561 //  LPLD_SCCB_WriteReg(0x14, 0x28);
//  562 //  LPLD_SCCB_WriteReg(0xa5, 0x05);
//  563 //  LPLD_SCCB_WriteReg(0xab, 0x07);
//  564 //  LPLD_SCCB_WriteReg(0x24, 0x75);
//  565 //  LPLD_SCCB_WriteReg(0x25, 0x63);
//  566 //  LPLD_SCCB_WriteReg(0x26, 0xA5);
//  567 //  LPLD_SCCB_WriteReg(0x9f, 0x78);
//  568 //  LPLD_SCCB_WriteReg(0xa0, 0x68);
//  569 //  LPLD_SCCB_WriteReg(0xa1, 0x03);
//  570 //  LPLD_SCCB_WriteReg(0xa6, 0xdf);
//  571 //  LPLD_SCCB_WriteReg(0xa7, 0xdf);
//  572 //  LPLD_SCCB_WriteReg(0xa8, 0xf0);
//  573 //  LPLD_SCCB_WriteReg(0xa9, 0x90);
//  574 //  LPLD_SCCB_WriteReg(0xaa, 0x94);
//  575 //  LPLD_SCCB_WriteReg(0x13, 0xe5);
//  576 //  
//  577 //  LPLD_SCCB_WriteReg(0x0e, 0x61);
//  578 //  LPLD_SCCB_WriteReg(0x0f, 0x4b);
//  579 //  LPLD_SCCB_WriteReg(0x16, 0x02);
//  580 //  LPLD_SCCB_WriteReg(0x1e, 0x07);
//  581 //  LPLD_SCCB_WriteReg(0x21, 0x02);
//  582 //  LPLD_SCCB_WriteReg(0x22, 0x91);
//  583 //  LPLD_SCCB_WriteReg(0x29, 0x07);
//  584 //  LPLD_SCCB_WriteReg(0x33, 0x0b);
//  585 //  LPLD_SCCB_WriteReg(0x35, 0x0b);
//  586 //  LPLD_SCCB_WriteReg(0x37, 0x1d);
//  587 //  LPLD_SCCB_WriteReg(0x38, 0x71);
//  588 //  LPLD_SCCB_WriteReg(0x39, 0x2a);
//  589 //  LPLD_SCCB_WriteReg(0x3c, 0x78);
//  590 //  LPLD_SCCB_WriteReg(0x4d, 0x40);
//  591 //  LPLD_SCCB_WriteReg(0x4e, 0x20);
//  592 //  LPLD_SCCB_WriteReg(0x69, 0x00);
//  593 //  LPLD_SCCB_WriteReg(0x6b, 0x60);
//  594 //  LPLD_SCCB_WriteReg(0x74, 0x19);
//  595 //  LPLD_SCCB_WriteReg(0x8d, 0x4f);
//  596 //  LPLD_SCCB_WriteReg(0x8e, 0x00);
//  597 //  LPLD_SCCB_WriteReg(0x8f, 0x00);
//  598 //  LPLD_SCCB_WriteReg(0x90, 0x00);
//  599 //  LPLD_SCCB_WriteReg(0x91, 0x00);
//  600 //  LPLD_SCCB_WriteReg(0x92, 0x00);
//  601 //  LPLD_SCCB_WriteReg(0x96, 0x00);
//  602 //  LPLD_SCCB_WriteReg(0x9a, 0x80);
//  603 //  LPLD_SCCB_WriteReg(0xb0, 0x84);
//  604 //  LPLD_SCCB_WriteReg(0xb1, 0x0c);
//  605 //  LPLD_SCCB_WriteReg(0xb2, 0x0e);
//  606 //  LPLD_SCCB_WriteReg(0xb3, 0x82);
//  607 //  LPLD_SCCB_WriteReg(0xb8, 0x0a);
//  608 //  
//  609 //  
//  610 //  
//  611 //  LPLD_SCCB_WriteReg(0x43, 0x14);
//  612 //  LPLD_SCCB_WriteReg(0x44, 0xf0);
//  613 //  LPLD_SCCB_WriteReg(0x45, 0x34);
//  614 //  LPLD_SCCB_WriteReg(0x46, 0x58);
//  615 //  LPLD_SCCB_WriteReg(0x47, 0x28);
//  616 //  LPLD_SCCB_WriteReg(0x48, 0x3a);
//  617 //  LPLD_SCCB_WriteReg(0x59, 0x88);
//  618 //  LPLD_SCCB_WriteReg(0x5a, 0x88);
//  619 //  LPLD_SCCB_WriteReg(0x5b, 0x44);
//  620 //  LPLD_SCCB_WriteReg(0x5c, 0x67);
//  621 //  LPLD_SCCB_WriteReg(0x5d, 0x49);
//  622 //  LPLD_SCCB_WriteReg(0x5e, 0x0e);
//  623 //  LPLD_SCCB_WriteReg(0x64, 0x04);
//  624 //  LPLD_SCCB_WriteReg(0x65, 0x20);
//  625 //  LPLD_SCCB_WriteReg(0x66, 0x05);
//  626 //  LPLD_SCCB_WriteReg(0x94, 0x04);
//  627 //  LPLD_SCCB_WriteReg(0x95, 0x08);
//  628 //  LPLD_SCCB_WriteReg(0x6c, 0x0a);
//  629 //  LPLD_SCCB_WriteReg(0x6d, 0x55);
//  630 //  LPLD_SCCB_WriteReg(0x6e, 0x11);
//  631 //  LPLD_SCCB_WriteReg(0x6f, 0x9f);
//  632 //  LPLD_SCCB_WriteReg(0x6a, 0x40);
//  633 //  LPLD_SCCB_WriteReg(0x01, 0x40);
//  634 //  LPLD_SCCB_WriteReg(0x02, 0x40);
//  635 //  LPLD_SCCB_WriteReg(0x13, 0xe7);
//  636 //  LPLD_SCCB_WriteReg(0x15, 0x00);  
//  637 //  
//  638 //  
//  639 //  LPLD_SCCB_WriteReg(0x4f, 0x80);
//  640 //  LPLD_SCCB_WriteReg(0x50, 0x80);
//  641 //  LPLD_SCCB_WriteReg(0x51, 0x00);
//  642 //  LPLD_SCCB_WriteReg(0x52, 0x22);
//  643 //  LPLD_SCCB_WriteReg(0x53, 0x5e);
//  644 //  LPLD_SCCB_WriteReg(0x54, 0x80);
//  645 //  LPLD_SCCB_WriteReg(0x58, 0x9e);
//  646 //  
//  647 //  LPLD_SCCB_WriteReg(0x41, 0x08);
//  648 //  LPLD_SCCB_WriteReg(0x3f, 0x00);
//  649 //  LPLD_SCCB_WriteReg(0x75, 0x05);
//  650 //  LPLD_SCCB_WriteReg(0x76, 0xe1);
//  651 //  LPLD_SCCB_WriteReg(0x4c, 0x00);
//  652 //  LPLD_SCCB_WriteReg(0x77, 0x01);
//  653 //  LPLD_SCCB_WriteReg(0x3d, 0xc2);	
//  654 //  LPLD_SCCB_WriteReg(0x4b, 0x09);
//  655 //  LPLD_SCCB_WriteReg(0xc9, 0x60);
//  656 //  LPLD_SCCB_WriteReg(0x41, 0x38);
//  657 //  LPLD_SCCB_WriteReg(0x56, 0x40);
//  658 //  
//  659 //  LPLD_SCCB_WriteReg(0x34, 0x11);
//  660 //  LPLD_SCCB_WriteReg(0x3b, 0x02); 
//  661 //  
//  662 //  LPLD_SCCB_WriteReg(0xa4, 0x89);
//  663 //  LPLD_SCCB_WriteReg(0x96, 0x00);
//  664 //  LPLD_SCCB_WriteReg(0x97, 0x30);
//  665 //  LPLD_SCCB_WriteReg(0x98, 0x20);
//  666 //  LPLD_SCCB_WriteReg(0x99, 0x30);
//  667 //  LPLD_SCCB_WriteReg(0x9a, 0x84);
//  668 //  LPLD_SCCB_WriteReg(0x9b, 0x29);
//  669 //  LPLD_SCCB_WriteReg(0x9c, 0x03);
//  670 //  LPLD_SCCB_WriteReg(0x9d, 0x4c);
//  671 //  LPLD_SCCB_WriteReg(0x9e, 0x3f);
//  672 //  LPLD_SCCB_WriteReg(0x78, 0x04);
//  673 //  
//  674 //  LPLD_SCCB_WriteReg(0x79, 0x01);
//  675 //  LPLD_SCCB_WriteReg(0xc8, 0xf0);
//  676 //  LPLD_SCCB_WriteReg(0x79, 0x0f);
//  677 //  LPLD_SCCB_WriteReg(0xc8, 0x00);
//  678 //  LPLD_SCCB_WriteReg(0x79, 0x10);
//  679 //  LPLD_SCCB_WriteReg(0xc8, 0x7e);
//  680 //  LPLD_SCCB_WriteReg(0x79, 0x0a);
//  681 //  LPLD_SCCB_WriteReg(0xc8, 0x80);
//  682 //  LPLD_SCCB_WriteReg(0x79, 0x0b);
//  683 //  LPLD_SCCB_WriteReg(0xc8, 0x01);
//  684 //  LPLD_SCCB_WriteReg(0x79, 0x0c);
//  685 //  LPLD_SCCB_WriteReg(0xc8, 0x0f);
//  686 //  LPLD_SCCB_WriteReg(0x79, 0x0d);
//  687 //  LPLD_SCCB_WriteReg(0xc8, 0x20);
//  688 //  LPLD_SCCB_WriteReg(0x79, 0x09);
//  689 //  LPLD_SCCB_WriteReg(0xc8, 0x80);
//  690 //  LPLD_SCCB_WriteReg(0x79, 0x02);
//  691 //  LPLD_SCCB_WriteReg(0xc8, 0xc0);
//  692 //  LPLD_SCCB_WriteReg(0x79, 0x03);
//  693 //  LPLD_SCCB_WriteReg(0xc8, 0x40);
//  694 //  LPLD_SCCB_WriteReg(0x79, 0x05);
//  695 //  LPLD_SCCB_WriteReg(0xc8, 0x30);
//  696 //  LPLD_SCCB_WriteReg(0x79, 0x26); 
//  697 //  LPLD_SCCB_WriteReg(0x09, 0x00);	
//  698   
//  699 }
        POP      {R0,PC}          ;; return
//  700 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  701 void SQC_OV7670_Show(void)
//  702 {
SQC_OV7670_Show:
        PUSH     {R4-R6,LR}
//  703   uint16 i,j;
//  704   uint16 coloer;
//  705   
//  706   for(i=0;i<240;i++)
        MOVS     R4,#+0
        B.N      ??SQC_OV7670_Show_0
//  707     for(j=0;j<320;j++)
//  708     {
//  709       coloer = 0;
??SQC_OV7670_Show_1:
        MOVS     R6,#+0
//  710       coloer = SQC_OV7670_Readfifo();
        BL       SQC_OV7670_Readfifo
        MOVS     R6,R0
//  711       LPLD_LCD_SetPoint(j,i,coloer);  
        MOVS     R2,R6
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOVS     R1,R4
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R5
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       LPLD_LCD_SetPoint
//  712     }
        ADDS     R5,R5,#+1
??SQC_OV7670_Show_2:
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,#+320
        BLT.N    ??SQC_OV7670_Show_1
        ADDS     R4,R4,#+1
??SQC_OV7670_Show_0:
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        CMP      R4,#+240
        BGE.N    ??SQC_OV7670_Show_3
        MOVS     R5,#+0
        B.N      ??SQC_OV7670_Show_2
//  713 }
??SQC_OV7670_Show_3:
        POP      {R4-R6,PC}       ;; return
//  714 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  715 uint16 SQC_OV7670_Readfifo(void)
//  716 {
SQC_OV7670_Readfifo:
        PUSH     {R3-R5,LR}
//  717   uint16 c1 = 0,c2 = 0 ;
        MOVS     R4,#+0
        MOVS     R5,#+0
//  718   ov7670_rck=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_1  ;; 0x43fe0044
        STR      R0,[R1, #+0]
//  719   c1 = LPLD_GPIO_Input_8b(PTA,9)&0xff;
        MOVS     R1,#+9
        LDR.N    R0,??DataTable2_2  ;; 0x400ff000
        BL       LPLD_GPIO_Input_8b
        MOVS     R4,R0
//  720   ov7670_rck = 1;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable2_1  ;; 0x43fe0044
        STR      R0,[R1, #+0]
//  721   ov7670_rck = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_1  ;; 0x43fe0044
        STR      R0,[R1, #+0]
//  722   c2 = LPLD_GPIO_Input_8b(PTA,9)&0xff;
        MOVS     R1,#+9
        LDR.N    R0,??DataTable2_2  ;; 0x400ff000
        BL       LPLD_GPIO_Input_8b
        MOVS     R5,R0
//  723   ov7670_rck = 1;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable2_1  ;; 0x43fe0044
        STR      R0,[R1, #+0]
//  724   c1<<=8;
        LSLS     R4,R4,#+8
//  725   c2=c1|c2;
        ORRS     R5,R4,R5
//  726   return c2;  
        MOVS     R0,R5
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        POP      {R1,R4,R5,PC}    ;; return
//  727 }
//  728 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  729 void SQC_OV7670_Isr()
//  730 {
SQC_OV7670_Isr:
        PUSH     {R7,LR}
//  731   if(Is_DispPhoto==1 && LPLD_GPIO_IsPinxExt(PORTA, GPIO_Pin24))
        LDR.N    R0,??DataTable2_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??SQC_OV7670_Isr_0
        LDR.N    R0,??DataTable2_4  ;; 0x400490a0
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+7
        BPL.N    ??SQC_OV7670_Isr_0
//  732   {
//  733     ov7670_wrst=0;  //写指针复位
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_5  ;; 0x43fe0018
        STR      R0,[R1, #+0]
//  734     ov7670_wr=1;   //写使能
        MOVS     R0,#+1
        LDR.N    R1,??DataTable2_6  ;; 0x43fe0064
        STR      R0,[R1, #+0]
//  735     Is_DispPhoto =2;
        MOVS     R0,#+2
        LDR.N    R1,??DataTable2_3
        STRB     R0,[R1, #+0]
//  736     ov7670_wr=1;   //写使能
        MOVS     R0,#+1
        LDR.N    R1,??DataTable2_6  ;; 0x43fe0064
        STR      R0,[R1, #+0]
//  737     ov7670_wrst=1;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable2_5  ;; 0x43fe0018
        STR      R0,[R1, #+0]
        B.N      ??SQC_OV7670_Isr_1
//  738     
//  739   }
//  740   else if(Is_DispPhoto == 2 && LPLD_GPIO_IsPinxExt(PORTA, GPIO_Pin24))
??SQC_OV7670_Isr_0:
        LDR.N    R0,??DataTable2_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+2
        BNE.N    ??SQC_OV7670_Isr_2
        LDR.N    R0,??DataTable2_4  ;; 0x400490a0
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+7
        BPL.N    ??SQC_OV7670_Isr_2
//  741   {
//  742     ov7670_wr=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_6  ;; 0x43fe0064
        STR      R0,[R1, #+0]
//  743     Is_DispPhoto = 3;
        MOVS     R0,#+3
        LDR.N    R1,??DataTable2_3
        STRB     R0,[R1, #+0]
        B.N      ??SQC_OV7670_Isr_1
//  744     
//  745   }
//  746   else if(Is_DispPhoto==3)
??SQC_OV7670_Isr_2:
        LDR.N    R0,??DataTable2_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+3
        BNE.N    ??SQC_OV7670_Isr_1
//  747         { 
//  748           ov7670_rrst=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_7  ;; 0x43fe001c
        STR      R0,[R1, #+0]
//  749           ov7670_rck = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_1  ;; 0x43fe0044
        STR      R0,[R1, #+0]
//  750           ov7670_rck=1;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable2_1  ;; 0x43fe0044
        STR      R0,[R1, #+0]
//  751           ov7670_rrst=1;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable2_7  ;; 0x43fe001c
        STR      R0,[R1, #+0]
//  752           ov7670_rck=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_1  ;; 0x43fe0044
        STR      R0,[R1, #+0]
//  753           ov7670_rck=1; 
        MOVS     R0,#+1
        LDR.N    R1,??DataTable2_1  ;; 0x43fe0044
        STR      R0,[R1, #+0]
//  754           SQC_OV7670_Show();
        BL       SQC_OV7670_Show
//  755           //清PORTA中断标志
//  756           LPLD_GPIO_ClearIntFlag(PORTA);       
        MOVS     R0,#-1
        LDR.N    R1,??DataTable2_4  ;; 0x400490a0
        STR      R0,[R1, #+0]
//  757           //使能PORTA中断
//  758           Is_DispPhoto = 1;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable2_3
        STRB     R0,[R1, #+0]
//  759           enable_irq(PORTA_IRQn);
        MOVS     R0,#+87
        BL       NVIC_EnableIRQ
//  760           
//  761         } 
//  762   
//  763 }
??SQC_OV7670_Isr_1:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     0xe000e100

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     0x43fe0044

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC32     0x400ff000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_3:
        DC32     Is_DispPhoto

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_4:
        DC32     0x400490a0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_5:
        DC32     0x43fe0018

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_6:
        DC32     0x43fe0064

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_7:
        DC32     0x43fe001c

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  764 
// 
//     1 byte  in section .bss
// 1 718 bytes in section .text
// 
// 1 718 bytes of CODE memory
//     1 byte  of DATA memory
//
//Errors: none
//Warnings: none
