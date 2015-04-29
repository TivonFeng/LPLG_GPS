///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.1.6676/W32 for ARM       25/Apr/2015  16:14:30
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  G:\test\LPLD_OSKinetis_V3_now02\lib\SQC\SQC_UM220.c
//    Command line =  
//        G:\test\LPLD_OSKinetis_V3_now02\lib\SQC\SQC_UM220.c -D LPLD_K60 -lCN
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
//        G:\test\LPLD_OSKinetis_V3_now02\project\LPLD_OV7670\iar\FLASH\List\SQC_UM220.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN LPLD_LCD_ShowStringno
        EXTERN LPLD_UART_PutCharArr
        EXTERN printf
        EXTERN sprintf
        EXTERN strlen

        PUBLIC Getpointer_buf
        PUBLIC Getpointer_pos
        PUBLIC Getpointer_vtg
        PUBLIC SQC_UM220_Init
        PUBLIC SQC_UM220_Recog
        PUBLIC SQC_UM220_Req
        PUBLIC SQC_UM220_Reset
        PUBLIC SQC_UM220_Time
        PUBLIC SQC_UM220_save
        PUBLIC gps_buf
        PUBLIC gps_pos
        PUBLIC gps_vtg
        PUBLIC gps_zda

// G:\test\LPLD_OSKinetis_V3_now02\lib\SQC\SQC_UM220.c
//    1 /**
//    2  * @file SQC_UM220.h
//    3  * @version 1.0[By Tivon]
//    4  * @date 2015-04-16
//    5  * @brief UM220 GPS 模块相关函数
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
//   21 
//   22 #include "common.h"
//   23 #include "SQC_UM220.h"
//   24 #include "HW_UART.h"
//   25 #include "DEV_LCD.h"

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   26 struct UM220_POS gps_pos;
gps_pos:
        DS8 92

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   27 struct UM220_VTG gps_vtg;
gps_vtg:
        DS8 32

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   28 struct UM220_BUF gps_buf;
gps_buf:
        DS8 1028

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   29 struct UM220_ZDA gps_zda;
gps_zda:
        DS8 32
//   30 
//   31 
//   32 //初始化gps模块得到位置信息

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   33 uint8 SQC_UM220_Init()
//   34 {
SQC_UM220_Init:
        PUSH     {LR}
        SUB      SP,SP,#+52
//   35   
//   36   uint8 recv[50];
//   37   sprintf(recv,"$CFGMSG,0,0,0\r\n");
        LDR.W    R1,??DataTable8_3
        ADD      R0,SP,#+0
        BL       sprintf
//   38   LPLD_UART_PutCharArr(UART3, recv,strlen(recv));//gps的串口
        ADD      R0,SP,#+0
        BL       strlen
        MOVS     R2,R0
        ADD      R1,SP,#+0
        LDR.W    R0,??DataTable8_4  ;; 0x4006d000
        BL       LPLD_UART_PutCharArr
//   39   sprintf(recv,"$CFGMSG,0,1,0\r\n");
        LDR.W    R1,??DataTable8_5
        ADD      R0,SP,#+0
        BL       sprintf
//   40   LPLD_UART_PutCharArr(UART3, recv,strlen(recv));
        ADD      R0,SP,#+0
        BL       strlen
        MOVS     R2,R0
        ADD      R1,SP,#+0
        LDR.W    R0,??DataTable8_4  ;; 0x4006d000
        BL       LPLD_UART_PutCharArr
//   41   sprintf(recv,"$CFGMSG,0,2,0\r\n");
        LDR.W    R1,??DataTable8_6
        ADD      R0,SP,#+0
        BL       sprintf
//   42   LPLD_UART_PutCharArr(UART3, recv,strlen(recv));
        ADD      R0,SP,#+0
        BL       strlen
        MOVS     R2,R0
        ADD      R1,SP,#+0
        LDR.W    R0,??DataTable8_4  ;; 0x4006d000
        BL       LPLD_UART_PutCharArr
//   43   sprintf(recv,"$CFGMSG,0,3,0\r\n");
        LDR.W    R1,??DataTable8_7
        ADD      R0,SP,#+0
        BL       sprintf
//   44   LPLD_UART_PutCharArr(UART3, recv,strlen(recv));
        ADD      R0,SP,#+0
        BL       strlen
        MOVS     R2,R0
        ADD      R1,SP,#+0
        LDR.W    R0,??DataTable8_4  ;; 0x4006d000
        BL       LPLD_UART_PutCharArr
//   45   sprintf(recv,"$CFGMSG,0,4,0\r\n");
        LDR.W    R1,??DataTable8_8
        ADD      R0,SP,#+0
        BL       sprintf
