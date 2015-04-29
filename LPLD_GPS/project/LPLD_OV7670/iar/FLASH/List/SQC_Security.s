///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.1.6676/W32 for ARM       23/Apr/2015  14:23:25
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  G:\test\LPLD_OSKinetis_V3_now02\lib\SQC\SQC_Security.c
//    Command line =  
//        G:\test\LPLD_OSKinetis_V3_now02\lib\SQC\SQC_Security.c -D LPLD_K60
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
//        G:\test\LPLD_OSKinetis_V3_now02\project\LPLD_OV7670\iar\FLASH\List\SQC_Security.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN PubCrypt_SHA256
        EXTERN aes256_decrypt_ecb
        EXTERN aes256_encrypt_ecb
        EXTERN aes256_init
        EXTERN malloc
        EXTERN strncpy

        PUBLIC SQC_SEC_AESdec
        PUBLIC SQC_SEC_AESenc
        PUBLIC SQC_SEC_GetID
        PUBLIC SQC_SEC_Sha256

// G:\test\LPLD_OSKinetis_V3_now02\lib\SQC\SQC_Security.c
//    1 /**
//    2  * @file SQC_Security.c
//    3  * @version 1.0[By finley]
//    4  * @date 2015-04-16
//    5  * @brief 数据加密相关函数
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
//   22 #include "SQC_Security.h"
//   23 #include "SHA256.h"
//   24 #include "aes256.h"
//   25 
//   26 
//   27 //获取unique id(128bit)

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   28 uint8 * SQC_SEC_GetID()
//   29 {
SQC_SEC_GetID:
        PUSH     {R7,LR}
//   30   uint32* uniqueid = (uint32*)malloc(sizeof(uint32)*4);
        MOVS     R0,#+16
        BL       malloc
//   31   uniqueid[0] = SIM->UIDH;
        LDR.N    R1,??DataTable0  ;; 0x40048054
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+0]
//   32   uniqueid[1] = SIM->UIDMH;
        LDR.N    R1,??DataTable0_1  ;; 0x40048058
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+4]
//   33   uniqueid[2] = SIM->UIDML;
        LDR.N    R1,??DataTable0_2  ;; 0x4004805c
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+8]
//   34   uniqueid[3] = SIM->UIDL;
        LDR.N    R1,??DataTable0_3  ;; 0x40048060
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+12]
//   35   return (uint8*)uniqueid;
        POP      {R1,PC}          ;; return
//   36 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0:
        DC32     0x40048054

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_1:
        DC32     0x40048058

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_2:
        DC32     0x4004805c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_3:
        DC32     0x40048060
//   37 
//   38 //生成sha256哈希值

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   39 uint8 SQC_SEC_Sha256(uint8* input,uint16 len,uint8* key)
//   40 {
SQC_SEC_Sha256:
        PUSH     {R7,LR}
//   41   return PubCrypt_SHA256(input,len,key);
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        BL       PubCrypt_SHA256
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,PC}          ;; return
//   42 }
//   43 
//   44 //加密数据(256bit密钥）
//   45 //返回密文的长度（字节），参数为（密钥，密文指针（返回），明文指针，明文长度）

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   46 uint16 SQC_SEC_AESenc(uint8* key,uint8** cry,uint8* data,uint16 len)
//   47 {
SQC_SEC_AESenc:
        PUSH     {R4-R9,LR}
        SUB      SP,SP,#+100
        MOVS     R5,R0
        MOVS     R4,R1
        MOVS     R6,R2
        MOVS     R7,R3
//   48   uint16 relen;
//   49   uint8  fill,t1,t2,t3;
//   50   aes256_context ctx;
//   51   
//   52   t1 = len%16;
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        MOVS     R1,#+16
        SDIV     R0,R7,R1
        MLS      R0,R0,R1,R7
//   53   if(t1 == 0)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??SQC_SEC_AESenc_0
//   54   {
//   55     fill = 16;
        MOVS     R9,#+16
//   56     relen = len + 16;
        ADDS     R8,R7,#+16
        B.N      ??SQC_SEC_AESenc_1
//   57   }
//   58   else
//   59   {
//   60     fill = 16 - t1;
??SQC_SEC_AESenc_0:
        RSBS     R9,R0,#+16
//   61     relen = len + fill;
        UXTAB    R8,R7,R9
