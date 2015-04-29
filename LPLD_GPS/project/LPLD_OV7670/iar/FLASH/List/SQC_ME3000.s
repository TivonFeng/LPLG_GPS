///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.1.6676/W32 for ARM       23/Apr/2015  14:23:25
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  G:\test\LPLD_OSKinetis_V3_now02\lib\SQC\SQC_ME3000.c
//    Command line =  
//        G:\test\LPLD_OSKinetis_V3_now02\lib\SQC\SQC_ME3000.c -D LPLD_K60 -lCN
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
//        G:\test\LPLD_OSKinetis_V3_now02\project\LPLD_OV7670\iar\FLASH\List\SQC_ME3000.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN LPLD_GPIO_Output_b
        EXTERN LPLD_UART_PutChar
        EXTERN LPLD_UART_PutCharArr
        EXTERN atoi
        EXTERN delay
        EXTERN malloc
        EXTERN printf
        EXTERN sprintf
        EXTERN strlen
        EXTERN strncpy
        EXTERN strstr

        PUBLIC SQC_ME3000_Close
        PUBLIC SQC_ME3000_Connect
        PUBLIC SQC_ME3000_Creg
        PUBLIC SQC_ME3000_Disconnect
        PUBLIC SQC_ME3000_GetPib
        PUBLIC SQC_ME3000_Init
        PUBLIC SQC_ME3000_Open
        PUBLIC SQC_ME3000_Pppstat
        PUBLIC SQC_ME3000_Recive
        PUBLIC SQC_ME3000_Send
        PUBLIC SQC_ME3000_Tcpstat
        PUBLIC gprs_pib

// G:\test\LPLD_OSKinetis_V3_now02\lib\SQC\SQC_ME3000.c
//    1 /**
//    2  * @file SQC_ME3000.c
//    3  * @version 1.0[By finley]
//    4  * @date 2015-04-16
//    5  * @brief ZTE-ME3000 3G/GPRS 模块相关函数
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
//   22 #include "SQC_ME3000.h"
//   23 #include "HW_UART.h"
//   24 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   25 struct _ME3000_PIB  gprs_pib;  
gprs_pib:
        DS8 1072
//   26    
//   27 //初始化模块

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   28 uint8 SQC_ME3000_Init()
//   29 {
SQC_ME3000_Init:
        PUSH     {R4,LR}
//   30   uint8 temp =0;
        MOVS     R4,#+0
//   31   printf("Start device,waiting...\n"); 
        LDR.W    R0,??DataTable10
        BL       printf