//   46   LPLD_UART_PutCharArr(UART3, recv,strlen(recv));
        ADD      R0,SP,#+0
        BL       strlen
        MOVS     R2,R0
        ADD      R1,SP,#+0
        LDR.W    R0,??DataTable8_4  ;; 0x4006d000
        BL       LPLD_UART_PutCharArr
//   47   sprintf(recv,"$CFGMSG,0,5,8\r\n");
        LDR.W    R1,??DataTable8_9
        ADD      R0,SP,#+0
        BL       sprintf
//   48   LPLD_UART_PutCharArr(UART3, recv,strlen(recv));
        ADD      R0,SP,#+0
        BL       strlen
        MOVS     R2,R0
        ADD      R1,SP,#+0
        LDR.W    R0,??DataTable8_4  ;; 0x4006d000
        BL       LPLD_UART_PutCharArr
//   49   return 0 ;
        MOVS     R0,#+0
        ADD      SP,SP,#+52
        POP      {PC}             ;; return
//   50 }
//   51 
//   52 
//   53 //软件复位

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   54 uint8 SQC_UM220_Reset()
//   55 {
SQC_UM220_Reset:
        PUSH     {LR}
        SUB      SP,SP,#+52
//   56   uint8 recv[50];
//   57   sprintf(recv,"$RESET,0,0xFF0\r\n");
        LDR.W    R1,??DataTable8_10
        ADD      R0,SP,#+0
        BL       sprintf
//   58   LPLD_UART_PutCharArr(UART3, recv,strlen(recv));
        ADD      R0,SP,#+0
        BL       strlen
        MOVS     R2,R0
        ADD      R1,SP,#+0
        LDR.W    R0,??DataTable8_4  ;; 0x4006d000
        BL       LPLD_UART_PutCharArr
//   59   return 0;
        MOVS     R0,#+0
        ADD      SP,SP,#+52
        POP      {PC}             ;; return
