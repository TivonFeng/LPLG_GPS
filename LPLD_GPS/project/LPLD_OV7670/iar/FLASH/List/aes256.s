///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.1.6676/W32 for ARM       23/Apr/2015  14:23:09
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  G:\test\LPLD_OSKinetis_V3_now02\lib\Security\aes256.c
//    Command line =  
//        G:\test\LPLD_OSKinetis_V3_now02\lib\Security\aes256.c -D LPLD_K60
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
//        G:\test\LPLD_OSKinetis_V3_now02\project\LPLD_OV7670\iar\FLASH\List\aes256.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        PUBLIC aes256_decrypt_ecb
        PUBLIC aes256_done
        PUBLIC aes256_encrypt_ecb
        PUBLIC aes256_init
        PUBLIC aes_addRoundKey
        PUBLIC aes_addRoundKey_cpy
        PUBLIC aes_expandDecKey
        PUBLIC aes_expandEncKey
        PUBLIC aes_mixColumns
        PUBLIC aes_mixColumns_inv
        PUBLIC aes_shiftRows
        PUBLIC aes_shiftRows_inv
        PUBLIC aes_subBytes
        PUBLIC aes_subBytes_inv
        PUBLIC gf_alog
        PUBLIC gf_log
        PUBLIC gf_mulinv
        PUBLIC rj_sbox
        PUBLIC rj_xtime

// G:\test\LPLD_OSKinetis_V3_now02\lib\Security\aes256.c
//    1 /*  
//    2 *   Byte-oriented AES-256 implementation.
//    3 *   All lookup tables replaced with 'on the fly' calculations. 
//    4 *
//    5 *   Copyright (c) 2007 Ilya O. Levin, http://www.literatecode.com
//    6 *
//    7 *   Permission to use, copy, modify, and distribute this software for any
//    8 *   purpose with or without fee is hereby granted, provided that the above
//    9 *   copyright notice and this permission notice appear in all copies.
//   10 *
//   11 *   THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
//   12 *   WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
//   13 *   MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
//   14 *   ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
//   15 *   WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
//   16 *   ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
//   17 *   OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
//   18 */
//   19 #include "aes256.h"
//   20 
//   21 #define F(x)   (((x)<<1) ^ ((((x)>>7) & 1) * 0x1b))
//   22 #define FD(x)  (((x) >> 1) ^ (((x) & 1) ? 0x8d : 0))
//   23 
//   24 /* -------------------------------------------------------------------------- */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   25 uint8_t gf_alog(uint8_t x) // calculate anti-logarithm gen 3
//   26 {
//   27     uint8_t atb = 1, z;
gf_alog:
        MOVS     R1,#+1
        B.N      ??gf_alog_0
//   28 
//   29     while (x--) {z = atb; atb <<= 1; if (z & 0x80) atb^= 0x1b; atb ^= z;}
??gf_alog_1:
        MOVS     R2,R1
        LSLS     R1,R1,#+1
        LSLS     R3,R2,#+24
        BPL.N    ??gf_alog_2
        EORS     R1,R1,#0x1B
??gf_alog_2:
        EORS     R1,R2,R1
??gf_alog_0:
        MOVS     R2,R0
        SUBS     R0,R2,#+1
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+0
        BNE.N    ??gf_alog_1
//   30 
//   31     return atb;
        MOVS     R0,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return
//   32 } /* gf_alog */
//   33 
//   34 /* -------------------------------------------------------------------------- */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   35 uint8_t gf_log(uint8_t x) // calculate logarithm gen 3
//   36 {
gf_log:
        PUSH     {R4}
//   37     uint8_t atb = 1, i = 0, z;
        MOVS     R2,#+1
        MOVS     R1,#+0
//   38 
//   39     do {
//   40         if (atb == x) break;
??gf_log_0:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R2,R0
        BEQ.N    ??gf_log_1
//   41         z = atb; atb <<= 1; if (z & 0x80) atb^= 0x1b; atb ^= z;
??gf_log_2:
        MOVS     R3,R2
        LSLS     R2,R2,#+1
        LSLS     R4,R3,#+24
        BPL.N    ??gf_log_3
        EORS     R2,R2,#0x1B
??gf_log_3:
        EORS     R2,R3,R2
//   42     } while (++i > 0);
        ADDS     R1,R1,#+1
        MOVS     R3,R1
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        CMP      R3,#+0
        BNE.N    ??gf_log_0
//   43 
//   44     return i;
??gf_log_1:
        MOVS     R0,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4}
        BX       LR               ;; return
//   45 } /* gf_log */
//   46 
//   47 
//   48 /* -------------------------------------------------------------------------- */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   49 uint8_t gf_mulinv(uint8_t x) // calculate multiplicative inverse
//   50 {
gf_mulinv:
        PUSH     {R7,LR}
//   51     return (x) ? gf_alog(255 - gf_log(x)) : 0;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??gf_mulinv_0
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       gf_log
        RSBS     R0,R0,#+255
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       gf_alog
        B.N      ??gf_mulinv_1
