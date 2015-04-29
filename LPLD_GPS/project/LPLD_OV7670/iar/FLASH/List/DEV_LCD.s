///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.1.6676/W32 for ARM       23/Apr/2015  14:23:12
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  G:\test\LPLD_OSKinetis_V3_now02\lib\LPLD\DEV\DEV_LCD.c
//    Command line =  
//        G:\test\LPLD_OSKinetis_V3_now02\lib\LPLD\DEV\DEV_LCD.c -D LPLD_K60
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
//        G:\test\LPLD_OSKinetis_V3_now02\project\LPLD_OV7670\iar\FLASH\List\DEV_LCD.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN LPLD_FlexBus_Init
        EXTERN LPLD_GPIO_Init
        EXTERN __aeabi_memcpy4
        EXTERN gImage_suqian

        PUBLIC CurX
        PUBLIC CurY
        PUBLIC LCD_GRAM
        PUBLIC LPLD_LCD_BGR2RGB
        PUBLIC LPLD_LCD_DrawLine
        PUBLIC LPLD_LCD_DrawRectangle
        PUBLIC LPLD_LCD_DrawSquare
        PUBLIC LPLD_LCD_DrawU8Gray
        PUBLIC LPLD_LCD_FillBackground
        PUBLIC LPLD_LCD_FillBackgroundGRAM
        PUBLIC LPLD_LCD_GRAMDrawHLine
        PUBLIC LPLD_LCD_GRAMFillRec
        PUBLIC LPLD_LCD_GetPoint
        PUBLIC LPLD_LCD_INFO
        PUBLIC LPLD_LCD_Init
        PUBLIC LPLD_LCD_PrintNum
        PUBLIC LPLD_LCD_PrintNumLine
        PUBLIC LPLD_LCD_PrintString
        PUBLIC LPLD_LCD_PrintStringLine
        PUBLIC LPLD_LCD_SetPoint
        PUBLIC LPLD_LCD_ShowChar
        PUBLIC LPLD_LCD_ShowCharno
        PUBLIC LPLD_LCD_ShowNum
        PUBLIC LPLD_LCD_ShowString
        PUBLIC LPLD_LCD_ShowStringno
        PUBLIC LPLD_LCD_U8GRAY2RGB
        PUBLIC PreX
        PUBLIC PreY
        PUBLIC asc2_1608
        PUBLIC mypow

// G:\test\LPLD_OSKinetis_V3_now02\lib\LPLD\DEV\DEV_LCD.c
//    1 /**
//    2  * @file DEV_LCD.c
//    3  * @version 0.2[By LPLD]
//    4  * @date 2013-10-21
//    5  * @brief LCD设备驱动程序
//    6  *
//    7  * 更改建议:可根据实际硬件修改
//    8  *
//    9  * 版权所有:北京拉普兰德电子技术有限公司
//   10  * http://www.lpld.cn
//   11  * mail:support@lpld.cn
//   12  *
//   13  * @par
//   14  * 本代码由拉普兰德[LPLD]开发并维护，并向所有使用者开放源代码。
//   15  * 开发者可以随意修使用或改源代码。但本段及以上注释应予以保留。
//   16  * 不得更改或删除原版权所有者姓名，二次开发者可以加注二次版权所有者。
//   17  * 但应在遵守此协议的基础上，开放源代码、不得出售代码本身。
//   18  * 拉普兰德不负责由于使用本代码所带来的任何事故、法律责任或相关不良影响。
//   19  * 拉普兰德无义务解释、说明本代码的具体原理、功能、实现方法。
//   20  * 除非拉普兰德[LPLD]授权，开发者不得将本代码用于商业产品。
//   21  *
//   22  * 0.2-2013-10-21 优化初始化函数、字符串数字显示函数
//   23  */
//   24 #include "DEV_LCD.h"
//   25 #include "Font_ASC.h"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
// __absolute unsigned char const asc2_1608[95][16]
asc2_1608:
        DATA
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 8, 8, 8
        DC8 8, 8, 8, 0, 0, 24, 24, 0, 0, 0, 72, 108, 36, 18, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 36, 36, 36, 127, 18, 18, 18, 127, 18, 18
        DC8 18, 0, 0, 0, 0, 8, 28, 42, 42, 10, 12, 24, 40, 40, 42, 42, 28, 8, 8
        DC8 0, 0, 0, 34, 37, 21, 21, 21, 42, 88, 84, 84, 84, 34, 0, 0, 0, 0, 0
        DC8 12, 18, 18, 18, 10, 118, 37, 41, 17, 145, 110, 0, 0, 0, 6, 6, 4, 3
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 64, 32, 16, 16, 8, 8, 8, 8, 8
        DC8 8, 16, 16, 32, 64, 0, 0, 2, 4, 8, 8, 16, 16, 16, 16, 16, 16, 8, 8
        DC8 4, 2, 0, 0, 0, 0, 0, 8, 8, 107, 28, 28, 107, 8, 8, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 8, 8, 8, 8, 127, 8, 8, 8, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 6, 6, 4, 3, 0, 0, 0, 0, 0, 0, 0, 0, 254, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 6, 0, 0, 0, 0, 128, 64
        DC8 64, 32, 32, 16, 16, 8, 8, 4, 4, 2, 2, 0, 0, 0, 0, 24, 36, 66, 66
        DC8 66, 66, 66, 66, 66, 36, 24, 0, 0, 0, 0, 0, 8, 14, 8, 8, 8, 8, 8, 8
        DC8 8, 8, 62, 0, 0, 0, 0, 0, 60, 66, 66, 66, 32, 32, 16, 8, 4, 66, 126
        DC8 0, 0, 0, 0, 0, 60, 66, 66, 32, 24, 32, 64, 64, 66, 34, 28, 0, 0, 0
        DC8 0, 0, 32, 48, 40, 36, 36, 34, 34, 126, 32, 32, 120, 0, 0, 0, 0, 0
        DC8 126, 2, 2, 2, 26, 38, 64, 64, 66, 34, 28, 0, 0, 0, 0, 0, 56, 36, 2
        DC8 2, 26, 38, 66, 66, 66, 36, 24, 0, 0, 0, 0, 0, 126, 34, 34, 16, 16
        DC8 8, 8, 8, 8, 8, 8, 0, 0, 0, 0, 0, 60, 66, 66, 66, 36, 24, 36, 66, 66
        DC8 66, 60, 0, 0, 0, 0, 0, 24, 36, 66, 66, 66, 100, 88, 64, 64, 36, 28
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 24, 24, 0, 0, 0, 0, 24, 24, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 8, 8, 4, 0, 0, 0, 64, 32, 16, 8, 4, 2
        DC8 4, 8, 16, 32, 64, 0, 0, 0, 0, 0, 0, 0, 0, 127, 0, 0, 0, 127, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 2, 4, 8, 16, 32, 64, 32, 16, 8, 4, 2, 0, 0, 0, 0
        DC8 0, 60, 66, 66, 70, 64, 32, 16, 16, 0, 24, 24, 0, 0, 0, 0, 0, 28, 34
        DC8 90, 85, 85, 85, 85, 45, 66, 34, 28, 0, 0, 0, 0, 0, 8, 8, 24, 20, 20
        DC8 36, 60, 34, 66, 66, 231, 0, 0, 0, 0, 0, 31, 34, 34, 34, 30, 34, 66
        DC8 66, 66, 34, 31, 0, 0, 0, 0, 0, 124, 66, 66, 1, 1, 1, 1, 1, 66, 34
        DC8 28, 0, 0, 0, 0, 0, 31, 34, 66, 66, 66, 66, 66, 66, 66, 34, 31, 0, 0
        DC8 0, 0, 0, 63, 66, 18, 18, 30, 18, 18, 2, 66, 66, 63, 0, 0, 0, 0, 0
        DC8 63, 66, 18, 18, 30, 18, 18, 2, 2, 2, 7, 0, 0, 0, 0, 0, 60, 34, 34
        DC8 1, 1, 1, 113, 33, 34, 34, 28, 0, 0, 0, 0, 0, 231, 66, 66, 66, 66
        DC8 126, 66, 66, 66, 66, 231, 0, 0, 0, 0, 0, 62, 8, 8, 8, 8, 8, 8, 8, 8
        DC8 8, 62, 0, 0, 0, 0, 0, 124, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16
        DC8 17, 15, 0, 0, 0, 119, 34, 18, 10, 14, 10, 18, 18, 34, 34, 119, 0, 0
        DC8 0, 0, 0, 7, 2, 2, 2, 2, 2, 2, 2, 2, 66, 127, 0, 0, 0, 0, 0, 119, 54
        DC8 54, 54, 54, 42, 42, 42, 42, 42, 107, 0, 0, 0, 0, 0, 227, 70, 70, 74
        DC8 74, 82, 82, 82, 98, 98, 71, 0, 0, 0, 0, 0, 28, 34, 65, 65, 65, 65
        DC8 65, 65, 65, 34, 28, 0, 0, 0, 0, 0, 63, 66, 66, 66, 66, 62, 2, 2, 2
        DC8 2, 7, 0, 0, 0, 0, 0, 28, 34, 65, 65, 65, 65, 65, 77, 83, 50, 28, 96
        DC8 0, 0, 0, 0, 63, 66, 66, 66, 62, 18, 18, 34, 34, 66, 199, 0, 0, 0, 0
        DC8 0, 124, 66, 66, 2, 4, 24, 32, 64, 66, 66, 62, 0, 0, 0, 0, 0, 127
        DC8 73, 8, 8, 8, 8, 8, 8, 8, 8, 28, 0, 0, 0, 0, 0, 231, 66, 66, 66, 66
        DC8 66, 66, 66, 66, 66, 60, 0, 0, 0, 0, 0, 231, 66, 66, 34, 36, 36, 20
        DC8 20, 24, 8, 8, 0, 0, 0, 0, 0, 107, 73, 73, 73, 73, 85, 85, 54, 34
        DC8 34, 34, 0, 0, 0, 0, 0, 231, 66, 36, 36, 24, 24, 24, 36, 36, 66, 231
        DC8 0, 0, 0, 0, 0, 119, 34, 34, 20, 20, 8, 8, 8, 8, 8, 28, 0, 0, 0, 0
        DC8 0, 126, 33, 32, 16, 16, 8, 4, 4, 66, 66, 63, 0, 0, 0, 120, 8, 8, 8
        DC8 8, 8, 8, 8, 8, 8, 8, 8, 8, 120, 0, 0, 0, 2, 2, 4, 4, 8, 8, 8, 16
        DC8 16, 32, 32, 32, 64, 64, 0, 30, 16, 16, 16, 16, 16, 16, 16, 16, 16
        DC8 16, 16, 16, 30, 0, 0, 56, 68, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 255, 0, 6, 8, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 60, 66, 120, 68
        DC8 66, 66, 252, 0, 0, 0, 0, 0, 3, 2, 2, 2, 26, 38, 66, 66, 66, 38, 26
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 56, 68, 2, 2, 2, 68, 56, 0, 0, 0, 0, 0
        DC8 96, 64, 64, 64, 120, 68, 66, 66, 66, 100, 216, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 60, 66, 126, 2, 2, 66, 60, 0, 0, 0, 0, 0, 240, 136, 8, 8, 126
        DC8 8, 8, 8, 8, 8, 62, 0, 0, 0, 0, 0, 0, 0, 0, 0, 124, 34, 34, 28, 2
        DC8 60, 66, 66, 60, 0, 0, 0, 3, 2, 2, 2, 58, 70, 66, 66, 66, 66, 231, 0
        DC8 0, 0, 0, 0, 12, 12, 0, 0, 14, 8, 8, 8, 8, 8, 62, 0, 0, 0, 0, 0, 48
        DC8 48, 0, 0, 56, 32, 32, 32, 32, 32, 32, 34, 30, 0, 0, 0, 3, 2, 2, 2
        DC8 114, 18, 10, 22, 18, 34, 119, 0, 0, 0, 0, 0, 14, 8, 8, 8, 8, 8, 8
        DC8 8, 8, 8, 62, 0, 0, 0, 0, 0, 0, 0, 0, 0, 127, 146, 146, 146, 146
        DC8 146, 183, 0, 0, 0, 0, 0, 0, 0, 0, 0, 59, 70, 66, 66, 66, 66, 231, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 60, 66, 66, 66, 66, 66, 60, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 27, 38, 66, 66, 66, 34, 30, 2, 7, 0, 0, 0, 0, 0, 0, 0
        DC8 120, 68, 66, 66, 66, 68, 120, 64, 224, 0, 0, 0, 0, 0, 0, 0, 119, 76
        DC8 4, 4, 4, 4, 31, 0, 0, 0, 0, 0, 0, 0, 0, 0, 124, 66, 2, 60, 64, 66
        DC8 62, 0, 0, 0, 0, 0, 0, 0, 8, 8, 62, 8, 8, 8, 8, 8, 48, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 99, 66, 66, 66, 66, 98, 220, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 231, 66, 36, 36, 20, 8, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 235, 73, 73
        DC8 85, 85, 34, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 118, 36, 24, 24, 24, 36
        DC8 110, 0, 0, 0, 0, 0, 0, 0, 0, 0, 231, 66, 36, 36, 20, 24, 8, 8, 7, 0
        DC8 0, 0, 0, 0, 0, 0, 126, 34, 16, 8, 8, 68, 126, 0, 0, 0, 192, 32, 32
        DC8 32, 32, 32, 16, 32, 32, 32, 32, 32, 32, 192, 0, 16, 16, 16, 16, 16
        DC8 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 0, 6, 8, 8, 8, 8, 8, 16
        DC8 8, 8, 8, 8, 8, 8, 6, 0, 12, 50, 194, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0
