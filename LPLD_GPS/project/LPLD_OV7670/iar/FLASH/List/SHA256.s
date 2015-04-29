///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.1.6676/W32 for ARM       23/Apr/2015  14:23:24
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  G:\test\LPLD_OSKinetis_V3_now02\lib\Security\SHA256.c
//    Command line =  
//        G:\test\LPLD_OSKinetis_V3_now02\lib\Security\SHA256.c -D LPLD_K60
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
//        G:\test\LPLD_OSKinetis_V3_now02\project\LPLD_OV7670\iar\FLASH\List\SHA256.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN free
        EXTERN malloc
        EXTERN memcpy
        EXTERN memset

        PUBLIC PubCrypt_SHA256
        PUBLIC PubCrypt_SHA256Final
        PUBLIC PubCrypt_SHA256Init
        PUBLIC PubCrypt_SHA256Update

// G:\test\LPLD_OSKinetis_V3_now02\lib\Security\SHA256.c
//    1 #include "SHA256.h"
//    2 #include "stdlib.h"
//    3 
//    4 /**************************************************
//    5 功能：将4字节HEX转换为32位无符号整型
//    6 参数说明：
//    7 	HexBuf (in)    --  输入缓冲区（in hex）长度必须为4字节以上
//    8 返回值：
//    9 	返回转换后的数值。如果出错返回0。
//   10 **************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   11 static unsigned int HexToInt(const unsigned char *HexBuf)
//   12 {
//   13 	return ((HexBuf[0] << 24) + (HexBuf[1] << 16) + (HexBuf[2] << 8) + HexBuf[3]);
HexToInt:
        LDRB     R1,[R0, #+0]
        LDRB     R2,[R0, #+1]
        LSLS     R2,R2,#+16
        ADDS     R1,R2,R1, LSL #+24
        LDRB     R2,[R0, #+2]
        ADDS     R1,R1,R2, LSL #+8
        LDRB     R0,[R0, #+3]
        ADDS     R0,R1,R0
        BX       LR               ;; return
//   14 }
//   15 
//   16 /**************************************************
//   17 功能：将32位无符号整型转换为4字节Hex数据
//   18 参数说明：
//   19 	int_num  (in) --  输入无符号整型数
//   20 	HexBuf   (out) --  输出Hex缓冲区(缓冲大小必须为4字节以上)
//   21 返回值：
//   22 	RETURN_SUCC 成功
//   23 	RETURN_ERR_PARAM 参数错误
//   24 **************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   25 static int IntToHex( unsigned int int_num, unsigned char *HexBuf)
//   26 {
//   27 	HexBuf[0] = int_num >> 24;
IntToHex:
        LSRS     R2,R0,#+24
        STRB     R2,[R1, #+0]
//   28 	HexBuf[1] = int_num >> 16;
        LSRS     R2,R0,#+16
        STRB     R2,[R1, #+1]
//   29 	HexBuf[2] = int_num >> 8;
        LSRS     R2,R0,#+8
        STRB     R2,[R1, #+2]
//   30 	HexBuf[3] = int_num;
        STRB     R0,[R1, #+3]
//   31 
//   32 	return RETURN_SUCC;
        MOVS     R0,#+1
        BX       LR               ;; return
//   33 }
//   34 
//   35 /***************************************************************************
//   36 * Subroutine:	SHA256_Init
//   37 * Function:		Init SHA256 struct.
//   38 * Input:		ctx-struct for SHA256
//   39                 is224- if is 1 ,then the Hash is SHA224,or is SHA256
//   40 * Output:		ctx-struct for SHA256;
//   41 * Description:
//   42 * Date:			2010.09.02
//   43 * ModifyRecord:
//   44 * *************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   45 static void SHA256_Init( SHA256_CONTEXT *ctx, unsigned char  is224 )
//   46 {
//   47     ctx->total[0] = 0;
SHA256_Init:
        MOVS     R2,#+0
        STR      R2,[R0, #+0]
//   48     ctx->total[1] = 0;
        MOVS     R2,#+0
        STR      R2,[R0, #+4]
//   49 
//   50     if( is224 == 0 )
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BNE.N    ??SHA256_Init_0
//   51     {
//   52         /* SHA-256 */
//   53         ctx->state[0] = 0x6A09E667;
        LDR.N    R2,??DataTable1  ;; 0x6a09e667
        STR      R2,[R0, #+8]
//   54         ctx->state[1] = 0xBB67AE85;
        LDR.N    R2,??DataTable1_1  ;; 0xbb67ae85
        STR      R2,[R0, #+12]
//   55         ctx->state[2] = 0x3C6EF372;
        LDR.N    R2,??DataTable1_2  ;; 0x3c6ef372
        STR      R2,[R0, #+16]
//   56         ctx->state[3] = 0xA54FF53A;
        LDR.N    R2,??DataTable1_3  ;; 0xa54ff53a
        STR      R2,[R0, #+20]
//   57         ctx->state[4] = 0x510E527F;
        LDR.N    R2,??DataTable1_4  ;; 0x510e527f
        STR      R2,[R0, #+24]
//   58         ctx->state[5] = 0x9B05688C;
        LDR.N    R2,??DataTable1_5  ;; 0x9b05688c
        STR      R2,[R0, #+28]
//   59         ctx->state[6] = 0x1F83D9AB;
        LDR.N    R2,??DataTable1_6  ;; 0x1f83d9ab
        STR      R2,[R0, #+32]
//   60         ctx->state[7] = 0x5BE0CD19;
        LDR.N    R2,??DataTable1_7  ;; 0x5be0cd19
        STR      R2,[R0, #+36]
        B.N      ??SHA256_Init_1
//   61     }
//   62     else
//   63     {
//   64         /* SHA-224 */
//   65         ctx->state[0] = 0xC1059ED8;
??SHA256_Init_0:
        LDR.N    R2,??DataTable1_8  ;; 0xc1059ed8
        STR      R2,[R0, #+8]
//   66         ctx->state[1] = 0x367CD507;
        LDR.N    R2,??DataTable1_9  ;; 0x367cd507
        STR      R2,[R0, #+12]
//   67         ctx->state[2] = 0x3070DD17;
        LDR.N    R2,??DataTable1_10  ;; 0x3070dd17
        STR      R2,[R0, #+16]
//   68         ctx->state[3] = 0xF70E5939;
        LDR.N    R2,??DataTable1_11  ;; 0xf70e5939
        STR      R2,[R0, #+20]
//   69         ctx->state[4] = 0xFFC00B31;
        LDR.N    R2,??DataTable1_12  ;; 0xffc00b31
        STR      R2,[R0, #+24]
//   70         ctx->state[5] = 0x68581511;
        LDR.N    R2,??DataTable1_13  ;; 0x68581511
        STR      R2,[R0, #+28]
//   71         ctx->state[6] = 0x64F98FA7;
        LDR.N    R2,??DataTable1_14  ;; 0x64f98fa7
        STR      R2,[R0, #+32]
//   72         ctx->state[7] = 0xBEFA4FA4;
        LDR.N    R2,??DataTable1_15  ;; 0xbefa4fa4
        STR      R2,[R0, #+36]
//   73     }
//   74 
//   75     ctx->is224 = is224;
??SHA256_Init_1:
        STRB     R1,[R0, #+232]
//   76 }
        BX       LR               ;; return
//   77 
//   78 #define  SHR(x,n) ((x & 0xFFFFFFFF) >> n)
//   79 #define ROTR(x,n) (SHR(x,n) | (x << (32 - n)))
//   80 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   81 static unsigned int S(unsigned int x,char n)
//   82 {
//   83     switch(n)
S:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??S_0
        CMP      R1,#+2
        BEQ.N    ??S_1
        BCC.N    ??S_2
        B.N      ??S_3
//   84     {
//   85     case 0:
//   86         return (ROTR(x, 7) ^ ROTR(x,18) ^  SHR(x, 3));
??S_0:
        RORS     R1,R0,#+18
        EORS     R1,R1,R0, ROR #+7
        EORS     R0,R1,R0, LSR #+3
        B.N      ??S_4
//   87     case 1:
//   88         return (ROTR(x,17) ^ ROTR(x,19) ^  SHR(x,10));
??S_2:
        RORS     R1,R0,#+19
        EORS     R1,R1,R0, ROR #+17
        EORS     R0,R1,R0, LSR #+10
        B.N      ??S_4
//   89     case 2:
//   90         return (ROTR(x, 2) ^ ROTR(x,13) ^ ROTR(x,22));
??S_1:
        RORS     R1,R0,#+13
        EORS     R1,R1,R0, ROR #+2
        EORS     R0,R1,R0, ROR #+22
        B.N      ??S_4
//   91     default:
//   92         return (ROTR(x, 6) ^ ROTR(x,11) ^ ROTR(x,25));
??S_3:
        RORS     R1,R0,#+11
        EORS     R1,R1,R0, ROR #+6
        EORS     R0,R1,R0, ROR #+25
??S_4:
        BX       LR               ;; return
//   93     }
//   94 }
//   95 
//   96 #define F0(x,y,z) ((x & y) | (z & (x | y)))
//   97 #define F1(x,y,z) (z ^ (x & (y ^ z)))
//   98 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   99 static void P(unsigned int a,unsigned int b,unsigned int c,unsigned int* d,unsigned int e,unsigned int f,unsigned int g,unsigned int* h,unsigned int x,unsigned int K)
//  100 {
P:
        PUSH     {R3-R11,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,R3
        LDR      R9,[SP, #+40]
        LDR      R10,[SP, #+48]
        LDR      R8,[SP, #+52]
//  101     unsigned int  temp1;
//  102     temp1 = *h + S(e,3) + F1(e,f,g) + K + x;
        LDR      R11,[R8, #+0]
        MOVS     R1,#+3
        MOV      R0,R9
        BL       S
        ADDS     R0,R0,R11
        LDR      R1,[SP, #+44]
        EORS     R1,R10,R1
        ANDS     R1,R1,R9
        EORS     R1,R1,R10
        ADDS     R0,R1,R0
        LDR      R1,[SP, #+60]
        ADDS     R0,R1,R0
        LDR      R1,[SP, #+56]
        ADDS     R9,R1,R0
//  103     *d += temp1;
        LDR      R0,[R7, #+0]
        ADDS     R0,R9,R0
        STR      R0,[R7, #+0]
//  104     *h = temp1 + S(a,2) + F0(a,b,c);
        MOVS     R1,#+2
        MOVS     R0,R4
        BL       S
        ADDS     R0,R0,R9
        ANDS     R1,R5,R4
        ORRS     R2,R5,R4
        ANDS     R2,R2,R6
        ORRS     R1,R2,R1
        ADDS     R0,R1,R0
        STR      R0,[R8, #+0]
//  105 }
        POP      {R0,R4-R11,PC}   ;; return
//  106 

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
//  107 static const unsigned int KnumA[16]=
KnumA:
        DATA
        DC32 1116352408, 1899447441, 3049323471, 3921009573, 961987163
        DC32 1508970993, 2453635748, 2870763221, 3624381080, 310598401
        DC32 607225278, 1426881987, 1925078388, 2162078206, 2614888103
        DC32 3248222580
//  108 {
//  109     0x428A2F98,0x71374491,0xB5C0FBCF,0xE9B5DBA5,0x3956C25B,0x59F111F1,0x923F82A4,0xAB1C5ED5,
//  110     0xD807AA98,0x12835B01,0x243185BE,0x550C7DC3,0x72BE5D74,0x80DEB1FE,0x9BDC06A7,0xC19BF174
//  111 };

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
//  112 static const unsigned int KnumB[48]=
KnumB:
        DATA
        DC32 3835390401, 4022224774, 264347078, 604807628, 770255983
        DC32 1249150122, 1555081692, 1996064986, 2554220882, 2821834349
        DC32 2952996808, 3210313671, 3336571891, 3584528711, 113926993
        DC32 338241895, 666307205, 773529912, 1294757372, 1396182291
        DC32 1695183700, 1986661051, 2177026350, 2456956037, 2730485921
        DC32 2820302411, 3259730800, 3345764771, 3516065817, 3600352804
        DC32 4094571909, 275423344, 430227734, 506948616, 659060556, 883997877
        DC32 958139571, 1322822218, 1537002063, 1747873779, 1955562222
        DC32 2024104815, 2227730452, 2361852424, 2428436474, 2756734187
        DC32 3204031479, 3329325298
//  113 {
//  114     0xE49B69C1,0xEFBE4786,0x0FC19DC6,0x240CA1CC,0x2DE92C6F,0x4A7484AA,0x5CB0A9DC,0x76F988DA,
//  115     0x983E5152,0xA831C66D,0xB00327C8,0xBF597FC7,0xC6E00BF3,0xD5A79147,0x06CA6351,0x14292967,
//  116     0x27B70A85,0x2E1B2138,0x4D2C6DFC,0x53380D13,0x650A7354,0x766A0ABB,0x81C2C92E,0x92722C85,
//  117     0xA2BFE8A1,0xA81A664B,0xC24B8B70,0xC76C51A3,0xD192E819,0xD6990624,0xF40E3585,0x106AA070,
//  118     0x19A4C116,0x1E376C08,0x2748774C,0x34B0BCB5,0x391C0CB3,0x4ED8AA4A,0x5B9CCA4F,0x682E6FF3,
//  119     0x748F82EE,0x78A5636F,0x84C87814,0x8CC70208,0x90BEFFFA,0xA4506CEB,0xBEF9A3F7,0xC67178F2
//  120 };
//  121 /***************************************************************************
//  122 * Subroutine:	SHA256_Process
//  123 * Function:		Process SHA256
//  124 * Input:		None
//  125 * Output:		None;
//  126 * Description:
//  127 * Date:			2010.09.02
//  128 * ModifyRecord:
//  129 * *************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  130 static void SHA256_Process( SHA256_CONTEXT *ctx, unsigned char  data[64] )
//  131 {
SHA256_Process:
        PUSH     {R4-R7,LR}
        SUB      SP,SP,#+316
        MOVS     R4,R0
        MOVS     R5,R1
//  132     unsigned int  temp1, temp2, W[64];
//  133     unsigned int stateN[8];
//  134     unsigned int indexA,indexB,indexC;
//  135 
//  136     for(temp1=0; temp1<16; temp1++)
        MOVS     R6,#+0
        B.N      ??SHA256_Process_0
//  137     {
//  138         W[temp1] = HexToInt(data+temp1*4);
??SHA256_Process_1:
        ADDS     R0,R5,R6, LSL #+2
        BL       HexToInt
        ADD      R1,SP,#+56
        STR      R0,[R1, R6, LSL #+2]
//  139     }
        ADDS     R6,R6,#+1
??SHA256_Process_0:
        CMP      R6,#+16
        BCC.N    ??SHA256_Process_1
//  140 
//  141 #define R(t) (W[t] = S(W[t -  2],1) + W[t -  7] + S(W[t - 15],0) + W[t - 16])
//  142 
//  143     memcpy(stateN,ctx->state,8*sizeof(unsigned int));
        MOVS     R2,#+32
        ADDS     R1,R4,#+8
        ADD      R0,SP,#+24
        BL       memcpy
//  144     
//  145     for(indexA=0;indexA<2;indexA++)
        MOVS     R5,#+0
        B.N      ??SHA256_Process_2
//  146     {
//  147         for(indexB=0;indexB<8;indexB++)
//  148         {
//  149             P( stateN[(8-indexB)%8], stateN[(9-indexB)%8], stateN[(10-indexB)%8], &stateN[(11-indexB)%8], stateN[(12-indexB)%8], stateN[(13-indexB)%8], stateN[(14-indexB)%8], &stateN[(15-indexB)%8], W[indexA*8+indexB], KnumA[indexA*8+indexB]);
??SHA256_Process_3:
        ADDS     R0,R6,R5, LSL #+3
        LDR.N    R1,??DataTable1_16
        LDR      R0,[R1, R0, LSL #+2]
        STR      R0,[SP, #+20]
        ADDS     R0,R6,R5, LSL #+3
        ADD      R1,SP,#+56
        LDR      R0,[R1, R0, LSL #+2]
        STR      R0,[SP, #+16]
        RSBS     R0,R6,#+15
        MOVS     R1,#+8
        UDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        ADD      R0,SP,#+24
        ADDS     R0,R0,R2, LSL #+2
        STR      R0,[SP, #+12]
        RSBS     R0,R6,#+14
        MOVS     R1,#+8
        UDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        ADD      R0,SP,#+24
        LDR      R0,[R0, R2, LSL #+2]
        STR      R0,[SP, #+8]
        RSBS     R0,R6,#+13
        MOVS     R1,#+8
        UDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        ADD      R0,SP,#+24
        LDR      R0,[R0, R2, LSL #+2]
        STR      R0,[SP, #+4]
        RSBS     R0,R6,#+12
        MOVS     R1,#+8
        UDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        ADD      R0,SP,#+24
        LDR      R0,[R0, R2, LSL #+2]
        STR      R0,[SP, #+0]
        RSBS     R0,R6,#+11
        MOVS     R1,#+8
        UDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        ADD      R0,SP,#+24
        ADDS     R3,R0,R2, LSL #+2
        RSBS     R0,R6,#+10
        MOVS     R1,#+8
        UDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        ADD      R0,SP,#+24
        LDR      R2,[R0, R2, LSL #+2]
        RSBS     R0,R6,#+9
        MOVS     R1,#+8
        UDIV     R7,R0,R1
        MLS      R7,R7,R1,R0
        ADD      R0,SP,#+24
        LDR      R1,[R0, R7, LSL #+2]
        RSBS     R0,R6,#+8
        MOVS     R7,#+8
        UDIV     R12,R0,R7
        MLS      R12,R12,R7,R0
        ADD      R0,SP,#+24
        LDR      R0,[R0, R12, LSL #+2]
        BL       P
//  150         }
        ADDS     R6,R6,#+1
??SHA256_Process_4:
        CMP      R6,#+8
        BCC.N    ??SHA256_Process_3
        ADDS     R5,R5,#+1
??SHA256_Process_2:
        CMP      R5,#+2
        BCS.N    ??SHA256_Process_5
        MOVS     R6,#+0
        B.N      ??SHA256_Process_4
//  151     }
//  152     
//  153     for(indexA=0;indexA<6;indexA++)
??SHA256_Process_5:
        MOVS     R5,#+0
        B.N      ??SHA256_Process_6
//  154     {
//  155         for(indexB=0;indexB<8;indexB++)
//  156         {
//  157             P( stateN[(8-indexB)%8], stateN[(9-indexB)%8], stateN[(10-indexB)%8], &stateN[(11-indexB)%8], stateN[(12-indexB)%8], stateN[(13-indexB)%8], stateN[(14-indexB)%8], &stateN[(15-indexB)%8], R(indexA*8+indexB+16), KnumB[indexA*8+indexB]);
??SHA256_Process_7:
        MOVS     R1,#+1
        ADDS     R0,R6,R5, LSL #+3
        ADD      R2,SP,#+56
        ADDS     R0,R2,R0, LSL #+2
        LDR      R0,[R0, #+56]
        BL       S
        ADDS     R1,R6,R5, LSL #+3
        ADD      R2,SP,#+56
        ADDS     R1,R2,R1, LSL #+2
        LDR      R1,[R1, #+36]
        ADDS     R7,R1,R0
        MOVS     R1,#+0
        ADDS     R0,R6,R5, LSL #+3
        ADD      R2,SP,#+56
        ADDS     R0,R2,R0, LSL #+2
        LDR      R0,[R0, #+4]
        BL       S
        ADDS     R0,R0,R7
        ADDS     R1,R6,R5, LSL #+3
        ADD      R2,SP,#+56
        LDR      R1,[R2, R1, LSL #+2]
        ADDS     R0,R1,R0
        ADDS     R1,R6,R5, LSL #+3
        ADD      R2,SP,#+56
        ADDS     R1,R2,R1, LSL #+2
        STR      R0,[R1, #+64]
        ADDS     R1,R6,R5, LSL #+3
        LDR.N    R2,??DataTable1_17
        LDR      R1,[R2, R1, LSL #+2]
        STR      R1,[SP, #+20]
        STR      R0,[SP, #+16]
        RSBS     R0,R6,#+15
        MOVS     R1,#+8
        UDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        ADD      R0,SP,#+24
        ADDS     R0,R0,R2, LSL #+2
        STR      R0,[SP, #+12]
        RSBS     R0,R6,#+14
        MOVS     R1,#+8
        UDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        ADD      R0,SP,#+24
        LDR      R0,[R0, R2, LSL #+2]
        STR      R0,[SP, #+8]
        RSBS     R0,R6,#+13
        MOVS     R1,#+8
        UDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        ADD      R0,SP,#+24
        LDR      R0,[R0, R2, LSL #+2]
        STR      R0,[SP, #+4]
        RSBS     R0,R6,#+12
        MOVS     R1,#+8
        UDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        ADD      R0,SP,#+24
        LDR      R0,[R0, R2, LSL #+2]
        STR      R0,[SP, #+0]
        RSBS     R0,R6,#+11
        MOVS     R1,#+8
        UDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        ADD      R0,SP,#+24
        ADDS     R3,R0,R2, LSL #+2
        RSBS     R0,R6,#+10
        MOVS     R1,#+8
        UDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        ADD      R0,SP,#+24
        LDR      R2,[R0, R2, LSL #+2]
        RSBS     R0,R6,#+9
        MOVS     R1,#+8
        UDIV     R7,R0,R1
        MLS      R7,R7,R1,R0
        ADD      R0,SP,#+24
        LDR      R1,[R0, R7, LSL #+2]
        RSBS     R0,R6,#+8
        MOVS     R7,#+8
        UDIV     R12,R0,R7
        MLS      R12,R12,R7,R0
        ADD      R0,SP,#+24
        LDR      R0,[R0, R12, LSL #+2]
        BL       P
//  158         }
        ADDS     R6,R6,#+1
??SHA256_Process_8:
        CMP      R6,#+8
        BCC.W    ??SHA256_Process_7
        ADDS     R5,R5,#+1
??SHA256_Process_6:
        CMP      R5,#+6
        BCS.N    ??SHA256_Process_9
        MOVS     R6,#+0
        B.N      ??SHA256_Process_8
//  159     }
//  160     
//  161     for(indexA=0;indexA<8;indexA++)
??SHA256_Process_9:
        MOVS     R5,#+0
        B.N      ??SHA256_Process_10
//  162     {
//  163         ctx->state[indexA] += stateN[indexA];
??SHA256_Process_11:
        ADDS     R0,R4,R5, LSL #+2
        LDR      R0,[R0, #+8]
        ADD      R1,SP,#+24
        LDR      R1,[R1, R5, LSL #+2]
        ADDS     R0,R1,R0
        ADDS     R1,R4,R5, LSL #+2
        STR      R0,[R1, #+8]
//  164     }
        ADDS     R5,R5,#+1
??SHA256_Process_10:
        CMP      R5,#+8
        BCC.N    ??SHA256_Process_11
//  165 }
        ADD      SP,SP,#+316
        POP      {R4-R7,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     0x6a09e667

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     0xbb67ae85

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     0x3c6ef372

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DC32     0xa54ff53a

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_4:
        DC32     0x510e527f

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_5:
        DC32     0x9b05688c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_6:
        DC32     0x1f83d9ab

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_7:
        DC32     0x5be0cd19

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_8:
        DC32     0xc1059ed8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_9:
        DC32     0x367cd507

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_10:
        DC32     0x3070dd17

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_11:
        DC32     0xf70e5939

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_12:
        DC32     0xffc00b31

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_13:
        DC32     0x68581511

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_14:
        DC32     0x64f98fa7

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_15:
        DC32     0xbefa4fa4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_16:
        DC32     KnumA

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_17:
        DC32     KnumB
//  166 
//  167 /*********************************************************
//  168 函数定义：PubCrypt_SHA256Update
//  169 函数功能： SHA-256 HASH算法
//  170 参数
//  171 	hd(in/out)	sha256结构体
//  172 	inbuf(in)	写入的数据
//  173 	inlen(in)	写入数据的长度
//  174 返回值
//  175 	RETURN_SUCC 成功
//  176 	RETURN_FAIL 失败
//  177 	RETURN_ERR_PARAM 参数错
//  178 *********************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  179 int PubCrypt_SHA256Update( SHA256_CONTEXT *hd, unsigned char *inbuf, unsigned int inlen)
//  180 {
PubCrypt_SHA256Update:
        PUSH     {R4-R8,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//  181     int  fill;
//  182     unsigned int  left;
//  183     //去掉判断，减少代码空间
//  184     //if(hd==NULL || inbuf==NULL || inlen <= 0)
//  185     //{
//  186     //    return RETURN_ERR_PARAM;
//  187     //}
//  188 
//  189     left = hd->total[0] & 0x3F;
        LDRB     R0,[R4, #+0]
        ANDS     R7,R0,#0x3F
//  190     fill = 64 - left;
        RSBS     R8,R7,#+64
//  191 
//  192     hd->total[0] += inlen;
        LDR      R0,[R4, #+0]
        ADDS     R0,R6,R0
        STR      R0,[R4, #+0]
//  193     hd->total[0] &= 0xFFFFFFFF;
        LDR      R0,[R4, #+0]
        STR      R0,[R4, #+0]
//  194 
//  195     if(hd->total[0] < (unsigned long) inlen )
        LDR      R0,[R4, #+0]
        CMP      R0,R6
        BCS.N    ??PubCrypt_SHA256Update_0
//  196     {
//  197         hd->total[1]++;
        LDR      R0,[R4, #+4]
        ADDS     R0,R0,#+1
        STR      R0,[R4, #+4]
//  198     }
//  199 
//  200     if(left && inlen >= fill )
??PubCrypt_SHA256Update_0:
        CMP      R7,#+0
        BEQ.N    ??PubCrypt_SHA256Update_1
        CMP      R6,R8
        BCC.N    ??PubCrypt_SHA256Update_1
//  201     {
//  202         memcpy((void *) (hd->buffer + left),(void *) inbuf, fill );
        MOV      R2,R8
        MOVS     R1,R5
        ADDS     R0,R7,R4
        ADDS     R0,R0,#+40
        BL       memcpy
//  203         SHA256_Process(hd, hd->buffer );
        ADDS     R1,R4,#+40
        MOVS     R0,R4
        BL       SHA256_Process
//  204         inbuf += fill;
        ADDS     R5,R8,R5
//  205         inlen  -= fill;
        SUBS     R6,R6,R8
//  206         left = 0;
        MOVS     R7,#+0
        B.N      ??PubCrypt_SHA256Update_1
//  207     }
//  208 
//  209     while(inlen >= 64 )
//  210     {
//  211         SHA256_Process(hd, inbuf );
??PubCrypt_SHA256Update_2:
        MOVS     R1,R5
        MOVS     R0,R4
        BL       SHA256_Process
//  212         inbuf += 64;
        ADDS     R5,R5,#+64
//  213         inlen  -= 64;
        SUBS     R6,R6,#+64
//  214     }
??PubCrypt_SHA256Update_1:
        CMP      R6,#+64
        BCS.N    ??PubCrypt_SHA256Update_2
//  215 
//  216     if(inlen > 0 )
        CMP      R6,#+0
        BEQ.N    ??PubCrypt_SHA256Update_3
//  217     {
//  218         memcpy((void *) (hd->buffer + left),(void *) inbuf, inlen );
        MOVS     R2,R6
        MOVS     R1,R5
        ADDS     R0,R7,R4
        ADDS     R0,R0,#+40
        BL       memcpy
//  219     }
//  220     return RETURN_SUCC;
??PubCrypt_SHA256Update_3:
        MOVS     R0,#+1
        POP      {R4-R8,PC}       ;; return
//  221 }
//  222 
//  223 /*********************************************************
//  224 函数定义：PubCrypt_SHA256Final
//  225 函数功能： SHA-256 HASH算法
//  226 参数
//  227 	hd(in)			sha256结构体
//  228 	strHash(out)	最终的hash值
//  229 返回值
//  230 	RETURN_SUCC 成功
//  231 	RETURN_FAIL 失败
//  232 	RETURN_ERR_PARAM 参数错
//  233 *********************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  234 int PubCrypt_SHA256Final(SHA256_CONTEXT *hd,unsigned char *strHash)
//  235 {
PubCrypt_SHA256Final:
        PUSH     {R4-R7,LR}
        SUB      SP,SP,#+12
        MOVS     R4,R0
        MOVS     R5,R1
//  236     unsigned int  last, padn;
//  237     unsigned int  high, low;
//  238     unsigned char  msglen[8];
//  239     unsigned char *sha2_padding;
//  240     //去掉判断，减少代码空间
//  241     //if(hd==NULL || strHash==NULL)
//  242     //{
//  243     //    return RETURN_ERR_PARAM;
//  244     //}
//  245 
//  246     high = ( hd->total[0] >> 29 ) | ( hd->total[1] <<  3 );
        LDR      R0,[R4, #+0]
        LDR      R1,[R4, #+4]
        LSLS     R1,R1,#+3
        ORRS     R0,R1,R0, LSR #+29
//  247     low  = ( hd->total[0] <<  3 );
        LDR      R1,[R4, #+0]
        LSLS     R6,R1,#+3
//  248 
//  249     IntToHex( high, msglen);
        ADD      R1,SP,#+0
        BL       IntToHex
//  250     IntToHex( low,  msglen+4);
        ADD      R1,SP,#+4
        MOVS     R0,R6
        BL       IntToHex
//  251 
//  252     last = hd->total[0] & 0x3F;
        LDRB     R0,[R4, #+0]
        ANDS     R0,R0,#0x3F
//  253     padn = ( last < 56 ) ? ( 56 - last ) : ( 120 - last );
        CMP      R0,#+56
        BCS.N    ??PubCrypt_SHA256Final_0
        RSBS     R6,R0,#+56
        B.N      ??PubCrypt_SHA256Final_1
??PubCrypt_SHA256Final_0:
        RSBS     R6,R0,#+120
//  254 
//  255     sha2_padding=(unsigned char *)malloc(padn);
??PubCrypt_SHA256Final_1:
        MOVS     R0,R6
        BL       malloc
        MOVS     R7,R0
//  256     if(sha2_padding==NULL)
        CMP      R7,#+0
        BNE.N    ??PubCrypt_SHA256Final_2
//  257     {
//  258         return RETURN_FAIL;
        MOVS     R0,#+0
        B.N      ??PubCrypt_SHA256Final_3
//  259     }
//  260     memset(sha2_padding,0,padn);
??PubCrypt_SHA256Final_2:
        MOVS     R2,R6
        MOVS     R1,#+0
        MOVS     R0,R7
        BL       memset
//  261     sha2_padding[0]=0x80;
        MOVS     R0,#+128
        STRB     R0,[R7, #+0]
//  262     PubCrypt_SHA256Update( hd, (unsigned char *) sha2_padding, padn );
        MOVS     R2,R6
        MOVS     R1,R7
        MOVS     R0,R4
        BL       PubCrypt_SHA256Update
//  263     free(sha2_padding);
        MOVS     R0,R7
        BL       free
//  264     PubCrypt_SHA256Update( hd, msglen, 8 );
        MOVS     R2,#+8
        ADD      R1,SP,#+0
        MOVS     R0,R4
        BL       PubCrypt_SHA256Update
//  265 
//  266     for(padn=0;padn<7;padn++)
        MOVS     R6,#+0
        B.N      ??PubCrypt_SHA256Final_4
//  267     {
//  268         IntToHex( hd->state[padn], strHash+padn*4);
??PubCrypt_SHA256Final_5:
        ADDS     R1,R5,R6, LSL #+2
        ADDS     R0,R4,R6, LSL #+2
        LDR      R0,[R0, #+8]
        BL       IntToHex
//  269     }
        ADDS     R6,R6,#+1
??PubCrypt_SHA256Final_4:
        CMP      R6,#+7
        BCC.N    ??PubCrypt_SHA256Final_5
//  270 
//  271     if( hd->is224 == 0 )
        LDRB     R0,[R4, #+232]
        CMP      R0,#+0
        BNE.N    ??PubCrypt_SHA256Final_6
//  272     {
//  273         IntToHex( hd->state[7], strHash+28 );
        ADDS     R1,R5,#+28
        LDR      R0,[R4, #+36]
        BL       IntToHex
//  274     }
//  275     return RETURN_SUCC;
??PubCrypt_SHA256Final_6:
        MOVS     R0,#+1
??PubCrypt_SHA256Final_3:
        POP      {R1-R7,PC}       ;; return
//  276 }
//  277 
//  278 /*********************************************************
//  279 函数定义：PubCrypt_SHA256
//  280 函数功能： SHA-256 HASH算法
//  281 参数
//  282 	pData(in)             --生成SHA的数据
//  283 	pLen(in)              --数据长度
//  284 	strHash(out)          --生成的HASH值(32字节)
//  285 返回值
//  286 	RETURN_SUCC 成功
//  287 	RETURN_FAIL 失败
//  288 	RETURN_ERR_PARAM 参数错误
//  289 *********************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  290 int PubCrypt_SHA256(const unsigned char *pData,unsigned int pLen,unsigned char *strHash)
//  291 {
PubCrypt_SHA256:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//  292     SHA256_CONTEXT *ctx;
//  293     //去掉判断，减少代码空间
//  294     //if(pData==NULL || strHash==NULL)
//  295     //{
//  296     //	return RETURN_ERR_PARAM;
//  297     //}
//  298     ctx=(SHA256_CONTEXT *)malloc(sizeof(SHA256_CONTEXT));
        MOVS     R0,#+236
        BL       malloc
        MOVS     R7,R0
//  299     if(ctx==NULL)
        CMP      R7,#+0
        BNE.N    ??PubCrypt_SHA256_0
//  300     {
//  301         return RETURN_FAIL;
        MOVS     R0,#+0
        B.N      ??PubCrypt_SHA256_1
//  302     }
//  303     SHA256_Init (ctx,0);
??PubCrypt_SHA256_0:
        MOVS     R1,#+0
        MOVS     R0,R7
        BL       SHA256_Init
//  304     PubCrypt_SHA256Update (ctx, (unsigned char *)pData, pLen);
        MOVS     R2,R5
        MOVS     R1,R4
        MOVS     R0,R7
        BL       PubCrypt_SHA256Update
//  305     PubCrypt_SHA256Final (ctx,strHash);
        MOVS     R1,R6
        MOVS     R0,R7
        BL       PubCrypt_SHA256Final
//  306     free(ctx);
        MOVS     R0,R7
        BL       free
//  307     return RETURN_SUCC;
        MOVS     R0,#+1
??PubCrypt_SHA256_1:
        POP      {R1,R4-R7,PC}    ;; return
//  308 }
//  309 
//  310 /*********************************************************
//  311 函数定义：PubCrypt_SHA256Init
//  312 函数功能： SHA-256 HASH算法
//  313 参数
//  314 	hd(in/out)	sha256结构体
//  315 返回值
//  316 	RETURN_SUCC 成功
//  317 	RETURN_FAIL 失败
//  318 	RETURN_ERR_PARAM 参数错误
//  319 *********************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  320 int PubCrypt_SHA256Init( SHA256_CONTEXT *hd )
//  321 {
PubCrypt_SHA256Init:
        PUSH     {R7,LR}
//  322     //去掉判断，减少代码空间
//  323     //if(hd==NULL)
//  324     //{
//  325     //    return RETURN_ERR_PARAM;
//  326     //}
//  327     SHA256_Init( hd ,0);
        MOVS     R1,#+0
        BL       SHA256_Init
//  328     return RETURN_SUCC;
        MOVS     R0,#+1
        POP      {R1,PC}          ;; return
//  329 }

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  330 
// 
//   256 bytes in section .rodata
// 1 306 bytes in section .text
// 
// 1 306 bytes of CODE  memory
//   256 bytes of CONST memory
//
//Errors: none
//Warnings: 2