??gf_mulinv_0:
        MOVS     R0,#+0
??gf_mulinv_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,PC}          ;; return
//   52 } /* gf_mulinv */
//   53 
//   54 /* -------------------------------------------------------------------------- */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   55 uint8_t rj_sbox(uint8_t x)
//   56 {
rj_sbox:
        PUSH     {R7,LR}
//   57     uint8_t y, sb;
//   58 
//   59     sb = y = gf_mulinv(x);
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       gf_mulinv
        MOVS     R1,R0
//   60     y = (y<<1)|(y>>7); sb ^= y;  y = (y<<1)|(y>>7); sb ^= y; 
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSRS     R2,R0,#+7
        ORRS     R0,R2,R0, LSL #+1
        EORS     R1,R0,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSRS     R2,R0,#+7
        ORRS     R0,R2,R0, LSL #+1
        EORS     R1,R0,R1
//   61     y = (y<<1)|(y>>7); sb ^= y;  y = (y<<1)|(y>>7); sb ^= y;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSRS     R2,R0,#+7
        ORRS     R0,R2,R0, LSL #+1
        EORS     R1,R0,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSRS     R2,R0,#+7
        ORRS     R0,R2,R0, LSL #+1
        EORS     R1,R0,R1
//   62 
//   63     return (sb ^ 0x63);
        EORS     R0,R1,#0x63
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,PC}          ;; return
//   64 } /* rj_sbox */
//   65 
//   66 /* -------------------------------------------------------------------------- */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   67 uint8_t rj_xtime(uint8_t x) 
//   68 {
//   69     return (x & 0x80) ? ((x << 1) ^ 0x1b) : (x << 1);
rj_xtime:
        LSLS     R1,R0,#+24
        BPL.N    ??rj_xtime_0
        LSLS     R0,R0,#+1
        EORS     R0,R0,#0x1B
        B.N      ??rj_xtime_1
??rj_xtime_0:
        LSLS     R0,R0,#+1
??rj_xtime_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return
//   70 } /* rj_xtime */
//   71 
//   72 
//   73 /* -------------------------------------------------------------------------- */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   74 void aes_subBytes(uint8_t *buf)
//   75 {
aes_subBytes:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
//   76     register uint8_t i = 16;
        MOVS     R5,#+16
        B.N      ??aes_subBytes_0
//   77     while (i--) buf[i] = rj_sbox(buf[i]);
??aes_subBytes_1:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDRB     R0,[R5, R4]
        BL       rj_sbox
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        STRB     R0,[R5, R4]
??aes_subBytes_0:
        MOVS     R0,R5
        SUBS     R5,R0,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??aes_subBytes_1
//   78 } /* aes_subBytes */
        POP      {R0,R4,R5,PC}    ;; return
//   79 
//   80 /* -------------------------------------------------------------------------- */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   81 void aes_subBytes_inv(uint8_t *buf)
//   82 {
aes_subBytes_inv:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
//   83     register uint8_t i = 16, j;
        MOVS     R5,#+16
        B.N      ??aes_subBytes_inv_0
//   84     while (i--) 
//   85     {
//   86         j = 0; do { if (rj_sbox(j) == buf[i]) {buf[i] = j; break;} } while (++j);
??aes_subBytes_inv_1:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        STRB     R6,[R5, R4]
??aes_subBytes_inv_0:
        MOVS     R0,R5
        SUBS     R5,R0,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??aes_subBytes_inv_2
        MOVS     R6,#+0
??aes_subBytes_inv_3:
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       rj_sbox
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDRB     R1,[R5, R4]
        CMP      R0,R1
        BEQ.N    ??aes_subBytes_inv_1
        ADDS     R6,R6,#+1
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??aes_subBytes_inv_3
        B.N      ??aes_subBytes_inv_0
//   87     }
//   88 } /* aes_subBytes_inv */
??aes_subBytes_inv_2:
        POP      {R4-R6,PC}       ;; return
//   89 
//   90 /* -------------------------------------------------------------------------- */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   91 void aes_addRoundKey(uint8_t *buf, uint8_t *key)
//   92 {
aes_addRoundKey:
        PUSH     {R4}
//   93     register uint8_t i = 16;
        MOVS     R2,#+16
        B.N      ??aes_addRoundKey_0
//   94     while (i--) buf[i] ^= key[i];
??aes_addRoundKey_1:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LDRB     R3,[R2, R0]
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LDRB     R4,[R2, R1]
        EORS     R3,R4,R3
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        STRB     R3,[R2, R0]
??aes_addRoundKey_0:
        MOVS     R3,R2
        SUBS     R2,R3,#+1
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        CMP      R3,#+0
        BNE.N    ??aes_addRoundKey_1
//   95 } /* aes_addRoundKey */
        POP      {R4}
        BX       LR               ;; return
//   96 
//   97 /* -------------------------------------------------------------------------- */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   98 void aes_addRoundKey_cpy(uint8_t *buf, uint8_t *key, uint8_t *cpk)
//   99 {
aes_addRoundKey_cpy:
        PUSH     {R4,R5}