//   26 #include "common.h"  
//   27 
//   28 extern const  unsigned char gImage_suqian[153600];
//   29 static void LPLD_LCD_Reset(void);
//   30 static void LPLD_LCD_FLEXBUS_Init(uint16 lcd_id);
//   31 static void LPLD_LCD_IO_Cfg(void);
//   32 static void LPLD_LCD_WriteIndex(uint16 index);
//   33 static void LPLD_LCD_WriteData(uint16 data);
//   34 static uint16 LPLD_LCD_ReadData(void);
//   35 static void LPLD_LCD_WriteReg(uint16 LCD_Reg,uint16 LCD_RegValue);
//   36 static uint16 LPLD_LCD_ReadReg(uint16 LCD_Reg);
//   37 static void LPLD_LCD_SetCursor( uint16 Xpos, uint16 Ypos );
//   38 static void LPLD_LCD_Delayms(uint16 ms);
//   39 void LPLD_LCD_ShowStringno(uint16 Xpos, uint16 Ypos, uint8 *str,uint16 strColor );
//   40 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   41 LPLD_LCD_Info_t LPLD_LCD_INFO;
LPLD_LCD_INFO:
        DS8 8

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   42 uint16 PreX=0, PreY=0;
PreX:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
PreY:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   43 uint16 *LCD_GRAM;
LCD_GRAM:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   44 uint16 CurX=0, CurY=0;
CurX:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
CurY:
        DS8 2
//   45 
//   46 /*
//   47  * LPLD_LCD_Delayms
//   48  * LCD内部延时函数，内部调用
//   49  */

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//   50 static void LPLD_LCD_Delayms(uint16 n)
//   51 {
//   52   uint16 i;
//   53   while(n--)
LPLD_LCD_Delayms:
??LPLD_LCD_Delayms_0:
        MOVS     R1,R0
        SUBS     R0,R1,#+1
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R1,#+0
        BEQ.N    ??LPLD_LCD_Delayms_1
//   54   {
//   55     for(i=0; i<400; i++)
        MOVS     R1,#+0
??LPLD_LCD_Delayms_2:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R1,#+400
        BGE.N    ??LPLD_LCD_Delayms_0
//   56     {
//   57       asm("nop");
        nop
//   58     }
        ADDS     R1,R1,#+1
        B.N      ??LPLD_LCD_Delayms_2
//   59   }
//   60 }
??LPLD_LCD_Delayms_1:
        BX       LR               ;; return
//   61 
//   62 /*
//   63  * LPLD_LCD_FLEXBUS_Init
//   64  * LCD FlexBus初始化函数，内部调用
//   65  * 
//   66  * 说明:
//   67  *    本初始化函数用来配置FlexBus与LCD的连接
//   68  *    配置为16位端口大小
//   69  *    地址与数据线复用
//   70  *    数据及地址线为FB_AD[15:0]
//   71  *    RS:FB_AD[16]
//   72  *    CS:FB_CS0
//   73  *    RW:FB_FB_RW
//   74  *    RD:FB_OE 
//   75  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   76 static void LPLD_LCD_FLEXBUS_Init(uint16 lcd_id)
//   77 {
LPLD_LCD_FLEXBUS_Init:
        PUSH     {LR}
        SUB      SP,SP,#+28