//   62   }
//   63   *cry = (uint8*)malloc(sizeof(uint8)*relen);
??SQC_SEC_AESenc_1:
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        MOV      R0,R8
        BL       malloc
        STR      R0,[R4, #+0]
//   64   for(t2=0;t2<relen;t2++)
        MOVS     R0,#+0
        B.N      ??SQC_SEC_AESenc_2
//   65   {
//   66     if(t2<len)
//   67       (*cry)[t2] = data[t2];
//   68     else
//   69       (*cry)[t2] = fill;
??SQC_SEC_AESenc_3:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR      R1,[R4, #+0]
        STRB     R9,[R0, R1]
??SQC_SEC_AESenc_4:
        ADDS     R0,R0,#+1
??SQC_SEC_AESenc_2:
        MOVS     R1,R0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        CMP      R1,R8
        BCS.N    ??SQC_SEC_AESenc_5
        MOVS     R1,R0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R1,R7
        BCS.N    ??SQC_SEC_AESenc_3
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDRB     R1,[R0, R6]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR      R2,[R4, #+0]
        STRB     R1,[R0, R2]
        B.N      ??SQC_SEC_AESenc_4
//   70   }
//   71   
//   72   aes256_init(&ctx, key);
??SQC_SEC_AESenc_5:
        MOVS     R1,R5
        ADD      R0,SP,#+0
        BL       aes256_init
//   73   for(t3 = 0;t3 < relen/16;t3++)
        MOVS     R5,#+0
        B.N      ??SQC_SEC_AESenc_6
//   74   {
//   75     aes256_encrypt_ecb(&ctx, ((*cry)+t3*16));
??SQC_SEC_AESenc_7:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR      R0,[R4, #+0]
        ADDS     R1,R0,R5, LSL #+4
        ADD      R0,SP,#+0
        BL       aes256_encrypt_ecb
//   76   }
        ADDS     R5,R5,#+1
??SQC_SEC_AESenc_6:
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        MOVS     R0,#+16
        SDIV     R0,R8,R0
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,R0
        BLT.N    ??SQC_SEC_AESenc_7
//   77   return relen;
        MOV      R0,R8
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        ADD      SP,SP,#+100
        POP      {R4-R9,PC}       ;; return
//   78 }
//   79       
//   80 //解密数据(256bit密钥）
//   81 //返回明文的长度（字节），参数为（密钥，明文指针（返回），密文指针，密文长度）

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   82 uint16 SQC_SEC_AESdec(uint8* key,uint8** data,uint8* cry,uint16 len)
//   83 {
SQC_SEC_AESdec:
        PUSH     {R4-R7,LR}
        SUB      SP,SP,#+100
        MOVS     R4,R1
        MOVS     R5,R2
        MOVS     R6,R3
//   84   uint16 relen;
//   85   uint8  fill,t3;
//   86   aes256_context ctx;
//   87   
//   88   aes256_init(&ctx, key);
        MOVS     R1,R0
        ADD      R0,SP,#+0
        BL       aes256_init
//   89   
//   90   for(t3 = 0;t3 < len/16;t3++)
        MOVS     R7,#+0
        B.N      ??SQC_SEC_AESdec_0
//   91   {
//   92     aes256_decrypt_ecb(&ctx,(cry+t3*16));
??SQC_SEC_AESdec_1:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        ADDS     R1,R5,R7, LSL #+4
        ADD      R0,SP,#+0
        BL       aes256_decrypt_ecb
//   93   }
        ADDS     R7,R7,#+1
??SQC_SEC_AESdec_0:
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        MOVS     R0,#+16
        SDIV     R0,R6,R0
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,R0
        BLT.N    ??SQC_SEC_AESdec_1
//   94   fill = cry[len-1];
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        ADDS     R0,R6,R5
        LDRB     R0,[R0, #-1]
//   95   relen = len - fill;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        SUBS     R6,R6,R0
//   96   (*data) = (uint8*)malloc(sizeof(uint8)*relen);
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        MOVS     R0,R6
        BL       malloc
        STR      R0,[R4, #+0]
//   97   strncpy((*data),cry,relen);
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        MOVS     R2,R6
        MOVS     R1,R5
        LDR      R0,[R4, #+0]
        BL       strncpy
//   98   return relen;
        MOVS     R0,R6
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        ADD      SP,SP,#+100
        POP      {R4-R7,PC}       ;; return
//   99 }

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
// 
// 322 bytes in section .text
// 
// 322 bytes of CODE memory
//
//Errors: none
//Warnings: 2