//  100     register uint8_t i = 16;
        MOVS     R3,#+16
        B.N      ??aes_addRoundKey_cpy_0
//  101     while (i--)  buf[i] ^= (cpk[i] = key[i]), cpk[16+i] = key[16 + i];
??aes_addRoundKey_cpy_1:
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        LDRB     R4,[R3, R1]
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        STRB     R4,[R3, R2]
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        LDRB     R5,[R3, R0]
        EORS     R4,R4,R5
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        STRB     R4,[R3, R0]
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        ADDS     R4,R3,R1
        LDRB     R4,[R4, #+16]
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        ADDS     R5,R3,R2
        STRB     R4,[R5, #+16]
??aes_addRoundKey_cpy_0:
        MOVS     R4,R3
        SUBS     R3,R4,#+1
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.N    ??aes_addRoundKey_cpy_1
//  102 } /* aes_addRoundKey_cpy */
        POP      {R4,R5}
        BX       LR               ;; return
//  103 
//  104 
//  105 /* -------------------------------------------------------------------------- */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  106 void aes_shiftRows(uint8_t *buf)
//  107 {
//  108     register uint8_t i, j; /* to make it potentially parallelable :) */
//  109 
//  110     i = buf[1]; buf[1] = buf[5]; buf[5] = buf[9]; buf[9] = buf[13]; buf[13] = i;
aes_shiftRows:
        LDRB     R1,[R0, #+1]
        LDRB     R2,[R0, #+5]
        STRB     R2,[R0, #+1]
        LDRB     R2,[R0, #+9]
        STRB     R2,[R0, #+5]
        LDRB     R2,[R0, #+13]
        STRB     R2,[R0, #+9]
        STRB     R1,[R0, #+13]
//  111     i = buf[10]; buf[10] = buf[2]; buf[2] = i;
        LDRB     R1,[R0, #+10]
        LDRB     R2,[R0, #+2]
        STRB     R2,[R0, #+10]
        STRB     R1,[R0, #+2]
//  112     j = buf[3]; buf[3] = buf[15]; buf[15] = buf[11]; buf[11] = buf[7]; buf[7] = j;
        LDRB     R1,[R0, #+3]
        LDRB     R2,[R0, #+15]
        STRB     R2,[R0, #+3]
        LDRB     R2,[R0, #+11]
        STRB     R2,[R0, #+15]
        LDRB     R2,[R0, #+7]
        STRB     R2,[R0, #+11]
        STRB     R1,[R0, #+7]
//  113     j = buf[14]; buf[14] = buf[6]; buf[6]  = j;
        LDRB     R1,[R0, #+14]
        LDRB     R2,[R0, #+6]
        STRB     R2,[R0, #+14]
        STRB     R1,[R0, #+6]
//  114 
//  115 } /* aes_shiftRows */
        BX       LR               ;; return
//  116 
//  117 /* -------------------------------------------------------------------------- */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  118 void aes_shiftRows_inv(uint8_t *buf)
//  119 {
//  120     register uint8_t i, j; /* same as above :) */
//  121 
//  122     i = buf[1]; buf[1] = buf[13]; buf[13] = buf[9]; buf[9] = buf[5]; buf[5] = i;
aes_shiftRows_inv:
        LDRB     R1,[R0, #+1]
        LDRB     R2,[R0, #+13]
        STRB     R2,[R0, #+1]
        LDRB     R2,[R0, #+9]
        STRB     R2,[R0, #+13]
        LDRB     R2,[R0, #+5]
        STRB     R2,[R0, #+9]
        STRB     R1,[R0, #+5]
//  123     i = buf[2]; buf[2] = buf[10]; buf[10] = i;
        LDRB     R1,[R0, #+2]
        LDRB     R2,[R0, #+10]
        STRB     R2,[R0, #+2]
        STRB     R1,[R0, #+10]
//  124     j = buf[3]; buf[3] = buf[7]; buf[7] = buf[11]; buf[11] = buf[15]; buf[15] = j;
        LDRB     R1,[R0, #+3]
        LDRB     R2,[R0, #+7]
        STRB     R2,[R0, #+3]
        LDRB     R2,[R0, #+11]
        STRB     R2,[R0, #+7]
        LDRB     R2,[R0, #+15]
        STRB     R2,[R0, #+11]
        STRB     R1,[R0, #+15]
//  125     j = buf[6]; buf[6] = buf[14]; buf[14] = j;
        LDRB     R1,[R0, #+6]
        LDRB     R2,[R0, #+14]
        STRB     R2,[R0, #+6]
        STRB     R1,[R0, #+14]
//  126 
//  127 } /* aes_shiftRows_inv */
        BX       LR               ;; return
//  128 
//  129 /* -------------------------------------------------------------------------- */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  130 void aes_mixColumns(uint8_t *buf)
//  131 {
aes_mixColumns:
        PUSH     {R3-R11,LR}
        MOVS     R4,R0
//  132     register uint8_t i, a, b, c, d, e;
//  133 
//  134     for (i = 0; i < 16; i += 4)
        MOVS     R5,#+0
        B.N      ??aes_mixColumns_0
//  135     {
//  136         a = buf[i]; b = buf[i + 1]; c = buf[i + 2]; d = buf[i + 3];
??aes_mixColumns_1:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDRB     R6,[R5, R4]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R0,R5,R4
        LDRB     R7,[R0, #+1]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R0,R5,R4
        LDRB     R8,[R0, #+2]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R0,R5,R4
        LDRB     R9,[R0, #+3]
//  137         e = a ^ b ^ c ^ d;
        EORS     R0,R7,R6
        EORS     R0,R8,R0
        EORS     R10,R9,R0
//  138         buf[i] ^= e ^ rj_xtime(a^b);   buf[i+1] ^= e ^ rj_xtime(b^c);
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDRB     R11,[R5, R4]
        EORS     R0,R7,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       rj_xtime
        EORS     R0,R0,R10
        EORS     R0,R0,R11
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        STRB     R0,[R5, R4]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R0,R5,R4
        LDRB     R11,[R0, #+1]
        EORS     R0,R8,R7
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       rj_xtime
        EORS     R0,R0,R10
        EORS     R0,R0,R11
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R1,R5,R4
        STRB     R0,[R1, #+1]
//  139         buf[i+2] ^= e ^ rj_xtime(c^d); buf[i+3] ^= e ^ rj_xtime(d^a);
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R0,R5,R4
        LDRB     R7,[R0, #+2]
        EORS     R0,R9,R8
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       rj_xtime
        EORS     R0,R0,R10
        EORS     R0,R0,R7
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R1,R5,R4
        STRB     R0,[R1, #+2]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R0,R5,R4
        LDRB     R7,[R0, #+3]
        EORS     R0,R6,R9
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       rj_xtime
        EORS     R0,R0,R10
        EORS     R0,R0,R7
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R1,R5,R4
        STRB     R0,[R1, #+3]
//  140     }
        ADDS     R5,R5,#+4
??aes_mixColumns_0:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+16
        BLT.N    ??aes_mixColumns_1
//  141 } /* aes_mixColumns */
        POP      {R0,R4-R11,PC}   ;; return
//  142 
//  143 /* -------------------------------------------------------------------------- */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  144 void aes_mixColumns_inv(uint8_t *buf)
//  145 {
aes_mixColumns_inv:
        PUSH     {R3-R11,LR}
        MOVS     R4,R0
//  146     register uint8_t i, a, b, c, d, e, x, y, z;
//  147 
//  148     for (i = 0; i < 16; i += 4)
        MOVS     R5,#+0
        B.N      ??aes_mixColumns_inv_0
//  149     {
//  150         a = buf[i]; b = buf[i + 1]; c = buf[i + 2]; d = buf[i + 3];
??aes_mixColumns_inv_1:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDRB     R0,[R5, R4]
        STRB     R0,[SP, #+0]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R0,R5,R4
        LDRB     R6,[R0, #+1]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R0,R5,R4
        LDRB     R7,[R0, #+2]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R0,R5,R4
        LDRB     R8,[R0, #+3]
//  151         e = a ^ b ^ c ^ d;
        LDRB     R0,[SP, #+0]
        EORS     R0,R6,R0
        EORS     R0,R7,R0
        EORS     R10,R8,R0
//  152         z = rj_xtime(e);
        MOV      R0,R10
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       rj_xtime
        MOV      R11,R0
//  153         x = e ^ rj_xtime(rj_xtime(z^a^c));  y = e ^ rj_xtime(rj_xtime(z^b^d));
        LDRB     R0,[SP, #+0]
        EORS     R0,R0,R11
        EORS     R0,R7,R0
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       rj_xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       rj_xtime
        EORS     R9,R0,R10
        EORS     R0,R6,R11
        EORS     R0,R8,R0
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       rj_xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       rj_xtime
        EORS     R10,R0,R10
//  154         buf[i] ^= x ^ rj_xtime(a^b);   buf[i+1] ^= y ^ rj_xtime(b^c);
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDRB     R11,[R5, R4]
        LDRB     R0,[SP, #+0]
        EORS     R0,R6,R0
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       rj_xtime
        EORS     R0,R0,R9
        EORS     R0,R0,R11
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        STRB     R0,[R5, R4]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R0,R5,R4
        LDRB     R11,[R0, #+1]
        EORS     R0,R7,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       rj_xtime
        EORS     R0,R0,R10
        EORS     R0,R0,R11
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R1,R5,R4
        STRB     R0,[R1, #+1]
//  155         buf[i+2] ^= x ^ rj_xtime(c^d); buf[i+3] ^= y ^ rj_xtime(d^a);
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R0,R5,R4
        LDRB     R6,[R0, #+2]
        EORS     R0,R8,R7
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       rj_xtime
        EORS     R0,R0,R9
        EORS     R0,R0,R6
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R1,R5,R4
        STRB     R0,[R1, #+2]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R0,R5,R4
        LDRB     R6,[R0, #+3]
        LDRB     R0,[SP, #+0]
        EORS     R0,R0,R8
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       rj_xtime
        EORS     R0,R0,R10
        EORS     R0,R0,R6
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R1,R5,R4
        STRB     R0,[R1, #+3]
//  156     }
        ADDS     R5,R5,#+4
??aes_mixColumns_inv_0:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+16
        BLT.N    ??aes_mixColumns_inv_1
//  157 } /* aes_mixColumns_inv */
        POP      {R0,R4-R11,PC}   ;; return
//  158 
//  159 /* -------------------------------------------------------------------------- */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  160 void aes_expandEncKey(uint8_t *k, uint8_t *rc) 
//  161 {
aes_expandEncKey:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
//  162     register uint8_t i;
//  163 
//  164     k[0] ^= rj_sbox(k[29]) ^ (*rc);
        LDRB     R6,[R4, #+0]
        LDRB     R0,[R4, #+29]
        BL       rj_sbox
        LDRB     R1,[R5, #+0]
        EORS     R0,R1,R0
        EORS     R0,R0,R6
        STRB     R0,[R4, #+0]
//  165     k[1] ^= rj_sbox(k[30]);
        LDRB     R6,[R4, #+1]
        LDRB     R0,[R4, #+30]
        BL       rj_sbox
        EORS     R0,R0,R6
        STRB     R0,[R4, #+1]
//  166     k[2] ^= rj_sbox(k[31]);
        LDRB     R6,[R4, #+2]
        LDRB     R0,[R4, #+31]
        BL       rj_sbox
        EORS     R0,R0,R6
        STRB     R0,[R4, #+2]
//  167     k[3] ^= rj_sbox(k[28]);
        LDRB     R6,[R4, #+3]
        LDRB     R0,[R4, #+28]
        BL       rj_sbox
        EORS     R0,R0,R6
        STRB     R0,[R4, #+3]
//  168     *rc = F( *rc);
        LDRB     R0,[R5, #+0]
        LDRB     R1,[R5, #+0]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSRS     R1,R1,#+7
        MOVS     R2,#+27
        SMULBB   R1,R1,R2
        EORS     R0,R1,R0, LSL #+1
        STRB     R0,[R5, #+0]
//  169 
//  170     for(i = 4; i < 16; i += 4)  k[i] ^= k[i-4],   k[i+1] ^= k[i-3],
        MOVS     R0,#+4
        B.N      ??aes_expandEncKey_0
//  171                                 k[i+2] ^= k[i-2], k[i+3] ^= k[i-1];
??aes_expandEncKey_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDRB     R1,[R0, R4]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADDS     R2,R0,R4
        LDRB     R2,[R2, #-4]
        EORS     R1,R2,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        STRB     R1,[R0, R4]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADDS     R1,R0,R4
        LDRB     R1,[R1, #+1]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADDS     R2,R0,R4
        LDRB     R2,[R2, #-3]
        EORS     R1,R2,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADDS     R2,R0,R4
        STRB     R1,[R2, #+1]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADDS     R1,R0,R4
        LDRB     R1,[R1, #+2]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADDS     R2,R0,R4
        LDRB     R2,[R2, #-2]
        EORS     R1,R2,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADDS     R2,R0,R4
        STRB     R1,[R2, #+2]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADDS     R1,R0,R4
        LDRB     R1,[R1, #+3]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADDS     R2,R0,R4
        LDRB     R2,[R2, #-1]
        EORS     R1,R2,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADDS     R2,R0,R4
        STRB     R1,[R2, #+3]
        ADDS     R0,R0,#+4
??aes_expandEncKey_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+16
        BLT.N    ??aes_expandEncKey_1
//  172     k[16] ^= rj_sbox(k[12]);
        LDRB     R5,[R4, #+16]
        LDRB     R0,[R4, #+12]
        BL       rj_sbox
        EORS     R0,R0,R5
        STRB     R0,[R4, #+16]
//  173     k[17] ^= rj_sbox(k[13]);
        LDRB     R5,[R4, #+17]
        LDRB     R0,[R4, #+13]
        BL       rj_sbox
        EORS     R0,R0,R5
        STRB     R0,[R4, #+17]
//  174     k[18] ^= rj_sbox(k[14]);
        LDRB     R5,[R4, #+18]
        LDRB     R0,[R4, #+14]
        BL       rj_sbox
        EORS     R0,R0,R5
        STRB     R0,[R4, #+18]
//  175     k[19] ^= rj_sbox(k[15]);
        LDRB     R5,[R4, #+19]
        LDRB     R0,[R4, #+15]
        BL       rj_sbox
        EORS     R0,R0,R5
        STRB     R0,[R4, #+19]
//  176 
//  177     for(i = 20; i < 32; i += 4) k[i] ^= k[i-4],   k[i+1] ^= k[i-3],
        MOVS     R0,#+20
        B.N      ??aes_expandEncKey_2
//  178                                 k[i+2] ^= k[i-2], k[i+3] ^= k[i-1];
??aes_expandEncKey_3:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDRB     R1,[R0, R4]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADDS     R2,R0,R4
        LDRB     R2,[R2, #-4]
        EORS     R1,R2,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        STRB     R1,[R0, R4]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADDS     R1,R0,R4
        LDRB     R1,[R1, #+1]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADDS     R2,R0,R4
        LDRB     R2,[R2, #-3]
        EORS     R1,R2,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADDS     R2,R0,R4
        STRB     R1,[R2, #+1]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADDS     R1,R0,R4
        LDRB     R1,[R1, #+2]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADDS     R2,R0,R4
        LDRB     R2,[R2, #-2]
        EORS     R1,R2,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADDS     R2,R0,R4
        STRB     R1,[R2, #+2]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADDS     R1,R0,R4
        LDRB     R1,[R1, #+3]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADDS     R2,R0,R4
        LDRB     R2,[R2, #-1]
        EORS     R1,R2,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADDS     R2,R0,R4
        STRB     R1,[R2, #+3]
        ADDS     R0,R0,#+4
??aes_expandEncKey_2:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+32
        BLT.N    ??aes_expandEncKey_3
//  179 
//  180 } /* aes_expandEncKey */
        POP      {R4-R6,PC}       ;; return
//  181 
//  182 /* -------------------------------------------------------------------------- */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  183 void aes_expandDecKey(uint8_t *k, uint8_t *rc) 
//  184 {
aes_expandDecKey:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
//  185     uint8_t i;
//  186 
//  187     for(i = 28; i > 16; i -= 4) k[i+0] ^= k[i-4], k[i+1] ^= k[i-3], 
        MOVS     R0,#+28
        B.N      ??aes_expandDecKey_0
//  188                                 k[i+2] ^= k[i-2], k[i+3] ^= k[i-1];
??aes_expandDecKey_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDRB     R1,[R0, R4]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADDS     R2,R0,R4
        LDRB     R2,[R2, #-4]
        EORS     R1,R2,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        STRB     R1,[R0, R4]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADDS     R1,R0,R4
        LDRB     R1,[R1, #+1]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADDS     R2,R0,R4
        LDRB     R2,[R2, #-3]
        EORS     R1,R2,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADDS     R2,R0,R4
        STRB     R1,[R2, #+1]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADDS     R1,R0,R4
        LDRB     R1,[R1, #+2]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADDS     R2,R0,R4
        LDRB     R2,[R2, #-2]
        EORS     R1,R2,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADDS     R2,R0,R4
        STRB     R1,[R2, #+2]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADDS     R1,R0,R4
        LDRB     R1,[R1, #+3]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADDS     R2,R0,R4
        LDRB     R2,[R2, #-1]
        EORS     R1,R2,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADDS     R2,R0,R4
        STRB     R1,[R2, #+3]
        SUBS     R0,R0,#+4
??aes_expandDecKey_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+17
        BGE.N    ??aes_expandDecKey_1
//  189 
//  190     k[16] ^= rj_sbox(k[12]);
        LDRB     R6,[R4, #+16]
        LDRB     R0,[R4, #+12]
        BL       rj_sbox
        EORS     R0,R0,R6
        STRB     R0,[R4, #+16]
//  191     k[17] ^= rj_sbox(k[13]);
        LDRB     R6,[R4, #+17]
        LDRB     R0,[R4, #+13]
        BL       rj_sbox
        EORS     R0,R0,R6
        STRB     R0,[R4, #+17]
//  192     k[18] ^= rj_sbox(k[14]);
        LDRB     R6,[R4, #+18]
        LDRB     R0,[R4, #+14]
        BL       rj_sbox
        EORS     R0,R0,R6
        STRB     R0,[R4, #+18]
//  193     k[19] ^= rj_sbox(k[15]);
        LDRB     R6,[R4, #+19]
        LDRB     R0,[R4, #+15]
        BL       rj_sbox
        EORS     R0,R0,R6
        STRB     R0,[R4, #+19]
//  194 
//  195     for(i = 12; i > 0; i -= 4)  k[i+0] ^= k[i-4], k[i+1] ^= k[i-3],
        MOVS     R0,#+12
        B.N      ??aes_expandDecKey_2
//  196                                 k[i+2] ^= k[i-2], k[i+3] ^= k[i-1];
??aes_expandDecKey_3:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDRB     R1,[R0, R4]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADDS     R2,R0,R4
        LDRB     R2,[R2, #-4]
        EORS     R1,R2,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        STRB     R1,[R0, R4]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADDS     R1,R0,R4
        LDRB     R1,[R1, #+1]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADDS     R2,R0,R4
        LDRB     R2,[R2, #-3]
        EORS     R1,R2,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADDS     R2,R0,R4
        STRB     R1,[R2, #+1]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADDS     R1,R0,R4
        LDRB     R1,[R1, #+2]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADDS     R2,R0,R4
        LDRB     R2,[R2, #-2]
        EORS     R1,R2,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADDS     R2,R0,R4
        STRB     R1,[R2, #+2]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADDS     R1,R0,R4
        LDRB     R1,[R1, #+3]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADDS     R2,R0,R4
        LDRB     R2,[R2, #-1]
        EORS     R1,R2,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADDS     R2,R0,R4
        STRB     R1,[R2, #+3]
        SUBS     R0,R0,#+4
??aes_expandDecKey_2:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??aes_expandDecKey_3
//  197 
//  198     *rc = FD(*rc);
        LDRB     R0,[R5, #+0]
        LSLS     R0,R0,#+31
        BPL.N    ??aes_expandDecKey_4
        MOVS     R0,#+141
        B.N      ??aes_expandDecKey_5
??aes_expandDecKey_4:
        MOVS     R0,#+0
??aes_expandDecKey_5:
        LDRB     R1,[R5, #+0]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        EORS     R0,R0,R1, LSR #+1
        STRB     R0,[R5, #+0]
//  199     k[0] ^= rj_sbox(k[29]) ^ (*rc);
        LDRB     R6,[R4, #+0]
        LDRB     R0,[R4, #+29]
        BL       rj_sbox
        LDRB     R1,[R5, #+0]
        EORS     R0,R1,R0
        EORS     R0,R0,R6
        STRB     R0,[R4, #+0]
//  200     k[1] ^= rj_sbox(k[30]);
        LDRB     R5,[R4, #+1]
        LDRB     R0,[R4, #+30]
        BL       rj_sbox
        EORS     R0,R0,R5
        STRB     R0,[R4, #+1]
//  201     k[2] ^= rj_sbox(k[31]);
        LDRB     R5,[R4, #+2]
        LDRB     R0,[R4, #+31]
        BL       rj_sbox
        EORS     R0,R0,R5
        STRB     R0,[R4, #+2]
//  202     k[3] ^= rj_sbox(k[28]);
        LDRB     R5,[R4, #+3]
        LDRB     R0,[R4, #+28]
        BL       rj_sbox
        EORS     R0,R0,R5
        STRB     R0,[R4, #+3]
//  203 } /* aes_expandDecKey */
        POP      {R4-R6,PC}       ;; return
//  204 
//  205 
//  206 /* -------------------------------------------------------------------------- */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  207 void aes256_init(aes256_context *ctx, uint8_t *k)
//  208 {
aes256_init:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
//  209     uint8_t rcon = 1;
        MOVS     R0,#+1
        STRB     R0,[SP, #+0]
//  210     register uint8_t i;
//  211     for (i = 0; i < sizeof(ctx->key); i++) 
        MOVS     R5,#+0
        B.N      ??aes256_init_0
//  212       ctx->enckey[i] = ctx->deckey[i] = k[i];
??aes256_init_1:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDRB     R0,[R5, R1]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R2,R5,R4
        STRB     R0,[R2, #+64]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R2,R5,R4
        STRB     R0,[R2, #+32]
        ADDS     R5,R5,#+1
??aes256_init_0:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+32
        BCC.N    ??aes256_init_1
//  213     for (i = 8;--i;) 
        MOVS     R5,#+8
        B.N      ??aes256_init_2
//  214       aes_expandEncKey(ctx->deckey, &rcon);
??aes256_init_3:
        ADD      R1,SP,#+0
        ADDS     R0,R4,#+64
        BL       aes_expandEncKey
??aes256_init_2:
        SUBS     R5,R5,#+1
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??aes256_init_3
//  215 } /* aes256_init */
        POP      {R0,R4,R5,PC}    ;; return
//  216 
//  217 /* -------------------------------------------------------------------------- */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  218 void aes256_done(aes256_context *ctx)
//  219 {
//  220     register uint8_t i;
//  221     for (i = 0; i < sizeof(ctx->key); i++) 
aes256_done:
        MOVS     R1,#+0
        B.N      ??aes256_done_0
//  222         ctx->key[i] = ctx->enckey[i] = ctx->deckey[i] = 0;
??aes256_done_1:
        MOVS     R2,#+0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADDS     R3,R1,R0
        STRB     R2,[R3, #+64]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADDS     R3,R1,R0
        STRB     R2,[R3, #+32]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        STRB     R2,[R1, R0]
        ADDS     R1,R1,#+1
??aes256_done_0:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+32
        BCC.N    ??aes256_done_1
//  223 } /* aes256_done */
        BX       LR               ;; return
//  224 
//  225 /* -------------------------------------------------------------------------- */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  226 void aes256_encrypt_ecb(aes256_context *ctx, uint8_t *buf)
//  227 {
aes256_encrypt_ecb:
        PUSH     {R4-R6,LR}
        SUB      SP,SP,#+8
        MOVS     R4,R0
        MOVS     R5,R1
//  228     uint8_t i, rcon;
//  229 
//  230     aes_addRoundKey_cpy(buf, ctx->enckey, ctx->key);
        MOVS     R2,R4
        ADDS     R1,R4,#+32
        MOVS     R0,R5
        BL       aes_addRoundKey_cpy
//  231     for(i = 1, rcon = 1; i < 14; ++i)
        MOVS     R6,#+1
        MOVS     R0,#+1
        STRB     R0,[SP, #+0]
        B.N      ??aes256_encrypt_ecb_0
//  232     {
//  233         aes_subBytes(buf);
//  234         aes_shiftRows(buf);
//  235         aes_mixColumns(buf);
//  236         if( i & 1 ) aes_addRoundKey( buf, &ctx->key[16]);
//  237         else aes_expandEncKey(ctx->key, &rcon), aes_addRoundKey(buf, ctx->key);
??aes256_encrypt_ecb_1:
        ADD      R1,SP,#+0
        MOVS     R0,R4
        BL       aes_expandEncKey
        MOVS     R1,R4
        MOVS     R0,R5
        BL       aes_addRoundKey
??aes256_encrypt_ecb_2:
        ADDS     R6,R6,#+1
??aes256_encrypt_ecb_0:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+14
        BGE.N    ??aes256_encrypt_ecb_3
        MOVS     R0,R5
        BL       aes_subBytes
        MOVS     R0,R5
        BL       aes_shiftRows
        MOVS     R0,R5
        BL       aes_mixColumns
        LSLS     R0,R6,#+31
        BPL.N    ??aes256_encrypt_ecb_1
        ADDS     R1,R4,#+16
        MOVS     R0,R5
        BL       aes_addRoundKey
        B.N      ??aes256_encrypt_ecb_2
//  238     }
//  239     aes_subBytes(buf);
??aes256_encrypt_ecb_3:
        MOVS     R0,R5
        BL       aes_subBytes
//  240     aes_shiftRows(buf);
        MOVS     R0,R5
        BL       aes_shiftRows
//  241     aes_expandEncKey(ctx->key, &rcon); 
        ADD      R1,SP,#+0
        MOVS     R0,R4
        BL       aes_expandEncKey
//  242     aes_addRoundKey(buf, ctx->key);
        MOVS     R1,R4
        MOVS     R0,R5
        BL       aes_addRoundKey
//  243 } /* aes256_encrypt */
        POP      {R0,R1,R4-R6,PC}  ;; return
//  244 
//  245 /* -------------------------------------------------------------------------- */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  246 void aes256_decrypt_ecb(aes256_context *ctx, uint8_t *buf)
//  247 {
aes256_decrypt_ecb:
        PUSH     {R4-R6,LR}
        SUB      SP,SP,#+8
        MOVS     R4,R0
        MOVS     R5,R1
//  248     uint8_t i, rcon;
//  249 
//  250     aes_addRoundKey_cpy(buf, ctx->deckey, ctx->key);
        MOVS     R2,R4
        ADDS     R1,R4,#+64
        MOVS     R0,R5
        BL       aes_addRoundKey_cpy
//  251     aes_shiftRows_inv(buf);
        MOVS     R0,R5
        BL       aes_shiftRows_inv
//  252     aes_subBytes_inv(buf);
        MOVS     R0,R5
        BL       aes_subBytes_inv
//  253 
//  254     for (i = 14, rcon = 0x80; --i;)
        MOVS     R6,#+14
        MOVS     R0,#+128
        STRB     R0,[SP, #+0]
        B.N      ??aes256_decrypt_ecb_0
//  255     {
//  256         if( ( i & 1 ) )           
//  257         {
//  258             aes_expandDecKey(ctx->key, &rcon);
//  259             aes_addRoundKey(buf, &ctx->key[16]);
//  260         }
//  261         else aes_addRoundKey(buf, ctx->key);
??aes256_decrypt_ecb_1:
        MOVS     R1,R4
        MOVS     R0,R5
        BL       aes_addRoundKey
//  262         aes_mixColumns_inv(buf);
??aes256_decrypt_ecb_2:
        MOVS     R0,R5
        BL       aes_mixColumns_inv
//  263         aes_shiftRows_inv(buf);
        MOVS     R0,R5
        BL       aes_shiftRows_inv
//  264         aes_subBytes_inv(buf);
        MOVS     R0,R5
        BL       aes_subBytes_inv
??aes256_decrypt_ecb_0:
        SUBS     R6,R6,#+1
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??aes256_decrypt_ecb_3
        LSLS     R0,R6,#+31
        BPL.N    ??aes256_decrypt_ecb_1
        ADD      R1,SP,#+0
        MOVS     R0,R4
        BL       aes_expandDecKey
        ADDS     R1,R4,#+16
        MOVS     R0,R5
        BL       aes_addRoundKey
        B.N      ??aes256_decrypt_ecb_2
//  265     }
//  266     aes_addRoundKey( buf, ctx->key); 
??aes256_decrypt_ecb_3:
        MOVS     R1,R4
        MOVS     R0,R5
        BL       aes_addRoundKey
//  267 } /* aes256_decrypt */
        POP      {R0,R1,R4-R6,PC}  ;; return

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        END
// 
// 1 854 bytes in section .text
// 
// 1 854 bytes of CODE memory
//
//Errors: none
//Warnings: none
