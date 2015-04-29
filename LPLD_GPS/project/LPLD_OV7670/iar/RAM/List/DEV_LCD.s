///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.1.6676/W32 for ARM       26/Dec/2014  18:10:38
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  D:\LPLD_OSKinetis_V3www\lib\LPLD\DEV\DEV_LCD.c
//    Command line =  
//        D:\LPLD_OSKinetis_V3www\lib\LPLD\DEV\DEV_LCD.c -D LPLD_K60 -lCN
//        D:\LPLD_OSKinetis_V3www\project\LPLD_OV7670\iar\RAM\List\ -lB
//        D:\LPLD_OSKinetis_V3www\project\LPLD_OV7670\iar\RAM\List\ -o
//        D:\LPLD_OSKinetis_V3www\project\LPLD_OV7670\iar\RAM\Obj\ --no_cse
//        --no_unroll --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M4 -e --fpu=None
//        --dlib_config "D:\Program Files (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\INC\c\DLib_Config_Normal.h" -I
//        D:\LPLD_OSKinetis_V3www\project\LPLD_OV7670\iar\..\app\ -I
//        D:\LPLD_OSKinetis_V3www\project\LPLD_OV7670\iar\..\..\..\lib\CPU\ -I
//        D:\LPLD_OSKinetis_V3www\project\LPLD_OV7670\iar\..\..\..\lib\common\
//        -I D:\LPLD_OSKinetis_V3www\project\LPLD_OV7670\iar\..\..\..\lib\LPLD\
//        -I
//        D:\LPLD_OSKinetis_V3www\project\LPLD_OV7670\iar\..\..\..\lib\LPLD\HW\
//        -I
//        D:\LPLD_OSKinetis_V3www\project\LPLD_OV7670\iar\..\..\..\lib\LPLD\DEV\
//        -I
//        D:\LPLD_OSKinetis_V3www\project\LPLD_OV7670\iar\..\..\..\lib\uCOS-II\Ports\
//        -I
//        D:\LPLD_OSKinetis_V3www\project\LPLD_OV7670\iar\..\..\..\lib\uCOS-II\Source\
//        -I
//        D:\LPLD_OSKinetis_V3www\project\LPLD_OV7670\iar\..\..\..\lib\FatFs\
//        -I
//        D:\LPLD_OSKinetis_V3www\project\LPLD_OV7670\iar\..\..\..\lib\FatFs\option\
//        -I
//        D:\LPLD_OSKinetis_V3www\project\LPLD_OV7670\iar\..\..\..\lib\USB\common\
//        -I
//        D:\LPLD_OSKinetis_V3www\project\LPLD_OV7670\iar\..\..\..\lib\USB\driver\
//        -I
//        D:\LPLD_OSKinetis_V3www\project\LPLD_OV7670\iar\..\..\..\lib\USB\descriptor\
//        -I
//        D:\LPLD_OSKinetis_V3www\project\LPLD_OV7670\iar\..\..\..\lib\USB\class\
//        -Ol -I "D:\Program Files (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\CMSIS\Include\" -D ARM_MATH_CM4
//    List file    =  
//        D:\LPLD_OSKinetis_V3www\project\LPLD_OV7670\iar\RAM\List\DEV_LCD.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN LPLD_FlexBus_Init
        EXTERN LPLD_GPIO_Init
        EXTERN __aeabi_memcpy4

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
        PUBLIC LPLD_LCD_ShowNum
        PUBLIC LPLD_LCD_ShowString
        PUBLIC LPLD_LCD_U8GRAY2RGB
        PUBLIC PreX
        PUBLIC PreY
        PUBLIC asc2_1608
        PUBLIC mypow

// D:\LPLD_OSKinetis_V3www\lib\LPLD\DEV\DEV_LCD.c
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
//   26 
//   27 static void LPLD_LCD_Reset(void);
//   28 static void LPLD_LCD_FLEXBUS_Init(uint16 lcd_id);
//   29 static void LPLD_LCD_IO_Cfg(void);
//   30 static void LPLD_LCD_WriteIndex(uint16 index);
//   31 static void LPLD_LCD_WriteData(uint16 data);
//   32 static uint16 LPLD_LCD_ReadData(void);
//   33 static void LPLD_LCD_WriteReg(uint16 LCD_Reg,uint16 LCD_RegValue);
//   34 static uint16 LPLD_LCD_ReadReg(uint16 LCD_Reg);
//   35 static void LPLD_LCD_SetCursor( uint16 Xpos, uint16 Ypos );
//   36 static void LPLD_LCD_Delayms(uint16 ms);
//   37 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   38 LPLD_LCD_Info_t LPLD_LCD_INFO;
LPLD_LCD_INFO:
        DS8 8

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   39 uint16 PreX=0, PreY=0;
PreX:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
PreY:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   40 uint16 *LCD_GRAM;
LCD_GRAM:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   41 uint16 CurX=0, CurY=0;
CurX:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
CurY:
        DS8 2
//   42 
//   43 /*
//   44  * LPLD_LCD_Delayms
//   45  * LCD内部延时函数，内部调用
//   46  */

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//   47 static void LPLD_LCD_Delayms(uint16 n)
//   48 {
//   49   uint16 i;
//   50   while(n--)
LPLD_LCD_Delayms:
??LPLD_LCD_Delayms_0:
        MOVS     R1,R0
        SUBS     R0,R1,#+1
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R1,#+0
        BEQ.N    ??LPLD_LCD_Delayms_1
//   51   {
//   52     for(i=0; i<400; i++)
        MOVS     R1,#+0
??LPLD_LCD_Delayms_2:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R1,#+400
        BGE.N    ??LPLD_LCD_Delayms_0
//   53     {
//   54       asm("nop");
        nop
//   55     }
        ADDS     R1,R1,#+1
        B.N      ??LPLD_LCD_Delayms_2
//   56   }
//   57 }
??LPLD_LCD_Delayms_1:
        BX       LR               ;; return
//   58 
//   59 /*
//   60  * LPLD_LCD_FLEXBUS_Init
//   61  * LCD FlexBus初始化函数，内部调用
//   62  * 
//   63  * 说明:
//   64  *    本初始化函数用来配置FlexBus与LCD的连接
//   65  *    配置为16位端口大小
//   66  *    地址与数据线复用
//   67  *    数据及地址线为FB_AD[15:0]
//   68  *    RS:FB_AD[16]
//   69  *    CS:FB_CS0
//   70  *    RW:FB_FB_RW
//   71  *    RD:FB_OE 
//   72  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   73 static void LPLD_LCD_FLEXBUS_Init(uint16 lcd_id)
//   74 {
LPLD_LCD_FLEXBUS_Init:
        PUSH     {LR}
        SUB      SP,SP,#+28