//   60 }
//   61 //信息头解析

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   62  uint8 SQC_UM220_Recog()
//   63 {
//   64  
//   65   if(gps_buf.gps_Rxbuf[0]=='$'&&gps_buf.gps_Rxbuf[1]=='N'&&gps_buf.gps_Rxbuf[2]=='A'
//   66      &&gps_buf.gps_Rxbuf[3]=='V'&&gps_buf.gps_Rxbuf[4]=='P'&&gps_buf.gps_Rxbuf[5]=='O'
//   67        &&gps_buf.gps_Rxbuf[6]=='S')
SQC_UM220_Recog:
        LDR.W    R0,??DataTable8_11
        LDRSB    R0,[R0, #+0]
        CMP      R0,#+36
        BNE.N    ??SQC_UM220_Recog_0
        LDR.W    R0,??DataTable8_11
        LDRSB    R0,[R0, #+1]
        CMP      R0,#+78
        BNE.N    ??SQC_UM220_Recog_0
        LDR.W    R0,??DataTable8_11
        LDRSB    R0,[R0, #+2]
        CMP      R0,#+65
        BNE.N    ??SQC_UM220_Recog_0
        LDR.W    R0,??DataTable8_11
        LDRSB    R0,[R0, #+3]
        CMP      R0,#+86
        BNE.N    ??SQC_UM220_Recog_0
        LDR.W    R0,??DataTable8_11
        LDRSB    R0,[R0, #+4]
        CMP      R0,#+80
        BNE.N    ??SQC_UM220_Recog_0
        LDR.W    R0,??DataTable8_11
        LDRSB    R0,[R0, #+5]
        CMP      R0,#+79
        BNE.N    ??SQC_UM220_Recog_0
        LDR.W    R0,??DataTable8_11
        LDRSB    R0,[R0, #+6]
        CMP      R0,#+83
        BNE.N    ??SQC_UM220_Recog_0
//   68     return 1;
        MOVS     R0,#+1
        B.N      ??SQC_UM220_Recog_1
//   69   if(gps_buf.gps_Rxbuf[0]=='$'&&gps_buf.gps_Rxbuf[1]=='G'&&gps_buf.gps_Rxbuf[2]=='N'
//   70      &&gps_buf.gps_Rxbuf[3]=='V'&&gps_buf.gps_Rxbuf[4]=='T'&&gps_buf.gps_Rxbuf[5]=='G')
??SQC_UM220_Recog_0:
        LDR.W    R0,??DataTable8_11
        LDRSB    R0,[R0, #+0]
        CMP      R0,#+36
        BNE.N    ??SQC_UM220_Recog_2
        LDR.W    R0,??DataTable8_11
        LDRSB    R0,[R0, #+1]
        CMP      R0,#+71
        BNE.N    ??SQC_UM220_Recog_2
        LDR.W    R0,??DataTable8_11
        LDRSB    R0,[R0, #+2]
        CMP      R0,#+78
        BNE.N    ??SQC_UM220_Recog_2
        LDR.W    R0,??DataTable8_11
        LDRSB    R0,[R0, #+3]
        CMP      R0,#+86
        BNE.N    ??SQC_UM220_Recog_2
        LDR.W    R0,??DataTable8_11
        LDRSB    R0,[R0, #+4]
        CMP      R0,#+84
        BNE.N    ??SQC_UM220_Recog_2
        LDR.W    R0,??DataTable8_11
        LDRSB    R0,[R0, #+5]
        CMP      R0,#+71
        BNE.N    ??SQC_UM220_Recog_2
//   71   return 2;
        MOVS     R0,#+2
        B.N      ??SQC_UM220_Recog_1
//   72   if(gps_buf.gps_Rxbuf[0]=='$'&&gps_buf.gps_Rxbuf[1]=='G'&&gps_buf.gps_Rxbuf[2]=='N'
//   73      &&gps_buf.gps_Rxbuf[3]=='Z'&&gps_buf.gps_Rxbuf[4]=='D'&&gps_buf.gps_Rxbuf[5]=='A')
??SQC_UM220_Recog_2:
        LDR.W    R0,??DataTable8_11
        LDRSB    R0,[R0, #+0]
        CMP      R0,#+36
        BNE.N    ??SQC_UM220_Recog_3
        LDR.W    R0,??DataTable8_11
        LDRSB    R0,[R0, #+1]
        CMP      R0,#+71
        BNE.N    ??SQC_UM220_Recog_3
        LDR.W    R0,??DataTable8_11
        LDRSB    R0,[R0, #+2]
        CMP      R0,#+78
        BNE.N    ??SQC_UM220_Recog_3
        LDR.W    R0,??DataTable8_11
        LDRSB    R0,[R0, #+3]
        CMP      R0,#+90
        BNE.N    ??SQC_UM220_Recog_3
        LDR.W    R0,??DataTable8_11
        LDRSB    R0,[R0, #+4]
        CMP      R0,#+68
        BNE.N    ??SQC_UM220_Recog_3
        LDR.N    R0,??DataTable8_11
        LDRSB    R0,[R0, #+5]
        CMP      R0,#+65
        BNE.N    ??SQC_UM220_Recog_3
//   74     return 3;
        MOVS     R0,#+3
        B.N      ??SQC_UM220_Recog_1
//   75   
//   76 }
??SQC_UM220_Recog_3:
??SQC_UM220_Recog_1:
        BX       LR               ;; return
//   77 //信息打印

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   78 uint8 SQC_UM220_Req()
//   79 {
SQC_UM220_Req:
        PUSH     {R4-R6,LR}
        SUB      SP,SP,#+56
//   80   int8 i=0,j=1,k=0;
        MOVS     R4,#+0
        MOVS     R5,#+1
        MOVS     R6,#+0
//   81   uint8 recv[50],t1;
//   82  
//   83   switch(SQC_UM220_Recog())
        BL       SQC_UM220_Recog
        CMP      R0,#+1
        BEQ.N    ??SQC_UM220_Req_0
        BCC.W    ??SQC_UM220_Req_1
        CMP      R0,#+3
        BEQ.W    ??SQC_UM220_Req_2
        BCC.W    ??SQC_UM220_Req_3
        B.N      ??SQC_UM220_Req_1
//   84   {
//   85     
//   86   case 1:
//   87     SQC_UM220_save(gps_pos.lat,8,-1);
??SQC_UM220_Req_0:
        MOVS     R2,#-1
        MOVS     R1,#+8
        LDR.N    R0,??DataTable8_12
        BL       SQC_UM220_save
//   88     SQC_UM220_save(gps_pos.lon,9,-1);
        MOVS     R2,#-1
        MOVS     R1,#+9
        LDR.N    R0,??DataTable8_13
        BL       SQC_UM220_save
//   89     SQC_UM220_save(gps_pos.height,10,-1);
        MOVS     R2,#-1
        MOVS     R1,#+10
        LDR.N    R0,??DataTable8_14
        BL       SQC_UM220_save
//   90     if(gps_pos.lat[0]=='-')
        LDR.N    R0,??DataTable8_12
        LDRSB    R0,[R0, #+0]
        CMP      R0,#+45
        BNE.N    ??SQC_UM220_Req_4
//   91     {
//   92        sprintf(gps_pos.lat,"%s",gps_pos.lat);
        LDR.N    R2,??DataTable8_12
        ADR.N    R1,??DataTable8  ;; 0x25, 0x73, 0x00, 0x00
        LDR.N    R0,??DataTable8_12
        BL       sprintf
//   93        //printf("北纬 is %s°C\n",gps_pos.lat);
//   94       LPLD_LCD_ShowStringno(100,120,"N",0x00ff);
        MOVS     R3,#+255
        ADR.N    R2,??DataTable4  ;; "N"
        MOVS     R1,#+120
        MOVS     R0,#+100
        BL       LPLD_LCD_ShowStringno
//   95       LPLD_LCD_ShowStringno(120,120,gps_pos.lat,0x00ff);
        MOVS     R3,#+255
        LDR.N    R2,??DataTable8_12
        MOVS     R1,#+120
        MOVS     R0,#+120
        BL       LPLD_LCD_ShowStringno
        B.N      ??SQC_UM220_Req_5
//   96      }
//   97     else
//   98     {
//   99        sprintf(gps_pos.lat,"%s",gps_pos.lat);
??SQC_UM220_Req_4:
        LDR.N    R2,??DataTable8_12
        ADR.N    R1,??DataTable8  ;; 0x25, 0x73, 0x00, 0x00
        LDR.N    R0,??DataTable8_12
        BL       sprintf
//  100        //printf("南纬 is %s°C\n",gps_pos.lat);
//  101         LPLD_LCD_ShowStringno(100,120,"S",0x00ff);
        MOVS     R3,#+255
        ADR.N    R2,??DataTable7  ;; "S"
        MOVS     R1,#+120
        MOVS     R0,#+100
        BL       LPLD_LCD_ShowStringno
//  102       LPLD_LCD_ShowStringno(120,120,gps_pos.lat,0x00ff);
        MOVS     R3,#+255
        LDR.N    R2,??DataTable8_12
        MOVS     R1,#+120
        MOVS     R0,#+120
        BL       LPLD_LCD_ShowStringno
//  103      }
//  104     if(gps_pos.lon[0]=='-')
??SQC_UM220_Req_5:
        LDR.N    R0,??DataTable8_12
        LDRSB    R0,[R0, #+30]
        CMP      R0,#+45
        BNE.N    ??SQC_UM220_Req_6
//  105     {
//  106        sprintf(gps_pos.lon,"%s",gps_pos.lon);
        LDR.N    R2,??DataTable8_13
        ADR.N    R1,??DataTable8  ;; 0x25, 0x73, 0x00, 0x00
        LDR.N    R0,??DataTable8_13
        BL       sprintf
//  107        //printf("西经 is %s°C\n",gps_pos.lon);
//  108         LPLD_LCD_ShowStringno(100,140,"W",0x00ff);
        MOVS     R3,#+255
        ADR.N    R2,??DataTable8_1  ;; "W"
        MOVS     R1,#+140
        MOVS     R0,#+100
        BL       LPLD_LCD_ShowStringno
//  109       LPLD_LCD_ShowStringno(120,140,gps_pos.lon,0x00ff);
        MOVS     R3,#+255
        LDR.N    R2,??DataTable8_13
        MOVS     R1,#+140
        MOVS     R0,#+120
        BL       LPLD_LCD_ShowStringno
        B.N      ??SQC_UM220_Req_7
//  110     }
//  111     else
//  112     {
//  113        sprintf(gps_pos.lat,"%s",gps_pos.lon);
??SQC_UM220_Req_6:
        LDR.N    R2,??DataTable8_13
        ADR.N    R1,??DataTable8  ;; 0x25, 0x73, 0x00, 0x00
        LDR.N    R0,??DataTable8_12
        BL       sprintf
//  114       // printf("东经 is %s°C\n",gps_pos.lon);
//  115           LPLD_LCD_ShowStringno(100,140,"E",0x00ff);
        MOVS     R3,#+255
        ADR.N    R2,??DataTable8_2  ;; "E"
        MOVS     R1,#+140
        MOVS     R0,#+100
        BL       LPLD_LCD_ShowStringno
//  116       LPLD_LCD_ShowStringno(120,140,gps_pos.lon,0x00ff);
        MOVS     R3,#+255
        LDR.N    R2,??DataTable8_13
        MOVS     R1,#+140
        MOVS     R0,#+120
        BL       LPLD_LCD_ShowStringno
//  117     }   
//  118     gps_buf.gps_buf_len=0; 
??SQC_UM220_Req_7:
        MOVS     R0,#+0
        LDR.N    R1,??DataTable8_11
        STRH     R0,[R1, #+1024]
//  119     
//  120     sprintf(gps_pos.height,"%s",gps_pos.height);
        LDR.N    R2,??DataTable8_14
        ADR.N    R1,??DataTable8  ;; 0x25, 0x73, 0x00, 0x00
        LDR.N    R0,??DataTable8_14
        BL       sprintf
//  121     printf("高度 is %s 米\n",gps_pos.height);
        LDR.N    R1,??DataTable8_14
        LDR.N    R0,??DataTable8_15
        BL       printf
//  122     sprintf(recv,"$CFGMSG,1,0,0\r\n");
        LDR.N    R1,??DataTable8_16
        ADD      R0,SP,#+0
        BL       sprintf
//  123     LPLD_UART_PutCharArr(UART3, recv,strlen(recv)); 
        ADD      R0,SP,#+0
        BL       strlen
        MOVS     R2,R0
        ADD      R1,SP,#+0
        LDR.N    R0,??DataTable8_4  ;; 0x4006d000
        BL       LPLD_UART_PutCharArr
//  124     sprintf(recv,"$CFGMSG,0,5,5\r\n");
        LDR.N    R1,??DataTable8_17
        ADD      R0,SP,#+0
        BL       sprintf
//  125     LPLD_UART_PutCharArr(UART3, recv,strlen(recv));
        ADD      R0,SP,#+0
        BL       strlen
        MOVS     R2,R0
        ADD      R1,SP,#+0
        LDR.N    R0,??DataTable8_4  ;; 0x4006d000
        BL       LPLD_UART_PutCharArr
//  126     break;
//  127     
//  128   case 2:
//  129     SQC_UM220_save(gps_vtg.cogm,2,-1);
//  130     SQC_UM220_save(gps_vtg.kph,8,-1);
//  131     sprintf(gps_vtg.cogm,"%s",gps_vtg.cogm);
//  132     sprintf(gps_vtg.kph,"%s",gps_vtg.kph);
//  133     //printf("速度 %s km/h\n",gps_vtg.kph);
//  134     //printf("方向 %s°C\n",gps_vtg.cogm);
//  135      LPLD_LCD_ShowStringno(100,80,"speed is",0x00ff);
//  136     LPLD_LCD_ShowStringno(170,80,gps_vtg.kph,0x00ff);
//  137      LPLD_LCD_ShowStringno(100,100,"dir is",0x00ff);
//  138     LPLD_LCD_ShowStringno(160,100,gps_vtg.cogm,0x00ff);
//  139     gps_buf.gps_buf_len=0; 
//  140     sprintf(recv,"$CFGMSG,0,5,0\r\n");
//  141     LPLD_UART_PutCharArr(UART3, recv,strlen(recv));
//  142     sprintf(recv,"$CFGMSG,0,6,5\r\n");
//  143     LPLD_UART_PutCharArr(UART3, recv,strlen(recv));
//  144     break;
//  145     
//  146   case 3:
//  147     SQC_UM220_save(gps_zda.time,2,4);
//  148     SQC_UM220_Time(gps_zda.time);
//  149     sprintf(gps_zda.time,"%s",gps_zda.time); 
//  150     //printf("time is %s\n",gps_zda.time);
//  151     LPLD_LCD_ShowStringno(100,60,"time is",0x00ff);
//  152     LPLD_LCD_ShowStringno(160,60,gps_zda.time,0x00ff);
//  153     gps_buf.gps_buf_len=0;
//  154     sprintf(recv,"$CFGMSG,0,6,0\r\n");
//  155     LPLD_UART_PutCharArr(UART3, recv,strlen(recv));
//  156     sprintf(recv,"$CFGMSG,1,0,5\r\n");
//  157     LPLD_UART_PutCharArr(UART3, recv,strlen(recv));
//  158     break;
//  159   default:
//  160     return 0;
//  161     
//  162   }
//  163      
//  164 }
??SQC_UM220_Req_8:
??SQC_UM220_Req_9:
        ADD      SP,SP,#+56
        POP      {R4-R6,PC}       ;; return
??SQC_UM220_Req_3:
        MOVS     R2,#-1
        MOVS     R1,#+2
        LDR.N    R0,??DataTable8_18
        BL       SQC_UM220_save
        MOVS     R2,#-1
        MOVS     R1,#+8
        LDR.N    R0,??DataTable8_19
        BL       SQC_UM220_save
        LDR.N    R2,??DataTable8_18
        ADR.N    R1,??DataTable8  ;; 0x25, 0x73, 0x00, 0x00
        LDR.N    R0,??DataTable8_18
        BL       sprintf
        LDR.N    R2,??DataTable8_19
        ADR.N    R1,??DataTable8  ;; 0x25, 0x73, 0x00, 0x00
        LDR.N    R0,??DataTable8_19
        BL       sprintf
        MOVS     R3,#+255
        LDR.N    R2,??DataTable8_20
        MOVS     R1,#+80
        MOVS     R0,#+100
        BL       LPLD_LCD_ShowStringno
        MOVS     R3,#+255
        LDR.N    R2,??DataTable8_19
        MOVS     R1,#+80
        MOVS     R0,#+170
        BL       LPLD_LCD_ShowStringno
        MOVS     R3,#+255
        LDR.N    R2,??DataTable8_21
        MOVS     R1,#+100
        MOVS     R0,#+100
        BL       LPLD_LCD_ShowStringno
        MOVS     R3,#+255
        LDR.N    R2,??DataTable8_18
        MOVS     R1,#+100
        MOVS     R0,#+160
        BL       LPLD_LCD_ShowStringno
        MOVS     R0,#+0
        LDR.N    R1,??DataTable8_11
        STRH     R0,[R1, #+1024]
        LDR.N    R1,??DataTable8_22
        ADD      R0,SP,#+0
        BL       sprintf
        ADD      R0,SP,#+0
        BL       strlen
        MOVS     R2,R0
        ADD      R1,SP,#+0
        LDR.N    R0,??DataTable8_4  ;; 0x4006d000
        BL       LPLD_UART_PutCharArr
        LDR.N    R1,??DataTable8_23
        ADD      R0,SP,#+0
        BL       sprintf
        ADD      R0,SP,#+0
        BL       strlen
        MOVS     R2,R0
        ADD      R1,SP,#+0
        LDR.N    R0,??DataTable8_4  ;; 0x4006d000
        BL       LPLD_UART_PutCharArr
        B.N      ??SQC_UM220_Req_8
??SQC_UM220_Req_2:
        MOVS     R2,#+4
        MOVS     R1,#+2
        LDR.N    R0,??DataTable8_24
        BL       SQC_UM220_save
        LDR.N    R0,??DataTable8_24
        BL       SQC_UM220_Time
        LDR.N    R2,??DataTable8_24
        ADR.N    R1,??DataTable8  ;; 0x25, 0x73, 0x00, 0x00
        LDR.N    R0,??DataTable8_24
        BL       sprintf
        MOVS     R3,#+255
        LDR.N    R2,??DataTable8_25
        MOVS     R1,#+60
        MOVS     R0,#+100
        BL       LPLD_LCD_ShowStringno
        MOVS     R3,#+255
        LDR.N    R2,??DataTable8_24
        MOVS     R1,#+60
        MOVS     R0,#+160
        BL       LPLD_LCD_ShowStringno
        MOVS     R0,#+0
        LDR.N    R1,??DataTable8_11
        STRH     R0,[R1, #+1024]
        LDR.N    R1,??DataTable8_26
        ADD      R0,SP,#+0
        BL       sprintf
        ADD      R0,SP,#+0
        BL       strlen
        MOVS     R2,R0
        ADD      R1,SP,#+0
        LDR.N    R0,??DataTable8_4  ;; 0x4006d000
        BL       LPLD_UART_PutCharArr
        LDR.N    R1,??DataTable8_27
        ADD      R0,SP,#+0
        BL       sprintf
        ADD      R0,SP,#+0
        BL       strlen
        MOVS     R2,R0
        ADD      R1,SP,#+0
        LDR.N    R0,??DataTable8_4  ;; 0x4006d000
        BL       LPLD_UART_PutCharArr
        B.N      ??SQC_UM220_Req_8
??SQC_UM220_Req_1:
        MOVS     R0,#+0
        B.N      ??SQC_UM220_Req_9
//  165 //UTC时间转化当地时间

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  166 void  SQC_UM220_Time(uint8 time[])
//  167 {
//  168   uint8 t1;  
//  169   t1=(gps_zda.time[0]-0x30)*10;
SQC_UM220_Time:
        LDR.N    R0,??DataTable8_24
        LDRSB    R0,[R0, #+0]
        SUBS     R0,R0,#+48
        MOVS     R1,#+10
        SMULBB   R0,R0,R1
//  170        t1+=(gps_zda.time[1]-0x30);
        LDR.N    R1,??DataTable8_24
        LDRSB    R1,[R1, #+1]
        SUBS     R1,R1,#+48
        ADDS     R0,R1,R0
//  171        t1+=8;
        ADDS     R0,R0,#+8
//  172        if(t1>23) 
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+24
        BLT.N    ??SQC_UM220_Time_0
//  173        t1-=24;
        SUBS     R0,R0,#+24
//  174        gps_zda.time[0]=t1/10+0x30;
??SQC_UM220_Time_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R1,#+10
        SDIV     R1,R0,R1
        ADDS     R1,R1,#+48
        LDR.N    R2,??DataTable8_24
        STRB     R1,[R2, #+0]
//  175        gps_zda.time[1]=t1%10+0x30; 
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R1,#+10
        SDIV     R2,R0,R1
        MLS      R0,R1,R2,R0
        ADDS     R0,R0,#+48
        LDR.N    R1,??DataTable8_24
        STRB     R0,[R1, #+1]
//  176        gps_zda.time[4]=gps_zda.time[3];
        LDR.N    R0,??DataTable8_24
        LDRB     R0,[R0, #+3]
        LDR.N    R1,??DataTable8_24
        STRB     R0,[R1, #+4]
//  177        gps_zda.time[3]=gps_zda.time[2]; 
        LDR.N    R0,??DataTable8_24
        LDRB     R0,[R0, #+2]
        LDR.N    R1,??DataTable8_24
        STRB     R0,[R1, #+3]
//  178        gps_zda.time[2]=':';
        MOVS     R0,#+58
        LDR.N    R1,??DataTable8_24
        STRB     R0,[R1, #+2]
//  179 }
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC8      "N",0x0,0x0
//  180 //数据存储

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  181 void SQC_UM220_save(uint8 a[],int q,int p)
//  182 {
SQC_UM220_save:
        PUSH     {R4-R6}
//  183   int8 i=0,j=1,k=0;
        MOVS     R6,#+0
        MOVS     R3,#+1
        MOVS     R4,#+0
//  184   uint8 recv[50],t1;
//  185  for(int i=0;i<gps_buf.gps_buf_len;i++)
        MOVS     R5,#+0
        B.N      ??SQC_UM220_save_0
//  186    {
//  187      if(gps_buf.gps_Rxbuf[i]=='*')
//  188        break;
//  189      if(gps_buf.gps_Rxbuf[i]==',')
//  190      {
//  191        j++;
//  192        k=0;
//  193        continue;
//  194      }
//  195      if(j==q)
//  196      {
//  197        if(k==p)
//  198        {
//  199          break;
//  200        }
//  201        a[k]=gps_buf.gps_Rxbuf[i];
??SQC_UM220_save_1:
        LDR.N    R6,??DataTable8_11
        LDRB     R6,[R5, R6]
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        STRB     R6,[R4, R0]
//  202        k++;
        ADDS     R4,R4,#+1
??SQC_UM220_save_2:
        ADDS     R5,R5,#+1
??SQC_UM220_save_0:
        LDR.N    R6,??DataTable8_11
        LDRH     R6,[R6, #+1024]
        CMP      R5,R6
        BGE.N    ??SQC_UM220_save_3
        LDR.N    R6,??DataTable8_11
        LDRSB    R6,[R5, R6]
        CMP      R6,#+42
        BEQ.N    ??SQC_UM220_save_3
??SQC_UM220_save_4:
        LDR.N    R6,??DataTable8_11
        LDRSB    R6,[R5, R6]
        CMP      R6,#+44
        BNE.N    ??SQC_UM220_save_5
        ADDS     R3,R3,#+1
        MOVS     R4,#+0
        B.N      ??SQC_UM220_save_2
??SQC_UM220_save_5:
        SXTB     R3,R3            ;; SignExt  R3,R3,#+24,#+24
        CMP      R3,R1
        BNE.N    ??SQC_UM220_save_2
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,R2
        BNE.N    ??SQC_UM220_save_1
//  203        
//  204      }  
//  205     
//  206    }
//  207 }
??SQC_UM220_save_3:
        POP      {R4-R6}
        BX       LR               ;; return
//  208 
//  209 //获取gga指针

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  210 struct UM220_POS* Getpointer_pos()
//  211 {
//  212   return &gps_pos;
Getpointer_pos:
        LDR.N    R0,??DataTable8_12
        BX       LR               ;; return
//  213 }
//  214 
//  215 //获取vta指针

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  216 struct UM220_VTG* Getpointer_vtg()
//  217 {
//  218   return &gps_vtg;
Getpointer_vtg:
        LDR.N    R0,??DataTable8_19
        BX       LR               ;; return
//  219 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7:
        DC8      "S",0x0,0x0
//  220 
//  221 //获取buf指针

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  222 struct UM220_BUF* Getpointer_buf()
//  223 {
//  224   return &gps_buf;
Getpointer_buf:
        LDR.N    R0,??DataTable8_11
        BX       LR               ;; return
//  225 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8:
        DC8      0x25, 0x73, 0x00, 0x00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_1:
        DC8      "W",0x0,0x0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_2:
        DC8      "E",0x0,0x0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_3:
        DC32     `?<Constant "$CFGMSG,0,0,0\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_4:
        DC32     0x4006d000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_5:
        DC32     `?<Constant "$CFGMSG,0,1,0\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_6:
        DC32     `?<Constant "$CFGMSG,0,2,0\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_7:
        DC32     `?<Constant "$CFGMSG,0,3,0\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_8:
        DC32     `?<Constant "$CFGMSG,0,4,0\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_9:
        DC32     `?<Constant "$CFGMSG,0,5,8\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_10:
        DC32     `?<Constant "$RESET,0,0xFF0\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_11:
        DC32     gps_buf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_12:
        DC32     gps_pos

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_13:
        DC32     gps_pos+0x1E

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_14:
        DC32     gps_pos+0x3C

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_15:
        DC32     `?<Constant "\\270\\337\\266\\310 is %s \\303\\327\\n"`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_16:
        DC32     `?<Constant "$CFGMSG,1,0,0\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_17:
        DC32     `?<Constant "$CFGMSG,0,5,5\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_18:
        DC32     gps_vtg+0xA

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_19:
        DC32     gps_vtg

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_20:
        DC32     `?<Constant "speed is">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_21:
        DC32     `?<Constant "dir is">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_22:
        DC32     `?<Constant "$CFGMSG,0,5,0\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_23:
        DC32     `?<Constant "$CFGMSG,0,6,5\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_24:
        DC32     gps_zda

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_25:
        DC32     `?<Constant "time is">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_26:
        DC32     `?<Constant "$CFGMSG,0,6,0\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_27:
        DC32     `?<Constant "$CFGMSG,1,0,5\\r\\n">`

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "$CFGMSG,0,0,0\\r\\n">`:
        DATA
        DC8 "$CFGMSG,0,0,0\015\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "$CFGMSG,0,1,0\\r\\n">`:
        DATA
        DC8 "$CFGMSG,0,1,0\015\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "$CFGMSG,0,2,0\\r\\n">`:
        DATA
        DC8 "$CFGMSG,0,2,0\015\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "$CFGMSG,0,3,0\\r\\n">`:
        DATA
        DC8 "$CFGMSG,0,3,0\015\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "$CFGMSG,0,4,0\\r\\n">`:
        DATA
        DC8 "$CFGMSG,0,4,0\015\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "$CFGMSG,0,5,8\\r\\n">`:
        DATA
        DC8 "$CFGMSG,0,5,8\015\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "$RESET,0,0xFF0\\r\\n">`:
        DATA
        DC8 "$RESET,0,0xFF0\015\012"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "%s"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(1)
        DATA
        DC8 "N"

        SECTION `.rodata`:CONST:REORDER:NOROOT(1)
        DATA
        DC8 "S"

        SECTION `.rodata`:CONST:REORDER:NOROOT(1)
        DATA
        DC8 "W"

        SECTION `.rodata`:CONST:REORDER:NOROOT(1)
        DATA
        DC8 "E"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\270\\337\\266\\310 is %s \\303\\327\\n"`:
        DATA
        DC8 "\270\337\266\310 is %s \303\327\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "$CFGMSG,1,0,0\\r\\n">`:
        DATA
        DC8 "$CFGMSG,1,0,0\015\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "$CFGMSG,0,5,5\\r\\n">`:
        DATA
        DC8 "$CFGMSG,0,5,5\015\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "speed is">`:
        DATA
        DC8 "speed is"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "dir is">`:
        DATA
        DC8 "dir is"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "$CFGMSG,0,5,0\\r\\n">`:
        DATA
        DC8 "$CFGMSG,0,5,0\015\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "$CFGMSG,0,6,5\\r\\n">`:
        DATA
        DC8 "$CFGMSG,0,6,5\015\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "time is">`:
        DATA
        DC8 "time is"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "$CFGMSG,0,6,0\\r\\n">`:
        DATA
        DC8 "$CFGMSG,0,6,0\015\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "$CFGMSG,1,0,5\\r\\n">`:
        DATA
        DC8 "$CFGMSG,1,0,5\015\012"

        END
// 
// 1 184 bytes in section .bss
//   268 bytes in section .rodata
// 1 320 bytes in section .text
// 
// 1 320 bytes of CODE  memory
//   268 bytes of CONST memory
// 1 184 bytes of DATA  memory
//
//Errors: none
//Warnings: 62