//   78   FB_InitTypeDef fb_init;
//   79   fb_init.FB_Fbx = FB0;
        MOVS     R0,#+0
        STRB     R0,[SP, #+4]
//   80   fb_init.FB_ChipSelAddress = LCD_CMD_ADDRESS;
        MOVS     R0,#+1610612736
        STR      R0,[SP, #+8]
//   81   fb_init.FB_AutoAckEnable = TRUE;
        MOVS     R0,#+1
        STRB     R0,[SP, #+18]
//   82   fb_init.FB_IsRightJustied = TRUE;
        MOVS     R0,#+1
        STRB     R0,[SP, #+17]
//   83   fb_init.FB_WateStates = 0x02;
        MOVS     R0,#+2
        STRB     R0,[SP, #+19]
//   84   fb_init.FB_PortSize = FB_SIZE_16BIT;
        MOVS     R0,#+2
        STRB     R0,[SP, #+16]
//   85   fb_init.FB_AddressSpace = FB_SPACE_KB(512);   //128K
        MOVS     R0,#+524288
        STR      R0,[SP, #+12]
//   86   fb_init.FB_ReadAddrHold = 0;
        MOVS     R0,#+0
        STRB     R0,[SP, #+20]
//   87   fb_init.FB_WriteAddrHold = 0;
        MOVS     R0,#+0
        STRB     R0,[SP, #+21]
//   88   LPLD_FlexBus_Init(fb_init); 
        ADD      R1,SP,#+4
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_FlexBus_Init
//   89   PORTB->PCR[11] = PORT_PCR_MUX(5);
        MOV      R0,#+1280
        LDR.W    R1,??DataTable22  ;; 0x4004a02c
        STR      R0,[R1, #+0]
//   90 }
        ADD      SP,SP,#+28
        POP      {PC}             ;; return
//   91 
//   92 /*
//   93  * LPLD_LCD_IO_Cfg
//   94  * LCD IO引脚初始化，内部调用
//   95  *
//   96  * 说明：
//   97  * 此处初始化复位引脚，可根据实际硬件更改
//   98  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   99 static void LPLD_LCD_IO_Cfg(void)
//  100 {
LPLD_LCD_IO_Cfg:
        PUSH     {LR}
        SUB      SP,SP,#+28
//  101   GPIO_InitTypeDef ptc_init;
//  102   //RST 
//  103   ptc_init.GPIO_PTx = PTC;
        LDR.W    R0,??DataTable22_1  ;; 0x400ff080
        STR      R0,[SP, #+4]
//  104   ptc_init.GPIO_Pins = GPIO_Pin12;
        MOV      R0,#+4096
        STR      R0,[SP, #+8]
//  105   ptc_init.GPIO_Dir = DIR_OUTPUT;
        MOVS     R0,#+1
        STRB     R0,[SP, #+16]
//  106   ptc_init.GPIO_Output = OUTPUT_H;
        MOVS     R0,#+1
        STRB     R0,[SP, #+17]
//  107   ptc_init.GPIO_PinControl = IRQC_DIS; 
        MOVS     R0,#+0
        STR      R0,[SP, #+12]
//  108   LPLD_GPIO_Init(ptc_init);    
        ADD      R1,SP,#+4
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_GPIO_Init
//  109 }
        ADD      SP,SP,#+28
        POP      {PC}             ;; return
//  110 
//  111 /*
//  112  * LPLD_LCD_WriteIndex
//  113  * LCD写控制命令，内部调用
//  114  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  115 static void LPLD_LCD_WriteIndex(uint16 index)
//  116 {
//  117   *(vuint16*)LCD_CMD_ADDRESS = index;  //write
LPLD_LCD_WriteIndex:
        MOVS     R1,#+1610612736
        STRH     R0,[R1, #+0]
//  118 }
        BX       LR               ;; return
//  119 
//  120 /*
//  121  * LPLD_LCD_WriteData
//  122  * LCD写数据，内部调用
//  123  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  124 void LPLD_LCD_WriteData(uint16 data)
//  125 {
//  126   *(vuint16*)LCD_DATA_ADDRESS = data;  //write
LPLD_LCD_WriteData:
        LDR.W    R1,??DataTable22_2  ;; 0x60040000
        STRH     R0,[R1, #+0]
//  127 }
        BX       LR               ;; return
//  128 
//  129 /*
//  130  * LPLD_LCD_ReadData
//  131  * LCD读数据，内部调用
//  132  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  133 static uint16 LPLD_LCD_ReadData(void)
//  134 { 
//  135   uint16 value;
//  136   value = *(vuint16*)LCD_DATA_ADDRESS;  //read
LPLD_LCD_ReadData:
        LDR.W    R0,??DataTable22_2  ;; 0x60040000
        LDRH     R0,[R0, #+0]
//  137   return value;
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BX       LR               ;; return
//  138 }
//  139 
//  140 /*
//  141  * LPLD_LCD_WriteReg
//  142  * LCD写寄存器，内部调用
//  143  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  144 static void LPLD_LCD_WriteReg(uint16 LCD_Reg,uint16 LCD_RegValue)
//  145 { 
LPLD_LCD_WriteReg:
        PUSH     {R4,LR}
        MOVS     R4,R1
//  146   /* Write 16-bit Index, then Write Reg */  
//  147   LPLD_LCD_WriteIndex(LCD_Reg);         
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       LPLD_LCD_WriteIndex
//  148   /* Write 16-bit Reg */
//  149   LPLD_LCD_WriteData(LCD_RegValue);  
        MOVS     R0,R4
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       LPLD_LCD_WriteData
//  150 }
        POP      {R4,PC}          ;; return
//  151 
//  152 /*
//  153  * LPLD_LCD_ReadReg
//  154  * LCD读寄存器，内部调用
//  155  */
//  156 static uint16 LPLD_LCD_ReadReg(uint16 LCD_Reg)
//  157 {
//  158   uint16 LCD_RAM;
//  159   /* Write 16-bit Index (then Read Reg) */
//  160   LPLD_LCD_WriteIndex(LCD_Reg);
//  161   /* Read 16-bit Reg */
//  162   LCD_RAM = LPLD_LCD_ReadData();      	
//  163   return LCD_RAM;
//  164 }
//  165 
//  166 /*
//  167  * LPLD_LCD_SetCursor
//  168  * 设置LCD内部GRAM光标位置，内部调用
//  169  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  170 static void LPLD_LCD_SetCursor( uint16 Xpos, uint16 Ypos )
//  171 {
LPLD_LCD_SetCursor:
        PUSH     {R4,LR}
        MOVS     R4,R1
//  172 #if(HORIZONTAL)
//  173     
//  174   uint16 temp = Xpos;
        MOVS     R1,R0
//  175   Xpos = Ypos;
        MOVS     R0,R4
//  176   Ypos = temp;  
        MOVS     R4,R1
//  177 
//  178 #else
//  179             
//  180 #endif
//  181   LPLD_LCD_WriteReg(LPLD_LCD_INFO.X_GRAM, Xpos );      
        MOVS     R1,R0
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LDR.W    R0,??DataTable22_3
        LDRH     R0,[R0, #+4]
        BL       LPLD_LCD_WriteReg
//  182   LPLD_LCD_WriteReg(LPLD_LCD_INFO.Y_GRAM, Ypos );          
        MOVS     R1,R4
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LDR.W    R0,??DataTable22_3
        LDRH     R0,[R0, #+6]
        BL       LPLD_LCD_WriteReg
//  183 }
        POP      {R4,PC}          ;; return
//  184 
//  185 
//  186 /*
//  187  * LPLD_LCD_Reset
//  188  * 复位LCD控制器，内部调用
//  189  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  190 static void LPLD_LCD_Reset(void)
//  191 {
LPLD_LCD_Reset:
        PUSH     {R7,LR}
//  192   LCD_CLR_RST;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable22_4  ;; 0x43fe1030
        STR      R0,[R1, #+0]
//  193   LPLD_LCD_Delayms(10); //延时
        MOVS     R0,#+10
        BL       LPLD_LCD_Delayms
//  194   LCD_SET_RST;
        MOVS     R0,#+1
        LDR.W    R1,??DataTable22_4  ;; 0x43fe1030
        STR      R0,[R1, #+0]
//  195 }
        POP      {R0,PC}          ;; return
//  196 
//  197 /*
//  198  * LPLD_LCD_Init
//  199  * LCD初始化
//  200  * 
//  201  * 参数:
//  202  *    无
//  203  *
//  204  * 输出:
//  205  *    LCD控制型号
//  206  *    0x9320--9320
//  207  *    0x8989--8989
//  208  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  209 uint16 LPLD_LCD_Init(void)
//  210 {
LPLD_LCD_Init:
        PUSH     {R4,LR}
//  211   uint16 dID;
//  212    
//  213   LPLD_LCD_FLEXBUS_Init(0);
        MOVS     R0,#+0
        BL       LPLD_LCD_FLEXBUS_Init
//  214   LPLD_LCD_IO_Cfg();
        BL       LPLD_LCD_IO_Cfg
//  215   LPLD_LCD_Delayms(50);
        MOVS     R0,#+50
        BL       LPLD_LCD_Delayms
//  216   
//  217   LPLD_LCD_Reset();                 //硬件复位
        BL       LPLD_LCD_Reset
//  218   
//  219  // dID = LPLD_LCD_ReadReg(0x0000);   //获取LCD控制器设备ID
//  220     
//  221  // LPLD_LCD_INFO.Lcd_Id = dID;
//  222   dID=0x8989;
        MOVW     R4,#+35209
//  223   if(dID == 0x9320)
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        MOVW     R0,#+37664
        CMP      R4,R0
        BNE.W    ??LPLD_LCD_Init_0
//  224   {
//  225     LPLD_LCD_INFO.Write_GRAM = 0x0022;
        MOVS     R0,#+34
        LDR.W    R1,??DataTable22_3
        STRH     R0,[R1, #+2]
//  226     LPLD_LCD_INFO.X_GRAM = 0x0020;
        MOVS     R0,#+32
        LDR.W    R1,??DataTable22_3
        STRH     R0,[R1, #+4]
//  227     LPLD_LCD_INFO.Y_GRAM = 0x0021;
        MOVS     R0,#+33
        LDR.W    R1,??DataTable22_3
        STRH     R0,[R1, #+6]
//  228     
//  229     LPLD_LCD_WriteReg(0x00,0x0001);   //开启LCD内部晶振，并等待10ms稳定
        MOVS     R1,#+1
        MOVS     R0,#+0
        BL       LPLD_LCD_WriteReg
//  230     LPLD_LCD_Delayms(10);
        MOVS     R0,#+10
        BL       LPLD_LCD_Delayms
//  231     
//  232     LPLD_LCD_WriteReg(0x01,0x0000);   //Driver Output Control
        MOVS     R1,#+0
        MOVS     R0,#+1
        BL       LPLD_LCD_WriteReg
//  233     LPLD_LCD_WriteReg(0x02,0x0700);   //LCD Driving Wave Control
        MOV      R1,#+1792
        MOVS     R0,#+2
        BL       LPLD_LCD_WriteReg
//  234     LPLD_LCD_WriteReg(0x03,0x1008);   //Entry Mode
        MOVW     R1,#+4104
        MOVS     R0,#+3
        BL       LPLD_LCD_WriteReg
//  235     LPLD_LCD_WriteReg(0x04,0x0000);   //Resizing Control
        MOVS     R1,#+0
        MOVS     R0,#+4
        BL       LPLD_LCD_WriteReg
//  236     LPLD_LCD_WriteReg(0x08,0x0202);   //Display Control 2
        MOVW     R1,#+514
        MOVS     R0,#+8
        BL       LPLD_LCD_WriteReg
//  237     LPLD_LCD_WriteReg(0x09,0x0000);   //Display Contral 3.(0x0000)
        MOVS     R1,#+0
        MOVS     R0,#+9
        BL       LPLD_LCD_WriteReg
//  238     LPLD_LCD_WriteReg(0x0a,0x0000);//Frame Cycle Contal.(0x0000)
        MOVS     R1,#+0
        MOVS     R0,#+10
        BL       LPLD_LCD_WriteReg
//  239     LPLD_LCD_WriteReg(0x0c,0x0001);//Extern Display Interface Contral 1.(0x0000)
        MOVS     R1,#+1
        MOVS     R0,#+12
        BL       LPLD_LCD_WriteReg
//  240     LPLD_LCD_WriteReg(0x0d,0x0000);//Frame Maker Position.
        MOVS     R1,#+0
        MOVS     R0,#+13
        BL       LPLD_LCD_WriteReg
//  241     LPLD_LCD_WriteReg(0x0f,0x0000);//Extern Display Interface Contral 2.
        MOVS     R1,#+0
        MOVS     R0,#+15
        BL       LPLD_LCD_WriteReg
//  242     
//  243     LPLD_LCD_WriteReg(0x10,0x0000);//Power Control 1.(0x16b0)
        MOVS     R1,#+0
        MOVS     R0,#+16
        BL       LPLD_LCD_WriteReg
//  244     LPLD_LCD_WriteReg(0x11,0x0000);//Power Control 2.(0x0001)	
        MOVS     R1,#+0
        MOVS     R0,#+17
        BL       LPLD_LCD_WriteReg
//  245     LPLD_LCD_WriteReg(0x12,0x0000);//Power Control 3.(0x0138)
        MOVS     R1,#+0
        MOVS     R0,#+18
        BL       LPLD_LCD_WriteReg
//  246     LPLD_LCD_WriteReg(0x13,0x0000);
        MOVS     R1,#+0
        MOVS     R0,#+19
        BL       LPLD_LCD_WriteReg
//  247     //LPLD_LCD_Delayms(200);	
//  248     
//  249     LPLD_LCD_WriteReg(0x10,0x17b0);//Power Control 1.(0x16b0)
        MOVW     R1,#+6064
        MOVS     R0,#+16
        BL       LPLD_LCD_WriteReg
//  250     LPLD_LCD_WriteReg(0x11,0x0137);//Power Control 2.(0x0001)
        MOVW     R1,#+311
        MOVS     R0,#+17
        BL       LPLD_LCD_WriteReg
//  251     LPLD_LCD_Delayms(5);
        MOVS     R0,#+5
        BL       LPLD_LCD_Delayms
//  252     LPLD_LCD_WriteReg(0x12,0x0139);//Power Control 3.(0x0138)
        MOVW     R1,#+313
        MOVS     R0,#+18
        BL       LPLD_LCD_WriteReg
//  253     LPLD_LCD_Delayms(5);	
        MOVS     R0,#+5
        BL       LPLD_LCD_Delayms
//  254     LPLD_LCD_WriteReg(0x13,0x1700);	 
        MOV      R1,#+5888
        MOVS     R0,#+19
        BL       LPLD_LCD_WriteReg
//  255    
//  256     LPLD_LCD_WriteReg(0x29,0x0000);
        MOVS     R1,#+0
        MOVS     R0,#+41
        BL       LPLD_LCD_WriteReg
//  257     LPLD_LCD_WriteReg(0x2B,0x0000);
        MOVS     R1,#+0
        MOVS     R0,#+43
        BL       LPLD_LCD_WriteReg
//  258     LPLD_LCD_Delayms(5);						
        MOVS     R0,#+5
        BL       LPLD_LCD_Delayms
//  259     
//  260     LPLD_LCD_WriteReg(0x30,0x0000);					
        MOVS     R1,#+0
        MOVS     R0,#+48
        BL       LPLD_LCD_WriteReg
//  261     LPLD_LCD_WriteReg(0x31,0x0507);
        MOVW     R1,#+1287
        MOVS     R0,#+49
        BL       LPLD_LCD_WriteReg
//  262     LPLD_LCD_WriteReg(0x32,0x0104);	
        MOV      R1,#+260
        MOVS     R0,#+50
        BL       LPLD_LCD_WriteReg
//  263     LPLD_LCD_WriteReg(0x35,0x0105);	
        MOVW     R1,#+261
        MOVS     R0,#+53
        BL       LPLD_LCD_WriteReg
//  264     LPLD_LCD_WriteReg(0x36,0x0404);
        MOVW     R1,#+1028
        MOVS     R0,#+54
        BL       LPLD_LCD_WriteReg
//  265     LPLD_LCD_WriteReg(0x37,0x0603);	
        MOVW     R1,#+1539
        MOVS     R0,#+55
        BL       LPLD_LCD_WriteReg
//  266     LPLD_LCD_WriteReg(0x38,0x0004);	
        MOVS     R1,#+4
        MOVS     R0,#+56
        BL       LPLD_LCD_WriteReg
//  267     LPLD_LCD_WriteReg(0x39,0x0007);
        MOVS     R1,#+7
        MOVS     R0,#+57
        BL       LPLD_LCD_WriteReg
//  268     LPLD_LCD_WriteReg(0x3c,0x0501);	
        MOVW     R1,#+1281
        MOVS     R0,#+60
        BL       LPLD_LCD_WriteReg
//  269     LPLD_LCD_WriteReg(0x3d,0x0404);
        MOVW     R1,#+1028
        MOVS     R0,#+61
        BL       LPLD_LCD_WriteReg
//  270     
//  271     LPLD_LCD_WriteReg(0x0050,0x0000);
        MOVS     R1,#+0
        MOVS     R0,#+80
        BL       LPLD_LCD_WriteReg
//  272     LPLD_LCD_WriteReg(0x0051,239);
        MOVS     R1,#+239
        MOVS     R0,#+81
        BL       LPLD_LCD_WriteReg
//  273     LPLD_LCD_WriteReg(0x0052,0x0000);
        MOVS     R1,#+0
        MOVS     R0,#+82
        BL       LPLD_LCD_WriteReg
//  274     LPLD_LCD_WriteReg(0x0053,319);
        MOVW     R1,#+319
        MOVS     R0,#+83
        BL       LPLD_LCD_WriteReg
//  275   
//  276     LPLD_LCD_WriteReg(0x60,0x2700);//Driver Output Control.
        MOV      R1,#+9984
        MOVS     R0,#+96
        BL       LPLD_LCD_WriteReg
//  277     LPLD_LCD_WriteReg(0x61,0x0001);//Driver Output Control.
        MOVS     R1,#+1
        MOVS     R0,#+97
        BL       LPLD_LCD_WriteReg
//  278     LPLD_LCD_WriteReg(0x6a,0x0000);//Vertical Srcoll Control.
        MOVS     R1,#+0
        MOVS     R0,#+106
        BL       LPLD_LCD_WriteReg
//  279     
//  280     LPLD_LCD_WriteReg(0x80,0x0000);//Display Position? Partial Display 1.
        MOVS     R1,#+0
        MOVS     R0,#+128
        BL       LPLD_LCD_WriteReg
//  281     LPLD_LCD_WriteReg(0x81,0x0000);//RAM Address Start? Partial Display 1.
        MOVS     R1,#+0
        MOVS     R0,#+129
        BL       LPLD_LCD_WriteReg
//  282     LPLD_LCD_WriteReg(0x82,0x0000);//RAM Address End-Partial Display 1.
        MOVS     R1,#+0
        MOVS     R0,#+130
        BL       LPLD_LCD_WriteReg
//  283     LPLD_LCD_WriteReg(0x83,0x0000);//Displsy Position? Partial Display 2.
        MOVS     R1,#+0
        MOVS     R0,#+131
        BL       LPLD_LCD_WriteReg
//  284     LPLD_LCD_WriteReg(0x84,0x0000);//RAM Address Start? Partial Display 2.
        MOVS     R1,#+0
        MOVS     R0,#+132
        BL       LPLD_LCD_WriteReg
//  285     LPLD_LCD_WriteReg(0x85,0x0000);//RAM Address End? Partial Display 2.
        MOVS     R1,#+0
        MOVS     R0,#+133
        BL       LPLD_LCD_WriteReg
//  286     
//  287     LPLD_LCD_WriteReg(0x90,0x0010);//Frame Cycle Contral.(0x0013)
        MOVS     R1,#+16
        MOVS     R0,#+144
        BL       LPLD_LCD_WriteReg
//  288     LPLD_LCD_WriteReg(0x92,0x0000);//Panel Interface Contral 2.(0x0000)
        MOVS     R1,#+0
        MOVS     R0,#+146
        BL       LPLD_LCD_WriteReg
//  289     LPLD_LCD_WriteReg(0x93,0x0003);//Panel Interface Contral 3.
        MOVS     R1,#+3
        MOVS     R0,#+147
        BL       LPLD_LCD_WriteReg
//  290     LPLD_LCD_WriteReg(0x95,0x0110);//Frame Cycle Contral.(0x0110)
        MOV      R1,#+272
        MOVS     R0,#+149
        BL       LPLD_LCD_WriteReg
//  291     LPLD_LCD_WriteReg(0x97,0x0000);//
        MOVS     R1,#+0
        MOVS     R0,#+151
        BL       LPLD_LCD_WriteReg
//  292     LPLD_LCD_WriteReg(0x98,0x0000);//Frame Cycle Contral.
        MOVS     R1,#+0
        MOVS     R0,#+152
        BL       LPLD_LCD_WriteReg
//  293 
//  294     LPLD_LCD_WriteReg(0x07,0x0133);
        MOVW     R1,#+307
        MOVS     R0,#+7
        BL       LPLD_LCD_WriteReg
//  295     LPLD_LCD_Delayms(3);
        MOVS     R0,#+3
        BL       LPLD_LCD_Delayms
        B.N      ??LPLD_LCD_Init_1
//  296   }  
//  297   else if(dID == 0x8989)
??LPLD_LCD_Init_0:
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        MOVW     R0,#+35209
        CMP      R4,R0
        BNE.W    ??LPLD_LCD_Init_1
//  298   {
//  299     LPLD_LCD_INFO.Write_GRAM = 0x0022;
        MOVS     R0,#+34
        LDR.W    R1,??DataTable22_3
        STRH     R0,[R1, #+2]
//  300     LPLD_LCD_INFO.X_GRAM = 0x004e;
        MOVS     R0,#+78
        LDR.W    R1,??DataTable22_3
        STRH     R0,[R1, #+4]
//  301     LPLD_LCD_INFO.Y_GRAM = 0x004f;
        MOVS     R0,#+79
        LDR.W    R1,??DataTable22_3
        STRH     R0,[R1, #+6]
//  302     
//  303     //SSD1289;
//  304     /* 打开晶振 */
//  305     LPLD_LCD_WriteReg(0x0000,0x0001);    LPLD_LCD_Delayms(LCD_DELAY_TIME); 
        MOVS     R1,#+1
        MOVS     R0,#+0
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  306  
//  307     //启动频率设置为最大osc/16 消耗功率设置在large档位，提高显示画质
//  308     //LPLD_LCD_WriteReg(0x0003,0xF8F8);    LPLD_LCD_Delayms(LCD_DELAY_TIME);
//  309     LPLD_LCD_WriteReg(0x0003,0xA8A4);    LPLD_LCD_Delayms(LCD_DELAY_TIME);   //0210
        MOVW     R1,#+43172
        MOVS     R0,#+3
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  310     LPLD_LCD_WriteReg(0x000C,0x0000);    LPLD_LCD_Delayms(LCD_DELAY_TIME);   
        MOVS     R1,#+0
        MOVS     R0,#+12
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  311     LPLD_LCD_WriteReg(0x000D,0x080C);    LPLD_LCD_Delayms(LCD_DELAY_TIME);   
        MOVW     R1,#+2060
        MOVS     R0,#+13
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  312     LPLD_LCD_WriteReg(0x000E,0x2B00);    LPLD_LCD_Delayms(LCD_DELAY_TIME);   
        MOV      R1,#+11008
        MOVS     R0,#+14
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  313     LPLD_LCD_WriteReg(0x001E,0x00B0);    LPLD_LCD_Delayms(LCD_DELAY_TIME); 
        MOVS     R1,#+176
        MOVS     R0,#+30
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  314     //驱动输出控制320*240 0x2B3F 
//  315   //  LPLD_LCD_WriteReg(0x0001,0x2B3F);    LPLD_LCD_Delayms(LCD_DELAY_TIME); 
//  316     
//  317     //  693F   6B3F   2B3F   293F
//  318     LPLD_LCD_WriteReg(0x0001,0x293F);    LPLD_LCD_Delayms(LCD_DELAY_TIME);   
        MOVW     R1,#+10559
        MOVS     R0,#+1
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  319   
//  320     //驱动输出控制320*240 0x233F 将原来的第11位BGR清零这样输出是RGB就不会红色与蓝色颠倒 
//  321     //LPLD_LCD_WriteReg(0x0001,0x233F);    LPLD_LCD_Delayms(LCD_DELAY_TIME);   
//  322     LPLD_LCD_WriteReg(0x0002,0x0600);    LPLD_LCD_Delayms(LCD_DELAY_TIME);
        MOV      R1,#+1536
        MOVS     R0,#+2
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  323     LPLD_LCD_WriteReg(0x0010,0x0000);    LPLD_LCD_Delayms(LCD_DELAY_TIME);
        MOVS     R1,#+0
        MOVS     R0,#+16
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  324     /* 定义数据格式 16位色 横屏 0x6070 */
//  325     // TY1（bit7） TY0 ID1 ID0 AM LG2 LG1 LG0
//  326     //   0          0   1   1   1  0   0   0
//  327     // type A  0 0
//  328     // type B  0 1
//  329     // type C  1 1
//  330     // AM   指针自动增加
//  331     // 65K颜色
//  332     // 寄存器 4f/4e 定义窗口大小
//  333     LPLD_LCD_WriteReg(0x0011,0x6028);    LPLD_LCD_Delayms(LCD_DELAY_TIME);   
        MOVW     R1,#+24616
        MOVS     R0,#+17
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  334     //LPLD_LCD_WriteReg(0x0011,0x6070);    LPLD_LCD_Delayms(LCD_DELAY_TIME);   
//  335     //
//  336     LPLD_LCD_WriteReg(0x0005,0x0000);    LPLD_LCD_Delayms(LCD_DELAY_TIME);
        MOVS     R1,#+0
        MOVS     R0,#+5
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  337     LPLD_LCD_WriteReg(0x0006,0x0000);    LPLD_LCD_Delayms(LCD_DELAY_TIME);
        MOVS     R1,#+0
        MOVS     R0,#+6
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  338     LPLD_LCD_WriteReg(0x0016,0xEF1C);    LPLD_LCD_Delayms(LCD_DELAY_TIME);
        MOVW     R1,#+61212
        MOVS     R0,#+22
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  339     LPLD_LCD_WriteReg(0x0017,0x0003);    LPLD_LCD_Delayms(LCD_DELAY_TIME);
        MOVS     R1,#+3
        MOVS     R0,#+23
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  340     //PT1 PT0 VLE2 VLE1 SPT 0  0 GON DTE CM 0 D1 D0
//  341     //  0   0        1   0  0  0  1   1  0  0  1  1
//  342     LPLD_LCD_WriteReg(0x0007,0x0233);    LPLD_LCD_Delayms(LCD_DELAY_TIME);
        MOVW     R1,#+563
        MOVS     R0,#+7
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  343     //LPLD_LCD_WriteReg(0x0007,0x0133);    LPLD_LCD_Delayms(LCD_DELAY_TIME);
//  344     //NO1 NO0 SDT1 SDT0 0 EQ2 EQ1 EQ0 DIV1 DIV0 SDIV SRTN RTN3 RTN2 RTN1 RTN0
//  345     //                                 1     1    0    0    0    0   0   0
//  346     //将DIV设置成2分频
//  347     //
//  348     //LPLD_LCD_WriteReg(0x000B,0x0020);    LPLD_LCD_Delayms(LCD_DELAY_TIME);
//  349     LPLD_LCD_WriteReg(0x000B,0x0020);    LPLD_LCD_Delayms(LCD_DELAY_TIME);
        MOVS     R1,#+32
        MOVS     R0,#+11
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  350     //配置扫描模式
//  351     LPLD_LCD_WriteReg(0x000F,0x0000);    LPLD_LCD_Delayms(LCD_DELAY_TIME);   
        MOVS     R1,#+0
        MOVS     R0,#+15
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  352     /* 扫描开始地址 */
//  353     //垂直控制
//  354     LPLD_LCD_WriteReg(0x0041,0x0000);    LPLD_LCD_Delayms(LCD_DELAY_TIME);
        MOVS     R1,#+0
        MOVS     R0,#+65
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  355     LPLD_LCD_WriteReg(0x0042,0x0000);    LPLD_LCD_Delayms(LCD_DELAY_TIME);
        MOVS     R1,#+0
        MOVS     R0,#+66
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  356     //水平RAMposition
//  357     LPLD_LCD_WriteReg(0x0048,0x0000);    LPLD_LCD_Delayms(LCD_DELAY_TIME);
        MOVS     R1,#+0
        MOVS     R0,#+72
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  358     LPLD_LCD_WriteReg(0x0049,0x013F);    LPLD_LCD_Delayms(LCD_DELAY_TIME);
        MOVW     R1,#+319
        MOVS     R0,#+73
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  359     
//  360     LPLD_LCD_WriteReg(0x004A,0x0000);    LPLD_LCD_Delayms(LCD_DELAY_TIME);
        MOVS     R1,#+0
        MOVS     R0,#+74
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  361     LPLD_LCD_WriteReg(0x004B,0x0000);    LPLD_LCD_Delayms(LCD_DELAY_TIME); 
        MOVS     R1,#+0
        MOVS     R0,#+75
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  362  
//  363    // LPLD_LCD_WriteReg(0x0044,0xEF00);    LPLD_LCD_Delayms(LCD_DELAY_TIME);
//  364    // LPLD_LCD_WriteReg(0x0045,0x0000);    LPLD_LCD_Delayms(LCD_DELAY_TIME); 
//  365    // LPLD_LCD_WriteReg(0x0046,0x013F);    LPLD_LCD_Delayms(LCD_DELAY_TIME);
//  366     
//  367     LPLD_LCD_WriteReg(0x0030,0x0707);    LPLD_LCD_Delayms(LCD_DELAY_TIME);
        MOVW     R1,#+1799
        MOVS     R0,#+48
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  368     LPLD_LCD_WriteReg(0x0031,0x0204);    LPLD_LCD_Delayms(LCD_DELAY_TIME);
        MOV      R1,#+516
        MOVS     R0,#+49
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  369     LPLD_LCD_WriteReg(0x0032,0x0204);    LPLD_LCD_Delayms(LCD_DELAY_TIME);
        MOV      R1,#+516
        MOVS     R0,#+50
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  370     LPLD_LCD_WriteReg(0x0033,0x0502);    LPLD_LCD_Delayms(LCD_DELAY_TIME);
        MOVW     R1,#+1282
        MOVS     R0,#+51
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  371     LPLD_LCD_WriteReg(0x0034,0x0507);    LPLD_LCD_Delayms(LCD_DELAY_TIME);
        MOVW     R1,#+1287
        MOVS     R0,#+52
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  372     LPLD_LCD_WriteReg(0x0035,0x0204);    LPLD_LCD_Delayms(LCD_DELAY_TIME);
        MOV      R1,#+516
        MOVS     R0,#+53
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  373     LPLD_LCD_WriteReg(0x0036,0x0204);    LPLD_LCD_Delayms(LCD_DELAY_TIME);
        MOV      R1,#+516
        MOVS     R0,#+54
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  374     LPLD_LCD_WriteReg(0x0037,0x0502);    LPLD_LCD_Delayms(LCD_DELAY_TIME);
        MOVW     R1,#+1282
        MOVS     R0,#+55
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  375     LPLD_LCD_WriteReg(0x003A,0x0302);    LPLD_LCD_Delayms(LCD_DELAY_TIME);
        MOVW     R1,#+770
        MOVS     R0,#+58
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  376     LPLD_LCD_WriteReg(0x003B,0x0302);    LPLD_LCD_Delayms(LCD_DELAY_TIME);
        MOVW     R1,#+770
        MOVS     R0,#+59
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  377     LPLD_LCD_WriteReg(0x0023,0x0000);    LPLD_LCD_Delayms(LCD_DELAY_TIME);
        MOVS     R1,#+0
        MOVS     R0,#+35
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  378     LPLD_LCD_WriteReg(0x0024,0x0000);    LPLD_LCD_Delayms(LCD_DELAY_TIME);
        MOVS     R1,#+0
        MOVS     R0,#+36
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  379     /*0000 390K  50 
//  380       0010 430K  55 
//  381       0101 470K  60 
//  382       1000 510K  65 
//  383       1010 548K  70 
//  384       1100 587K  75 
//  385       1110 626K  80 */
//  386     LPLD_LCD_WriteReg(0x0025,0x8000);    LPLD_LCD_Delayms(LCD_DELAY_TIME);
        MOV      R1,#+32768
        MOVS     R0,#+37
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  387  //   LPLD_LCD_WriteReg(0x0025,0xe000);    LPLD_LCD_Delayms(LCD_DELAY_TIME);
//  388     
//  389   //  LPLD_LCD_WriteReg(0x004f,0);
//  390   //  LPLD_LCD_WriteReg(0x004e,0);//设定显示窗口       
//  391     //LPLD_LCD_UpdateData();	//更新写入的数据使之生效*/
//  392     LPLD_LCD_Delayms(20);         //等待LCD启动
        MOVS     R0,#+20
        BL       LPLD_LCD_Delayms
//  393   }
//  394   
//  395   return dID;
??LPLD_LCD_Init_1:
        MOVS     R0,R4
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        POP      {R4,PC}          ;; return
//  396 }
//  397 
//  398 /*
//  399  * LPLD_LCD_FillBackground
//  400  * 填充LCD背景色
//  401  * 
//  402  * 参数:
//  403  *    Color--16位RGB颜色值
//  404  *
//  405  * 输出:
//  406  *    无
//  407  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  408 void LPLD_LCD_FillBackground(uint16 Color)
//  409 {
LPLD_LCD_FillBackground:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
//  410   uint32_t index=0;
        MOVS     R5,#+0
//  411   LPLD_LCD_SetCursor(0,0); 
        MOVS     R1,#+0
        MOVS     R0,#+0
        BL       LPLD_LCD_SetCursor
//  412   LPLD_LCD_WriteIndex(LPLD_LCD_INFO.Write_GRAM);
        LDR.W    R0,??DataTable22_3
        LDRH     R0,[R0, #+2]
        BL       LPLD_LCD_WriteIndex
//  413   for( index = 0; index < MAX_X * MAX_Y; index++ )
        MOVS     R0,#+0
        MOVS     R5,R0
        B.N      ??LPLD_LCD_FillBackground_0
//  414   {
//  415     LPLD_LCD_WriteData(Color);
??LPLD_LCD_FillBackground_1:
        MOVS     R0,R4
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       LPLD_LCD_WriteData
//  416   }
        ADDS     R5,R5,#+1
??LPLD_LCD_FillBackground_0:
        CMP      R5,#+76800
        BCC.N    ??LPLD_LCD_FillBackground_1
//  417 }
        POP      {R0,R4,R5,PC}    ;; return
//  418 
//  419 /*
//  420  * LPLD_LCD_FillBackgroundGRAM
//  421  * 填充LCD背景色到LCD_GRAM
//  422  * 
//  423  * 参数:
//  424  *    *Color--16位RGB颜色值数组，长度为LCD_GRAM数组的长度
//  425  *
//  426  * 输出:
//  427  *    无
//  428  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  429 void LPLD_LCD_FillBackgroundGRAM(uint16 *Color)
//  430 {
LPLD_LCD_FillBackgroundGRAM:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
//  431   uint32_t index=0;
        MOVS     R5,#+0
//  432   LPLD_LCD_SetCursor(0,0); 
        MOVS     R1,#+0
        MOVS     R0,#+0
        BL       LPLD_LCD_SetCursor
//  433   LPLD_LCD_WriteIndex(LPLD_LCD_INFO.Write_GRAM);
        LDR.W    R0,??DataTable22_3
        LDRH     R0,[R0, #+2]
        BL       LPLD_LCD_WriteIndex
//  434   for( index = 0; index < MAX_X * MAX_Y; index++ )
        MOVS     R0,#+0
        MOVS     R5,R0
        B.N      ??LPLD_LCD_FillBackgroundGRAM_0
//  435   {
//  436     LPLD_LCD_WriteData(Color[index]);
??LPLD_LCD_FillBackgroundGRAM_1:
        LDRH     R0,[R4, R5, LSL #+1]
        BL       LPLD_LCD_WriteData
//  437   }
        ADDS     R5,R5,#+1
??LPLD_LCD_FillBackgroundGRAM_0:
        CMP      R5,#+76800
        BCC.N    ??LPLD_LCD_FillBackgroundGRAM_1
//  438 }
        POP      {R0,R4,R5,PC}    ;; return
//  439 
//  440 /*
//  441  * LPLD_LCD_BGR2RGB
//  442  * BGR颜色转RGB颜色
//  443  * 
//  444  * 参数:
//  445  *    Color--16位BGR颜色值
//  446  *
//  447  * 输出:
//  448  *    16位RGB颜色值
//  449  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  450 uint16 LPLD_LCD_BGR2RGB(uint16 Color)
//  451 {
//  452   uint16  r, g, b, rgb;
//  453   
//  454   b = ( Color>>0 )  & 0x1f;
LPLD_LCD_BGR2RGB:
        ANDS     R2,R0,#0x1F
//  455   g = ( Color>>5 )  & 0x3f;
        UBFX     R1,R0,#+5,#+6
//  456   r = ( Color>>11 ) & 0x1f;
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R0,R0,#+11
//  457   
//  458   rgb =  (b<<11) + (g<<5) + (r<<0);
        LSLS     R1,R1,#+5
        ADDS     R1,R1,R2, LSL #+11
        ADDS     R0,R0,R1
//  459   
//  460   return( rgb );
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BX       LR               ;; return
//  461 }
//  462 
//  463 /*
//  464  * LPLD_LCD_U8GRAY2RGB
//  465  * U8灰度颜色转为RGB颜色
//  466  * 
//  467  * 参数:
//  468  *    Color--8位灰度颜色值
//  469  *
//  470  * 输出:
//  471  *    16位RGB颜色值
//  472  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  473 uint16 LPLD_LCD_U8GRAY2RGB(uint8 Color)
//  474 {
//  475   uint16  r, g, b, rgb;
//  476   
//  477   b = ( Color>>3 )  & 0x1f;
LPLD_LCD_U8GRAY2RGB:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSRS     R2,R0,#+3
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
//  478   g = ( Color>>2 )  & 0x3f;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSRS     R1,R0,#+2
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
//  479   r = ( Color>>3 )  & 0x1f;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSRS     R0,R0,#+3
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
//  480   
//  481   rgb =  (b<<11) + (g<<5) + (r<<0);
        LSLS     R1,R1,#+5
        ADDS     R1,R1,R2, LSL #+11
        ADDS     R0,R0,R1
//  482   
//  483   return( rgb );
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BX       LR               ;; return
//  484 }
//  485 
//  486 /*
//  487  * LPLD_LCD_GetPoint
//  488  * 取得LCD某点的16位RGB值
//  489  * 
//  490  * 参数:
//  491  *    Xpos--X轴坐标
//  492  *    Ypos--Y轴坐标
//  493  *
//  494  * 输出:
//  495  *    16位RGB颜色值
//  496  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  497 uint16 LPLD_LCD_GetPoint(uint16 Xpos,uint16 Ypos)
//  498 {
LPLD_LCD_GetPoint:
        PUSH     {R4,LR}
//  499   uint16 dummy;
//  500   
//  501   LPLD_LCD_SetCursor(Xpos,Ypos);
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       LPLD_LCD_SetCursor
//  502   LPLD_LCD_WriteIndex(LPLD_LCD_INFO.Write_GRAM);  
        LDR.W    R0,??DataTable22_3
        LDRH     R0,[R0, #+2]
        BL       LPLD_LCD_WriteIndex
//  503  
//  504   dummy = LPLD_LCD_ReadData();   /* 空读一次 */
        BL       LPLD_LCD_ReadData
        MOVS     R4,R0
//  505   dummy = LPLD_LCD_ReadData(); 
        BL       LPLD_LCD_ReadData
        MOVS     R4,R0
//  506   return  dummy;	          
        MOVS     R0,R4
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        POP      {R4,PC}          ;; return
//  507 }
//  508 
//  509 /*
//  510  * LPLD_LCD_SetPoint
//  511  * 设置LCD某点的16位RGB值
//  512  * 
//  513  * 参数:
//  514  *    Xpos--X轴坐标
//  515  *    Ypos--Y轴坐标
//  516  *    Color--16位RGB颜色值
//  517  *
//  518  * 输出:
//  519  *    无
//  520  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  521 void LPLD_LCD_SetPoint(uint16 Xpos,uint16 Ypos,uint16 Color)
//  522 {
LPLD_LCD_SetPoint:
        PUSH     {R4,LR}
        MOVS     R4,R2
//  523   if( Xpos >= MAX_X || Ypos >= MAX_Y )
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,#+320
        BGE.N    ??LPLD_LCD_SetPoint_0
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R1,#+240
        BLT.N    ??LPLD_LCD_SetPoint_1
//  524   {
//  525     return;
??LPLD_LCD_SetPoint_0:
        B.N      ??LPLD_LCD_SetPoint_2
//  526   } 
//  527   LPLD_LCD_SetCursor(Xpos,Ypos);
??LPLD_LCD_SetPoint_1:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       LPLD_LCD_SetCursor
//  528   LPLD_LCD_WriteReg(LPLD_LCD_INFO.Write_GRAM,Color);
        MOVS     R1,R4
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LDR.W    R0,??DataTable22_3
        LDRH     R0,[R0, #+2]
        BL       LPLD_LCD_WriteReg
//  529 }
??LPLD_LCD_SetPoint_2:
        POP      {R4,PC}          ;; return
//  530 
//  531 /*
//  532  * LPLD_LCD_DrawLine
//  533  * 在指定坐标显示直线
//  534  * 
//  535  * 参数:
//  536  *    x0--X轴起始坐标
//  537  *    y0--Y轴起始坐标
//  538  *    x1--X轴结束坐标
//  539  *    y1--Y轴结束坐标
//  540  *    Color--16位RGB颜色值
//  541  *
//  542  * 输出:
//  543  *    无
//  544  */	 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  545 void LPLD_LCD_DrawLine( uint16 x0, uint16 y0, uint16 x1, uint16 y1 , uint16 color )
//  546 {
LPLD_LCD_DrawLine:
        PUSH     {R3-R11,LR}
        MOVS     R5,R0
        MOV      R9,R1
        MOVS     R6,R2
        MOV      R11,R3
//  547   short dx,dy;      /* 定义X Y轴上增加的变量值 */
//  548   short temp;       /* 起点 终点大小比较 交换数据时的中间变量 */
//  549   
//  550   if( x0 > x1 )     /* X轴上起点大于终点 交换数据 */
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R6,R5
        BCS.N    ??LPLD_LCD_DrawLine_0
//  551   {
//  552     temp = x1;
        MOV      R10,R6
//  553     x1 = x0;
        MOVS     R6,R5
//  554     x0 = temp;   
        MOV      R5,R10
//  555   }
//  556   if( y0 > y1 )     /* Y轴上起点大于终点 交换数据 */
??LPLD_LCD_DrawLine_0:
        UXTH     R11,R11          ;; ZeroExt  R11,R11,#+16,#+16
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        CMP      R11,R9
        BCS.N    ??LPLD_LCD_DrawLine_1
//  557   {
//  558     temp = y1;
        MOV      R10,R11
//  559     y1 = y0;
        MOV      R11,R9
//  560     y0 = temp;   
        MOV      R9,R10
//  561   }
//  562   
//  563   dx = x1-x0;       /* X轴方向上的增量 */
??LPLD_LCD_DrawLine_1:
        SUBS     R7,R6,R5
//  564   dy = y1-y0;       /* Y轴方向上的增量 */
        SUBS     R8,R11,R9
        LDR      R4,[SP, #+40]
//  565   
//  566   if( dx == 0 )     /* X轴上没有增量 画垂直线 */ 
        SXTH     R7,R7            ;; SignExt  R7,R7,#+16,#+16
        CMP      R7,#+0
        BNE.N    ??LPLD_LCD_DrawLine_2
//  567   {
//  568     do
//  569     { 
//  570       LPLD_LCD_SetPoint(x0, y0, color);   /* 逐点显示 描垂直线 */
??LPLD_LCD_DrawLine_3:
        MOVS     R2,R4
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOV      R1,R9
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R5
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       LPLD_LCD_SetPoint
//  571       y0++;
        ADDS     R9,R9,#+1
//  572     }
//  573     while( y1 >= y0 ); 
        UXTH     R11,R11          ;; ZeroExt  R11,R11,#+16,#+16
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        CMP      R11,R9
        BCS.N    ??LPLD_LCD_DrawLine_3
//  574       return; 
        B.N      ??LPLD_LCD_DrawLine_4
//  575   }
//  576   if( dy == 0 )     /* Y轴上没有增量 画水平直线 */ 
??LPLD_LCD_DrawLine_2:
        SXTH     R8,R8            ;; SignExt  R8,R8,#+16,#+16
        CMP      R8,#+0
        BNE.N    ??LPLD_LCD_DrawLine_5
//  577   {
//  578     do
//  579     {
//  580       LPLD_LCD_SetPoint(x0, y0, color);   /* 逐点显示 描水平线 */
??LPLD_LCD_DrawLine_6:
        MOVS     R2,R4
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOV      R1,R9
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R5
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       LPLD_LCD_SetPoint
//  581       x0++;
        ADDS     R5,R5,#+1
//  582     }
//  583     while( x1 >= x0 ); 
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R6,R5
        BCS.N    ??LPLD_LCD_DrawLine_6
//  584       return;
        B.N      ??LPLD_LCD_DrawLine_4
//  585   }
//  586   /* 布兰森汉姆(Bresenham)算法画线 */
//  587   if( dx > dy )                         /* 靠近X轴 */
??LPLD_LCD_DrawLine_5:
        SXTH     R8,R8            ;; SignExt  R8,R8,#+16,#+16
        SXTH     R7,R7            ;; SignExt  R7,R7,#+16,#+16
        CMP      R8,R7
        BGE.N    ??LPLD_LCD_DrawLine_7
//  588   {
//  589     temp = 2 * dy - dx;               /* 计算下个点的位置 */         
        SXTH     R8,R8            ;; SignExt  R8,R8,#+16,#+16
        SXTH     R7,R7            ;; SignExt  R7,R7,#+16,#+16
        RSBS     R10,R7,R8, LSL #+1
        B.N      ??LPLD_LCD_DrawLine_8
//  590     while( x0 != x1 )
//  591     {
//  592       LPLD_LCD_SetPoint(x0,y0,color);    /* 画起点 */ 
//  593       x0++;                         /* X轴上加1 */
//  594       if( temp > 0 )                /* 判断下下个点的位置 */
//  595       {
//  596         y0++;                     /* 为右上相邻点，即（x0+1,y0+1） */ 
??LPLD_LCD_DrawLine_9:
        ADDS     R9,R9,#+1
//  597         temp += 2 * dy - 2 * dx; 
        SXTH     R8,R8            ;; SignExt  R8,R8,#+16,#+16
        LSLS     R0,R8,#+1
        SXTAH    R0,R0,R10
        SXTH     R7,R7            ;; SignExt  R7,R7,#+16,#+16
        SUBS     R10,R0,R7, LSL #+1
//  598       }
??LPLD_LCD_DrawLine_8:
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        CMP      R5,R6
        BEQ.N    ??LPLD_LCD_DrawLine_10
        MOVS     R2,R4
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOV      R1,R9
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R5
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       LPLD_LCD_SetPoint
        ADDS     R5,R5,#+1
        SXTH     R10,R10          ;; SignExt  R10,R10,#+16,#+16
        CMP      R10,#+1
        BGE.N    ??LPLD_LCD_DrawLine_9
//  599       else         
//  600       {
//  601         temp += 2 * dy;           /* 判断下下个点的位置 */  
        SXTH     R8,R8            ;; SignExt  R8,R8,#+16,#+16
        LSLS     R0,R8,#+1
        SXTAH    R10,R0,R10
        B.N      ??LPLD_LCD_DrawLine_8
//  602       }       
//  603     }
//  604     LPLD_LCD_SetPoint(x0,y0,color);
??LPLD_LCD_DrawLine_10:
        MOVS     R2,R4
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOV      R1,R9
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R5
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       LPLD_LCD_SetPoint
        B.N      ??LPLD_LCD_DrawLine_11
//  605     }  
//  606     else
//  607     {
//  608       temp = 2 * dx - dy;                      /* 靠近Y轴 */       
??LPLD_LCD_DrawLine_7:
        SXTH     R7,R7            ;; SignExt  R7,R7,#+16,#+16
        SXTH     R8,R8            ;; SignExt  R8,R8,#+16,#+16
        RSBS     R10,R8,R7, LSL #+1
        B.N      ??LPLD_LCD_DrawLine_12
//  609       while( y0 != y1 )
//  610       {
//  611         LPLD_LCD_SetPoint(x0,y0,color);     
//  612         y0++;                 
//  613         if( temp > 0 )           
//  614         {
//  615           x0++;               
??LPLD_LCD_DrawLine_13:
        ADDS     R5,R5,#+1
//  616           temp+=2*dy-2*dx; 
        SXTH     R8,R8            ;; SignExt  R8,R8,#+16,#+16
        LSLS     R0,R8,#+1
        SXTAH    R0,R0,R10
        SXTH     R7,R7            ;; SignExt  R7,R7,#+16,#+16
        SUBS     R10,R0,R7, LSL #+1
//  617         }
??LPLD_LCD_DrawLine_12:
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        UXTH     R11,R11          ;; ZeroExt  R11,R11,#+16,#+16
        CMP      R9,R11
        BEQ.N    ??LPLD_LCD_DrawLine_14
        MOVS     R2,R4
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOV      R1,R9
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R5
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       LPLD_LCD_SetPoint
        ADDS     R9,R9,#+1
        SXTH     R10,R10          ;; SignExt  R10,R10,#+16,#+16
        CMP      R10,#+1
        BGE.N    ??LPLD_LCD_DrawLine_13
//  618         else
//  619         {
//  620           temp += 2 * dy;
        SXTH     R8,R8            ;; SignExt  R8,R8,#+16,#+16
        LSLS     R0,R8,#+1
        SXTAH    R10,R0,R10
        B.N      ??LPLD_LCD_DrawLine_12
//  621         }
//  622      } 
//  623   LPLD_LCD_SetPoint(x0,y0,color);
??LPLD_LCD_DrawLine_14:
        MOVS     R2,R4
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOV      R1,R9
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R5
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       LPLD_LCD_SetPoint
//  624   }
//  625 } 
??LPLD_LCD_DrawLine_11:
??LPLD_LCD_DrawLine_4:
        POP      {R0,R4-R11,PC}   ;; return
//  626 
//  627 
//  628 /*
//  629  * LPLD_LCD_DrawSquare
//  630  * 在指定坐标显示正方形
//  631  * 
//  632  * 参数： 
//  633  *    x0--正方形的起始横坐标 
//  634  *    y0--正方形的起始纵坐标
//  635  *    side_length--正方形的边长
//  636  *    Line_color--正方形边的颜色
//  637  *    Fill_color--正方形整体填充的颜色
//  638  *
//  639  * 输出:
//  640  *    无
//  641  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  642 void LPLD_LCD_DrawSquare(uint16 x0,uint16 y0,uint16 side_length,uint16 Line_color,uint16 Fill_color)
//  643 {
LPLD_LCD_DrawSquare:
        PUSH     {R3-R9,LR}
        MOVS     R5,R0
        MOVS     R6,R1
        MOVS     R7,R2
        MOVS     R4,R3
//  644   uint16 i,j;
//  645   if(side_length > MAX_X || side_length > MAX_Y)
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R7,#+320
        BGT.N    ??LPLD_LCD_DrawSquare_0
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R7,#+241
        BLT.N    ??LPLD_LCD_DrawSquare_1
//  646     return;
??LPLD_LCD_DrawSquare_0:
        B.N      ??LPLD_LCD_DrawSquare_2
//  647   
//  648   if(x0+side_length > MAX_X)
??LPLD_LCD_DrawSquare_1:
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        UXTAH    R0,R7,R5
        CMP      R0,#+320
        BGT.N    ??LPLD_LCD_DrawSquare_2
//  649     return;
//  650   else
//  651     LPLD_LCD_DrawLine(x0,y0,x0+side_length,y0,Line_color);
??LPLD_LCD_DrawSquare_3:
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        STR      R4,[SP, #+0]
        MOVS     R3,R6
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        ADDS     R2,R7,R5
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOVS     R1,R6
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R5
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       LPLD_LCD_DrawLine
//  652   
//  653   if(y0+side_length > MAX_Y)
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        UXTAH    R0,R7,R6
        CMP      R0,#+241
        BGE.N    ??LPLD_LCD_DrawSquare_2
//  654     return;
//  655   else
//  656     LPLD_LCD_DrawLine(x0,y0,x0,y0+side_length,Line_color);
??LPLD_LCD_DrawSquare_4:
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        STR      R4,[SP, #+0]
        ADDS     R3,R7,R6
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        MOVS     R2,R5
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOVS     R1,R6
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R5
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       LPLD_LCD_DrawLine
//  657   
//  658   LPLD_LCD_DrawLine(x0+side_length,y0,x0+side_length,y0+side_length,Line_color);
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        STR      R4,[SP, #+0]
        ADDS     R3,R7,R6
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        ADDS     R2,R7,R5
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOVS     R1,R6
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ADDS     R0,R7,R5
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       LPLD_LCD_DrawLine
//  659   LPLD_LCD_DrawLine(x0,y0+side_length,x0+side_length,y0+side_length,Line_color);
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        STR      R4,[SP, #+0]
        ADDS     R3,R7,R6
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        ADDS     R2,R7,R5
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        ADDS     R1,R7,R6
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R5
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       LPLD_LCD_DrawLine
//  660   
//  661   for(i=0;i<side_length-1;i++)
        MOVS     R8,#+0
        LDR      R4,[SP, #+32]
        B.N      ??LPLD_LCD_DrawSquare_5
//  662   {
//  663     for(j=0;j<side_length-1;j++)
//  664     {
//  665       LPLD_LCD_SetPoint(x0+1+i,y0+1+j,Fill_color);
??LPLD_LCD_DrawSquare_6:
        MOVS     R2,R4
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        ADDS     R0,R9,R6
        ADDS     R1,R0,#+1
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ADDS     R0,R8,R5
        ADDS     R0,R0,#+1
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       LPLD_LCD_SetPoint
//  666     }
        ADDS     R9,R9,#+1
??LPLD_LCD_DrawSquare_7:
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        SUBS     R0,R7,#+1
        CMP      R9,R0
        BLT.N    ??LPLD_LCD_DrawSquare_6
        ADDS     R8,R8,#+1
??LPLD_LCD_DrawSquare_5:
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        SUBS     R0,R7,#+1
        CMP      R8,R0
        BGE.N    ??LPLD_LCD_DrawSquare_8
        MOVS     R9,#+0
        B.N      ??LPLD_LCD_DrawSquare_7
//  667   }
//  668 }
??LPLD_LCD_DrawSquare_8:
??LPLD_LCD_DrawSquare_2:
        POP      {R0,R4-R9,PC}    ;; return
//  669 
//  670 /*
//  671  * LPLD_LCD_DrawRectangle
//  672  * 在指定坐标显示矩形
//  673  * 
//  674  * 参数： 
//  675  *    x0--长方形的起始横坐标 
//  676  *    y0--长方形的起始纵坐标
//  677  *    side_xlength--长
//  678  *    side_ylength--宽
//  679  *    Line_color--长方形边的颜色
//  680  *    Fill_color--长方形整体填充的颜色
//  681  *
//  682  * 输出:
//  683  *    无
//  684  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  685 void LPLD_LCD_DrawRectangle(uint16 x0,uint16 y0,uint16 side_xlength,uint16 side_ylength,uint16 Line_color,uint16 Fill_color)
//  686 {
LPLD_LCD_DrawRectangle:
        PUSH     {R4-R10,LR}
        SUB      SP,SP,#+8
        MOVS     R5,R0
        MOVS     R6,R1
        MOVS     R7,R2
        MOV      R8,R3
//  687   uint16 i,j;
//  688   if(side_xlength > MAX_X || side_ylength > MAX_Y)
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R7,#+320
        BGT.N    ??LPLD_LCD_DrawRectangle_0
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        CMP      R8,#+241
        BLT.N    ??LPLD_LCD_DrawRectangle_1
//  689     return;
??LPLD_LCD_DrawRectangle_0:
        B.N      ??LPLD_LCD_DrawRectangle_2
//  690   
//  691   if(x0+side_xlength > MAX_X)
??LPLD_LCD_DrawRectangle_1:
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        UXTAH    R0,R7,R5
        CMP      R0,#+320
        BGT.N    ??LPLD_LCD_DrawRectangle_2
//  692     return;
??LPLD_LCD_DrawRectangle_3:
        LDR      R4,[SP, #+40]
//  693   else
//  694     LPLD_LCD_DrawLine(x0,y0,x0+side_xlength,y0,Line_color);
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        STR      R4,[SP, #+0]
        MOVS     R3,R6
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        ADDS     R2,R7,R5
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOVS     R1,R6
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R5
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       LPLD_LCD_DrawLine
//  695   
//  696   if(y0+side_ylength > MAX_Y)
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        UXTAH    R0,R8,R6
        CMP      R0,#+241
        BGE.N    ??LPLD_LCD_DrawRectangle_2
//  697     return;
//  698   else
//  699     LPLD_LCD_DrawLine(x0,y0,x0,y0+side_ylength,Line_color);
??LPLD_LCD_DrawRectangle_4:
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        STR      R4,[SP, #+0]
        ADDS     R3,R8,R6
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        MOVS     R2,R5
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOVS     R1,R6
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R5
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       LPLD_LCD_DrawLine
//  700   
//  701   LPLD_LCD_DrawLine(x0+side_xlength,y0,x0+side_xlength,y0+side_ylength,Line_color);
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        STR      R4,[SP, #+0]
        ADDS     R3,R8,R6
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        ADDS     R2,R7,R5
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOVS     R1,R6
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ADDS     R0,R7,R5
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       LPLD_LCD_DrawLine
//  702   LPLD_LCD_DrawLine(x0,y0+side_ylength,x0+side_xlength,y0+side_ylength,Line_color);
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        STR      R4,[SP, #+0]
        ADDS     R3,R8,R6
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        ADDS     R2,R7,R5
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        ADDS     R1,R8,R6
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R5
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       LPLD_LCD_DrawLine
//  703   
//  704   for(i=0;i<side_xlength-1;i++)
        MOVS     R9,#+0
        LDR      R4,[SP, #+44]
        B.N      ??LPLD_LCD_DrawRectangle_5
//  705   {
//  706     for(j=0;j<side_ylength-1;j++)
//  707     {
//  708       LPLD_LCD_SetPoint(x0+1+i,y0+1+j,Fill_color);
??LPLD_LCD_DrawRectangle_6:
        MOVS     R2,R4
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        ADDS     R0,R10,R6
        ADDS     R1,R0,#+1
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ADDS     R0,R9,R5
        ADDS     R0,R0,#+1
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       LPLD_LCD_SetPoint
//  709     }
        ADDS     R10,R10,#+1
??LPLD_LCD_DrawRectangle_7:
        UXTH     R10,R10          ;; ZeroExt  R10,R10,#+16,#+16
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        SUBS     R0,R8,#+1
        CMP      R10,R0
        BLT.N    ??LPLD_LCD_DrawRectangle_6
        ADDS     R9,R9,#+1
??LPLD_LCD_DrawRectangle_5:
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        SUBS     R0,R7,#+1
        CMP      R9,R0
        BGE.N    ??LPLD_LCD_DrawRectangle_8
        MOVS     R10,#+0
        B.N      ??LPLD_LCD_DrawRectangle_7
//  710   }
//  711 }
??LPLD_LCD_DrawRectangle_8:
??LPLD_LCD_DrawRectangle_2:
        POP      {R0,R1,R4-R10,PC}  ;; return
//  712 
//  713 /*
//  714  * LPLD_LCD_GRAMFillRec
//  715  * 填充指定颜色的矩形到LCD_GRAM
//  716  * 
//  717  * 参数： 
//  718  *    x0--X轴起始坐标
//  719  *    y0--Y轴起始坐标
//  720  *    x1--X轴结束坐标
//  721  *    y1--Y轴结束坐标
//  722  *    Color--16位RGB颜色值
//  723  *
//  724  * 输出:
//  725  *    无
//  726  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  727 void LPLD_LCD_GRAMFillRec(uint16 x0,uint16 y0,uint16 x1,uint16 y1,uint16 Color)
//  728 {          
LPLD_LCD_GRAMFillRec:
        PUSH     {R4-R7}
//  729   uint16 i,j;   
//  730   for(i=y0;i<=y1;i++)
        LDR      R4,[SP, #+16]
        B.N      ??LPLD_LCD_GRAMFillRec_0
//  731   {
//  732     for(j=x0; j<x1; j++)
//  733     {
//  734       LCD_GRAM[MAX_X*MAX_Y - (j-1)*MAX_Y - (i)] = Color;
??LPLD_LCD_GRAMFillRec_1:
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        SUBS     R6,R5,#+1
        MOVS     R7,#+240
        MULS     R6,R7,R6
        RSBS     R6,R6,#+76800
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        SUBS     R6,R6,R1
        LDR.W    R7,??DataTable22_5
        LDR      R7,[R7, #+0]
        STRH     R4,[R7, R6, LSL #+1]
//  735     }    
        ADDS     R5,R5,#+1
??LPLD_LCD_GRAMFillRec_2:
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        CMP      R5,R2
        BCC.N    ??LPLD_LCD_GRAMFillRec_1
        ADDS     R1,R1,#+1
??LPLD_LCD_GRAMFillRec_0:
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R3,R1
        BCC.N    ??LPLD_LCD_GRAMFillRec_3
        MOVS     R5,R0
        B.N      ??LPLD_LCD_GRAMFillRec_2
//  736   }
//  737 } 
??LPLD_LCD_GRAMFillRec_3:
        POP      {R4-R7}
        BX       LR               ;; return
//  738 
//  739 /*
//  740  * LPLD_LCD_GRAMDrawHLine
//  741  * 填充指定颜色的横线到LCD_GRAM
//  742  * 
//  743  * 参数： 
//  744  *    x0--X轴起始坐标
//  745  *    y0--Y轴起始坐标
//  746  *    len--横线长度
//  747  *    Color--16位RGB颜色值
//  748  *
//  749  * 输出:
//  750  *    无
//  751  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  752 void LPLD_LCD_GRAMDrawHLine(uint16 x0,uint16 y0,uint16 len,uint16 Color)
//  753 {
LPLD_LCD_GRAMDrawHLine:
        PUSH     {R4-R6}
//  754   uint16 i;
//  755   for(i=0; i<len; i++)
        MOVS     R4,#+0
        B.N      ??LPLD_LCD_GRAMDrawHLine_0
//  756   {
//  757     LCD_GRAM[MAX_X*MAX_Y - (x0+i-1)*MAX_Y - (y0)] = Color;
??LPLD_LCD_GRAMDrawHLine_1:
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        UXTAH    R5,R4,R0
        SUBS     R5,R5,#+1
        MOVS     R6,#+240
        MULS     R5,R6,R5
        RSBS     R5,R5,#+76800
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        SUBS     R5,R5,R1
        LDR.W    R6,??DataTable22_5
        LDR      R6,[R6, #+0]
        STRH     R3,[R6, R5, LSL #+1]
//  758   }
        ADDS     R4,R4,#+1
??LPLD_LCD_GRAMDrawHLine_0:
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        CMP      R4,R2
        BCC.N    ??LPLD_LCD_GRAMDrawHLine_1
//  759 }
        POP      {R4-R6}
        BX       LR               ;; return
//  760 
//  761 /*
//  762  * LPLD_LCD_GRAMDrawHLine
//  763  * 显示一幅指定大小的U8灰度图像
//  764  * 
//  765  * 参数： 
//  766  *    *Color--8位灰度图像数组
//  767  *    w--图像宽
//  768  *    h--图像高
//  769  *
//  770  * 输出:
//  771  *    无
//  772  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  773 void LPLD_LCD_DrawU8Gray(uint8 *Color, uint16 w, uint16 h)
//  774 {
LPLD_LCD_DrawU8Gray:
        PUSH     {R4-R8,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//  775   uint16 i=0, j=0;
        MOVS     R7,#+0
        MOVS     R8,#+0
//  776  
//  777   for(i=0; i<w; i++)
        MOVS     R0,#+0
        MOVS     R7,R0
        B.N      ??LPLD_LCD_DrawU8Gray_0
//  778   {  
//  779     LPLD_LCD_SetCursor(w-i-1, 0); 
//  780     LPLD_LCD_WriteIndex(LPLD_LCD_INFO.Write_GRAM);
//  781     for(j=0; j<h; j++)
//  782     {
//  783       LPLD_LCD_WriteData(LPLD_LCD_U8GRAY2RGB(Color[j*w+i]));
??LPLD_LCD_DrawU8Gray_1:
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        MLA      R0,R5,R8,R7
        LDRB     R0,[R0, R4]
        BL       LPLD_LCD_U8GRAY2RGB
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       LPLD_LCD_WriteData
//  784     }   
        ADDS     R8,R8,#+1
??LPLD_LCD_DrawU8Gray_2:
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        CMP      R8,R6
        BCC.N    ??LPLD_LCD_DrawU8Gray_1
        ADDS     R7,R7,#+1
??LPLD_LCD_DrawU8Gray_0:
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R7,R5
        BCS.N    ??LPLD_LCD_DrawU8Gray_3
        MOVS     R1,#+0
        SUBS     R0,R5,R7
        SUBS     R0,R0,#+1
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       LPLD_LCD_SetCursor
        LDR.W    R0,??DataTable22_3
        LDRH     R0,[R0, #+2]
        BL       LPLD_LCD_WriteIndex
        MOVS     R8,#+0
        B.N      ??LPLD_LCD_DrawU8Gray_2
//  785   }
//  786 }
??LPLD_LCD_DrawU8Gray_3:
        POP      {R4-R8,PC}       ;; return
//  787 
//  788 /*
//  789  * LPLD_LCD_ShowChar
//  790  * 在指定坐标显示字符
//  791  * 
//  792  * 参数： 
//  793  *    Xpos--X轴坐标
//  794  *    Ypos--Y轴坐标
//  795  *    ASCI--ASCI码
//  796  *    charColor--字符字体颜色
//  797  *    bkColor--字符背景颜色
//  798  *
//  799  * 输出:
//  800  *    无
//  801  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  802 void LPLD_LCD_ShowChar( uint16 Xpos, uint16 Ypos, uint8 ASCI, uint16 charColor, uint16 bkColor )
//  803 {
LPLD_LCD_ShowChar:
        PUSH     {R2,R4-R11,LR}
        SUB      SP,SP,#+8
        MOVS     R5,R0
        MOVS     R6,R1
        MOVS     R7,R3
//  804   uint16 i, j,te1,te2;
//  805   uint8 tmp_char;
//  806   for( i=0; i<16; i++ )
        MOVS     R8,#+0
        LDR      R4,[SP, #+48]
        B.N      ??LPLD_LCD_ShowChar_0
??LPLD_LCD_ShowChar_1:
        ADDS     R8,R8,#+1
??LPLD_LCD_ShowChar_0:
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        CMP      R8,#+16
        BGE.N    ??LPLD_LCD_ShowChar_2
//  807   {
//  808     tmp_char = asc2_1608[ASCI-32][i];
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        LDRB     R0,[SP, #+8]
        LDR.N    R1,??DataTable22_6
        ADDS     R0,R1,R0, LSL #+4
        ADDS     R0,R8,R0
        SUBS     R0,R0,#+512
        LDRB     R9,[R0, #+0]
//  809     for( j=0; j<8; j++ )
        MOVS     R10,#+0
        B.N      ??LPLD_LCD_ShowChar_3
//  810     {
//  811       if( (tmp_char >> j) & 0x01 == 0x01 )
//  812       {
//  813         LPLD_LCD_SetPoint( Xpos + j, Ypos + i, charColor );  /* 字符颜色 */
//  814       }
//  815       else
//  816       {
//  817         te1=Xpos + j;
??LPLD_LCD_ShowChar_4:
        ADDS     R0,R10,R5
        STRH     R0,[SP, #+0]
//  818         te2 = Ypos + i;
        ADDS     R11,R8,R6
//  819          LPLD_LCD_SetPoint( Xpos + j, Ypos + i, bkColor );  /* 背景颜色 */
        MOVS     R2,R4
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        ADDS     R1,R8,R6
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ADDS     R0,R10,R5
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       LPLD_LCD_SetPoint
//  820       }
??LPLD_LCD_ShowChar_5:
        ADDS     R10,R10,#+1
??LPLD_LCD_ShowChar_3:
        UXTH     R10,R10          ;; ZeroExt  R10,R10,#+16,#+16
        CMP      R10,#+8
        BGE.N    ??LPLD_LCD_ShowChar_1
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        ASRS     R0,R9,R10
        LSLS     R0,R0,#+31
        BPL.N    ??LPLD_LCD_ShowChar_4
        MOVS     R2,R7
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        ADDS     R1,R8,R6
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ADDS     R0,R10,R5
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       LPLD_LCD_SetPoint
        B.N      ??LPLD_LCD_ShowChar_5
//  821     }
//  822   }
//  823 }
??LPLD_LCD_ShowChar_2:
        POP      {R0-R2,R4-R11,PC}  ;; return
//  824 
//  825 //不开窗写函数

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  826 void LPLD_LCD_ShowCharno( uint16 Xpos, uint16 Ypos, uint8 ASCI, uint16 charColor )
//  827 {
LPLD_LCD_ShowCharno:
        PUSH     {R2,R4-R11,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R3
//  828   uint16 i, j,coloer,te1,te2;
//  829   uint8 tmp_char;
//  830   for( i=0; i<16; i++ )
        MOVS     R7,#+0
        B.N      ??LPLD_LCD_ShowCharno_0
??LPLD_LCD_ShowCharno_1:
        ADDS     R7,R7,#+1
??LPLD_LCD_ShowCharno_0:
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R7,#+16
        BGE.N    ??LPLD_LCD_ShowCharno_2
//  831   {
//  832     tmp_char = asc2_1608[ASCI-32][i];
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        LDRB     R0,[SP, #+0]
        LDR.N    R1,??DataTable22_6
        ADDS     R0,R1,R0, LSL #+4
        ADDS     R0,R7,R0
        SUBS     R0,R0,#+512
        LDRB     R8,[R0, #+0]
//  833     for( j=0; j<8; j++ )
        MOVS     R9,#+0
        B.N      ??LPLD_LCD_ShowCharno_3
//  834     {
//  835       if( (tmp_char >> j) & 0x01 == 0x01 )
//  836       {
//  837         LPLD_LCD_SetPoint( Xpos + j, Ypos + i, charColor );  /* 字符颜色 */
//  838       }
//  839       else
//  840       {
//  841         te1=Xpos + j;
??LPLD_LCD_ShowCharno_4:
        ADDS     R10,R9,R4
//  842         te2 = Ypos + i;
        ADDS     R11,R7,R5
//  843         coloer=gImage_suqian[((Xpos + j)+(Ypos + i)*320)*2];
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        UXTAH    R0,R9,R4
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        UXTAH    R1,R7,R5
        MOV      R2,#+320
        MLA      R0,R2,R1,R0
        LDR.N    R1,??DataTable22_7
        LDRB     R2,[R1, R0, LSL #+1]
//  844         coloer<<=8;
        LSLS     R2,R2,#+8
//  845         coloer=coloer&0xff00;
        ANDS     R2,R2,#0xFF00
//  846         coloer |= gImage_suqian[((Xpos + j)+(Ypos + i)*320)*2+1];        
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        UXTAH    R0,R9,R4
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        UXTAH    R1,R7,R5
        MOV      R3,#+320
        MLA      R0,R3,R1,R0
        LDR.N    R1,??DataTable22_7
        ADDS     R0,R1,R0, LSL #+1
        LDRB     R0,[R0, #+1]
        ORRS     R2,R0,R2
//  847         LPLD_LCD_SetPoint( Xpos + j, Ypos + i, coloer );
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        ADDS     R1,R7,R5
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ADDS     R0,R9,R4
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       LPLD_LCD_SetPoint
//  848       }
??LPLD_LCD_ShowCharno_5:
        ADDS     R9,R9,#+1
??LPLD_LCD_ShowCharno_3:
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        CMP      R9,#+8
        BGE.N    ??LPLD_LCD_ShowCharno_1
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        ASRS     R0,R8,R9
        LSLS     R0,R0,#+31
        BPL.N    ??LPLD_LCD_ShowCharno_4
        MOVS     R2,R6
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        ADDS     R1,R7,R5
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ADDS     R0,R9,R4
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       LPLD_LCD_SetPoint
        B.N      ??LPLD_LCD_ShowCharno_5
//  849     }
//  850   }
//  851 }
??LPLD_LCD_ShowCharno_2:
        POP      {R0,R4-R11,PC}   ;; return
//  852 
//  853 
//  854 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  855 uint32 mypow(uint8 m,uint8 n)
//  856 {
//  857 	uint32 result=1;	 
mypow:
        MOVS     R2,#+1
        B.N      ??mypow_0
//  858 	while(n--)result*=m;    
??mypow_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MULS     R2,R0,R2
??mypow_0:
        MOVS     R3,R1
        SUBS     R1,R3,#+1
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        CMP      R3,#+0
        BNE.N    ??mypow_1
//  859 	return result;
        MOVS     R0,R2
        BX       LR               ;; return
//  860 }
//  861 
//  862 /*
//  863  * LPLD_LCD_ShowNum
//  864  * 在指定坐标显示数字
//  865  * 
//  866  * 参数： 
//  867  *    Xpos--X轴坐标
//  868  *    Ypos--Y轴坐标
//  869  *    num--数字
//  870  *    len--数字长度
//  871  *    charColor--字符字体颜色
//  872  *    bkColor--字符背景颜色
//  873  *
//  874  * 输出:
//  875  *    无
//  876  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  877 void LPLD_LCD_ShowNum(uint16 Xpos, uint16 Ypos, uint16 num, uint8 len, uint16 charColor, uint16 bkColor )
//  878 {         	
LPLD_LCD_ShowNum:
        PUSH     {R4-R10,LR}
        SUB      SP,SP,#+8
        MOVS     R6,R0
        MOVS     R7,R1
        MOV      R8,R2
        MOV      R9,R3
//  879   uint8 t,temp;						   
//  880   for(t=0;t<len;t++)
        MOVS     R10,#+0
        LDR      R4,[SP, #+40]
        LDR      R5,[SP, #+44]
        B.N      ??LPLD_LCD_ShowNum_0
//  881   {
//  882     temp=(num/mypow(10,len-t-1))%10;
??LPLD_LCD_ShowNum_1:
        SUBS     R0,R9,R10
        SUBS     R1,R0,#+1
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+10
        BL       mypow
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        UDIV     R0,R8,R0
        MOVS     R1,#+10
        UDIV     R2,R0,R1
        MLS      R0,R1,R2,R0
//  883     LPLD_LCD_ShowChar(Xpos+(8)*t,Ypos,temp+'0',charColor,bkColor); 
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        STR      R5,[SP, #+0]
        MOVS     R3,R4
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        ADDS     R2,R0,#+48
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,R7
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        LSLS     R0,R10,#+3
        UXTAH    R0,R0,R6
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       LPLD_LCD_ShowChar
//  884     CurX = CurX + 8;  
        LDR.N    R0,??DataTable22_8
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+8
        LDR.N    R1,??DataTable22_8
        STRH     R0,[R1, #+0]
//  885   }
        ADDS     R10,R10,#+1
??LPLD_LCD_ShowNum_0:
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        CMP      R10,R9
        BCC.N    ??LPLD_LCD_ShowNum_1
//  886 } 
        POP      {R0,R1,R4-R10,PC}  ;; return
//  887 
//  888 /*
//  889  * LPLD_LCD_ShowString
//  890  * 在指定坐标显示字符串
//  891  * 
//  892  * 参数： 
//  893  *    Xpos--X轴坐标
//  894  *    Ypos--Y轴坐标
//  895  *    *str--字符串
//  896  *    strColor--字符串字体颜色
//  897  *    bkColor--字符背景颜色
//  898  *
//  899  * 输出:
//  900  *    无
//  901  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  902 void LPLD_LCD_ShowString(uint16 Xpos, uint16 Ypos, uint8 *str,uint16 strColor, uint16 bkColor)
//  903 {
LPLD_LCD_ShowString:
        PUSH     {R4-R8,LR}
        SUB      SP,SP,#+8
        MOVS     R7,R0
        MOV      R8,R1
        MOVS     R6,R2
        MOVS     R5,R3
        LDR      R4,[SP, #+32]
//  904   uint8 TempChar;
//  905   do
//  906   {
//  907     TempChar = *str++;  
??LPLD_LCD_ShowString_0:
        LDRB     R2,[R6, #+0]
        ADDS     R6,R6,#+1
//  908     LPLD_LCD_ShowChar( Xpos, Ypos, TempChar, strColor, bkColor );    
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        STR      R4,[SP, #+0]
        MOVS     R3,R5
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOV      R1,R8
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R7
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       LPLD_LCD_ShowChar
//  909     if( Xpos <= MAX_X - 8 )
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R7,#+312
        BGT.N    ??LPLD_LCD_ShowString_1
//  910     {
//  911       Xpos += 8;
        ADDS     R7,R7,#+8
        B.N      ??LPLD_LCD_ShowString_2
//  912     } 
//  913     else if ( Ypos <= MAX_Y - 16 )
??LPLD_LCD_ShowString_1:
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        CMP      R8,#+225
        BGE.N    ??LPLD_LCD_ShowString_3
//  914     {
//  915       Xpos = 0;
        MOVS     R7,#+0
//  916       Ypos += 16;
        ADDS     R8,R8,#+16
        B.N      ??LPLD_LCD_ShowString_2
//  917     }   
//  918     else
//  919     {
//  920       Xpos = 0;
??LPLD_LCD_ShowString_3:
        MOVS     R7,#+0
//  921       Ypos = 0;
        MOVS     R8,#+0
//  922     } 
//  923     CurX = CurX + 8;  
??LPLD_LCD_ShowString_2:
        LDR.N    R0,??DataTable22_8
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+8
        LDR.N    R1,??DataTable22_8
        STRH     R0,[R1, #+0]
//  924   }
//  925   while ( *str != 0 );
        LDRB     R0,[R6, #+0]
        CMP      R0,#+0
        BNE.N    ??LPLD_LCD_ShowString_0
//  926 }
        POP      {R0,R1,R4-R8,PC}  ;; return
//  927 
//  928 //不开窗

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  929 void LPLD_LCD_ShowStringno(uint16 Xpos, uint16 Ypos, uint8 *str,uint16 strColor )
//  930 {
LPLD_LCD_ShowStringno:
        PUSH     {R3-R7,LR}
        MOVS     R6,R0
        MOVS     R7,R1
        MOVS     R5,R2
        MOVS     R4,R3
//  931   uint8 TempChar;
//  932   do
//  933   {
//  934     TempChar = *str++;  
??LPLD_LCD_ShowStringno_0:
        LDRB     R2,[R5, #+0]
        ADDS     R5,R5,#+1
//  935     LPLD_LCD_ShowCharno( Xpos, Ypos, TempChar, strColor );    
        MOVS     R3,R4
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,R7
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R6
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       LPLD_LCD_ShowCharno
//  936     if( Xpos <= MAX_X - 8 )
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        CMP      R6,#+312
        BGT.N    ??LPLD_LCD_ShowStringno_1
//  937     {
//  938       Xpos += 8;
        ADDS     R6,R6,#+8
        B.N      ??LPLD_LCD_ShowStringno_2
//  939     } 
//  940     else if ( Ypos <= MAX_Y - 16 )
??LPLD_LCD_ShowStringno_1:
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R7,#+225
        BGE.N    ??LPLD_LCD_ShowStringno_3
//  941     {
//  942       Xpos = 0;
        MOVS     R6,#+0
//  943       Ypos += 16;
        ADDS     R7,R7,#+16
        B.N      ??LPLD_LCD_ShowStringno_2
//  944     }   
//  945     else
//  946     {
//  947       Xpos = 0;
??LPLD_LCD_ShowStringno_3:
        MOVS     R6,#+0
//  948       Ypos = 0;
        MOVS     R7,#+0
//  949     } 
//  950     CurX = CurX + 8;  
??LPLD_LCD_ShowStringno_2:
        LDR.N    R0,??DataTable22_8
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+8
        LDR.N    R1,??DataTable22_8
        STRH     R0,[R1, #+0]
//  951   }
//  952   while ( *str != 0 );
        LDRB     R0,[R5, #+0]
        CMP      R0,#+0
        BNE.N    ??LPLD_LCD_ShowStringno_0
//  953 }
        POP      {R0,R4-R7,PC}    ;; return
//  954 
//  955 
//  956 
//  957 
//  958 
//  959 
//  960 /*
//  961  * LPLD_LCD_PrintStringLine
//  962  * 另起一行显示字符串
//  963  * 
//  964  * 参数： 
//  965  *    *str--字符串
//  966  *    strColor--字符串字体颜色
//  967  *    bkColor--字符背景颜色
//  968  *
//  969  * 输出:
//  970  *    无
//  971  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  972 void LPLD_LCD_PrintStringLine(uint8 *str,uint16 strColor, uint16 bkColor)
//  973 {
LPLD_LCD_PrintStringLine:
        PUSH     {R4,LR}
        SUB      SP,SP,#+8
//  974   CurX = 0;
        MOVS     R3,#+0
        LDR.N    R4,??DataTable22_8
        STRH     R3,[R4, #+0]
//  975   LPLD_LCD_ShowString(0, CurY*18, str, strColor, bkColor);
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        STR      R2,[SP, #+0]
        MOVS     R3,R1
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        MOVS     R2,R0
        LDR.N    R0,??DataTable22_9
        LDRH     R0,[R0, #+0]
        MOVS     R1,#+18
        SMULBB   R1,R0,R1
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,#+0
        BL       LPLD_LCD_ShowString
//  976   CurY++;
        LDR.N    R0,??DataTable22_9
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable22_9
        STRH     R0,[R1, #+0]
//  977   if((CurY+1)*18>MAX_Y)
        LDR.N    R0,??DataTable22_9
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        MOVS     R1,#+18
        MULS     R0,R1,R0
        CMP      R0,#+241
        BLT.N    ??LPLD_LCD_PrintStringLine_0
//  978   {
//  979     CurY=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable22_9
        STRH     R0,[R1, #+0]
//  980   }
//  981 }
??LPLD_LCD_PrintStringLine_0:
        POP      {R0,R1,R4,PC}    ;; return
//  982 
//  983 /*
//  984  * LPLD_LCD_PrintString
//  985  * 接着当前行显示字符串
//  986  * 
//  987  * 参数： 
//  988  *    *str--字符串
//  989  *    strColor--字符串字体颜色
//  990  *    bkColor--字符背景颜色
//  991  *
//  992  * 输出:
//  993  *    无
//  994  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  995 void LPLD_LCD_PrintString(uint8 *str,uint16 Color, uint16 bkColor)
//  996 {
LPLD_LCD_PrintString:
        PUSH     {R7,LR}
//  997   LPLD_LCD_ShowString(CurX, (CurY-1)*18, str, Color, bkColor);
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        STR      R2,[SP, #+0]
        MOVS     R3,R1
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        MOVS     R2,R0
        LDR.N    R0,??DataTable22_9
        LDRH     R0,[R0, #+0]
        SUBS     R0,R0,#+1
        MOVS     R1,#+18
        SMULBB   R1,R0,R1
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LDR.N    R0,??DataTable22_8
        LDRH     R0,[R0, #+0]
        BL       LPLD_LCD_ShowString
//  998 }
        POP      {R0,PC}          ;; return
//  999 
// 1000 /*
// 1001  * LPLD_LCD_PrintNumLine
// 1002  * 另起一行显示数字
// 1003  * 
// 1004  * 参数： 
// 1005  *    num--数字
// 1006  *    len--数字长度
// 1007  *    numColor--字符字体颜色
// 1008  *    bkColor--字符背景颜色
// 1009  *
// 1010  * 输出:
// 1011  *    无
// 1012  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1013 void LPLD_LCD_PrintNumLine(uint16 num,uint8 len,uint16 numColor, uint16 bkColor)
// 1014 {
LPLD_LCD_PrintNumLine:
        PUSH     {R4,R5,LR}
        SUB      SP,SP,#+12
// 1015   CurX = 0;
        MOVS     R4,#+0
        LDR.N    R5,??DataTable22_8
        STRH     R4,[R5, #+0]
// 1016   LPLD_LCD_ShowNum(0, CurY*18, num, len, numColor, bkColor);
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        STR      R3,[SP, #+4]
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        STR      R2,[SP, #+0]
        MOVS     R3,R1
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        MOVS     R2,R0
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        LDR.N    R0,??DataTable22_9
        LDRH     R0,[R0, #+0]
        MOVS     R1,#+18
        SMULBB   R1,R0,R1
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,#+0
        BL       LPLD_LCD_ShowNum
// 1017   CurY++;
        LDR.N    R0,??DataTable22_9
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable22_9
        STRH     R0,[R1, #+0]
// 1018   if((CurY+1)*18>MAX_Y)
        LDR.N    R0,??DataTable22_9
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        MOVS     R1,#+18
        MULS     R0,R1,R0
        CMP      R0,#+241
        BLT.N    ??LPLD_LCD_PrintNumLine_0
// 1019   {
// 1020     CurY=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable22_9
        STRH     R0,[R1, #+0]
// 1021   }
// 1022 }
??LPLD_LCD_PrintNumLine_0:
        POP      {R0-R2,R4,R5,PC}  ;; return
// 1023 
// 1024 /*
// 1025  * LPLD_LCD_PrintNum
// 1026  * 接着当前行显示数字
// 1027  * 
// 1028  * 参数： 
// 1029  *    num--数字
// 1030  *    len--数字长度
// 1031  *    numColor--字符字体颜色
// 1032  *    bkColor--字符背景颜色
// 1033  *
// 1034  * 输出:
// 1035  *    无
// 1036  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1037 void LPLD_LCD_PrintNum(uint16 num,uint8 len,uint16 Color, uint16 bkColor)
// 1038 {
LPLD_LCD_PrintNum:
        PUSH     {LR}
        SUB      SP,SP,#+12
// 1039   LPLD_LCD_ShowNum(CurX, (CurY-1)*18, num,len, Color, bkColor);
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        STR      R3,[SP, #+4]
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        STR      R2,[SP, #+0]
        MOVS     R3,R1
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        MOVS     R2,R0
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        LDR.N    R0,??DataTable22_9
        LDRH     R0,[R0, #+0]
        SUBS     R0,R0,#+1
        MOVS     R1,#+18
        SMULBB   R1,R0,R1
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LDR.N    R0,??DataTable22_8
        LDRH     R0,[R0, #+0]
        BL       LPLD_LCD_ShowNum
// 1040 }
        POP      {R0-R2,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22:
        DC32     0x4004a02c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22_1:
        DC32     0x400ff080

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22_2:
        DC32     0x60040000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22_3:
        DC32     LPLD_LCD_INFO

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22_4:
        DC32     0x43fe1030

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22_5:
        DC32     LCD_GRAM

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22_6:
        DC32     asc2_1608

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22_7:
        DC32     gImage_suqian

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22_8:
        DC32     CurX

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22_9:
        DC32     CurY

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
// 1041 
// 1042 
// 
//    20 bytes in section .bss
// 1 520 bytes in section .rodata
// 3 596 bytes in section .text
// 
// 3 596 bytes of CODE  memory
// 1 520 bytes of CONST memory
//    20 bytes of DATA  memory
//
//Errors: none
//Warnings: 5