//   75   FB_InitTypeDef fb_init;
//   76   fb_init.FB_Fbx = FB0;
        MOVS     R0,#+0
        STRB     R0,[SP, #+4]
//   77   fb_init.FB_ChipSelAddress = LCD_CMD_ADDRESS;
        MOVS     R0,#+1610612736
        STR      R0,[SP, #+8]
//   78   fb_init.FB_AutoAckEnable = TRUE;
        MOVS     R0,#+1
        STRB     R0,[SP, #+18]
//   79   fb_init.FB_IsRightJustied = TRUE;
        MOVS     R0,#+1
        STRB     R0,[SP, #+17]
//   80   fb_init.FB_WateStates = 0x02;
        MOVS     R0,#+2
        STRB     R0,[SP, #+19]
//   81   fb_init.FB_PortSize = FB_SIZE_16BIT;
        MOVS     R0,#+2
        STRB     R0,[SP, #+16]
//   82   fb_init.FB_AddressSpace = FB_SPACE_KB(128);   //128K
        MOVS     R0,#+131072
        STR      R0,[SP, #+12]
//   83   fb_init.FB_ReadAddrHold = 0;
        MOVS     R0,#+0
        STRB     R0,[SP, #+20]
//   84   fb_init.FB_WriteAddrHold = 0;
        MOVS     R0,#+0
        STRB     R0,[SP, #+21]
//   85   LPLD_FlexBus_Init(fb_init); 
        ADD      R1,SP,#+4
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_FlexBus_Init
//   86 }
        ADD      SP,SP,#+28
        POP      {PC}             ;; return
//   87 
//   88 /*
//   89  * LPLD_LCD_IO_Cfg
//   90  * LCD IO引脚初始化，内部调用
//   91  *
//   92  * 说明：
//   93  * 此处初始化复位引脚，可根据实际硬件更改
//   94  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   95 static void LPLD_LCD_IO_Cfg(void)
//   96 {
LPLD_LCD_IO_Cfg:
        PUSH     {LR}
        SUB      SP,SP,#+28
//   97   GPIO_InitTypeDef ptc_init;
//   98   //RST 
//   99   ptc_init.GPIO_PTx = PTC;
        LDR.W    R0,??DataTable19  ;; 0x400ff080
        STR      R0,[SP, #+4]
//  100   ptc_init.GPIO_Pins = GPIO_Pin12;
        MOV      R0,#+4096
        STR      R0,[SP, #+8]
//  101   ptc_init.GPIO_Dir = DIR_OUTPUT;
        MOVS     R0,#+1
        STRB     R0,[SP, #+16]
//  102   ptc_init.GPIO_Output = OUTPUT_H;
        MOVS     R0,#+1
        STRB     R0,[SP, #+17]
//  103   ptc_init.GPIO_PinControl = IRQC_DIS; 
        MOVS     R0,#+0
        STR      R0,[SP, #+12]
//  104   LPLD_GPIO_Init(ptc_init);    
        ADD      R1,SP,#+4
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_GPIO_Init
//  105 }
        ADD      SP,SP,#+28
        POP      {PC}             ;; return
//  106 
//  107 /*
//  108  * LPLD_LCD_WriteIndex
//  109  * LCD写控制命令，内部调用
//  110  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  111 static void LPLD_LCD_WriteIndex(uint16 index)
//  112 {
//  113   *(vuint16*)LCD_CMD_ADDRESS = index;  //write
LPLD_LCD_WriteIndex:
        MOVS     R1,#+1610612736
        STRH     R0,[R1, #+0]
//  114 }
        BX       LR               ;; return
//  115 
//  116 /*
//  117  * LPLD_LCD_WriteData
//  118  * LCD写数据，内部调用
//  119  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  120 void LPLD_LCD_WriteData(uint16 data)
//  121 {
//  122   *(vuint16*)LCD_DATA_ADDRESS = data;  //write
LPLD_LCD_WriteData:
        LDR.W    R1,??DataTable19_1  ;; 0x60010000
        STRH     R0,[R1, #+0]
//  123 }
        BX       LR               ;; return
//  124 
//  125 /*
//  126  * LPLD_LCD_ReadData
//  127  * LCD读数据，内部调用
//  128  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  129 static uint16 LPLD_LCD_ReadData(void)
//  130 { 
//  131   uint16 value;
//  132   value = *(vuint16*)LCD_DATA_ADDRESS;  //read
LPLD_LCD_ReadData:
        LDR.W    R0,??DataTable19_1  ;; 0x60010000
        LDRH     R0,[R0, #+0]
//  133   return value;
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BX       LR               ;; return
//  134 }
//  135 
//  136 /*
//  137  * LPLD_LCD_WriteReg
//  138  * LCD写寄存器，内部调用
//  139  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  140 static void LPLD_LCD_WriteReg(uint16 LCD_Reg,uint16 LCD_RegValue)
//  141 { 
LPLD_LCD_WriteReg:
        PUSH     {R4,LR}
        MOVS     R4,R1
//  142   /* Write 16-bit Index, then Write Reg */  
//  143   LPLD_LCD_WriteIndex(LCD_Reg);         
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       LPLD_LCD_WriteIndex
//  144   /* Write 16-bit Reg */
//  145   LPLD_LCD_WriteData(LCD_RegValue);  
        MOVS     R0,R4
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       LPLD_LCD_WriteData
//  146 }
        POP      {R4,PC}          ;; return
//  147 
//  148 /*
//  149  * LPLD_LCD_ReadReg
//  150  * LCD读寄存器，内部调用
//  151  */
//  152 static uint16 LPLD_LCD_ReadReg(uint16 LCD_Reg)
//  153 {
//  154   uint16 LCD_RAM;
//  155   /* Write 16-bit Index (then Read Reg) */
//  156   LPLD_LCD_WriteIndex(LCD_Reg);
//  157   /* Read 16-bit Reg */
//  158   LCD_RAM = LPLD_LCD_ReadData();      	
//  159   return LCD_RAM;
//  160 }
//  161 
//  162 /*
//  163  * LPLD_LCD_SetCursor
//  164  * 设置LCD内部GRAM光标位置，内部调用
//  165  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  166 static void LPLD_LCD_SetCursor( uint16 Xpos, uint16 Ypos )
//  167 {
LPLD_LCD_SetCursor:
        PUSH     {R4,LR}
        MOVS     R4,R1
//  168 #if(HORIZONTAL)
//  169     
//  170   uint16 temp = Xpos;
        MOVS     R1,R0
//  171   Xpos = Ypos;
        MOVS     R0,R4
//  172   Ypos = temp;  
        MOVS     R4,R1
//  173 
//  174 #else
//  175             
//  176 #endif
//  177   LPLD_LCD_WriteReg(LPLD_LCD_INFO.X_GRAM, Xpos );      
        MOVS     R1,R0
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LDR.W    R0,??DataTable19_2
        LDRH     R0,[R0, #+4]
        BL       LPLD_LCD_WriteReg
//  178   LPLD_LCD_WriteReg(LPLD_LCD_INFO.Y_GRAM, Ypos );          
        MOVS     R1,R4
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LDR.W    R0,??DataTable19_2
        LDRH     R0,[R0, #+6]
        BL       LPLD_LCD_WriteReg
//  179 }
        POP      {R4,PC}          ;; return
//  180 
//  181 
//  182 /*
//  183  * LPLD_LCD_Reset
//  184  * 复位LCD控制器，内部调用
//  185  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  186 static void LPLD_LCD_Reset(void)
//  187 {
LPLD_LCD_Reset:
        PUSH     {R7,LR}
//  188   LCD_CLR_RST;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable19_3  ;; 0x43fe1030
        STR      R0,[R1, #+0]
//  189   LPLD_LCD_Delayms(10); //延时
        MOVS     R0,#+10
        BL       LPLD_LCD_Delayms
//  190   LCD_SET_RST;
        MOVS     R0,#+1
        LDR.W    R1,??DataTable19_3  ;; 0x43fe1030
        STR      R0,[R1, #+0]
//  191 }
        POP      {R0,PC}          ;; return
//  192 
//  193 /*
//  194  * LPLD_LCD_Init
//  195  * LCD初始化
//  196  * 
//  197  * 参数:
//  198  *    无
//  199  *
//  200  * 输出:
//  201  *    LCD控制型号
//  202  *    0x9320--9320
//  203  *    0x8989--8989
//  204  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  205 uint16 LPLD_LCD_Init(void)
//  206 {
LPLD_LCD_Init:
        PUSH     {R4,LR}
//  207   uint16 dID;
//  208    
//  209   LPLD_LCD_FLEXBUS_Init(0);
        MOVS     R0,#+0
        BL       LPLD_LCD_FLEXBUS_Init
//  210   LPLD_LCD_IO_Cfg();
        BL       LPLD_LCD_IO_Cfg
//  211   LPLD_LCD_Delayms(50);
        MOVS     R0,#+50
        BL       LPLD_LCD_Delayms
//  212   
//  213   LPLD_LCD_Reset();                 //硬件复位
        BL       LPLD_LCD_Reset
//  214   
//  215  // dID = LPLD_LCD_ReadReg(0x0000);   //获取LCD控制器设备ID
//  216     
//  217  // LPLD_LCD_INFO.Lcd_Id = dID;
//  218   dID=0x8989;
        MOVW     R4,#+35209
//  219   if(dID == 0x9320)
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        MOVW     R0,#+37664
        CMP      R4,R0
        BNE.W    ??LPLD_LCD_Init_0
//  220   {
//  221     LPLD_LCD_INFO.Write_GRAM = 0x0022;
        MOVS     R0,#+34
        LDR.W    R1,??DataTable19_2
        STRH     R0,[R1, #+2]
//  222     LPLD_LCD_INFO.X_GRAM = 0x0020;
        MOVS     R0,#+32
        LDR.W    R1,??DataTable19_2
        STRH     R0,[R1, #+4]
//  223     LPLD_LCD_INFO.Y_GRAM = 0x0021;
        MOVS     R0,#+33
        LDR.W    R1,??DataTable19_2
        STRH     R0,[R1, #+6]
//  224     
//  225     LPLD_LCD_WriteReg(0x00,0x0001);   //开启LCD内部晶振，并等待10ms稳定
        MOVS     R1,#+1
        MOVS     R0,#+0
        BL       LPLD_LCD_WriteReg
//  226     LPLD_LCD_Delayms(10);
        MOVS     R0,#+10
        BL       LPLD_LCD_Delayms
//  227     
//  228     LPLD_LCD_WriteReg(0x01,0x0000);   //Driver Output Control
        MOVS     R1,#+0
        MOVS     R0,#+1
        BL       LPLD_LCD_WriteReg
//  229     LPLD_LCD_WriteReg(0x02,0x0700);   //LCD Driving Wave Control
        MOV      R1,#+1792
        MOVS     R0,#+2
        BL       LPLD_LCD_WriteReg
//  230     LPLD_LCD_WriteReg(0x03,0x1008);   //Entry Mode
        MOVW     R1,#+4104
        MOVS     R0,#+3
        BL       LPLD_LCD_WriteReg
//  231     LPLD_LCD_WriteReg(0x04,0x0000);   //Resizing Control
        MOVS     R1,#+0
        MOVS     R0,#+4
        BL       LPLD_LCD_WriteReg
//  232     LPLD_LCD_WriteReg(0x08,0x0202);   //Display Control 2
        MOVW     R1,#+514
        MOVS     R0,#+8
        BL       LPLD_LCD_WriteReg
//  233     LPLD_LCD_WriteReg(0x09,0x0000);   //Display Contral 3.(0x0000)
        MOVS     R1,#+0
        MOVS     R0,#+9
        BL       LPLD_LCD_WriteReg
//  234     LPLD_LCD_WriteReg(0x0a,0x0000);//Frame Cycle Contal.(0x0000)
        MOVS     R1,#+0
        MOVS     R0,#+10
        BL       LPLD_LCD_WriteReg
//  235     LPLD_LCD_WriteReg(0x0c,0x0001);//Extern Display Interface Contral 1.(0x0000)
        MOVS     R1,#+1
        MOVS     R0,#+12
        BL       LPLD_LCD_WriteReg
//  236     LPLD_LCD_WriteReg(0x0d,0x0000);//Frame Maker Position.
        MOVS     R1,#+0
        MOVS     R0,#+13
        BL       LPLD_LCD_WriteReg
//  237     LPLD_LCD_WriteReg(0x0f,0x0000);//Extern Display Interface Contral 2.
        MOVS     R1,#+0
        MOVS     R0,#+15
        BL       LPLD_LCD_WriteReg
//  238     
//  239     LPLD_LCD_WriteReg(0x10,0x0000);//Power Control 1.(0x16b0)
        MOVS     R1,#+0
        MOVS     R0,#+16
        BL       LPLD_LCD_WriteReg
//  240     LPLD_LCD_WriteReg(0x11,0x0000);//Power Control 2.(0x0001)	
        MOVS     R1,#+0
        MOVS     R0,#+17
        BL       LPLD_LCD_WriteReg
//  241     LPLD_LCD_WriteReg(0x12,0x0000);//Power Control 3.(0x0138)
        MOVS     R1,#+0
        MOVS     R0,#+18
        BL       LPLD_LCD_WriteReg
//  242     LPLD_LCD_WriteReg(0x13,0x0000);
        MOVS     R1,#+0
        MOVS     R0,#+19
        BL       LPLD_LCD_WriteReg
//  243     //LPLD_LCD_Delayms(200);	
//  244     
//  245     LPLD_LCD_WriteReg(0x10,0x17b0);//Power Control 1.(0x16b0)
        MOVW     R1,#+6064
        MOVS     R0,#+16
        BL       LPLD_LCD_WriteReg
//  246     LPLD_LCD_WriteReg(0x11,0x0137);//Power Control 2.(0x0001)
        MOVW     R1,#+311
        MOVS     R0,#+17
        BL       LPLD_LCD_WriteReg
//  247     LPLD_LCD_Delayms(5);
        MOVS     R0,#+5
        BL       LPLD_LCD_Delayms
//  248     LPLD_LCD_WriteReg(0x12,0x0139);//Power Control 3.(0x0138)
        MOVW     R1,#+313
        MOVS     R0,#+18
        BL       LPLD_LCD_WriteReg
//  249     LPLD_LCD_Delayms(5);	
        MOVS     R0,#+5
        BL       LPLD_LCD_Delayms
//  250     LPLD_LCD_WriteReg(0x13,0x1700);	 
        MOV      R1,#+5888
        MOVS     R0,#+19
        BL       LPLD_LCD_WriteReg
//  251    
//  252     LPLD_LCD_WriteReg(0x29,0x0000);
        MOVS     R1,#+0
        MOVS     R0,#+41
        BL       LPLD_LCD_WriteReg
//  253     LPLD_LCD_WriteReg(0x2B,0x0000);
        MOVS     R1,#+0
        MOVS     R0,#+43
        BL       LPLD_LCD_WriteReg
//  254     LPLD_LCD_Delayms(5);						
        MOVS     R0,#+5
        BL       LPLD_LCD_Delayms
//  255     
//  256     LPLD_LCD_WriteReg(0x30,0x0000);					
        MOVS     R1,#+0
        MOVS     R0,#+48
        BL       LPLD_LCD_WriteReg
//  257     LPLD_LCD_WriteReg(0x31,0x0507);
        MOVW     R1,#+1287
        MOVS     R0,#+49
        BL       LPLD_LCD_WriteReg
//  258     LPLD_LCD_WriteReg(0x32,0x0104);	
        MOV      R1,#+260
        MOVS     R0,#+50
        BL       LPLD_LCD_WriteReg
//  259     LPLD_LCD_WriteReg(0x35,0x0105);	
        MOVW     R1,#+261
        MOVS     R0,#+53
        BL       LPLD_LCD_WriteReg
//  260     LPLD_LCD_WriteReg(0x36,0x0404);
        MOVW     R1,#+1028
        MOVS     R0,#+54
        BL       LPLD_LCD_WriteReg
//  261     LPLD_LCD_WriteReg(0x37,0x0603);	
        MOVW     R1,#+1539
        MOVS     R0,#+55
        BL       LPLD_LCD_WriteReg
//  262     LPLD_LCD_WriteReg(0x38,0x0004);	
        MOVS     R1,#+4
        MOVS     R0,#+56
        BL       LPLD_LCD_WriteReg
//  263     LPLD_LCD_WriteReg(0x39,0x0007);
        MOVS     R1,#+7
        MOVS     R0,#+57
        BL       LPLD_LCD_WriteReg
//  264     LPLD_LCD_WriteReg(0x3c,0x0501);	
        MOVW     R1,#+1281
        MOVS     R0,#+60
        BL       LPLD_LCD_WriteReg
//  265     LPLD_LCD_WriteReg(0x3d,0x0404);
        MOVW     R1,#+1028
        MOVS     R0,#+61
        BL       LPLD_LCD_WriteReg
//  266     
//  267     LPLD_LCD_WriteReg(0x0050,0x0000);
        MOVS     R1,#+0
        MOVS     R0,#+80
        BL       LPLD_LCD_WriteReg
//  268     LPLD_LCD_WriteReg(0x0051,239);
        MOVS     R1,#+239
        MOVS     R0,#+81
        BL       LPLD_LCD_WriteReg
//  269     LPLD_LCD_WriteReg(0x0052,0x0000);
        MOVS     R1,#+0
        MOVS     R0,#+82
        BL       LPLD_LCD_WriteReg
//  270     LPLD_LCD_WriteReg(0x0053,319);
        MOVW     R1,#+319
        MOVS     R0,#+83
        BL       LPLD_LCD_WriteReg
//  271   
//  272     LPLD_LCD_WriteReg(0x60,0x2700);//Driver Output Control.
        MOV      R1,#+9984
        MOVS     R0,#+96
        BL       LPLD_LCD_WriteReg
//  273     LPLD_LCD_WriteReg(0x61,0x0001);//Driver Output Control.
        MOVS     R1,#+1
        MOVS     R0,#+97
        BL       LPLD_LCD_WriteReg
//  274     LPLD_LCD_WriteReg(0x6a,0x0000);//Vertical Srcoll Control.
        MOVS     R1,#+0
        MOVS     R0,#+106
        BL       LPLD_LCD_WriteReg
//  275     
//  276     LPLD_LCD_WriteReg(0x80,0x0000);//Display Position? Partial Display 1.
        MOVS     R1,#+0
        MOVS     R0,#+128
        BL       LPLD_LCD_WriteReg
//  277     LPLD_LCD_WriteReg(0x81,0x0000);//RAM Address Start? Partial Display 1.
        MOVS     R1,#+0
        MOVS     R0,#+129
        BL       LPLD_LCD_WriteReg
//  278     LPLD_LCD_WriteReg(0x82,0x0000);//RAM Address End-Partial Display 1.
        MOVS     R1,#+0
        MOVS     R0,#+130
        BL       LPLD_LCD_WriteReg
//  279     LPLD_LCD_WriteReg(0x83,0x0000);//Displsy Position? Partial Display 2.
        MOVS     R1,#+0
        MOVS     R0,#+131
        BL       LPLD_LCD_WriteReg
//  280     LPLD_LCD_WriteReg(0x84,0x0000);//RAM Address Start? Partial Display 2.
        MOVS     R1,#+0
        MOVS     R0,#+132
        BL       LPLD_LCD_WriteReg
//  281     LPLD_LCD_WriteReg(0x85,0x0000);//RAM Address End? Partial Display 2.
        MOVS     R1,#+0
        MOVS     R0,#+133
        BL       LPLD_LCD_WriteReg
//  282     
//  283     LPLD_LCD_WriteReg(0x90,0x0010);//Frame Cycle Contral.(0x0013)
        MOVS     R1,#+16
        MOVS     R0,#+144
        BL       LPLD_LCD_WriteReg
//  284     LPLD_LCD_WriteReg(0x92,0x0000);//Panel Interface Contral 2.(0x0000)
        MOVS     R1,#+0
        MOVS     R0,#+146
        BL       LPLD_LCD_WriteReg
//  285     LPLD_LCD_WriteReg(0x93,0x0003);//Panel Interface Contral 3.
        MOVS     R1,#+3
        MOVS     R0,#+147
        BL       LPLD_LCD_WriteReg
//  286     LPLD_LCD_WriteReg(0x95,0x0110);//Frame Cycle Contral.(0x0110)
        MOV      R1,#+272
        MOVS     R0,#+149
        BL       LPLD_LCD_WriteReg
//  287     LPLD_LCD_WriteReg(0x97,0x0000);//
        MOVS     R1,#+0
        MOVS     R0,#+151
        BL       LPLD_LCD_WriteReg
//  288     LPLD_LCD_WriteReg(0x98,0x0000);//Frame Cycle Contral.
        MOVS     R1,#+0
        MOVS     R0,#+152
        BL       LPLD_LCD_WriteReg
//  289 
//  290     LPLD_LCD_WriteReg(0x07,0x0133);
        MOVW     R1,#+307
        MOVS     R0,#+7
        BL       LPLD_LCD_WriteReg
//  291     LPLD_LCD_Delayms(3);
        MOVS     R0,#+3
        BL       LPLD_LCD_Delayms
        B.N      ??LPLD_LCD_Init_1
//  292   }  
//  293   else if(dID == 0x8989)
??LPLD_LCD_Init_0:
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        MOVW     R0,#+35209
        CMP      R4,R0
        BNE.W    ??LPLD_LCD_Init_1
//  294   {
//  295     LPLD_LCD_INFO.Write_GRAM = 0x0022;
        MOVS     R0,#+34
        LDR.W    R1,??DataTable19_2
        STRH     R0,[R1, #+2]
//  296     LPLD_LCD_INFO.X_GRAM = 0x004e;
        MOVS     R0,#+78
        LDR.W    R1,??DataTable19_2
        STRH     R0,[R1, #+4]
//  297     LPLD_LCD_INFO.Y_GRAM = 0x004f;
        MOVS     R0,#+79
        LDR.W    R1,??DataTable19_2
        STRH     R0,[R1, #+6]
//  298     
//  299     //SSD1289;
//  300     /* 打开晶振 */
//  301     LPLD_LCD_WriteReg(0x0000,0x0001);    LPLD_LCD_Delayms(LCD_DELAY_TIME); 
        MOVS     R1,#+1
        MOVS     R0,#+0
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  302  
//  303     //启动频率设置为最大osc/16 消耗功率设置在large档位，提高显示画质
//  304     //LPLD_LCD_WriteReg(0x0003,0xF8F8);    LPLD_LCD_Delayms(LCD_DELAY_TIME);
//  305     LPLD_LCD_WriteReg(0x0003,0xA8A4);    LPLD_LCD_Delayms(LCD_DELAY_TIME);   //0210
        MOVW     R1,#+43172
        MOVS     R0,#+3
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  306     LPLD_LCD_WriteReg(0x000C,0x0000);    LPLD_LCD_Delayms(LCD_DELAY_TIME);   
        MOVS     R1,#+0
        MOVS     R0,#+12
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  307     LPLD_LCD_WriteReg(0x000D,0x080C);    LPLD_LCD_Delayms(LCD_DELAY_TIME);   
        MOVW     R1,#+2060
        MOVS     R0,#+13
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  308     LPLD_LCD_WriteReg(0x000E,0x2B00);    LPLD_LCD_Delayms(LCD_DELAY_TIME);   
        MOV      R1,#+11008
        MOVS     R0,#+14
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  309     LPLD_LCD_WriteReg(0x001E,0x00B0);    LPLD_LCD_Delayms(LCD_DELAY_TIME); 
        MOVS     R1,#+176
        MOVS     R0,#+30
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  310     //驱动输出控制320*240 0x2B3F 
//  311   //  LPLD_LCD_WriteReg(0x0001,0x2B3F);    LPLD_LCD_Delayms(LCD_DELAY_TIME); 
//  312     
//  313     //  693F   6B3F   2B3F   293F
//  314     LPLD_LCD_WriteReg(0x0001,0x293F);    LPLD_LCD_Delayms(LCD_DELAY_TIME);   
        MOVW     R1,#+10559
        MOVS     R0,#+1
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  315   
//  316     //驱动输出控制320*240 0x233F 将原来的第11位BGR清零这样输出是RGB就不会红色与蓝色颠倒 
//  317     //LPLD_LCD_WriteReg(0x0001,0x233F);    LPLD_LCD_Delayms(LCD_DELAY_TIME);   
//  318     LPLD_LCD_WriteReg(0x0002,0x0600);    LPLD_LCD_Delayms(LCD_DELAY_TIME);
        MOV      R1,#+1536
        MOVS     R0,#+2
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  319     LPLD_LCD_WriteReg(0x0010,0x0000);    LPLD_LCD_Delayms(LCD_DELAY_TIME);
        MOVS     R1,#+0
        MOVS     R0,#+16
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  320     /* 定义数据格式 16位色 横屏 0x6070 */
//  321     // TY1（bit7） TY0 ID1 ID0 AM LG2 LG1 LG0
//  322     //   0          0   1   1   1  0   0   0
//  323     // type A  0 0
//  324     // type B  0 1
//  325     // type C  1 1
//  326     // AM   指针自动增加
//  327     // 65K颜色
//  328     // 寄存器 4f/4e 定义窗口大小
//  329     LPLD_LCD_WriteReg(0x0011,0x6028);    LPLD_LCD_Delayms(LCD_DELAY_TIME);   
        MOVW     R1,#+24616
        MOVS     R0,#+17
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  330     //LPLD_LCD_WriteReg(0x0011,0x6070);    LPLD_LCD_Delayms(LCD_DELAY_TIME);   
//  331     //
//  332     LPLD_LCD_WriteReg(0x0005,0x0000);    LPLD_LCD_Delayms(LCD_DELAY_TIME);
        MOVS     R1,#+0
        MOVS     R0,#+5
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  333     LPLD_LCD_WriteReg(0x0006,0x0000);    LPLD_LCD_Delayms(LCD_DELAY_TIME);
        MOVS     R1,#+0
        MOVS     R0,#+6
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  334     LPLD_LCD_WriteReg(0x0016,0xEF1C);    LPLD_LCD_Delayms(LCD_DELAY_TIME);
        MOVW     R1,#+61212
        MOVS     R0,#+22
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  335     LPLD_LCD_WriteReg(0x0017,0x0003);    LPLD_LCD_Delayms(LCD_DELAY_TIME);
        MOVS     R1,#+3
        MOVS     R0,#+23
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  336     //PT1 PT0 VLE2 VLE1 SPT 0  0 GON DTE CM 0 D1 D0
//  337     //  0   0        1   0  0  0  1   1  0  0  1  1
//  338     LPLD_LCD_WriteReg(0x0007,0x0233);    LPLD_LCD_Delayms(LCD_DELAY_TIME);
        MOVW     R1,#+563
        MOVS     R0,#+7
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  339     //LPLD_LCD_WriteReg(0x0007,0x0133);    LPLD_LCD_Delayms(LCD_DELAY_TIME);
//  340     //NO1 NO0 SDT1 SDT0 0 EQ2 EQ1 EQ0 DIV1 DIV0 SDIV SRTN RTN3 RTN2 RTN1 RTN0
//  341     //                                 1     1    0    0    0    0   0   0
//  342     //将DIV设置成2分频
//  343     //
//  344     //LPLD_LCD_WriteReg(0x000B,0x0020);    LPLD_LCD_Delayms(LCD_DELAY_TIME);
//  345     LPLD_LCD_WriteReg(0x000B,0x0020);    LPLD_LCD_Delayms(LCD_DELAY_TIME);
        MOVS     R1,#+32
        MOVS     R0,#+11
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  346     //配置扫描模式
//  347     LPLD_LCD_WriteReg(0x000F,0x0000);    LPLD_LCD_Delayms(LCD_DELAY_TIME);   
        MOVS     R1,#+0
        MOVS     R0,#+15
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  348     /* 扫描开始地址 */
//  349     //垂直控制
//  350     LPLD_LCD_WriteReg(0x0041,0x0000);    LPLD_LCD_Delayms(LCD_DELAY_TIME);
        MOVS     R1,#+0
        MOVS     R0,#+65
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  351     LPLD_LCD_WriteReg(0x0042,0x0000);    LPLD_LCD_Delayms(LCD_DELAY_TIME);
        MOVS     R1,#+0
        MOVS     R0,#+66
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  352     //水平RAMposition
//  353     LPLD_LCD_WriteReg(0x0048,0x0000);    LPLD_LCD_Delayms(LCD_DELAY_TIME);
        MOVS     R1,#+0
        MOVS     R0,#+72
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  354     LPLD_LCD_WriteReg(0x0049,0x013F);    LPLD_LCD_Delayms(LCD_DELAY_TIME);
        MOVW     R1,#+319
        MOVS     R0,#+73
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  355     
//  356     LPLD_LCD_WriteReg(0x004A,0x0000);    LPLD_LCD_Delayms(LCD_DELAY_TIME);
        MOVS     R1,#+0
        MOVS     R0,#+74
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  357     LPLD_LCD_WriteReg(0x004B,0x0000);    LPLD_LCD_Delayms(LCD_DELAY_TIME); 
        MOVS     R1,#+0
        MOVS     R0,#+75
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  358  
//  359    // LPLD_LCD_WriteReg(0x0044,0xEF00);    LPLD_LCD_Delayms(LCD_DELAY_TIME);
//  360    // LPLD_LCD_WriteReg(0x0045,0x0000);    LPLD_LCD_Delayms(LCD_DELAY_TIME); 
//  361    // LPLD_LCD_WriteReg(0x0046,0x013F);    LPLD_LCD_Delayms(LCD_DELAY_TIME);
//  362     
//  363     LPLD_LCD_WriteReg(0x0030,0x0707);    LPLD_LCD_Delayms(LCD_DELAY_TIME);
        MOVW     R1,#+1799
        MOVS     R0,#+48
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  364     LPLD_LCD_WriteReg(0x0031,0x0204);    LPLD_LCD_Delayms(LCD_DELAY_TIME);
        MOV      R1,#+516
        MOVS     R0,#+49
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  365     LPLD_LCD_WriteReg(0x0032,0x0204);    LPLD_LCD_Delayms(LCD_DELAY_TIME);
        MOV      R1,#+516
        MOVS     R0,#+50
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  366     LPLD_LCD_WriteReg(0x0033,0x0502);    LPLD_LCD_Delayms(LCD_DELAY_TIME);
        MOVW     R1,#+1282
        MOVS     R0,#+51
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  367     LPLD_LCD_WriteReg(0x0034,0x0507);    LPLD_LCD_Delayms(LCD_DELAY_TIME);
        MOVW     R1,#+1287
        MOVS     R0,#+52
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  368     LPLD_LCD_WriteReg(0x0035,0x0204);    LPLD_LCD_Delayms(LCD_DELAY_TIME);
        MOV      R1,#+516
        MOVS     R0,#+53
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  369     LPLD_LCD_WriteReg(0x0036,0x0204);    LPLD_LCD_Delayms(LCD_DELAY_TIME);
        MOV      R1,#+516
        MOVS     R0,#+54
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  370     LPLD_LCD_WriteReg(0x0037,0x0502);    LPLD_LCD_Delayms(LCD_DELAY_TIME);
        MOVW     R1,#+1282
        MOVS     R0,#+55
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  371     LPLD_LCD_WriteReg(0x003A,0x0302);    LPLD_LCD_Delayms(LCD_DELAY_TIME);
        MOVW     R1,#+770
        MOVS     R0,#+58
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  372     LPLD_LCD_WriteReg(0x003B,0x0302);    LPLD_LCD_Delayms(LCD_DELAY_TIME);
        MOVW     R1,#+770
        MOVS     R0,#+59
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  373     LPLD_LCD_WriteReg(0x0023,0x0000);    LPLD_LCD_Delayms(LCD_DELAY_TIME);
        MOVS     R1,#+0
        MOVS     R0,#+35
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  374     LPLD_LCD_WriteReg(0x0024,0x0000);    LPLD_LCD_Delayms(LCD_DELAY_TIME);
        MOVS     R1,#+0
        MOVS     R0,#+36
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  375     /*0000 390K  50 
//  376       0010 430K  55 
//  377       0101 470K  60 
//  378       1000 510K  65 
//  379       1010 548K  70 
//  380       1100 587K  75 
//  381       1110 626K  80 */
//  382     LPLD_LCD_WriteReg(0x0025,0x8000);    LPLD_LCD_Delayms(LCD_DELAY_TIME);
        MOV      R1,#+32768
        MOVS     R0,#+37
        BL       LPLD_LCD_WriteReg
        MOVS     R0,#+0
        BL       LPLD_LCD_Delayms
//  383  //   LPLD_LCD_WriteReg(0x0025,0xe000);    LPLD_LCD_Delayms(LCD_DELAY_TIME);
//  384     
//  385   //  LPLD_LCD_WriteReg(0x004f,0);
//  386   //  LPLD_LCD_WriteReg(0x004e,0);//设定显示窗口       
//  387     //LPLD_LCD_UpdateData();	//更新写入的数据使之生效*/
//  388     LPLD_LCD_Delayms(20);         //等待LCD启动
        MOVS     R0,#+20
        BL       LPLD_LCD_Delayms
//  389   }
//  390   
//  391   return dID;
??LPLD_LCD_Init_1:
        MOVS     R0,R4
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        POP      {R4,PC}          ;; return
//  392 }
//  393 
//  394 /*
//  395  * LPLD_LCD_FillBackground
//  396  * 填充LCD背景色
//  397  * 
//  398  * 参数:
//  399  *    Color--16位RGB颜色值
//  400  *
//  401  * 输出:
//  402  *    无
//  403  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  404 void LPLD_LCD_FillBackground(uint16 Color)
//  405 {
LPLD_LCD_FillBackground:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
//  406   uint32_t index=0;
        MOVS     R5,#+0
//  407   LPLD_LCD_SetCursor(0,0); 
        MOVS     R1,#+0
        MOVS     R0,#+0
        BL       LPLD_LCD_SetCursor
//  408   LPLD_LCD_WriteIndex(LPLD_LCD_INFO.Write_GRAM);
        LDR.W    R0,??DataTable19_2
        LDRH     R0,[R0, #+2]
        BL       LPLD_LCD_WriteIndex
//  409   for( index = 0; index < MAX_X * MAX_Y; index++ )
        MOVS     R0,#+0
        MOVS     R5,R0
        B.N      ??LPLD_LCD_FillBackground_0
//  410   {
//  411     LPLD_LCD_WriteData(Color);
??LPLD_LCD_FillBackground_1:
        MOVS     R0,R4
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       LPLD_LCD_WriteData
//  412   }
        ADDS     R5,R5,#+1
??LPLD_LCD_FillBackground_0:
        CMP      R5,#+76800
        BCC.N    ??LPLD_LCD_FillBackground_1
//  413 }
        POP      {R0,R4,R5,PC}    ;; return
//  414 
//  415 /*
//  416  * LPLD_LCD_FillBackgroundGRAM
//  417  * 填充LCD背景色到LCD_GRAM
//  418  * 
//  419  * 参数:
//  420  *    *Color--16位RGB颜色值数组，长度为LCD_GRAM数组的长度
//  421  *
//  422  * 输出:
//  423  *    无
//  424  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  425 void LPLD_LCD_FillBackgroundGRAM(uint16 *Color)
//  426 {
LPLD_LCD_FillBackgroundGRAM:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
//  427   uint32_t index=0;
        MOVS     R5,#+0
//  428   LPLD_LCD_SetCursor(0,0); 
        MOVS     R1,#+0
        MOVS     R0,#+0
        BL       LPLD_LCD_SetCursor
//  429   LPLD_LCD_WriteIndex(LPLD_LCD_INFO.Write_GRAM);
        LDR.W    R0,??DataTable19_2
        LDRH     R0,[R0, #+2]
        BL       LPLD_LCD_WriteIndex
//  430   for( index = 0; index < MAX_X * MAX_Y; index++ )
        MOVS     R0,#+0
        MOVS     R5,R0
        B.N      ??LPLD_LCD_FillBackgroundGRAM_0
//  431   {
//  432     LPLD_LCD_WriteData(Color[index]);
??LPLD_LCD_FillBackgroundGRAM_1:
        LDRH     R0,[R4, R5, LSL #+1]
        BL       LPLD_LCD_WriteData
//  433   }
        ADDS     R5,R5,#+1
??LPLD_LCD_FillBackgroundGRAM_0:
        CMP      R5,#+76800
        BCC.N    ??LPLD_LCD_FillBackgroundGRAM_1
//  434 }
        POP      {R0,R4,R5,PC}    ;; return
//  435 
//  436 /*
//  437  * LPLD_LCD_BGR2RGB
//  438  * BGR颜色转RGB颜色
//  439  * 
//  440  * 参数:
//  441  *    Color--16位BGR颜色值
//  442  *
//  443  * 输出:
//  444  *    16位RGB颜色值
//  445  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  446 uint16 LPLD_LCD_BGR2RGB(uint16 Color)
//  447 {
//  448   uint16  r, g, b, rgb;
//  449   
//  450   b = ( Color>>0 )  & 0x1f;
LPLD_LCD_BGR2RGB:
        ANDS     R2,R0,#0x1F
//  451   g = ( Color>>5 )  & 0x3f;
        UBFX     R1,R0,#+5,#+6
//  452   r = ( Color>>11 ) & 0x1f;
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R0,R0,#+11
//  453   
//  454   rgb =  (b<<11) + (g<<5) + (r<<0);
        LSLS     R1,R1,#+5
        ADDS     R1,R1,R2, LSL #+11
        ADDS     R0,R0,R1
//  455   
//  456   return( rgb );
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BX       LR               ;; return
//  457 }
//  458 
//  459 /*
//  460  * LPLD_LCD_U8GRAY2RGB
//  461  * U8灰度颜色转为RGB颜色
//  462  * 
//  463  * 参数:
//  464  *    Color--8位灰度颜色值
//  465  *
//  466  * 输出:
//  467  *    16位RGB颜色值
//  468  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  469 uint16 LPLD_LCD_U8GRAY2RGB(uint8 Color)
//  470 {
//  471   uint16  r, g, b, rgb;
//  472   
//  473   b = ( Color>>3 )  & 0x1f;
LPLD_LCD_U8GRAY2RGB:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSRS     R2,R0,#+3
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
//  474   g = ( Color>>2 )  & 0x3f;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSRS     R1,R0,#+2
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
//  475   r = ( Color>>3 )  & 0x1f;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSRS     R0,R0,#+3
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
//  476   
//  477   rgb =  (b<<11) + (g<<5) + (r<<0);
        LSLS     R1,R1,#+5
        ADDS     R1,R1,R2, LSL #+11
        ADDS     R0,R0,R1
//  478   
//  479   return( rgb );
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BX       LR               ;; return
//  480 }
//  481 
//  482 /*
//  483  * LPLD_LCD_GetPoint
//  484  * 取得LCD某点的16位RGB值
//  485  * 
//  486  * 参数:
//  487  *    Xpos--X轴坐标
//  488  *    Ypos--Y轴坐标
//  489  *
//  490  * 输出:
//  491  *    16位RGB颜色值
//  492  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  493 uint16 LPLD_LCD_GetPoint(uint16 Xpos,uint16 Ypos)
//  494 {
LPLD_LCD_GetPoint:
        PUSH     {R4,LR}
//  495   uint16 dummy;
//  496   
//  497   LPLD_LCD_SetCursor(Xpos,Ypos);
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       LPLD_LCD_SetCursor
//  498   LPLD_LCD_WriteIndex(LPLD_LCD_INFO.Write_GRAM);  
        LDR.W    R0,??DataTable19_2
        LDRH     R0,[R0, #+2]
        BL       LPLD_LCD_WriteIndex
//  499  
//  500   dummy = LPLD_LCD_ReadData();   /* 空读一次 */
        BL       LPLD_LCD_ReadData
        MOVS     R4,R0
//  501   dummy = LPLD_LCD_ReadData(); 
        BL       LPLD_LCD_ReadData
        MOVS     R4,R0
//  502   return  dummy;	          
        MOVS     R0,R4
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        POP      {R4,PC}          ;; return
//  503 }
//  504 
//  505 /*
//  506  * LPLD_LCD_SetPoint
//  507  * 设置LCD某点的16位RGB值
//  508  * 
//  509  * 参数:
//  510  *    Xpos--X轴坐标
//  511  *    Ypos--Y轴坐标
//  512  *    Color--16位RGB颜色值
//  513  *
//  514  * 输出:
//  515  *    无
//  516  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  517 void LPLD_LCD_SetPoint(uint16 Xpos,uint16 Ypos,uint16 Color)
//  518 {
LPLD_LCD_SetPoint:
        PUSH     {R4,LR}
        MOVS     R4,R2
//  519   if( Xpos >= MAX_X || Ypos >= MAX_Y )
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,#+320
        BGE.N    ??LPLD_LCD_SetPoint_0
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R1,#+240
        BLT.N    ??LPLD_LCD_SetPoint_1
//  520   {
//  521     return;
??LPLD_LCD_SetPoint_0:
        B.N      ??LPLD_LCD_SetPoint_2
//  522   } 
//  523   LPLD_LCD_SetCursor(Xpos,Ypos);
??LPLD_LCD_SetPoint_1:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       LPLD_LCD_SetCursor
//  524   LPLD_LCD_WriteReg(LPLD_LCD_INFO.Write_GRAM,Color);
        MOVS     R1,R4
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LDR.W    R0,??DataTable19_2
        LDRH     R0,[R0, #+2]
        BL       LPLD_LCD_WriteReg
//  525 }
??LPLD_LCD_SetPoint_2:
        POP      {R4,PC}          ;; return
//  526 
//  527 /*
//  528  * LPLD_LCD_DrawLine
//  529  * 在指定坐标显示直线
//  530  * 
//  531  * 参数:
//  532  *    x0--X轴起始坐标
//  533  *    y0--Y轴起始坐标
//  534  *    x1--X轴结束坐标
//  535  *    y1--Y轴结束坐标
//  536  *    Color--16位RGB颜色值
//  537  *
//  538  * 输出:
//  539  *    无
//  540  */	 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  541 void LPLD_LCD_DrawLine( uint16 x0, uint16 y0, uint16 x1, uint16 y1 , uint16 color )
//  542 {
LPLD_LCD_DrawLine:
        PUSH     {R3-R11,LR}
        MOVS     R5,R0
        MOV      R9,R1
        MOVS     R6,R2
        MOV      R11,R3
//  543   short dx,dy;      /* 定义X Y轴上增加的变量值 */
//  544   short temp;       /* 起点 终点大小比较 交换数据时的中间变量 */
//  545   
//  546   if( x0 > x1 )     /* X轴上起点大于终点 交换数据 */
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R6,R5
        BCS.N    ??LPLD_LCD_DrawLine_0
//  547   {
//  548     temp = x1;
        MOV      R10,R6
//  549     x1 = x0;
        MOVS     R6,R5
//  550     x0 = temp;   
        MOV      R5,R10
//  551   }
//  552   if( y0 > y1 )     /* Y轴上起点大于终点 交换数据 */
??LPLD_LCD_DrawLine_0:
        UXTH     R11,R11          ;; ZeroExt  R11,R11,#+16,#+16
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        CMP      R11,R9
        BCS.N    ??LPLD_LCD_DrawLine_1
//  553   {
//  554     temp = y1;
        MOV      R10,R11
//  555     y1 = y0;
        MOV      R11,R9
//  556     y0 = temp;   
        MOV      R9,R10
//  557   }
//  558   
//  559   dx = x1-x0;       /* X轴方向上的增量 */
??LPLD_LCD_DrawLine_1:
        SUBS     R7,R6,R5
//  560   dy = y1-y0;       /* Y轴方向上的增量 */
        SUBS     R8,R11,R9
        LDR      R4,[SP, #+40]
//  561   
//  562   if( dx == 0 )     /* X轴上没有增量 画垂直线 */ 
        SXTH     R7,R7            ;; SignExt  R7,R7,#+16,#+16
        CMP      R7,#+0
        BNE.N    ??LPLD_LCD_DrawLine_2
//  563   {
//  564     do
//  565     { 
//  566       LPLD_LCD_SetPoint(x0, y0, color);   /* 逐点显示 描垂直线 */
??LPLD_LCD_DrawLine_3:
        MOVS     R2,R4
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOV      R1,R9
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R5
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       LPLD_LCD_SetPoint
//  567       y0++;
        ADDS     R9,R9,#+1
//  568     }
//  569     while( y1 >= y0 ); 
        UXTH     R11,R11          ;; ZeroExt  R11,R11,#+16,#+16
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        CMP      R11,R9
        BCS.N    ??LPLD_LCD_DrawLine_3
//  570       return; 
        B.N      ??LPLD_LCD_DrawLine_4
//  571   }
//  572   if( dy == 0 )     /* Y轴上没有增量 画水平直线 */ 
??LPLD_LCD_DrawLine_2:
        SXTH     R8,R8            ;; SignExt  R8,R8,#+16,#+16
        CMP      R8,#+0
        BNE.N    ??LPLD_LCD_DrawLine_5
//  573   {
//  574     do
//  575     {
//  576       LPLD_LCD_SetPoint(x0, y0, color);   /* 逐点显示 描水平线 */
??LPLD_LCD_DrawLine_6:
        MOVS     R2,R4
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOV      R1,R9
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R5
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       LPLD_LCD_SetPoint
//  577       x0++;
        ADDS     R5,R5,#+1
//  578     }
//  579     while( x1 >= x0 ); 
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R6,R5
        BCS.N    ??LPLD_LCD_DrawLine_6
//  580       return;
        B.N      ??LPLD_LCD_DrawLine_4
//  581   }
//  582   /* 布兰森汉姆(Bresenham)算法画线 */
//  583   if( dx > dy )                         /* 靠近X轴 */
??LPLD_LCD_DrawLine_5:
        SXTH     R8,R8            ;; SignExt  R8,R8,#+16,#+16
        SXTH     R7,R7            ;; SignExt  R7,R7,#+16,#+16
        CMP      R8,R7
        BGE.N    ??LPLD_LCD_DrawLine_7
//  584   {
//  585     temp = 2 * dy - dx;               /* 计算下个点的位置 */         
        SXTH     R8,R8            ;; SignExt  R8,R8,#+16,#+16
        SXTH     R7,R7            ;; SignExt  R7,R7,#+16,#+16
        RSBS     R10,R7,R8, LSL #+1
        B.N      ??LPLD_LCD_DrawLine_8
//  586     while( x0 != x1 )
//  587     {
//  588       LPLD_LCD_SetPoint(x0,y0,color);    /* 画起点 */ 
//  589       x0++;                         /* X轴上加1 */
//  590       if( temp > 0 )                /* 判断下下个点的位置 */
//  591       {
//  592         y0++;                     /* 为右上相邻点，即（x0+1,y0+1） */ 
??LPLD_LCD_DrawLine_9:
        ADDS     R9,R9,#+1
//  593         temp += 2 * dy - 2 * dx; 
        SXTH     R8,R8            ;; SignExt  R8,R8,#+16,#+16
        LSLS     R0,R8,#+1
        SXTAH    R0,R0,R10
        SXTH     R7,R7            ;; SignExt  R7,R7,#+16,#+16
        SUBS     R10,R0,R7, LSL #+1
//  594       }
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
//  595       else         
//  596       {
//  597         temp += 2 * dy;           /* 判断下下个点的位置 */  
        SXTH     R8,R8            ;; SignExt  R8,R8,#+16,#+16
        LSLS     R0,R8,#+1
        SXTAH    R10,R0,R10
        B.N      ??LPLD_LCD_DrawLine_8
//  598       }       
//  599     }
//  600     LPLD_LCD_SetPoint(x0,y0,color);
??LPLD_LCD_DrawLine_10:
        MOVS     R2,R4
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOV      R1,R9
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R5
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       LPLD_LCD_SetPoint
        B.N      ??LPLD_LCD_DrawLine_11
//  601     }  
//  602     else
//  603     {
//  604       temp = 2 * dx - dy;                      /* 靠近Y轴 */       
??LPLD_LCD_DrawLine_7:
        SXTH     R7,R7            ;; SignExt  R7,R7,#+16,#+16
        SXTH     R8,R8            ;; SignExt  R8,R8,#+16,#+16
        RSBS     R10,R8,R7, LSL #+1
        B.N      ??LPLD_LCD_DrawLine_12
//  605       while( y0 != y1 )
//  606       {
//  607         LPLD_LCD_SetPoint(x0,y0,color);     
//  608         y0++;                 
//  609         if( temp > 0 )           
//  610         {
//  611           x0++;               
??LPLD_LCD_DrawLine_13:
        ADDS     R5,R5,#+1
//  612           temp+=2*dy-2*dx; 
        SXTH     R8,R8            ;; SignExt  R8,R8,#+16,#+16
        LSLS     R0,R8,#+1
        SXTAH    R0,R0,R10
        SXTH     R7,R7            ;; SignExt  R7,R7,#+16,#+16
        SUBS     R10,R0,R7, LSL #+1
//  613         }
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
//  614         else
//  615         {
//  616           temp += 2 * dy;
        SXTH     R8,R8            ;; SignExt  R8,R8,#+16,#+16
        LSLS     R0,R8,#+1
        SXTAH    R10,R0,R10
        B.N      ??LPLD_LCD_DrawLine_12
//  617         }
//  618      } 
//  619   LPLD_LCD_SetPoint(x0,y0,color);
??LPLD_LCD_DrawLine_14:
        MOVS     R2,R4
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOV      R1,R9
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R5
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       LPLD_LCD_SetPoint
//  620   }
//  621 } 
??LPLD_LCD_DrawLine_11:
??LPLD_LCD_DrawLine_4:
        POP      {R0,R4-R11,PC}   ;; return
//  622 
//  623 
//  624 /*
//  625  * LPLD_LCD_DrawSquare
//  626  * 在指定坐标显示正方形
//  627  * 
//  628  * 参数： 
//  629  *    x0--正方形的起始横坐标 
//  630  *    y0--正方形的起始纵坐标
//  631  *    side_length--正方形的边长
//  632  *    Line_color--正方形边的颜色
//  633  *    Fill_color--正方形整体填充的颜色
//  634  *
//  635  * 输出:
//  636  *    无
//  637  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  638 void LPLD_LCD_DrawSquare(uint16 x0,uint16 y0,uint16 side_length,uint16 Line_color,uint16 Fill_color)
//  639 {
LPLD_LCD_DrawSquare:
        PUSH     {R3-R9,LR}
        MOVS     R5,R0
        MOVS     R6,R1
        MOVS     R7,R2
        MOVS     R4,R3
//  640   uint16 i,j;
//  641   if(side_length > MAX_X || side_length > MAX_Y)
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R7,#+320
        BGT.N    ??LPLD_LCD_DrawSquare_0
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R7,#+241
        BLT.N    ??LPLD_LCD_DrawSquare_1
//  642     return;
??LPLD_LCD_DrawSquare_0:
        B.N      ??LPLD_LCD_DrawSquare_2
//  643   
//  644   if(x0+side_length > MAX_X)
??LPLD_LCD_DrawSquare_1:
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        UXTAH    R0,R7,R5
        CMP      R0,#+320
        BGT.N    ??LPLD_LCD_DrawSquare_2
//  645     return;
//  646   else
//  647     LPLD_LCD_DrawLine(x0,y0,x0+side_length,y0,Line_color);
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
//  648   
//  649   if(y0+side_length > MAX_Y)
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        UXTAH    R0,R7,R6
        CMP      R0,#+241
        BGE.N    ??LPLD_LCD_DrawSquare_2
//  650     return;
//  651   else
//  652     LPLD_LCD_DrawLine(x0,y0,x0,y0+side_length,Line_color);
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
//  653   
//  654   LPLD_LCD_DrawLine(x0+side_length,y0,x0+side_length,y0+side_length,Line_color);
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
//  655   LPLD_LCD_DrawLine(x0,y0+side_length,x0+side_length,y0+side_length,Line_color);
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
//  656   
//  657   for(i=0;i<side_length-1;i++)
        MOVS     R8,#+0
        LDR      R4,[SP, #+32]
        B.N      ??LPLD_LCD_DrawSquare_5
//  658   {
//  659     for(j=0;j<side_length-1;j++)
//  660     {
//  661       LPLD_LCD_SetPoint(x0+1+i,y0+1+j,Fill_color);
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
//  662     }
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
//  663   }
//  664 }
??LPLD_LCD_DrawSquare_8:
??LPLD_LCD_DrawSquare_2:
        POP      {R0,R4-R9,PC}    ;; return
//  665 
//  666 /*
//  667  * LPLD_LCD_DrawRectangle
//  668  * 在指定坐标显示矩形
//  669  * 
//  670  * 参数： 
//  671  *    x0--长方形的起始横坐标 
//  672  *    y0--长方形的起始纵坐标
//  673  *    side_xlength--长
//  674  *    side_ylength--宽
//  675  *    Line_color--长方形边的颜色
//  676  *    Fill_color--长方形整体填充的颜色
//  677  *
//  678  * 输出:
//  679  *    无
//  680  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  681 void LPLD_LCD_DrawRectangle(uint16 x0,uint16 y0,uint16 side_xlength,uint16 side_ylength,uint16 Line_color,uint16 Fill_color)
//  682 {
LPLD_LCD_DrawRectangle:
        PUSH     {R4-R10,LR}
        SUB      SP,SP,#+8
        MOVS     R5,R0
        MOVS     R6,R1
        MOVS     R7,R2
        MOV      R8,R3
//  683   uint16 i,j;
//  684   if(side_xlength > MAX_X || side_ylength > MAX_Y)
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R7,#+320
        BGT.N    ??LPLD_LCD_DrawRectangle_0
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        CMP      R8,#+241
        BLT.N    ??LPLD_LCD_DrawRectangle_1
//  685     return;
??LPLD_LCD_DrawRectangle_0:
        B.N      ??LPLD_LCD_DrawRectangle_2
//  686   
//  687   if(x0+side_xlength > MAX_X)
??LPLD_LCD_DrawRectangle_1:
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        UXTAH    R0,R7,R5
        CMP      R0,#+320
        BGT.N    ??LPLD_LCD_DrawRectangle_2
//  688     return;
??LPLD_LCD_DrawRectangle_3:
        LDR      R4,[SP, #+40]
//  689   else
//  690     LPLD_LCD_DrawLine(x0,y0,x0+side_xlength,y0,Line_color);
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
//  691   
//  692   if(y0+side_ylength > MAX_Y)
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        UXTAH    R0,R8,R6
        CMP      R0,#+241
        BGE.N    ??LPLD_LCD_DrawRectangle_2
//  693     return;
//  694   else
//  695     LPLD_LCD_DrawLine(x0,y0,x0,y0+side_ylength,Line_color);
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
//  696   
//  697   LPLD_LCD_DrawLine(x0+side_xlength,y0,x0+side_xlength,y0+side_ylength,Line_color);
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
//  698   LPLD_LCD_DrawLine(x0,y0+side_ylength,x0+side_xlength,y0+side_ylength,Line_color);
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
//  699   
//  700   for(i=0;i<side_xlength-1;i++)
        MOVS     R9,#+0
        LDR      R4,[SP, #+44]
        B.N      ??LPLD_LCD_DrawRectangle_5
//  701   {
//  702     for(j=0;j<side_ylength-1;j++)
//  703     {
//  704       LPLD_LCD_SetPoint(x0+1+i,y0+1+j,Fill_color);
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
//  705     }
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
//  706   }
//  707 }
??LPLD_LCD_DrawRectangle_8:
??LPLD_LCD_DrawRectangle_2:
        POP      {R0,R1,R4-R10,PC}  ;; return
//  708 
//  709 /*
//  710  * LPLD_LCD_GRAMFillRec
//  711  * 填充指定颜色的矩形到LCD_GRAM
//  712  * 
//  713  * 参数： 
//  714  *    x0--X轴起始坐标
//  715  *    y0--Y轴起始坐标
//  716  *    x1--X轴结束坐标
//  717  *    y1--Y轴结束坐标
//  718  *    Color--16位RGB颜色值
//  719  *
//  720  * 输出:
//  721  *    无
//  722  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  723 void LPLD_LCD_GRAMFillRec(uint16 x0,uint16 y0,uint16 x1,uint16 y1,uint16 Color)
//  724 {          
LPLD_LCD_GRAMFillRec:
        PUSH     {R4-R7}
//  725   uint16 i,j;   
//  726   for(i=y0;i<=y1;i++)
        LDR      R4,[SP, #+16]
        B.N      ??LPLD_LCD_GRAMFillRec_0
//  727   {
//  728     for(j=x0; j<x1; j++)
//  729     {
//  730       LCD_GRAM[MAX_X*MAX_Y - (j-1)*MAX_Y - (i)] = Color;
??LPLD_LCD_GRAMFillRec_1:
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        SUBS     R6,R5,#+1
        MOVS     R7,#+240
        MULS     R6,R7,R6
        RSBS     R6,R6,#+76800
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        SUBS     R6,R6,R1
        LDR.N    R7,??DataTable19_4
        LDR      R7,[R7, #+0]
        STRH     R4,[R7, R6, LSL #+1]
//  731     }    
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
//  732   }
//  733 } 
??LPLD_LCD_GRAMFillRec_3:
        POP      {R4-R7}
        BX       LR               ;; return
//  734 
//  735 /*
//  736  * LPLD_LCD_GRAMDrawHLine
//  737  * 填充指定颜色的横线到LCD_GRAM
//  738  * 
//  739  * 参数： 
//  740  *    x0--X轴起始坐标
//  741  *    y0--Y轴起始坐标
//  742  *    len--横线长度
//  743  *    Color--16位RGB颜色值
//  744  *
//  745  * 输出:
//  746  *    无
//  747  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  748 void LPLD_LCD_GRAMDrawHLine(uint16 x0,uint16 y0,uint16 len,uint16 Color)
//  749 {
LPLD_LCD_GRAMDrawHLine:
        PUSH     {R4-R6}
//  750   uint16 i;
//  751   for(i=0; i<len; i++)
        MOVS     R4,#+0
        B.N      ??LPLD_LCD_GRAMDrawHLine_0
//  752   {
//  753     LCD_GRAM[MAX_X*MAX_Y - (x0+i-1)*MAX_Y - (y0)] = Color;
??LPLD_LCD_GRAMDrawHLine_1:
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        UXTAH    R5,R4,R0
        SUBS     R5,R5,#+1
        MOVS     R6,#+240
        MULS     R5,R6,R5
        RSBS     R5,R5,#+76800
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        SUBS     R5,R5,R1
        LDR.N    R6,??DataTable19_4
        LDR      R6,[R6, #+0]
        STRH     R3,[R6, R5, LSL #+1]
//  754   }
        ADDS     R4,R4,#+1
??LPLD_LCD_GRAMDrawHLine_0:
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        CMP      R4,R2
        BCC.N    ??LPLD_LCD_GRAMDrawHLine_1
//  755 }
        POP      {R4-R6}
        BX       LR               ;; return
//  756 
//  757 /*
//  758  * LPLD_LCD_GRAMDrawHLine
//  759  * 显示一幅指定大小的U8灰度图像
//  760  * 
//  761  * 参数： 
//  762  *    *Color--8位灰度图像数组
//  763  *    w--图像宽
//  764  *    h--图像高
//  765  *
//  766  * 输出:
//  767  *    无
//  768  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  769 void LPLD_LCD_DrawU8Gray(uint8 *Color, uint16 w, uint16 h)
//  770 {
LPLD_LCD_DrawU8Gray:
        PUSH     {R4-R8,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//  771   uint16 i=0, j=0;
        MOVS     R7,#+0
        MOVS     R8,#+0
//  772  
//  773   for(i=0; i<w; i++)
        MOVS     R0,#+0
        MOVS     R7,R0
        B.N      ??LPLD_LCD_DrawU8Gray_0
//  774   {  
//  775     LPLD_LCD_SetCursor(w-i-1, 0); 
//  776     LPLD_LCD_WriteIndex(LPLD_LCD_INFO.Write_GRAM);
//  777     for(j=0; j<h; j++)
//  778     {
//  779       LPLD_LCD_WriteData(LPLD_LCD_U8GRAY2RGB(Color[j*w+i]));
??LPLD_LCD_DrawU8Gray_1:
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        MLA      R0,R5,R8,R7
        LDRB     R0,[R0, R4]
        BL       LPLD_LCD_U8GRAY2RGB
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       LPLD_LCD_WriteData
//  780     }   
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
        LDR.N    R0,??DataTable19_2
        LDRH     R0,[R0, #+2]
        BL       LPLD_LCD_WriteIndex
        MOVS     R8,#+0
        B.N      ??LPLD_LCD_DrawU8Gray_2
//  781   }
//  782 }
??LPLD_LCD_DrawU8Gray_3:
        POP      {R4-R8,PC}       ;; return
//  783 
//  784 /*
//  785  * LPLD_LCD_ShowChar
//  786  * 在指定坐标显示字符
//  787  * 
//  788  * 参数： 
//  789  *    Xpos--X轴坐标
//  790  *    Ypos--Y轴坐标
//  791  *    ASCI--ASCI码
//  792  *    charColor--字符字体颜色
//  793  *    bkColor--字符背景颜色
//  794  *
//  795  * 输出:
//  796  *    无
//  797  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  798 void LPLD_LCD_ShowChar( uint16 Xpos, uint16 Ypos, uint8 ASCI, uint16 charColor, uint16 bkColor )
//  799 {
LPLD_LCD_ShowChar:
        PUSH     {R3-R11,LR}
        MOVS     R5,R0
        MOVS     R6,R1
        MOVS     R7,R2
        MOV      R8,R3
//  800   uint16 i, j;
//  801   uint8 tmp_char;
//  802   for( i=0; i<16; i++ )
        MOVS     R9,#+0
        LDR      R4,[SP, #+40]
        B.N      ??LPLD_LCD_ShowChar_0
??LPLD_LCD_ShowChar_1:
        ADDS     R9,R9,#+1
??LPLD_LCD_ShowChar_0:
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        CMP      R9,#+16
        BGE.N    ??LPLD_LCD_ShowChar_2
//  803   {
//  804     tmp_char = asc2_1608[ASCI-32][i];
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        LDR.N    R0,??DataTable19_5
        ADDS     R0,R0,R7, LSL #+4
        ADDS     R0,R9,R0
        SUBS     R0,R0,#+512
        LDRB     R10,[R0, #+0]
//  805     for( j=0; j<8; j++ )
        MOVS     R11,#+0
        B.N      ??LPLD_LCD_ShowChar_3
//  806     {
//  807       if( (tmp_char >> j) & 0x01 == 0x01 )
//  808       {
//  809         LPLD_LCD_SetPoint( Xpos + j, Ypos + i, charColor );  /* 字符颜色 */
//  810       }
//  811       else
//  812       {
//  813         LPLD_LCD_SetPoint( Xpos + j, Ypos + i, bkColor );  /* 背景颜色 */
??LPLD_LCD_ShowChar_4:
        MOVS     R2,R4
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        ADDS     R1,R9,R6
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ADDS     R0,R11,R5
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       LPLD_LCD_SetPoint
//  814       }
??LPLD_LCD_ShowChar_5:
        ADDS     R11,R11,#+1
??LPLD_LCD_ShowChar_3:
        UXTH     R11,R11          ;; ZeroExt  R11,R11,#+16,#+16
        CMP      R11,#+8
        BGE.N    ??LPLD_LCD_ShowChar_1
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        ASRS     R0,R10,R11
        LSLS     R0,R0,#+31
        BPL.N    ??LPLD_LCD_ShowChar_4
        MOV      R2,R8
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        ADDS     R1,R9,R6
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ADDS     R0,R11,R5
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       LPLD_LCD_SetPoint
        B.N      ??LPLD_LCD_ShowChar_5
//  815     }
//  816   }
//  817 }
??LPLD_LCD_ShowChar_2:
        POP      {R0,R4-R11,PC}   ;; return
//  818 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  819 uint32 mypow(uint8 m,uint8 n)
//  820 {
//  821 	uint32 result=1;	 
mypow:
        MOVS     R2,#+1
        B.N      ??mypow_0
//  822 	while(n--)result*=m;    
??mypow_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MULS     R2,R0,R2
??mypow_0:
        MOVS     R3,R1
        SUBS     R1,R3,#+1
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        CMP      R3,#+0
        BNE.N    ??mypow_1
//  823 	return result;
        MOVS     R0,R2
        BX       LR               ;; return
//  824 }
//  825 
//  826 /*
//  827  * LPLD_LCD_ShowNum
//  828  * 在指定坐标显示数字
//  829  * 
//  830  * 参数： 
//  831  *    Xpos--X轴坐标
//  832  *    Ypos--Y轴坐标
//  833  *    num--数字
//  834  *    len--数字长度
//  835  *    charColor--字符字体颜色
//  836  *    bkColor--字符背景颜色
//  837  *
//  838  * 输出:
//  839  *    无
//  840  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  841 void LPLD_LCD_ShowNum(uint16 Xpos, uint16 Ypos, uint16 num, uint8 len, uint16 charColor, uint16 bkColor )
//  842 {         	
LPLD_LCD_ShowNum:
        PUSH     {R4-R10,LR}
        SUB      SP,SP,#+8
        MOVS     R6,R0
        MOVS     R7,R1
        MOV      R8,R2
        MOV      R9,R3
//  843   uint8 t,temp;						   
//  844   for(t=0;t<len;t++)
        MOVS     R10,#+0
        LDR      R4,[SP, #+40]
        LDR      R5,[SP, #+44]
        B.N      ??LPLD_LCD_ShowNum_0
//  845   {
//  846     temp=(num/mypow(10,len-t-1))%10;
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
//  847     LPLD_LCD_ShowChar(Xpos+(8)*t,Ypos,temp+'0',charColor,bkColor); 
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
//  848     CurX = CurX + 8;  
        LDR.N    R0,??DataTable19_6
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+8
        LDR.N    R1,??DataTable19_6
        STRH     R0,[R1, #+0]
//  849   }
        ADDS     R10,R10,#+1
??LPLD_LCD_ShowNum_0:
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        CMP      R10,R9
        BCC.N    ??LPLD_LCD_ShowNum_1
//  850 } 
        POP      {R0,R1,R4-R10,PC}  ;; return
//  851 
//  852 /*
//  853  * LPLD_LCD_ShowString
//  854  * 在指定坐标显示字符串
//  855  * 
//  856  * 参数： 
//  857  *    Xpos--X轴坐标
//  858  *    Ypos--Y轴坐标
//  859  *    *str--字符串
//  860  *    strColor--字符串字体颜色
//  861  *    bkColor--字符背景颜色
//  862  *
//  863  * 输出:
//  864  *    无
//  865  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  866 void LPLD_LCD_ShowString(uint16 Xpos, uint16 Ypos, uint8 *str,uint16 strColor, uint16 bkColor)
//  867 {
LPLD_LCD_ShowString:
        PUSH     {R4-R8,LR}
        SUB      SP,SP,#+8
        MOVS     R7,R0
        MOV      R8,R1
        MOVS     R6,R2
        MOVS     R5,R3
        LDR      R4,[SP, #+32]
//  868   uint8 TempChar;
//  869   do
//  870   {
//  871     TempChar = *str++;  
??LPLD_LCD_ShowString_0:
        LDRB     R2,[R6, #+0]
        ADDS     R6,R6,#+1
//  872     LPLD_LCD_ShowChar( Xpos, Ypos, TempChar, strColor, bkColor );    
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
//  873     if( Xpos <= MAX_X - 8 )
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R7,#+312
        BGT.N    ??LPLD_LCD_ShowString_1
//  874     {
//  875       Xpos += 8;
        ADDS     R7,R7,#+8
        B.N      ??LPLD_LCD_ShowString_2
//  876     } 
//  877     else if ( Ypos <= MAX_Y - 16 )
??LPLD_LCD_ShowString_1:
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        CMP      R8,#+225
        BGE.N    ??LPLD_LCD_ShowString_3
//  878     {
//  879       Xpos = 0;
        MOVS     R7,#+0
//  880       Ypos += 16;
        ADDS     R8,R8,#+16
        B.N      ??LPLD_LCD_ShowString_2
//  881     }   
//  882     else
//  883     {
//  884       Xpos = 0;
??LPLD_LCD_ShowString_3:
        MOVS     R7,#+0
//  885       Ypos = 0;
        MOVS     R8,#+0
//  886     } 
//  887     CurX = CurX + 8;  
??LPLD_LCD_ShowString_2:
        LDR.N    R0,??DataTable19_6
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+8
        LDR.N    R1,??DataTable19_6
        STRH     R0,[R1, #+0]
//  888   }
//  889   while ( *str != 0 );
        LDRB     R0,[R6, #+0]
        CMP      R0,#+0
        BNE.N    ??LPLD_LCD_ShowString_0
//  890 }
        POP      {R0,R1,R4-R8,PC}  ;; return
//  891 
//  892 /*
//  893  * LPLD_LCD_PrintStringLine
//  894  * 另起一行显示字符串
//  895  * 
//  896  * 参数： 
//  897  *    *str--字符串
//  898  *    strColor--字符串字体颜色
//  899  *    bkColor--字符背景颜色
//  900  *
//  901  * 输出:
//  902  *    无
//  903  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  904 void LPLD_LCD_PrintStringLine(uint8 *str,uint16 strColor, uint16 bkColor)
//  905 {
LPLD_LCD_PrintStringLine:
        PUSH     {R4,LR}
        SUB      SP,SP,#+8
//  906   CurX = 0;
        MOVS     R3,#+0
        LDR.N    R4,??DataTable19_6
        STRH     R3,[R4, #+0]
//  907   LPLD_LCD_ShowString(0, CurY*18, str, strColor, bkColor);
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        STR      R2,[SP, #+0]
        MOVS     R3,R1
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        MOVS     R2,R0
        LDR.N    R0,??DataTable19_7
        LDRH     R0,[R0, #+0]
        MOVS     R1,#+18
        SMULBB   R1,R0,R1
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,#+0
        BL       LPLD_LCD_ShowString
//  908   CurY++;
        LDR.N    R0,??DataTable19_7
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable19_7
        STRH     R0,[R1, #+0]
//  909   if((CurY+1)*18>MAX_Y)
        LDR.N    R0,??DataTable19_7
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        MOVS     R1,#+18
        MULS     R0,R1,R0
        CMP      R0,#+241
        BLT.N    ??LPLD_LCD_PrintStringLine_0
//  910   {
//  911     CurY=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable19_7
        STRH     R0,[R1, #+0]
//  912   }
//  913 }
??LPLD_LCD_PrintStringLine_0:
        POP      {R0,R1,R4,PC}    ;; return
//  914 
//  915 /*
//  916  * LPLD_LCD_PrintString
//  917  * 接着当前行显示字符串
//  918  * 
//  919  * 参数： 
//  920  *    *str--字符串
//  921  *    strColor--字符串字体颜色
//  922  *    bkColor--字符背景颜色
//  923  *
//  924  * 输出:
//  925  *    无
//  926  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  927 void LPLD_LCD_PrintString(uint8 *str,uint16 Color, uint16 bkColor)
//  928 {
LPLD_LCD_PrintString:
        PUSH     {R7,LR}
//  929   LPLD_LCD_ShowString(CurX, (CurY-1)*18, str, Color, bkColor);
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        STR      R2,[SP, #+0]
        MOVS     R3,R1
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        MOVS     R2,R0
        LDR.N    R0,??DataTable19_7
        LDRH     R0,[R0, #+0]
        SUBS     R0,R0,#+1
        MOVS     R1,#+18
        SMULBB   R1,R0,R1
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LDR.N    R0,??DataTable19_6
        LDRH     R0,[R0, #+0]
        BL       LPLD_LCD_ShowString
//  930 }
        POP      {R0,PC}          ;; return
//  931 
//  932 /*
//  933  * LPLD_LCD_PrintNumLine
//  934  * 另起一行显示数字
//  935  * 
//  936  * 参数： 
//  937  *    num--数字
//  938  *    len--数字长度
//  939  *    numColor--字符字体颜色
//  940  *    bkColor--字符背景颜色
//  941  *
//  942  * 输出:
//  943  *    无
//  944  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  945 void LPLD_LCD_PrintNumLine(uint16 num,uint8 len,uint16 numColor, uint16 bkColor)
//  946 {
LPLD_LCD_PrintNumLine:
        PUSH     {R4,R5,LR}
        SUB      SP,SP,#+12
//  947   CurX = 0;
        MOVS     R4,#+0
        LDR.N    R5,??DataTable19_6
        STRH     R4,[R5, #+0]
//  948   LPLD_LCD_ShowNum(0, CurY*18, num, len, numColor, bkColor);
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        STR      R3,[SP, #+4]
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        STR      R2,[SP, #+0]
        MOVS     R3,R1
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        MOVS     R2,R0
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        LDR.N    R0,??DataTable19_7
        LDRH     R0,[R0, #+0]
        MOVS     R1,#+18
        SMULBB   R1,R0,R1
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,#+0
        BL       LPLD_LCD_ShowNum
//  949   CurY++;
        LDR.N    R0,??DataTable19_7
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable19_7
        STRH     R0,[R1, #+0]
//  950   if((CurY+1)*18>MAX_Y)
        LDR.N    R0,??DataTable19_7
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        MOVS     R1,#+18
        MULS     R0,R1,R0
        CMP      R0,#+241
        BLT.N    ??LPLD_LCD_PrintNumLine_0
//  951   {
//  952     CurY=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable19_7
        STRH     R0,[R1, #+0]
//  953   }
//  954 }
??LPLD_LCD_PrintNumLine_0:
        POP      {R0-R2,R4,R5,PC}  ;; return
//  955 
//  956 /*
//  957  * LPLD_LCD_PrintNum
//  958  * 接着当前行显示数字
//  959  * 
//  960  * 参数： 
//  961  *    num--数字
//  962  *    len--数字长度
//  963  *    numColor--字符字体颜色
//  964  *    bkColor--字符背景颜色
//  965  *
//  966  * 输出:
//  967  *    无
//  968  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  969 void LPLD_LCD_PrintNum(uint16 num,uint8 len,uint16 Color, uint16 bkColor)
//  970 {
LPLD_LCD_PrintNum:
        PUSH     {LR}
        SUB      SP,SP,#+12
//  971   LPLD_LCD_ShowNum(CurX, (CurY-1)*18, num,len, Color, bkColor);
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        STR      R3,[SP, #+4]
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        STR      R2,[SP, #+0]
        MOVS     R3,R1
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        MOVS     R2,R0
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        LDR.N    R0,??DataTable19_7
        LDRH     R0,[R0, #+0]
        SUBS     R0,R0,#+1
        MOVS     R1,#+18
        SMULBB   R1,R0,R1
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LDR.N    R0,??DataTable19_6
        LDRH     R0,[R0, #+0]
        BL       LPLD_LCD_ShowNum
//  972 }
        POP      {R0-R2,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable19:
        DC32     0x400ff080

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable19_1:
        DC32     0x60010000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable19_2:
        DC32     LPLD_LCD_INFO

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable19_3:
        DC32     0x43fe1030

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable19_4:
        DC32     LCD_GRAM

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable19_5:
        DC32     asc2_1608

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable19_6:
        DC32     CurX

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable19_7:
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
//  973 
//  974 
// 
//    20 bytes in section .bss
// 1 520 bytes in section .rodata
// 3 290 bytes in section .text
// 
// 3 290 bytes of CODE  memory
// 1 520 bytes of CONST memory
//    20 bytes of DATA  memory
//
//Errors: none
//Warnings: 1