//   32   gprs_pib.Rxlen= 0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable10_1
        STRH     R0,[R1, #+1024]
//   33   gprs_pib.Rxflag = 0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable10_1
        STRB     R0,[R1, #+1026]
//   34   gprs_pib.msgnum = 0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable10_1
        STRB     R0,[R1, #+1068]
//   35   LPLD_GPIO_Output_b(PTC,14,0);
        MOVS     R2,#+0
        MOVS     R1,#+14
        LDR.W    R0,??DataTable10_2  ;; 0x400ff080
        BL       LPLD_GPIO_Output_b
//   36   delay();
        BL       delay
//   37   LPLD_GPIO_Output_b(PTC,14,1);
        MOVS     R2,#+1
        MOVS     R1,#+14
        LDR.W    R0,??DataTable10_2  ;; 0x400ff080
        BL       LPLD_GPIO_Output_b
//   38   LPLD_GPIO_Output_b(PTC,19,1);
        MOVS     R2,#+1
        MOVS     R1,#+19
        LDR.W    R0,??DataTable10_2  ;; 0x400ff080
        BL       LPLD_GPIO_Output_b
//   39   delay();  delay();
        BL       delay
        BL       delay
//   40   delay();  delay();
        BL       delay
        BL       delay
//   41   delay();  delay();
        BL       delay
        BL       delay
//   42   delay();  delay();
        BL       delay
        BL       delay
//   43   LPLD_GPIO_Output_b(PTC,19,0);
        MOVS     R2,#+0
        MOVS     R1,#+19
        LDR.W    R0,??DataTable10_2  ;; 0x400ff080
        BL       LPLD_GPIO_Output_b
//   44   while(1)
//   45   {
//   46     if(gprs_pib.Rxflag == 2 && temp == 0)
??SQC_ME3000_Init_0:
        LDR.W    R0,??DataTable10_1
        LDRB     R0,[R0, #+1026]
        CMP      R0,#+2
        BNE.N    ??SQC_ME3000_Init_1
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.N    ??SQC_ME3000_Init_1
//   47     {
//   48       if (strstr(gprs_pib.Rxbuf,"+CFUN: 1") != 0)
        LDR.W    R1,??DataTable10_3
        LDR.W    R0,??DataTable10_1
        BL       strstr
        CMP      R0,#+0
        BEQ.N    ??SQC_ME3000_Init_2
//   49         temp += 2;
        ADDS     R4,R4,#+2
        B.N      ??SQC_ME3000_Init_3
//   50       else 
//   51         temp += 1;
??SQC_ME3000_Init_2:
        ADDS     R4,R4,#+1
//   52       gprs_pib.Rxflag = 0;
??SQC_ME3000_Init_3:
        MOVS     R0,#+0
        LDR.W    R1,??DataTable10_1
        STRB     R0,[R1, #+1026]
//   53     }
//   54     if(gprs_pib.Rxflag == 2 && temp > 0)
??SQC_ME3000_Init_1:
        LDR.W    R0,??DataTable10_1
        LDRB     R0,[R0, #+1026]
        CMP      R0,#+2
        BNE.N    ??SQC_ME3000_Init_0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??SQC_ME3000_Init_0
//   55     {
//   56       if (strstr(gprs_pib.Rxbuf,"+CPIN: READY") != 0)
        LDR.W    R1,??DataTable10_4
        LDR.W    R0,??DataTable10_1
        BL       strstr
        CMP      R0,#+0
        BEQ.N    ??SQC_ME3000_Init_4
//   57         temp += 2;
        ADDS     R4,R4,#+2
        B.N      ??SQC_ME3000_Init_5
//   58       else 
//   59         temp +=1;
??SQC_ME3000_Init_4:
        ADDS     R4,R4,#+1
//   60       if (temp == 4)
??SQC_ME3000_Init_5:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+4
        BNE.N    ??SQC_ME3000_Init_6
//   61       {
//   62         gprs_pib.Rxflag = 0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable10_1
        STRB     R0,[R1, #+1026]
//   63         break;
//   64       }
//   65       else
//   66       {
//   67         gprs_pib.Rxflag = 0;
//   68         return FALSE;
//   69       }
//   70     }   
//   71   }
//   72   return SQC_ME3000_Creg();
        BL       SQC_ME3000_Creg
        B.N      ??SQC_ME3000_Init_7
??SQC_ME3000_Init_6:
        MOVS     R0,#+0
        LDR.W    R1,??DataTable10_1
        STRB     R0,[R1, #+1026]
        MOVS     R0,#+0
??SQC_ME3000_Init_7:
        POP      {R4,PC}          ;; return
//   73 
//   74 }
//   75 
//   76 //获取pib指针

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   77 struct _ME3000_PIB* SQC_ME3000_GetPib()
//   78 {
//   79   return &gprs_pib;
SQC_ME3000_GetPib:
        LDR.W    R0,??DataTable10_1
        BX       LR               ;; return
//   80 }
//   81  
//   82 //查询是否入网

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   83 uint8 SQC_ME3000_Creg()
//   84 {
SQC_ME3000_Creg:
        PUSH     {LR}
        SUB      SP,SP,#+20
//   85   uint8 cmd[20];
//   86   gprs_pib.Rxflag = 0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable10_1
        STRB     R0,[R1, #+1026]
//   87   sprintf(cmd,"AT+CREG?\r\n");
        LDR.W    R1,??DataTable10_5
        ADD      R0,SP,#+0
        BL       sprintf
        B.N      ??SQC_ME3000_Creg_0
//   88   while(1)
//   89   {
//   90     LPLD_UART_PutCharArr(UART5,cmd,strlen(cmd));
//   91     delay();delay();
//   92     if(gprs_pib.Rxflag == 2)
//   93     {
//   94       if(strstr(gprs_pib.Rxbuf,"+CREG: 0, 1") != 0)
//   95       {
//   96         gprs_pib.Rxflag = 0;
//   97         return TRUE;
//   98       }
//   99       else
//  100         gprs_pib.Rxflag = 0;
??SQC_ME3000_Creg_1:
        MOVS     R0,#+0
        LDR.W    R1,??DataTable10_1
        STRB     R0,[R1, #+1026]
??SQC_ME3000_Creg_0:
        ADD      R0,SP,#+0
        BL       strlen
        MOVS     R2,R0
        ADD      R1,SP,#+0
        LDR.W    R0,??DataTable10_6  ;; 0x400eb000
        BL       LPLD_UART_PutCharArr
        BL       delay
        BL       delay
        LDR.W    R0,??DataTable10_1
        LDRB     R0,[R0, #+1026]
        CMP      R0,#+2
        BNE.N    ??SQC_ME3000_Creg_0
        LDR.W    R1,??DataTable10_7
        LDR.W    R0,??DataTable10_1
        BL       strstr
        CMP      R0,#+0
        BEQ.N    ??SQC_ME3000_Creg_1
        MOVS     R0,#+0
        LDR.W    R1,??DataTable10_1
        STRB     R0,[R1, #+1026]
        MOVS     R0,#+1
        ADD      SP,SP,#+20
        POP      {PC}             ;; return
//  101     }
//  102   }
//  103 }
//  104 
//  105 //打开gprs网络

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  106 uint8 SQC_ME3000_Open()
//  107 {
SQC_ME3000_Open:
        PUSH     {LR}
        SUB      SP,SP,#+20
//  108   uint8 cmd[20];
//  109   gprs_pib.Rxflag = 0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable10_1
        STRB     R0,[R1, #+1026]
//  110   sprintf(cmd,"AT+ZPPPOPEN\r\n");
        LDR.W    R1,??DataTable10_8
        ADD      R0,SP,#+0
        BL       sprintf
//  111   LPLD_UART_PutCharArr(UART5,cmd,strlen(cmd));
        ADD      R0,SP,#+0
        BL       strlen
        MOVS     R2,R0
        ADD      R1,SP,#+0
        LDR.W    R0,??DataTable10_6  ;; 0x400eb000
        BL       LPLD_UART_PutCharArr
//  112   while(1)
//  113   {
//  114     delay();delay();
??SQC_ME3000_Open_0:
        BL       delay
        BL       delay
//  115     if(gprs_pib.Rxflag == 2)
        LDR.N    R0,??DataTable10_1
        LDRB     R0,[R0, #+1026]
        CMP      R0,#+2
        BNE.N    ??SQC_ME3000_Open_0
//  116     {
//  117       if(strstr(gprs_pib.Rxbuf,"+ZPPPOPEN:CONNECTED") != 0
//  118          || strstr(gprs_pib.Rxbuf,"+ZPPPOPEN:ESTABLISHED") != 0)
        LDR.N    R1,??DataTable10_9
        LDR.N    R0,??DataTable10_1
        BL       strstr
        CMP      R0,#+0
        BNE.N    ??SQC_ME3000_Open_1
        LDR.N    R1,??DataTable10_10
        LDR.N    R0,??DataTable10_1
        BL       strstr
        CMP      R0,#+0
        BEQ.N    ??SQC_ME3000_Open_2
//  119         return TRUE;
??SQC_ME3000_Open_1:
        MOVS     R0,#+1
        B.N      ??SQC_ME3000_Open_3
//  120       else
//  121         return FALSE;
??SQC_ME3000_Open_2:
        MOVS     R0,#+0
??SQC_ME3000_Open_3:
        ADD      SP,SP,#+20
        POP      {PC}             ;; return
//  122     }
//  123   }
//  124 }
//  125 
//  126 //关闭gprs网络

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  127 uint8 SQC_ME3000_Close()
//  128 {
SQC_ME3000_Close:
        PUSH     {LR}
        SUB      SP,SP,#+20
//  129   uint8 cmd[20];
//  130   gprs_pib.Rxflag = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable10_1
        STRB     R0,[R1, #+1026]
//  131   sprintf(cmd,"AT+ZPPPCLOSE\r\n");
        LDR.N    R1,??DataTable10_11
        ADD      R0,SP,#+0
        BL       sprintf
//  132   LPLD_UART_PutCharArr(UART5,cmd,strlen(cmd));
        ADD      R0,SP,#+0
        BL       strlen
        MOVS     R2,R0
        ADD      R1,SP,#+0
        LDR.N    R0,??DataTable10_6  ;; 0x400eb000
        BL       LPLD_UART_PutCharArr
//  133   while(1)
//  134   {
//  135     delay();
??SQC_ME3000_Close_0:
        BL       delay
//  136     if(gprs_pib.Rxflag == 2)
        LDR.N    R0,??DataTable10_1
        LDRB     R0,[R0, #+1026]
        CMP      R0,#+2
        BNE.N    ??SQC_ME3000_Close_0
//  137     {
//  138       if(strstr(gprs_pib.Rxbuf,"+ZPPPCLOSE:OK") != 0
//  139          || strstr(gprs_pib.Rxbuf,"+ZPPPCLOSE:DISCONNECTED") != 0)
        LDR.N    R1,??DataTable10_12
        LDR.N    R0,??DataTable10_1
        BL       strstr
        CMP      R0,#+0
        BNE.N    ??SQC_ME3000_Close_1
        LDR.N    R1,??DataTable10_13
        LDR.N    R0,??DataTable10_1
        BL       strstr
        CMP      R0,#+0
        BEQ.N    ??SQC_ME3000_Close_2
//  140         return TRUE;
??SQC_ME3000_Close_1:
        MOVS     R0,#+1
        B.N      ??SQC_ME3000_Close_3
//  141       else
//  142         return FALSE;
??SQC_ME3000_Close_2:
        MOVS     R0,#+0
??SQC_ME3000_Close_3:
        ADD      SP,SP,#+20
        POP      {PC}             ;; return
//  143     }
//  144   }
//  145 }
//  146 
//  147 //查询gprs连接状态

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  148 uint8 SQC_ME3000_Pppstat()
//  149 {
SQC_ME3000_Pppstat:
        PUSH     {LR}
        SUB      SP,SP,#+20
//  150   uint8 cmd[20];
//  151   gprs_pib.Rxflag = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable10_1
        STRB     R0,[R1, #+1026]
//  152   sprintf(cmd,"AT+ZPPPSTATUS\r\n");
        LDR.N    R1,??DataTable10_14
        ADD      R0,SP,#+0
        BL       sprintf
//  153   LPLD_UART_PutCharArr(UART5,cmd,strlen(cmd));
        ADD      R0,SP,#+0
        BL       strlen
        MOVS     R2,R0
        ADD      R1,SP,#+0
        LDR.N    R0,??DataTable10_6  ;; 0x400eb000
        BL       LPLD_UART_PutCharArr
//  154   while(1)
//  155   {
//  156     delay();
??SQC_ME3000_Pppstat_0:
        BL       delay
//  157     if(gprs_pib.Rxflag == 2)
        LDR.N    R0,??DataTable10_1
        LDRB     R0,[R0, #+1026]
        CMP      R0,#+2
        BNE.N    ??SQC_ME3000_Pppstat_0
//  158     {
//  159       if(strstr(gprs_pib.Rxbuf,"+ZPPPSTATUS:ESTABLISHED") != 0)
        LDR.N    R1,??DataTable10_15
        LDR.N    R0,??DataTable10_1
        BL       strstr
        CMP      R0,#+0
        BEQ.N    ??SQC_ME3000_Pppstat_1
//  160         return TRUE;
        MOVS     R0,#+1
        B.N      ??SQC_ME3000_Pppstat_2
//  161       else
//  162         return FALSE;
??SQC_ME3000_Pppstat_1:
        MOVS     R0,#+0
??SQC_ME3000_Pppstat_2:
        ADD      SP,SP,#+20
        POP      {PC}             ;; return
//  163     }
//  164   }
//  165 }
//  166 
//  167 //使用tcp连接服务器

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  168 uint8 SQC_ME3000_Connect(struct _in_addr addr)
//  169 {
SQC_ME3000_Connect:
        PUSH     {R0,R1,LR}
        SUB      SP,SP,#+68
//  170   uint8 cmd[50];
//  171   gprs_pib.Rxflag = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable10_1
        STRB     R0,[R1, #+1026]
//  172   sprintf(cmd,"AT+ZIPSETUP=1,%d.%d.%d.%d,%d\r\n",addr.s_addr[0],addr.s_addr[1],addr.s_addr[2],addr.s_addr[3],addr.s_port);
        LDRH     R0,[SP, #+72]
        STR      R0,[SP, #+8]
        LDRB     R0,[SP, #+71]
        STR      R0,[SP, #+4]
        LDRB     R0,[SP, #+70]
        STR      R0,[SP, #+0]
        LDRB     R3,[SP, #+69]
        LDRB     R2,[SP, #+68]
        LDR.N    R1,??DataTable10_16
        ADD      R0,SP,#+12
        BL       sprintf
//  173   LPLD_UART_PutCharArr(UART5,cmd,strlen(cmd));
        ADD      R0,SP,#+12
        BL       strlen
        MOVS     R2,R0
        ADD      R1,SP,#+12
        LDR.N    R0,??DataTable10_6  ;; 0x400eb000
        BL       LPLD_UART_PutCharArr
//  174   while(1)
//  175   {
//  176     delay();
??SQC_ME3000_Connect_0:
        BL       delay
//  177     if(gprs_pib.Rxflag == 2)
        LDR.N    R0,??DataTable10_1
        LDRB     R0,[R0, #+1026]
        CMP      R0,#+2
        BNE.N    ??SQC_ME3000_Connect_0
//  178     {
//  179       if(strstr(gprs_pib.Rxbuf,"+ZIPSETUP:CONNECTED") != 0)
        LDR.N    R1,??DataTable10_17
        LDR.N    R0,??DataTable10_1
        BL       strstr
        CMP      R0,#+0
        BEQ.N    ??SQC_ME3000_Connect_1
//  180         return TRUE;
        MOVS     R0,#+1
        B.N      ??SQC_ME3000_Connect_2
//  181       else
//  182         return FALSE;
??SQC_ME3000_Connect_1:
        MOVS     R0,#+0
??SQC_ME3000_Connect_2:
        ADD      SP,SP,#+76
        POP      {PC}             ;; return
//  183     }
//  184   }
//  185 }
//  186 
//  187 //查询tcp连接状态

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  188 uint8 SQC_ME3000_Tcpstat()
//  189 {
SQC_ME3000_Tcpstat:
        PUSH     {LR}
        SUB      SP,SP,#+20
//  190   uint8 cmd[20];
//  191   gprs_pib.Rxflag = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable10_1
        STRB     R0,[R1, #+1026]
//  192   sprintf(cmd,"AT+ZIPSTATUS=1\r\n");
        LDR.N    R1,??DataTable10_18
        ADD      R0,SP,#+0
        BL       sprintf
//  193   LPLD_UART_PutCharArr(UART5,cmd,strlen(cmd));
        ADD      R0,SP,#+0
        BL       strlen
        MOVS     R2,R0
        ADD      R1,SP,#+0
        LDR.N    R0,??DataTable10_6  ;; 0x400eb000
        BL       LPLD_UART_PutCharArr
//  194   while(1)
//  195   {
//  196     delay();
??SQC_ME3000_Tcpstat_0:
        BL       delay
//  197     if(gprs_pib.Rxflag == 2)
        LDR.N    R0,??DataTable10_1
        LDRB     R0,[R0, #+1026]
        CMP      R0,#+2
        BNE.N    ??SQC_ME3000_Tcpstat_0
//  198     {
//  199       if(strstr(gprs_pib.Rxbuf,"+ZIPSTATUS:ESTABLISHED") != 0)
        LDR.N    R1,??DataTable10_19
        LDR.N    R0,??DataTable10_1
        BL       strstr
        CMP      R0,#+0
        BEQ.N    ??SQC_ME3000_Tcpstat_1
//  200         return TRUE;
        MOVS     R0,#+1
        B.N      ??SQC_ME3000_Tcpstat_2
//  201       else
//  202         return FALSE;
??SQC_ME3000_Tcpstat_1:
        MOVS     R0,#+0
??SQC_ME3000_Tcpstat_2:
        ADD      SP,SP,#+20
        POP      {PC}             ;; return
//  203     }
//  204   }
//  205 }
//  206 
//  207 //关闭tcp连接

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  208 uint8 SQC_ME3000_Disconnect()
//  209 {
SQC_ME3000_Disconnect:
        PUSH     {LR}
        SUB      SP,SP,#+20
//  210   uint8 cmd[20];
//  211   gprs_pib.Rxflag = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable10_1
        STRB     R0,[R1, #+1026]
//  212   sprintf(cmd,"AT+ZIPCLOSE=1\r\n");
        LDR.N    R1,??DataTable10_20
        ADD      R0,SP,#+0
        BL       sprintf
//  213   LPLD_UART_PutCharArr(UART5,cmd,strlen(cmd));
        ADD      R0,SP,#+0
        BL       strlen
        MOVS     R2,R0
        ADD      R1,SP,#+0
        LDR.N    R0,??DataTable10_6  ;; 0x400eb000
        BL       LPLD_UART_PutCharArr
//  214   while(1)
//  215   {
//  216     delay();
??SQC_ME3000_Disconnect_0:
        BL       delay
//  217     if(gprs_pib.Rxflag == 2)
        LDR.N    R0,??DataTable10_1
        LDRB     R0,[R0, #+1026]
        CMP      R0,#+2
        BNE.N    ??SQC_ME3000_Disconnect_0
//  218     {
//  219       if(strstr(gprs_pib.Rxbuf,"+ZIPCLOSE:OK") != 0)
        LDR.N    R1,??DataTable10_21
        LDR.N    R0,??DataTable10_1
        BL       strstr
        CMP      R0,#+0
        BEQ.N    ??SQC_ME3000_Disconnect_1
//  220         return TRUE;
        MOVS     R0,#+1
        B.N      ??SQC_ME3000_Disconnect_2
//  221       else
//  222         return FALSE;
??SQC_ME3000_Disconnect_1:
        MOVS     R0,#+0
??SQC_ME3000_Disconnect_2:
        ADD      SP,SP,#+20
        POP      {PC}             ;; return
//  223     }
//  224   }
//  225 }
//  226 
//  227 //向服务器发送数据

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  228 uint8 SQC_ME3000_Send(uint8 * msg,uint16 len)
//  229 {
SQC_ME3000_Send:
        PUSH     {R4,R5,LR}
        SUB      SP,SP,#+20
        MOVS     R4,R0
        MOVS     R5,R1
//  230   uint8 cmd[20];
//  231   gprs_pib.Rxflag = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable10_1
        STRB     R0,[R1, #+1026]
//  232   sprintf(cmd,"AT+ZIPSEND=1,%d\r\n",len);
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        MOVS     R2,R5
        LDR.N    R1,??DataTable10_22
        ADD      R0,SP,#+0
        BL       sprintf
//  233   LPLD_UART_PutCharArr(UART5,cmd,strlen(cmd));
        ADD      R0,SP,#+0
        BL       strlen
        MOVS     R2,R0
        ADD      R1,SP,#+0
        LDR.N    R0,??DataTable10_6  ;; 0x400eb000
        BL       LPLD_UART_PutCharArr
//  234   while(1)
//  235   {
//  236     delay();
??SQC_ME3000_Send_0:
        BL       delay
//  237     if(gprs_pib.Rxflag == 3)
        LDR.N    R0,??DataTable10_1
        LDRB     R0,[R0, #+1026]
        CMP      R0,#+3
        BNE.N    ??SQC_ME3000_Send_1
//  238     {
//  239       gprs_pib.Rxflag = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable10_1
        STRB     R0,[R1, #+1026]
//  240       LPLD_UART_PutCharArr(UART5,msg,len);
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        MOVS     R2,R5
        MOVS     R1,R4
        LDR.N    R0,??DataTable10_6  ;; 0x400eb000
        BL       LPLD_UART_PutCharArr
//  241       LPLD_UART_PutChar(UART5,0x0D);
        MOVS     R1,#+13
        LDR.N    R0,??DataTable10_6  ;; 0x400eb000
        BL       LPLD_UART_PutChar
//  242       LPLD_UART_PutChar(UART5,0x0A);
        MOVS     R1,#+10
        LDR.N    R0,??DataTable10_6  ;; 0x400eb000
        BL       LPLD_UART_PutChar
//  243     }
//  244     if(gprs_pib.Rxflag == 2)
??SQC_ME3000_Send_1:
        LDR.N    R0,??DataTable10_1
        LDRB     R0,[R0, #+1026]
        CMP      R0,#+2
        BNE.N    ??SQC_ME3000_Send_0
//  245     {
//  246       if(strstr(gprs_pib.Rxbuf,"+ZIPSEND:OK") != 0)
        LDR.N    R1,??DataTable10_23
        LDR.N    R0,??DataTable10_1
        BL       strstr
        CMP      R0,#+0
        BEQ.N    ??SQC_ME3000_Send_2
//  247         return TRUE;
        MOVS     R0,#+1
        B.N      ??SQC_ME3000_Send_3
//  248       else
//  249         return FALSE;
??SQC_ME3000_Send_2:
        MOVS     R0,#+0
??SQC_ME3000_Send_3:
        ADD      SP,SP,#+20
        POP      {R4,R5,PC}       ;; return
//  250     }
//  251   }
//  252 }
//  253 
//  254 //解析从服务器接收到的数据

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  255 uint8 SQC_ME3000_Recive(uint8* cmd,uint16 len)
//  256 {
SQC_ME3000_Recive:
        PUSH     {R1-R5,LR}
        MOVS     R4,R0
//  257   uint8 rxlen[10];
//  258   uint8 i = 0;
        MOVS     R0,#+0
//  259   if(cmd[0] == '+' && cmd[1] == 'Z' &&
//  260      cmd[2] == 'I' && cmd[3] == 'P' &&
//  261      cmd[4] == 'R' && cmd[5] == 'E' &&
//  262      cmd[6] == 'C' && cmd[7] == 'V' )
        LDRB     R1,[R4, #+0]
        CMP      R1,#+43
        BNE.N    ??SQC_ME3000_Recive_0
        LDRB     R1,[R4, #+1]
        CMP      R1,#+90
        BNE.N    ??SQC_ME3000_Recive_0
        LDRB     R1,[R4, #+2]
        CMP      R1,#+73
        BNE.N    ??SQC_ME3000_Recive_0
        LDRB     R1,[R4, #+3]
        CMP      R1,#+80
        BNE.N    ??SQC_ME3000_Recive_0
        LDRB     R1,[R4, #+4]
        CMP      R1,#+82
        BNE.N    ??SQC_ME3000_Recive_0
        LDRB     R1,[R4, #+5]
        CMP      R1,#+69
        BNE.N    ??SQC_ME3000_Recive_0
        LDRB     R1,[R4, #+6]
        CMP      R1,#+67
        BNE.N    ??SQC_ME3000_Recive_0
        LDRB     R1,[R4, #+7]
        CMP      R1,#+86
        BNE.N    ??SQC_ME3000_Recive_0
//  263   {
//  264     if(gprs_pib.msgnum >= 10)
        LDR.N    R1,??DataTable10_1
        LDRB     R1,[R1, #+1068]
        CMP      R1,#+10
        BLT.N    ??SQC_ME3000_Recive_1
//  265       return FALSE;
        MOVS     R0,#+0
        B.N      ??SQC_ME3000_Recive_2
//  266     cmd += 11;
??SQC_ME3000_Recive_1:
        ADDW     R4,R4,#+11
//  267     do
//  268     {
//  269       rxlen[i] = *cmd;
??SQC_ME3000_Recive_3:
        LDRB     R1,[R4, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADD      R2,SP,#+0
        STRB     R1,[R0, R2]
//  270       i++;
        ADDS     R0,R0,#+1
//  271       cmd++;
        ADDS     R4,R4,#+1
//  272     }while(*cmd != ',');
        LDRB     R1,[R4, #+0]
        CMP      R1,#+44
        BNE.N    ??SQC_ME3000_Recive_3
//  273     cmd++;
        ADDS     R4,R4,#+1
//  274     rxlen[i] = 0;
        MOVS     R1,#+0
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADD      R2,SP,#+0
        STRB     R1,[R0, R2]
//  275     len = atoi(rxlen);
        ADD      R0,SP,#+0
        BL       atoi
        MOVS     R5,R0
//  276     gprs_pib.Rxmsg[gprs_pib.msgnum] = (uint8 *)malloc(len+1);
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        ADDS     R0,R5,#+1
        BL       malloc
        LDR.N    R1,??DataTable10_1
        LDRB     R1,[R1, #+1068]
        LDR.N    R2,??DataTable10_1
        ADDS     R1,R2,R1, LSL #+2
        STR      R0,[R1, #+1028]
//  277     strncpy(gprs_pib.Rxmsg[gprs_pib.msgnum],cmd,len);
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        MOVS     R2,R5
        MOVS     R1,R4
        LDR.N    R0,??DataTable10_1
        LDRB     R0,[R0, #+1068]
        LDR.N    R3,??DataTable10_1
        ADDS     R0,R3,R0, LSL #+2
        LDR      R0,[R0, #+1028]
        BL       strncpy
//  278     printf("Recv Msg:%s\n",gprs_pib.Rxmsg[gprs_pib.msgnum]);
        LDR.N    R0,??DataTable10_1
        LDRB     R0,[R0, #+1068]
        LDR.N    R1,??DataTable10_1
        ADDS     R0,R1,R0, LSL #+2
        LDR      R1,[R0, #+1028]
        LDR.N    R0,??DataTable10_24
        BL       printf
//  279     gprs_pib.msgnum++;
        LDR.N    R0,??DataTable10_1
        LDRB     R0,[R0, #+1068]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable10_1
        STRB     R0,[R1, #+1068]
//  280     return TRUE;
        MOVS     R0,#+1
        B.N      ??SQC_ME3000_Recive_2
//  281   }
//  282   else
//  283     return FALSE;      
??SQC_ME3000_Recive_0:
        MOVS     R0,#+0
??SQC_ME3000_Recive_2:
        POP      {R1-R5,PC}       ;; return
//  284 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10:
        DC32     `?<Constant "Start device,waiting...\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_1:
        DC32     gprs_pib

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_2:
        DC32     0x400ff080

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_3:
        DC32     `?<Constant "+CFUN: 1">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_4:
        DC32     `?<Constant "+CPIN: READY">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_5:
        DC32     `?<Constant "AT+CREG?\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_6:
        DC32     0x400eb000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_7:
        DC32     `?<Constant "+CREG: 0, 1">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_8:
        DC32     `?<Constant "AT+ZPPPOPEN\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_9:
        DC32     `?<Constant "+ZPPPOPEN:CONNECTED">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_10:
        DC32     `?<Constant "+ZPPPOPEN:ESTABLISHED">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_11:
        DC32     `?<Constant "AT+ZPPPCLOSE\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_12:
        DC32     `?<Constant "+ZPPPCLOSE:OK">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_13:
        DC32     `?<Constant "+ZPPPCLOSE:DISCONNECTED">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_14:
        DC32     `?<Constant "AT+ZPPPSTATUS\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_15:
        DC32     `?<Constant "+ZPPPSTATUS:ESTABLISHED">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_16:
        DC32     `?<Constant "AT+ZIPSETUP=1,%d.%d.%...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_17:
        DC32     `?<Constant "+ZIPSETUP:CONNECTED">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_18:
        DC32     `?<Constant "AT+ZIPSTATUS=1\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_19:
        DC32     `?<Constant "+ZIPSTATUS:ESTABLISHED">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_20:
        DC32     `?<Constant "AT+ZIPCLOSE=1\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_21:
        DC32     `?<Constant "+ZIPCLOSE:OK">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_22:
        DC32     `?<Constant "AT+ZIPSEND=1,%d\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_23:
        DC32     `?<Constant "+ZIPSEND:OK">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_24:
        DC32     `?<Constant "Recv Msg:%s\\n">`

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "Start device,waiting...\\n">`:
        DATA
        DC8 "Start device,waiting...\012"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "+CFUN: 1">`:
        DATA
        DC8 "+CFUN: 1"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "+CPIN: READY">`:
        DATA
        DC8 "+CPIN: READY"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "AT+CREG?\\r\\n">`:
        DATA
        DC8 "AT+CREG?\015\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "+CREG: 0, 1">`:
        DATA
        DC8 "+CREG: 0, 1"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "AT+ZPPPOPEN\\r\\n">`:
        DATA
        DC8 "AT+ZPPPOPEN\015\012"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "+ZPPPOPEN:CONNECTED">`:
        DATA
        DC8 "+ZPPPOPEN:CONNECTED"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "+ZPPPOPEN:ESTABLISHED">`:
        DATA
        DC8 "+ZPPPOPEN:ESTABLISHED"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "AT+ZPPPCLOSE\\r\\n">`:
        DATA
        DC8 "AT+ZPPPCLOSE\015\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "+ZPPPCLOSE:OK">`:
        DATA
        DC8 "+ZPPPCLOSE:OK"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "+ZPPPCLOSE:DISCONNECTED">`:
        DATA
        DC8 "+ZPPPCLOSE:DISCONNECTED"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "AT+ZPPPSTATUS\\r\\n">`:
        DATA
        DC8 "AT+ZPPPSTATUS\015\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "+ZPPPSTATUS:ESTABLISHED">`:
        DATA
        DC8 "+ZPPPSTATUS:ESTABLISHED"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "AT+ZIPSETUP=1,%d.%d.%...">`:
        DATA
        DC8 "AT+ZIPSETUP=1,%d.%d.%d.%d,%d\015\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "+ZIPSETUP:CONNECTED">`:
        DATA
        DC8 "+ZIPSETUP:CONNECTED"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "AT+ZIPSTATUS=1\\r\\n">`:
        DATA
        DC8 "AT+ZIPSTATUS=1\015\012"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "+ZIPSTATUS:ESTABLISHED">`:
        DATA
        DC8 "+ZIPSTATUS:ESTABLISHED"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "AT+ZIPCLOSE=1\\r\\n">`:
        DATA
        DC8 "AT+ZIPCLOSE=1\015\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "+ZIPCLOSE:OK">`:
        DATA
        DC8 "+ZIPCLOSE:OK"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "AT+ZIPSEND=1,%d\\r\\n">`:
        DATA
        DC8 "AT+ZIPSEND=1,%d\015\012"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "+ZIPSEND:OK">`:
        DATA
        DC8 "+ZIPSEND:OK"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "Recv Msg:%s\\n">`:
        DATA
        DC8 "Recv Msg:%s\012"
        DC8 0, 0, 0

        END
//  285 
// 
// 1 072 bytes in section .bss
//   412 bytes in section .rodata
// 1 284 bytes in section .text
// 
// 1 284 bytes of CODE  memory
//   412 bytes of CONST memory
// 1 072 bytes of DATA  memory
//
//Errors: none
//Warnings: 39
