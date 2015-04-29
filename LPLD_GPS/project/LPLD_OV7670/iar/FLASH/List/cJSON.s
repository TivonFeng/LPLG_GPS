///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.1.6676/W32 for ARM       23/Apr/2015  14:23:11
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  G:\test\LPLD_OSKinetis_V3_now02\lib\Security\cJSON.c
//    Command line =  
//        G:\test\LPLD_OSKinetis_V3_now02\lib\Security\cJSON.c -D LPLD_K60 -lCN
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
//        G:\test\LPLD_OSKinetis_V3_now02\project\LPLD_OV7670\iar\FLASH\List\cJSON.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN __aeabi_cdcmpeq
        EXTERN __aeabi_cdcmple
        EXTERN __aeabi_cdrcmple
        EXTERN __aeabi_d2iz
        EXTERN __aeabi_dadd
        EXTERN __aeabi_dmul
        EXTERN __aeabi_dsub
        EXTERN __aeabi_f2d
        EXTERN __aeabi_i2d
        EXTERN floor
        EXTERN free
        EXTERN malloc
        EXTERN memcpy
        EXTERN memset
        EXTERN pow
        EXTERN sprintf
        EXTERN strchr
        EXTERN strcpy
        EXTERN strlen
        EXTERN strncmp
        EXTERN tolower

        PUBLIC cJSON_AddItemReferenceToArray
        PUBLIC cJSON_AddItemReferenceToObject
        PUBLIC cJSON_AddItemToArray
        PUBLIC cJSON_AddItemToObject
        PUBLIC cJSON_AddItemToObjectCS
        PUBLIC cJSON_CreateArray
        PUBLIC cJSON_CreateBool
        PUBLIC cJSON_CreateDoubleArray
        PUBLIC cJSON_CreateFalse
        PUBLIC cJSON_CreateFloatArray
        PUBLIC cJSON_CreateIntArray
        PUBLIC cJSON_CreateNull
        PUBLIC cJSON_CreateNumber
        PUBLIC cJSON_CreateObject
        PUBLIC cJSON_CreateString
        PUBLIC cJSON_CreateStringArray
        PUBLIC cJSON_CreateTrue
        PUBLIC cJSON_Delete
        PUBLIC cJSON_DeleteItemFromArray
        PUBLIC cJSON_DeleteItemFromObject
        PUBLIC cJSON_DetachItemFromArray
        PUBLIC cJSON_DetachItemFromObject
        PUBLIC cJSON_Duplicate
        PUBLIC cJSON_GetArrayItem
        PUBLIC cJSON_GetArraySize
        PUBLIC cJSON_GetErrorPtr
        PUBLIC cJSON_GetObjectItem
        PUBLIC cJSON_InitHooks
        PUBLIC cJSON_InsertItemInArray
        PUBLIC cJSON_Minify
        PUBLIC cJSON_Parse
        PUBLIC cJSON_ParseWithOpts
        PUBLIC cJSON_Print
        PUBLIC cJSON_PrintBuffered
        PUBLIC cJSON_PrintUnformatted
        PUBLIC cJSON_ReplaceItemInArray
        PUBLIC cJSON_ReplaceItemInObject

// G:\test\LPLD_OSKinetis_V3_now02\lib\Security\cJSON.c
//    1 /*
//    2   Copyright (c) 2009 Dave Gamble
//    3 
//    4   Permission is hereby granted, free of charge, to any person obtaining a copy
//    5   of this software and associated documentation files (the "Software"), to deal
//    6   in the Software without restriction, including without limitation the rights
//    7   to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//    8   copies of the Software, and to permit persons to whom the Software is
//    9   furnished to do so, subject to the following conditions:
//   10 
//   11   The above copyright notice and this permission notice shall be included in
//   12   all copies or substantial portions of the Software.
//   13 
//   14   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//   15   IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//   16   FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//   17   AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//   18   LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//   19   OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//   20   THE SOFTWARE.
//   21 */
//   22 
//   23 /* cJSON */
//   24 /* JSON parser in C. */
//   25 
//   26 //#include <string.h>
//   27 //#include <stdio.h>
//   28 #include <math.h>
//   29 #include "stdlib.h"
//   30 #include <float.h>
//   31 #include <limits.h>
//   32 #include <ctype.h>
//   33 #include "cJSON.h"
//   34 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   35 static const char *ep;
ep:
        DS8 4
//   36 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   37 const char *cJSON_GetErrorPtr(void)
//   38 {
//   39     return ep;
cJSON_GetErrorPtr:
        LDR.W    R0,??DataTable14
        LDR      R0,[R0, #+0]
        BX       LR               ;; return
//   40 }
//   41 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   42 static int cJSON_strcasecmp(const char *s1, const char *s2)
//   43 {
cJSON_strcasecmp:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
//   44     if (!s1) return (s1 == s2) ? 0 : 1;
        CMP      R4,#+0
        BNE.N    ??cJSON_strcasecmp_0
        CMP      R4,R5
        BNE.N    ??cJSON_strcasecmp_1
        MOVS     R0,#+0
        B.N      ??cJSON_strcasecmp_2
??cJSON_strcasecmp_1:
        MOVS     R0,#+1
??cJSON_strcasecmp_2:
        B.N      ??cJSON_strcasecmp_3
//   45     if (!s2) return 1;
??cJSON_strcasecmp_0:
        CMP      R5,#+0
        BNE.N    ??cJSON_strcasecmp_4
        MOVS     R0,#+1
        B.N      ??cJSON_strcasecmp_3
//   46     for(; tolower(*s1) == tolower(*s2); ++s1, ++s2)	if(*s1 == 0)	return 0;
??cJSON_strcasecmp_5:
        ADDS     R4,R4,#+1
        ADDS     R5,R5,#+1
??cJSON_strcasecmp_4:
        LDRB     R0,[R4, #+0]
        BL       tolower
        MOVS     R6,R0
        LDRB     R0,[R5, #+0]
        BL       tolower
        CMP      R6,R0
        BNE.N    ??cJSON_strcasecmp_6
        LDRB     R0,[R4, #+0]
        CMP      R0,#+0
        BNE.N    ??cJSON_strcasecmp_5
        MOVS     R0,#+0
        B.N      ??cJSON_strcasecmp_3
//   47     return tolower(*(const unsigned char *)s1) - tolower(*(const unsigned char *)s2);
??cJSON_strcasecmp_6:
        LDRB     R0,[R4, #+0]
        BL       tolower
        MOVS     R4,R0
        LDRB     R0,[R5, #+0]
        BL       tolower
        SUBS     R0,R4,R0
??cJSON_strcasecmp_3:
        POP      {R4-R6,PC}       ;; return
//   48 }
//   49 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   50 static void *(*cJSON_malloc)(size_t sz) = malloc;
cJSON_malloc:
        DATA
        DC32 malloc

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   51 static void (*cJSON_free)(void *ptr) = free;
cJSON_free:
        DATA
        DC32 free
//   52 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   53 static char *cJSON_strdup(const char *str)
//   54 {
cJSON_strdup:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
//   55     size_t len;
//   56     char *copy;
//   57 
//   58     len = strlen(str) + 1;
        MOVS     R0,R4
        BL       strlen
        ADDS     R5,R0,#+1
//   59     if (!(copy = (char *)cJSON_malloc(len))) return 0;
        MOVS     R0,R5
        LDR.W    R1,??DataTable14_1
        LDR      R1,[R1, #+0]
        BLX      R1
        MOVS     R6,R0
        CMP      R6,#+0
        BNE.N    ??cJSON_strdup_0
        MOVS     R0,#+0
        B.N      ??cJSON_strdup_1
//   60     memcpy(copy, str, len);
??cJSON_strdup_0:
        MOVS     R2,R5
        MOVS     R1,R4
        MOVS     R0,R6
        BL       memcpy
//   61     return copy;
        MOVS     R0,R6
??cJSON_strdup_1:
        POP      {R4-R6,PC}       ;; return
//   62 }
//   63 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   64 void cJSON_InitHooks(cJSON_Hooks *hooks)
//   65 {
//   66     if (!hooks)   /* Reset hooks */
cJSON_InitHooks:
        CMP      R0,#+0
        BNE.N    ??cJSON_InitHooks_0
//   67     {
//   68         cJSON_malloc = malloc;
        LDR.W    R0,??DataTable14_2
        LDR.W    R1,??DataTable14_1
        STR      R0,[R1, #+0]
//   69         cJSON_free = free;
        LDR.W    R0,??DataTable14_3
        LDR.W    R1,??DataTable14_4
        STR      R0,[R1, #+0]
//   70         return;
        B.N      ??cJSON_InitHooks_1
//   71     }
//   72 
//   73     cJSON_malloc = (hooks->malloc_fn) ? hooks->malloc_fn : malloc;
??cJSON_InitHooks_0:
        LDR      R1,[R0, #+0]
        CMP      R1,#+0
        BEQ.N    ??cJSON_InitHooks_2
        LDR      R1,[R0, #+0]
        LDR.W    R2,??DataTable14_1
        STR      R1,[R2, #+0]
        B.N      ??cJSON_InitHooks_3
??cJSON_InitHooks_2:
        LDR.W    R1,??DataTable14_2
        LDR.W    R2,??DataTable14_1
        STR      R1,[R2, #+0]
//   74     cJSON_free	 = (hooks->free_fn) ? hooks->free_fn : free;
??cJSON_InitHooks_3:
        LDR      R1,[R0, #+4]
        CMP      R1,#+0
        BEQ.N    ??cJSON_InitHooks_4
        LDR      R0,[R0, #+4]
        LDR.W    R1,??DataTable14_4
        STR      R0,[R1, #+0]
        B.N      ??cJSON_InitHooks_5
??cJSON_InitHooks_4:
        LDR.W    R0,??DataTable14_3
        LDR.W    R1,??DataTable14_4
        STR      R0,[R1, #+0]
//   75 }
??cJSON_InitHooks_5:
??cJSON_InitHooks_1:
        BX       LR               ;; return
//   76 
//   77 /* Internal constructor. */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   78 static cJSON *cJSON_New_Item(void)
//   79 {
cJSON_New_Item:
        PUSH     {R4,LR}
//   80     cJSON *node = (cJSON *)cJSON_malloc(sizeof(cJSON));
        MOVS     R0,#+40
        LDR.W    R1,??DataTable14_1
        LDR      R1,[R1, #+0]
        BLX      R1
        MOVS     R4,R0
//   81     if (node) memset(node, 0, sizeof(cJSON));
        CMP      R4,#+0
        BEQ.N    ??cJSON_New_Item_0
        MOVS     R2,#+40
        MOVS     R1,#+0
        MOVS     R0,R4
        BL       memset
//   82     return node;
??cJSON_New_Item_0:
        MOVS     R0,R4
        POP      {R4,PC}          ;; return
//   83 }
//   84 
//   85 /* Delete a cJSON structure. */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   86 void cJSON_Delete(cJSON *c)
//   87 {
cJSON_Delete:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        B.N      ??cJSON_Delete_0
//   88     cJSON *next;
//   89     while (c)
//   90     {
//   91         next = c->next;
??cJSON_Delete_1:
        LDR      R5,[R4, #+0]
//   92         if (!(c->type & cJSON_IsReference) && c->child) cJSON_Delete(c->child);
        LDR      R0,[R4, #+12]
        LSLS     R0,R0,#+23
        BMI.N    ??cJSON_Delete_2
        LDR      R0,[R4, #+8]
        CMP      R0,#+0
        BEQ.N    ??cJSON_Delete_2
        LDR      R0,[R4, #+8]
        BL       cJSON_Delete
//   93         if (!(c->type & cJSON_IsReference) && c->valuestring) cJSON_free(c->valuestring);
??cJSON_Delete_2:
        LDR      R0,[R4, #+12]
        LSLS     R0,R0,#+23
        BMI.N    ??cJSON_Delete_3
        LDR      R0,[R4, #+16]
        CMP      R0,#+0
        BEQ.N    ??cJSON_Delete_3
        LDR      R0,[R4, #+16]
        LDR.W    R1,??DataTable14_4
        LDR      R1,[R1, #+0]
        BLX      R1
//   94         if (!(c->type & cJSON_StringIsConst) && c->string) cJSON_free(c->string);
??cJSON_Delete_3:
        LDR      R0,[R4, #+12]
        LSLS     R0,R0,#+22
        BMI.N    ??cJSON_Delete_4
        LDR      R0,[R4, #+32]
        CMP      R0,#+0
        BEQ.N    ??cJSON_Delete_4
        LDR      R0,[R4, #+32]
        LDR.W    R1,??DataTable14_4
        LDR      R1,[R1, #+0]
        BLX      R1
//   95         cJSON_free(c);
??cJSON_Delete_4:
        MOVS     R0,R4
        LDR.W    R1,??DataTable14_4
        LDR      R1,[R1, #+0]
        BLX      R1
//   96         c = next;
        MOVS     R4,R5
//   97     }
??cJSON_Delete_0:
        CMP      R4,#+0
        BNE.N    ??cJSON_Delete_1
//   98 }
        POP      {R0,R4,R5,PC}    ;; return
//   99 
//  100 /* Parse the input text to generate a number, and populate the result into item. */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  101 static const char *parse_number(cJSON *item, const char *num)
//  102 {
parse_number:
        PUSH     {R0,R4-R11,LR}
        SUB      SP,SP,#+8
        MOVS     R6,R1
//  103     double n = 0, sign = 1, scale = 0;
        MOVS     R8,#+0
        MOVS     R9,#+0
        MOVS     R10,#+0
        LDR.W    R11,??DataTable14_5  ;; 0x3ff00000
        MOVS     R4,#+0
        MOVS     R5,#+0
//  104     int subscale = 0, signsubscale = 1;
        MOVS     R7,#+0
        MOVS     R0,#+1
        STR      R0,[SP, #+0]
//  105 
//  106     if (*num == '-') sign = -1, num++;	/* Has sign? */
        LDRB     R0,[R6, #+0]
        CMP      R0,#+45
        BNE.N    ??parse_number_0
        MOVS     R10,#+0
        LDR.W    R11,??DataTable14_6  ;; 0xbff00000
        ADDS     R6,R6,#+1
//  107     if (*num == '0') num++;			/* is zero */
??parse_number_0:
        LDRB     R0,[R6, #+0]
        CMP      R0,#+48
        BNE.N    ??parse_number_1
        ADDS     R6,R6,#+1
//  108     if (*num >= '1' && *num <= '9')	do	n = (n * 10.0) + (*num++ -'0');
??parse_number_1:
        LDRB     R0,[R6, #+0]
        SUBS     R0,R0,#+49
        CMP      R0,#+9
        BCS.N    ??parse_number_2
??parse_number_3:
        MOVS     R0,#+0
        LDR.W    R1,??DataTable14_7  ;; 0x40240000
        MOV      R2,R8
        MOV      R3,R9
        BL       __aeabi_dmul
        MOV      R8,R0
        MOV      R9,R1
        LDRB     R0,[R6, #+0]
        SUBS     R0,R0,#+48
        BL       __aeabi_i2d
        MOV      R2,R8
        MOV      R3,R9
        BL       __aeabi_dadd
        MOV      R8,R0
        MOV      R9,R1
        ADDS     R6,R6,#+1
//  109         while (*num >= '0' && *num <= '9');	/* Number? */
        LDRB     R0,[R6, #+0]
        SUBS     R0,R0,#+48
        CMP      R0,#+10
        BCC.N    ??parse_number_3
//  110     if (*num == '.' && num[1] >= '0' && num[1] <= '9')
??parse_number_2:
        LDRB     R0,[R6, #+0]
        CMP      R0,#+46
        BNE.N    ??parse_number_4
        LDRB     R0,[R6, #+1]
        SUBS     R0,R0,#+48
        CMP      R0,#+10
        BCS.N    ??parse_number_4
//  111     {
//  112         num++;		   /* Fractional part? */
        ADDS     R6,R6,#+1
//  113         do	n = (n * 10.0) + (*num++ -'0'), scale--;
??parse_number_5:
        MOVS     R0,#+0
        LDR.W    R1,??DataTable14_7  ;; 0x40240000
        MOV      R2,R8
        MOV      R3,R9
        BL       __aeabi_dmul
        MOV      R8,R0
        MOV      R9,R1
        LDRB     R0,[R6, #+0]
        SUBS     R0,R0,#+48
        BL       __aeabi_i2d
        MOV      R2,R8
        MOV      R3,R9
        BL       __aeabi_dadd
        MOV      R8,R0
        MOV      R9,R1
        ADDS     R6,R6,#+1
        MOVS     R0,#+0
        LDR.W    R1,??DataTable14_6  ;; 0xbff00000
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        MOVS     R4,R0
        MOVS     R5,R1
//  114         while (*num >= '0' && *num <= '9');
        LDRB     R0,[R6, #+0]
        SUBS     R0,R0,#+48
        CMP      R0,#+10
        BCC.N    ??parse_number_5
//  115     }
//  116     if (*num == 'e' || *num == 'E')		/* Exponent? */
??parse_number_4:
        LDRB     R0,[R6, #+0]
        CMP      R0,#+101
        BEQ.N    ??parse_number_6
        LDRB     R0,[R6, #+0]
        CMP      R0,#+69
        BNE.N    ??parse_number_7
//  117     {
//  118         num++;
??parse_number_6:
        ADDS     R6,R6,#+1
//  119         if (*num == '+') num++;
        LDRB     R0,[R6, #+0]
        CMP      R0,#+43
        BNE.N    ??parse_number_8
        ADDS     R6,R6,#+1
        B.N      ??parse_number_9
//  120         else if (*num == '-') signsubscale = -1, num++;		/* With sign? */
??parse_number_8:
        LDRB     R0,[R6, #+0]
        CMP      R0,#+45
        BNE.N    ??parse_number_9
        MOVS     R0,#-1
        STR      R0,[SP, #+0]
        ADDS     R6,R6,#+1
        B.N      ??parse_number_9
//  121         while (*num >= '0' && *num <= '9') subscale = (subscale * 10) + (*num++ - '0');	/* Number? */
??parse_number_10:
        MOVS     R0,#+10
        LDRB     R1,[R6, #+0]
        MLA      R0,R0,R7,R1
        SUBS     R7,R0,#+48
        ADDS     R6,R6,#+1
??parse_number_9:
        LDRB     R0,[R6, #+0]
        SUBS     R0,R0,#+48
        CMP      R0,#+10
        BCC.N    ??parse_number_10
//  122     }
//  123 
//  124     n = sign * n * pow(10.0, (scale + subscale * signsubscale));	/* number = +/- number.fraction * 10^+/- exponent */
??parse_number_7:
        MOV      R2,R8
        MOV      R3,R9
        MOV      R0,R10
        MOV      R1,R11
        BL       __aeabi_dmul
        MOV      R8,R0
        MOV      R9,R1
        LDR      R0,[SP, #+0]
        MUL      R0,R0,R7
        BL       __aeabi_i2d
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,#+0
        LDR.W    R1,??DataTable14_7  ;; 0x40240000
        BL       pow
        MOV      R2,R8
        MOV      R3,R9
        BL       __aeabi_dmul
        MOV      R8,R0
        MOV      R9,R1
//  125 
//  126     item->valuedouble = n;
        LDR      R0,[SP, #+8]
        STRD     R8,R9,[R0, #+24]
//  127     item->valueint = (int)n;
        MOV      R0,R8
        MOV      R1,R9
        BL       __aeabi_d2iz
        LDR      R1,[SP, #+8]
        STR      R0,[R1, #+20]
//  128     item->type = cJSON_Number;
        MOVS     R0,#+3
        LDR      R1,[SP, #+8]
        STR      R0,[R1, #+12]
//  129     return num;
        MOVS     R0,R6
        POP      {R1-R11,PC}      ;; return
//  130 }
//  131 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  132 static int pow2gt (int x)
//  133 {
//  134     --x;
pow2gt:
        SUBS     R0,R0,#+1
//  135     x |= x >> 1;
        ORRS     R0,R0,R0, ASR #+1
//  136     x |= x >> 2;
        ORRS     R0,R0,R0, ASR #+2
//  137     x |= x >> 4;
        ORRS     R0,R0,R0, ASR #+4
//  138     x |= x >> 8;
        ORRS     R0,R0,R0, ASR #+8
//  139     x |= x >> 16;
        ORRS     R0,R0,R0, ASR #+16
//  140     return x + 1;
        ADDS     R0,R0,#+1
        BX       LR               ;; return
//  141 }
//  142 
//  143 typedef struct
//  144 {
//  145     char *buffer;
//  146     int length;
//  147     int offset;
//  148 } printbuffer;
//  149 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  150 static char *ensure(printbuffer *p, int needed)
//  151 {
ensure:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R0,R1
//  152     char *newbuffer;
//  153     int newsize;
//  154     if (!p || !p->buffer) return 0;
        CMP      R4,#+0
        BEQ.N    ??ensure_0
        LDR      R1,[R4, #+0]
        CMP      R1,#+0
        BNE.N    ??ensure_1
??ensure_0:
        MOVS     R0,#+0
        B.N      ??ensure_2
//  155     needed += p->offset;
??ensure_1:
        LDR      R1,[R4, #+8]
        ADDS     R0,R1,R0
//  156     if (needed <= p->length) return p->buffer + p->offset;
        LDR      R1,[R4, #+4]
        CMP      R1,R0
        BLT.N    ??ensure_3
        LDR      R0,[R4, #+8]
        LDR      R1,[R4, #+0]
        ADDS     R0,R0,R1
        B.N      ??ensure_2
//  157 
//  158     newsize = pow2gt(needed);
??ensure_3:
        BL       pow2gt
        MOVS     R6,R0
//  159     newbuffer = (char *)cJSON_malloc(newsize);
        MOVS     R0,R6
        LDR.W    R1,??DataTable14_1
        LDR      R1,[R1, #+0]
        BLX      R1
        MOVS     R5,R0
//  160     if (!newbuffer)
        CMP      R5,#+0
        BNE.N    ??ensure_4
//  161     {
//  162         cJSON_free(p->buffer);
        LDR      R0,[R4, #+0]
        LDR.W    R1,??DataTable14_4
        LDR      R1,[R1, #+0]
        BLX      R1
//  163         p->length = 0, p->buffer = 0;
        MOVS     R0,#+0
        STR      R0,[R4, #+4]
        MOVS     R0,#+0
        STR      R0,[R4, #+0]
//  164         return 0;
        MOVS     R0,#+0
        B.N      ??ensure_2
//  165     }
//  166     if (newbuffer) memcpy(newbuffer, p->buffer, p->length);
??ensure_4:
        CMP      R5,#+0
        BEQ.N    ??ensure_5
        LDR      R2,[R4, #+4]
        LDR      R1,[R4, #+0]
        MOVS     R0,R5
        BL       memcpy
//  167     cJSON_free(p->buffer);
??ensure_5:
        LDR      R0,[R4, #+0]
        LDR.W    R1,??DataTable14_4
        LDR      R1,[R1, #+0]
        BLX      R1
//  168     p->length = newsize;
        STR      R6,[R4, #+4]
//  169     p->buffer = newbuffer;
        STR      R5,[R4, #+0]
//  170     return newbuffer + p->offset;
        LDR      R0,[R4, #+8]
        ADDS     R0,R0,R5
??ensure_2:
        POP      {R4-R6,PC}       ;; return
//  171 }
//  172 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  173 static int update(printbuffer *p)
//  174 {
update:
        PUSH     {R4,LR}
//  175     char *str;
//  176     if (!p || !p->buffer) return 0;
        CMP      R0,#+0
        BEQ.N    ??update_0
        LDR      R1,[R0, #+0]
        CMP      R1,#+0
        BNE.N    ??update_1
??update_0:
        MOVS     R0,#+0
        B.N      ??update_2
//  177     str = p->buffer + p->offset;
??update_1:
        LDR      R1,[R0, #+8]
        LDR      R2,[R0, #+0]
        ADDS     R1,R1,R2
//  178     return p->offset + strlen(str);
        LDR      R4,[R0, #+8]
        MOVS     R0,R1
        BL       strlen
        ADDS     R0,R0,R4
??update_2:
        POP      {R4,PC}          ;; return
//  179 }
//  180 
//  181 /* Render the number nicely from the given item into a string. */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  182 static char *print_number(cJSON *item, printbuffer *p)
//  183 {
print_number:
        PUSH     {R4-R8,LR}
        MOV      R8,R0
        MOVS     R6,R1
//  184     char *str = 0;
        MOVS     R7,#+0
//  185     double d = item->valuedouble;
        LDRD     R4,R5,[R8, #+24]
//  186     if (d == 0)
        MOVS     R0,#+0
        MOVS     R1,#+0
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_cdcmpeq
        BNE.N    ??print_number_0
//  187     {
//  188         if (p)	str = ensure(p, 2);
        CMP      R6,#+0
        BEQ.N    ??print_number_1
        MOVS     R1,#+2
        MOVS     R0,R6
        BL       ensure
        MOVS     R7,R0
        B.N      ??print_number_2
//  189         else	str = (char *)cJSON_malloc(2);	/* special case for 0. */
??print_number_1:
        MOVS     R0,#+2
        LDR.W    R1,??DataTable14_1
        LDR      R1,[R1, #+0]
        BLX      R1
        MOVS     R7,R0
//  190         if (str) strcpy(str, "0");
??print_number_2:
        CMP      R7,#+0
        BEQ.W    ??print_number_3
        ADR.N    R1,??DataTable7  ;; "0"
        MOVS     R0,R7
        BL       strcpy
        B.N      ??print_number_3
//  191     }
//  192     else if (fabs(((double)item->valueint) - d) <= DBL_EPSILON && d <= INT_MAX && d >= INT_MIN)
??print_number_0:
        LDR      R0,[R8, #+20]
        BL       __aeabi_i2d
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dsub
        BICS     R1,R1,#0x80000000
        MOVS     R2,#+1
        LDR.W    R3,??DataTable16  ;; 0x3cb00000
        BL       __aeabi_cdcmple
        BCS.N    ??print_number_4
        MOVS     R0,R4
        MOVS     R1,R5
        LDR.W    R2,??DataTable16_1  ;; 0xffc00001
        LDR.W    R3,??DataTable16_2  ;; 0x41dfffff
        BL       __aeabi_cdcmple
        BCS.N    ??print_number_4
        MOVS     R0,R4
        MOVS     R1,R5
        MOVS     R2,#+0
        LDR.W    R3,??DataTable16_3  ;; 0xc1e00000
        BL       __aeabi_cdrcmple
        BHI.N    ??print_number_4
//  193     {
//  194         if (p)	str = ensure(p, 21);
        CMP      R6,#+0
        BEQ.N    ??print_number_5
        MOVS     R1,#+21
        MOVS     R0,R6
        BL       ensure
        MOVS     R7,R0
        B.N      ??print_number_6
//  195         else	str = (char *)cJSON_malloc(21);	/* 2^64+1 can be represented in 21 chars. */
??print_number_5:
        MOVS     R0,#+21
        LDR.W    R1,??DataTable14_1
        LDR      R1,[R1, #+0]
        BLX      R1
        MOVS     R7,R0
//  196         if (str)	sprintf(str, "%d", item->valueint);
??print_number_6:
        CMP      R7,#+0
        BEQ.N    ??print_number_3
        LDR      R2,[R8, #+20]
        ADR.N    R1,??DataTable7_1  ;; 0x25, 0x64, 0x00, 0x00
        MOVS     R0,R7
        BL       sprintf
        B.N      ??print_number_3
//  197     }
//  198     else
//  199     {
//  200         if (p)	str = ensure(p, 64);
??print_number_4:
        CMP      R6,#+0
        BEQ.N    ??print_number_7
        MOVS     R1,#+64
        MOVS     R0,R6
        BL       ensure
        MOVS     R7,R0
        B.N      ??print_number_8
//  201         else	str = (char *)cJSON_malloc(64);	/* This is a nice tradeoff. */
??print_number_7:
        MOVS     R0,#+64
        LDR.W    R1,??DataTable14_1
        LDR      R1,[R1, #+0]
        BLX      R1
        MOVS     R7,R0
//  202         if (str)
??print_number_8:
        CMP      R7,#+0
        BEQ.N    ??print_number_3
//  203         {
//  204             if (fabs(floor(d) - d) <= DBL_EPSILON && fabs(d) < 1.0e60)sprintf(str, "%.0f", d);
        MOVS     R0,R4
        MOVS     R1,R5
        BL       floor
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dsub
        BICS     R1,R1,#0x80000000
        MOVS     R2,#+1
        LDR.W    R3,??DataTable16  ;; 0x3cb00000
        BL       __aeabi_cdcmple
        BCS.N    ??print_number_9
        MOVS     R0,R4
        MOVS     R1,R5
        BICS     R1,R1,#0x80000000
        LDR.W    R2,??DataTable16_4  ;; 0xe4c2f344
        LDR.W    R3,??DataTable16_5  ;; 0x4c63e9e4
        BL       __aeabi_cdcmple
        BCS.N    ??print_number_9
        MOVS     R2,R4
        MOVS     R3,R5
        LDR.W    R1,??DataTable16_6
        MOVS     R0,R7
        BL       sprintf
        B.N      ??print_number_3
//  205             else if (fabs(d) < 1.0e-6 || fabs(d) > 1.0e9)			sprintf(str, "%e", d);
??print_number_9:
        MOVS     R0,R4
        MOVS     R1,R5
        BICS     R1,R1,#0x80000000
        LDR.W    R2,??DataTable16_7  ;; 0xa0b5ed8d
        LDR.W    R3,??DataTable16_8  ;; 0x3eb0c6f7
        BL       __aeabi_cdcmple
        BCC.N    ??print_number_10
        MOVS     R0,R4
        MOVS     R1,R5
        BICS     R1,R1,#0x80000000
        MOVS     R2,#+1
        LDR.W    R3,??DataTable16_9  ;; 0x41cdcd65
        BL       __aeabi_cdrcmple
        BHI.N    ??print_number_11
??print_number_10:
        MOVS     R2,R4
        MOVS     R3,R5
        ADR.N    R1,??DataTable8  ;; 0x25, 0x65, 0x00, 0x00
        MOVS     R0,R7
        BL       sprintf
        B.N      ??print_number_3
//  206             else												sprintf(str, "%f", d);
??print_number_11:
        MOVS     R2,R4
        MOVS     R3,R5
        ADR.N    R1,??DataTable8_1  ;; 0x25, 0x66, 0x00, 0x00
        MOVS     R0,R7
        BL       sprintf
//  207         }
//  208     }
//  209     return str;
??print_number_3:
        MOVS     R0,R7
        POP      {R4-R8,PC}       ;; return
//  210 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7:
        DC8      "0",0x0,0x0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_1:
        DC8      0x25, 0x64, 0x00, 0x00
//  211 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  212 static unsigned parse_hex4(const char *str)
//  213 {
parse_hex4:
        MOVS     R1,R0
//  214     unsigned h = 0;
        MOVS     R0,#+0
//  215     if (*str >= '0' && *str <= '9') h += (*str) - '0';
        LDRB     R2,[R1, #+0]
        SUBS     R2,R2,#+48
        CMP      R2,#+10
        BCS.N    ??parse_hex4_0
        LDRB     R2,[R1, #+0]
        SUBS     R2,R2,#+48
        ADDS     R0,R2,R0
//  216     else if (*str >= 'A' && *str <= 'F') h += 10 + (*str) - 'A';
//  217     else if (*str >= 'a' && *str <= 'f') h += 10 + (*str) - 'a';
//  218     else return 0;
//  219     h = h << 4;
??parse_hex4_1:
        LSLS     R0,R0,#+4
//  220     str++;
        ADDS     R1,R1,#+1
//  221     if (*str >= '0' && *str <= '9') h += (*str) - '0';
        LDRB     R2,[R1, #+0]
        SUBS     R2,R2,#+48
        CMP      R2,#+10
        BCS.N    ??parse_hex4_2
        LDRB     R2,[R1, #+0]
        SUBS     R2,R2,#+48
        ADDS     R0,R2,R0
//  222     else if (*str >= 'A' && *str <= 'F') h += 10 + (*str) - 'A';
//  223     else if (*str >= 'a' && *str <= 'f') h += 10 + (*str) - 'a';
//  224     else return 0;
//  225     h = h << 4;
??parse_hex4_3:
        LSLS     R0,R0,#+4
//  226     str++;
        ADDS     R1,R1,#+1
//  227     if (*str >= '0' && *str <= '9') h += (*str) - '0';
        LDRB     R2,[R1, #+0]
        SUBS     R2,R2,#+48
        CMP      R2,#+10
        BCS.N    ??parse_hex4_4
        LDRB     R2,[R1, #+0]
        SUBS     R2,R2,#+48
        ADDS     R0,R2,R0
//  228     else if (*str >= 'A' && *str <= 'F') h += 10 + (*str) - 'A';
//  229     else if (*str >= 'a' && *str <= 'f') h += 10 + (*str) - 'a';
//  230     else return 0;
//  231     h = h << 4;
??parse_hex4_5:
        LSLS     R0,R0,#+4
//  232     str++;
        ADDS     R1,R1,#+1
//  233     if (*str >= '0' && *str <= '9') h += (*str) - '0';
        LDRB     R2,[R1, #+0]
        SUBS     R2,R2,#+48
        CMP      R2,#+10
        BCS.N    ??parse_hex4_6
        LDRB     R1,[R1, #+0]
        SUBS     R1,R1,#+48
        ADDS     R0,R1,R0
//  234     else if (*str >= 'A' && *str <= 'F') h += 10 + (*str) - 'A';
//  235     else if (*str >= 'a' && *str <= 'f') h += 10 + (*str) - 'a';
//  236     else return 0;
//  237     return h;
??parse_hex4_7:
??parse_hex4_8:
        BX       LR               ;; return
??parse_hex4_0:
        LDRB     R2,[R1, #+0]
        SUBS     R2,R2,#+65
        CMP      R2,#+6
        BCS.N    ??parse_hex4_9
        LDRB     R2,[R1, #+0]
        SUBS     R2,R2,#+55
        ADDS     R0,R2,R0
        B.N      ??parse_hex4_1
??parse_hex4_9:
        LDRB     R2,[R1, #+0]
        SUBS     R2,R2,#+97
        CMP      R2,#+6
        BCS.N    ??parse_hex4_10
        LDRB     R2,[R1, #+0]
        SUBS     R2,R2,#+87
        ADDS     R0,R2,R0
        B.N      ??parse_hex4_1
??parse_hex4_10:
        MOVS     R0,#+0
        B.N      ??parse_hex4_8
??parse_hex4_2:
        LDRB     R2,[R1, #+0]
        SUBS     R2,R2,#+65
        CMP      R2,#+6
        BCS.N    ??parse_hex4_11
        LDRB     R2,[R1, #+0]
        SUBS     R2,R2,#+55
        ADDS     R0,R2,R0
        B.N      ??parse_hex4_3
??parse_hex4_11:
        LDRB     R2,[R1, #+0]
        SUBS     R2,R2,#+97
        CMP      R2,#+6
        BCS.N    ??parse_hex4_12
        LDRB     R2,[R1, #+0]
        SUBS     R2,R2,#+87
        ADDS     R0,R2,R0
        B.N      ??parse_hex4_3
??parse_hex4_12:
        MOVS     R0,#+0
        B.N      ??parse_hex4_8
??parse_hex4_4:
        LDRB     R2,[R1, #+0]
        SUBS     R2,R2,#+65
        CMP      R2,#+6
        BCS.N    ??parse_hex4_13
        LDRB     R2,[R1, #+0]
        SUBS     R2,R2,#+55
        ADDS     R0,R2,R0
        B.N      ??parse_hex4_5
??parse_hex4_13:
        LDRB     R2,[R1, #+0]
        SUBS     R2,R2,#+97
        CMP      R2,#+6
        BCS.N    ??parse_hex4_14
        LDRB     R2,[R1, #+0]
        SUBS     R2,R2,#+87
        ADDS     R0,R2,R0
        B.N      ??parse_hex4_5
??parse_hex4_14:
        MOVS     R0,#+0
        B.N      ??parse_hex4_8
??parse_hex4_6:
        LDRB     R2,[R1, #+0]
        SUBS     R2,R2,#+65
        CMP      R2,#+6
        BCS.N    ??parse_hex4_15
        LDRB     R1,[R1, #+0]
        SUBS     R1,R1,#+55
        ADDS     R0,R1,R0
        B.N      ??parse_hex4_7
??parse_hex4_15:
        LDRB     R2,[R1, #+0]
        SUBS     R2,R2,#+97
        CMP      R2,#+6
        BCS.N    ??parse_hex4_16
        LDRB     R1,[R1, #+0]
        SUBS     R1,R1,#+87
        ADDS     R0,R1,R0
        B.N      ??parse_hex4_7
??parse_hex4_16:
        MOVS     R0,#+0
        B.N      ??parse_hex4_8
//  238 }

        SECTION `.rodata`:CONST:REORDER:NOROOT(1)
        DATA
        DC8 "0"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "%d"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "%.0f">`:
        DATA
        DC8 "%.0f"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "%e"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "%f"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "\"\""
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\"\\\\\\b\\f\\n\\r\\t">`:
        DATA
        DC8 "\"\\\010\014\012\015\t"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "u%04x">`:
        DATA
        DC8 "u%04x"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "null">`:
        DATA
        DC8 "null"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "false">`:
        DATA
        DC8 "false"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "true">`:
        DATA
        DC8 "true"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "[]"
        DC8 0
//  239 
//  240 /* Parse the input text into an unescaped cstring, and populate item. */

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
//  241 static const unsigned char firstByteMark[7] = { 0x00, 0x00, 0xC0, 0xE0, 0xF0, 0xF8, 0xFC };
firstByteMark:
        DATA
        DC8 0, 0, 192, 224, 240, 248, 252, 0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  242 static const char *parse_string(cJSON *item, const char *str)
//  243 {
parse_string:
        PUSH     {R4-R8,LR}
        MOVS     R4,R0
        MOVS     R6,R1
//  244     const char *ptr = str + 1;
        ADDS     R5,R6,#+1
//  245     char *ptr2;
//  246     char *out;
//  247     int len = 0;
        MOVS     R0,#+0
//  248     unsigned uc, uc2;
//  249     if (*str != '\"')
        LDRB     R1,[R6, #+0]
        CMP      R1,#+34
        BEQ.N    ??parse_string_0
//  250     {
//  251         ep = str;    /* not a string! */
        LDR.W    R0,??DataTable14
        STR      R6,[R0, #+0]
//  252         return 0;
        MOVS     R0,#+0
        B.N      ??parse_string_1
//  253     }
//  254 
//  255     while (*ptr != '\"' && *ptr && ++len) if (*ptr++ == '\\') ptr++;	/* Skip escaped quotes. */
??parse_string_2:
        MOVS     R1,R5
        ADDS     R5,R1,#+1
        LDRB     R1,[R1, #+0]
        CMP      R1,#+92
        BNE.N    ??parse_string_0
        ADDS     R5,R5,#+1
??parse_string_0:
        LDRB     R1,[R5, #+0]
        CMP      R1,#+34
        BEQ.N    ??parse_string_3
        LDRB     R1,[R5, #+0]
        CMP      R1,#+0
        BEQ.N    ??parse_string_3
        ADDS     R0,R0,#+1
        CMP      R0,#+0
        BNE.N    ??parse_string_2
//  256 
//  257     out = (char *)cJSON_malloc(len + 1);	/* This is how long we need for the string, roughly. */
??parse_string_3:
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable14_1
        LDR      R1,[R1, #+0]
        BLX      R1
        MOVS     R7,R0
//  258     if (!out) return 0;
        CMP      R7,#+0
        BNE.N    ??parse_string_4
        MOVS     R0,#+0
        B.N      ??parse_string_1
//  259 
//  260     ptr = str + 1;
??parse_string_4:
        ADDS     R5,R6,#+1
//  261     ptr2 = out;
        MOVS     R6,R7
        B.N      ??parse_string_5
//  262     while (*ptr != '\"' && *ptr)
//  263     {
//  264         if (*ptr != '\\') *ptr2++ = *ptr++;
??parse_string_6:
        LDRB     R0,[R5, #+0]
        STRB     R0,[R6, #+0]
        ADDS     R5,R5,#+1
        ADDS     R6,R6,#+1
??parse_string_5:
        LDRB     R0,[R5, #+0]
        CMP      R0,#+34
        BEQ.W    ??parse_string_7
        LDRB     R0,[R5, #+0]
        CMP      R0,#+0
        BEQ.W    ??parse_string_7
        LDRB     R0,[R5, #+0]
        CMP      R0,#+92
        BNE.N    ??parse_string_6
//  265         else
//  266         {
//  267             ptr++;
        ADDS     R5,R5,#+1
//  268             switch (*ptr)
        LDRB     R0,[R5, #+0]
        CMP      R0,#+98
        BEQ.N    ??parse_string_8
        CMP      R0,#+102
        BEQ.N    ??parse_string_9
        CMP      R0,#+110
        BEQ.N    ??parse_string_10
        CMP      R0,#+114
        BEQ.N    ??parse_string_11
        CMP      R0,#+116
        BEQ.N    ??parse_string_12
        CMP      R0,#+117
        BEQ.N    ??parse_string_13
        B.N      ??parse_string_14
//  269             {
//  270             case 'b':
//  271                 *ptr2++ = '\b';
??parse_string_8:
        MOVS     R0,#+8
        STRB     R0,[R6, #+0]
        ADDS     R6,R6,#+1
//  272                 break;
        B.N      ??parse_string_15
//  273             case 'f':
//  274                 *ptr2++ = '\f';
??parse_string_9:
        MOVS     R0,#+12
        STRB     R0,[R6, #+0]
        ADDS     R6,R6,#+1
//  275                 break;
        B.N      ??parse_string_15
//  276             case 'n':
//  277                 *ptr2++ = '\n';
??parse_string_10:
        MOVS     R0,#+10
        STRB     R0,[R6, #+0]
        ADDS     R6,R6,#+1
//  278                 break;
        B.N      ??parse_string_15
//  279             case 'r':
//  280                 *ptr2++ = '\r';
??parse_string_11:
        MOVS     R0,#+13
        STRB     R0,[R6, #+0]
        ADDS     R6,R6,#+1
//  281                 break;
        B.N      ??parse_string_15
//  282             case 't':
//  283                 *ptr2++ = '\t';
??parse_string_12:
        MOVS     R0,#+9
        STRB     R0,[R6, #+0]
        ADDS     R6,R6,#+1
//  284                 break;
        B.N      ??parse_string_15
//  285             case 'u':	 /* transcode utf16 to utf8. */
//  286                 uc = parse_hex4(ptr + 1);
??parse_string_13:
        ADDS     R0,R5,#+1
        BL       parse_hex4
        MOV      R8,R0
//  287                 ptr += 4;	/* get the unicode char. */
        ADDS     R5,R5,#+4
//  288 
//  289                 if ((uc >= 0xDC00 && uc <= 0xDFFF) || uc == 0)	break;	/* check for invalid.	*/
        SUBS     R0,R8,#+56320
        CMP      R0,#+1024
        BCC.N    ??parse_string_16
        CMP      R8,#+0
        BNE.N    ??parse_string_17
??parse_string_16:
        B.N      ??parse_string_15
//  290 
//  291                 if (uc >= 0xD800 && uc <= 0xDBFF)	/* UTF16 surrogate pairs.	*/
??parse_string_17:
        SUBS     R0,R8,#+55296
        CMP      R0,#+1024
        BCS.N    ??parse_string_18
//  292                 {
//  293                     if (ptr[1] != '\\' || ptr[2] != 'u')	break;	/* missing second-half of surrogate.	*/
        LDRB     R0,[R5, #+1]
        CMP      R0,#+92
        BNE.N    ??parse_string_19
        LDRB     R0,[R5, #+2]
        CMP      R0,#+117
        BEQ.N    ??parse_string_20
??parse_string_19:
        B.N      ??parse_string_15
//  294                     uc2 = parse_hex4(ptr + 3);
??parse_string_20:
        ADDS     R0,R5,#+3
        BL       parse_hex4
//  295                     ptr += 6;
        ADDW     R5,R5,#+6
//  296                     if (uc2 < 0xDC00 || uc2 > 0xDFFF)		break;	/* invalid second-half of surrogate.	*/
        SUBS     R1,R0,#+56320
        CMP      R1,#+1024
        BCS.N    ??parse_string_15
//  297                     uc = 0x10000 + (((uc & 0x3FF) << 10) | (uc2 & 0x3FF));
??parse_string_21:
        LSLS     R1,R8,#+22       ;; ZeroExtS R1,R8,#+22,#+22
        LSRS     R1,R1,#+22
        LSLS     R0,R0,#+22       ;; ZeroExtS R0,R0,#+22,#+22
        LSRS     R0,R0,#+22
        ORRS     R0,R0,R1, LSL #+10
        ADDS     R8,R0,#+65536
//  298                 }
//  299 
//  300                 len = 4;
??parse_string_18:
        MOVS     R0,#+4
//  301                 if (uc < 0x80) len = 1;
        CMP      R8,#+128
        BCS.N    ??parse_string_22
        MOVS     R0,#+1
        B.N      ??parse_string_23
//  302                 else if (uc < 0x800) len = 2;
??parse_string_22:
        CMP      R8,#+2048
        BCS.N    ??parse_string_24
        MOVS     R0,#+2
        B.N      ??parse_string_23
//  303                 else if (uc < 0x10000) len = 3;
??parse_string_24:
        CMP      R8,#+65536
        BCS.N    ??parse_string_23
        MOVS     R0,#+3
//  304                 ptr2 += len;
??parse_string_23:
        ADDS     R6,R0,R6
//  305 
//  306                 switch (len)
        CMP      R0,#+1
        BEQ.N    ??parse_string_25
        BCC.N    ??parse_string_26
        CMP      R0,#+3
        BEQ.N    ??parse_string_27
        BCC.N    ??parse_string_28
        CMP      R0,#+4
        BNE.N    ??parse_string_26
//  307                 {
//  308                 case 4:
//  309                     *--ptr2 = ((uc | 0x80) & 0xBF);
??parse_string_29:
        SUBS     R6,R6,#+1
        ANDS     R1,R8,#0xBF
        ORRS     R1,R1,#0x80
        STRB     R1,[R6, #+0]
//  310                     uc >>= 6;
        LSRS     R8,R8,#+6
//  311                 case 3:
//  312                     *--ptr2 = ((uc | 0x80) & 0xBF);
??parse_string_27:
        SUBS     R6,R6,#+1
        ANDS     R1,R8,#0xBF
        ORRS     R1,R1,#0x80
        STRB     R1,[R6, #+0]
//  313                     uc >>= 6;
        LSRS     R8,R8,#+6
//  314                 case 2:
//  315                     *--ptr2 = ((uc | 0x80) & 0xBF);
??parse_string_28:
        SUBS     R6,R6,#+1
        ANDS     R1,R8,#0xBF
        ORRS     R1,R1,#0x80
        STRB     R1,[R6, #+0]
//  316                     uc >>= 6;
        LSRS     R8,R8,#+6
//  317                 case 1:
//  318                     *--ptr2 = (uc | firstByteMark[len]);
??parse_string_25:
        SUBS     R6,R6,#+1
        LDR.W    R1,??DataTable16_10
        LDRB     R1,[R0, R1]
        ORRS     R1,R1,R8
        STRB     R1,[R6, #+0]
//  319                 }
//  320                 ptr2 += len;
??parse_string_26:
        ADDS     R6,R0,R6
//  321                 break;
        B.N      ??parse_string_15
//  322             default:
//  323                 *ptr2++ = *ptr;
??parse_string_14:
        LDRB     R0,[R5, #+0]
        STRB     R0,[R6, #+0]
        ADDS     R6,R6,#+1
//  324                 break;
//  325             }
//  326             ptr++;
??parse_string_15:
        ADDS     R5,R5,#+1
        B.N      ??parse_string_5
//  327         }
//  328     }
//  329     *ptr2 = 0;
??parse_string_7:
        MOVS     R0,#+0
        STRB     R0,[R6, #+0]
//  330     if (*ptr == '\"') ptr++;
        LDRB     R0,[R5, #+0]
        CMP      R0,#+34
        BNE.N    ??parse_string_30
        ADDS     R5,R5,#+1
//  331     item->valuestring = out;
??parse_string_30:
        STR      R7,[R4, #+16]
//  332     item->type = cJSON_String;
        MOVS     R0,#+4
        STR      R0,[R4, #+12]
//  333     return ptr;
        MOVS     R0,R5
??parse_string_1:
        POP      {R4-R8,PC}       ;; return
//  334 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8:
        DC8      0x25, 0x65, 0x00, 0x00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_1:
        DC8      0x25, 0x66, 0x00, 0x00
//  335 
//  336 /* Render the cstring provided to an escaped version that can be printed. */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  337 static char *print_string_ptr(const char *str, printbuffer *p)
//  338 {
print_string_ptr:
        PUSH     {R3-R9,LR}
        MOVS     R5,R0
        MOVS     R7,R1
//  339     const char *ptr;
//  340     char *ptr2, *out;
//  341     int len = 0, flag = 0;
        MOVS     R6,#+0
        MOVS     R0,#+0
//  342     unsigned char token;
//  343 
//  344     for (ptr = str; *ptr; ptr++) flag |= ((*ptr > 0 && *ptr < 32) || (*ptr == '\"') || (*ptr == '\\')) ? 1 : 0;
        MOVS     R4,R5
        B.N      ??print_string_ptr_0
??print_string_ptr_1:
        MOVS     R1,#+0
??print_string_ptr_2:
        ORRS     R0,R1,R0
        ADDS     R4,R4,#+1
??print_string_ptr_0:
        LDRB     R1,[R4, #+0]
        CMP      R1,#+0
        BEQ.N    ??print_string_ptr_3
        LDRB     R1,[R4, #+0]
        CMP      R1,#+0
        BEQ.N    ??print_string_ptr_4
        LDRB     R1,[R4, #+0]
        CMP      R1,#+32
        BLT.N    ??print_string_ptr_5
??print_string_ptr_4:
        LDRB     R1,[R4, #+0]
        CMP      R1,#+34
        BEQ.N    ??print_string_ptr_5
        LDRB     R1,[R4, #+0]
        CMP      R1,#+92
        BNE.N    ??print_string_ptr_1
??print_string_ptr_5:
        MOVS     R1,#+1
        B.N      ??print_string_ptr_2
//  345     if (!flag)
??print_string_ptr_3:
        CMP      R0,#+0
        BNE.N    ??print_string_ptr_6
//  346     {
//  347         len = ptr - str;
        SUBS     R6,R4,R5
//  348         if (p) out = ensure(p, len + 3);
        CMP      R7,#+0
        BEQ.N    ??print_string_ptr_7
        ADDS     R1,R6,#+3
        MOVS     R0,R7
        BL       ensure
        MOVS     R7,R0
        B.N      ??print_string_ptr_8
//  349         else		out = (char *)cJSON_malloc(len + 3);
??print_string_ptr_7:
        ADDS     R0,R6,#+3
        LDR.W    R1,??DataTable14_1
        LDR      R1,[R1, #+0]
        BLX      R1
        MOVS     R7,R0
//  350         if (!out) return 0;
??print_string_ptr_8:
        CMP      R7,#+0
        BNE.N    ??print_string_ptr_9
        MOVS     R0,#+0
        B.N      ??print_string_ptr_10
//  351         ptr2 = out;
??print_string_ptr_9:
        MOV      R8,R7
//  352         *ptr2++ = '\"';
        MOVS     R0,#+34
        STRB     R0,[R8, #+0]
        ADDS     R8,R8,#+1
//  353         strcpy(ptr2, str);
        MOVS     R1,R5
        MOV      R0,R8
        BL       strcpy
//  354         ptr2[len] = '\"';
        MOVS     R0,#+34
        STRB     R0,[R6, R8]
//  355         ptr2[len + 1] = 0;
        MOVS     R0,#+0
        ADDS     R1,R6,R8
        STRB     R0,[R1, #+1]
//  356         return out;
        MOVS     R0,R7
        B.N      ??print_string_ptr_10
//  357     }
//  358 
//  359     if (!str)
??print_string_ptr_6:
        CMP      R5,#+0
        BNE.N    ??print_string_ptr_11
//  360     {
//  361         if (p)	out = ensure(p, 3);
        CMP      R7,#+0
        BEQ.N    ??print_string_ptr_12
        MOVS     R1,#+3
        MOVS     R0,R7
        BL       ensure
        MOVS     R7,R0
        B.N      ??print_string_ptr_13
//  362         else	out = (char *)cJSON_malloc(3);
??print_string_ptr_12:
        MOVS     R0,#+3
        LDR.W    R1,??DataTable14_1
        LDR      R1,[R1, #+0]
        BLX      R1
        MOVS     R7,R0
//  363         if (!out) return 0;
??print_string_ptr_13:
        CMP      R7,#+0
        BNE.N    ??print_string_ptr_14
        MOVS     R0,#+0
        B.N      ??print_string_ptr_10
//  364         strcpy(out, "\"\"");
??print_string_ptr_14:
        ADR.N    R1,??DataTable12  ;; 0x22, 0x22, 0x00, 0x00
        MOVS     R0,R7
        BL       strcpy
//  365         return out;
        MOVS     R0,R7
        B.N      ??print_string_ptr_10
//  366     }
//  367     ptr = str;
??print_string_ptr_11:
        MOVS     R4,R5
        B.N      ??print_string_ptr_15
//  368     while ((token = *ptr) && ++len)
//  369     {
//  370         if (strchr("\"\\\b\f\n\r\t", token)) len++;
//  371         else if (token < 32) len += 5;
??print_string_ptr_16:
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        CMP      R9,#+32
        BGE.N    ??print_string_ptr_17
        ADDS     R6,R6,#+5
//  372         ptr++;
??print_string_ptr_17:
        ADDS     R4,R4,#+1
??print_string_ptr_15:
        LDRB     R9,[R4, #+0]
        MOV      R0,R9
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??print_string_ptr_18
        ADDS     R6,R6,#+1
        CMP      R6,#+0
        BEQ.N    ??print_string_ptr_18
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        MOV      R1,R9
        LDR.W    R0,??DataTable17
        BL       strchr
        CMP      R0,#+0
        BEQ.N    ??print_string_ptr_16
        ADDS     R6,R6,#+1
        B.N      ??print_string_ptr_17
//  373     }
//  374 
//  375     if (p)	out = ensure(p, len + 3);
??print_string_ptr_18:
        CMP      R7,#+0
        BEQ.N    ??print_string_ptr_19
        ADDS     R1,R6,#+3
        MOVS     R0,R7
        BL       ensure
        MOVS     R7,R0
        B.N      ??print_string_ptr_20
//  376     else	out = (char *)cJSON_malloc(len + 3);
??print_string_ptr_19:
        ADDS     R0,R6,#+3
        LDR.W    R1,??DataTable14_1
        LDR      R1,[R1, #+0]
        BLX      R1
        MOVS     R7,R0
//  377     if (!out) return 0;
??print_string_ptr_20:
        CMP      R7,#+0
        BNE.N    ??print_string_ptr_21
        MOVS     R0,#+0
        B.N      ??print_string_ptr_10
//  378 
//  379     ptr2 = out;
??print_string_ptr_21:
        MOV      R8,R7
//  380     ptr = str;
        MOVS     R4,R5
//  381     *ptr2++ = '\"';
        MOVS     R0,#+34
        STRB     R0,[R8, #+0]
        ADDS     R8,R8,#+1
        B.N      ??print_string_ptr_22
//  382     while (*ptr)
//  383     {
//  384         if ((unsigned char)*ptr > 31 && *ptr != '\"' && *ptr != '\\') *ptr2++ = *ptr++;
??print_string_ptr_23:
        LDRB     R0,[R4, #+0]
        STRB     R0,[R8, #+0]
        ADDS     R4,R4,#+1
        ADDS     R8,R8,#+1
??print_string_ptr_22:
        LDRB     R0,[R4, #+0]
        CMP      R0,#+0
        BEQ.N    ??print_string_ptr_24
        LDRB     R0,[R4, #+0]
        CMP      R0,#+32
        BLT.N    ??print_string_ptr_25
        LDRB     R0,[R4, #+0]
        CMP      R0,#+34
        BEQ.N    ??print_string_ptr_25
        LDRB     R0,[R4, #+0]
        CMP      R0,#+92
        BNE.N    ??print_string_ptr_23
//  385         else
//  386         {
//  387             *ptr2++ = '\\';
??print_string_ptr_25:
        MOVS     R0,#+92
        STRB     R0,[R8, #+0]
        ADDS     R8,R8,#+1
//  388             switch (token = *ptr++)
        LDRB     R9,[R4, #+0]
        ADDS     R4,R4,#+1
        MOV      R0,R9
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+8
        BEQ.N    ??print_string_ptr_26
        CMP      R0,#+9
        BEQ.N    ??print_string_ptr_27
        CMP      R0,#+10
        BEQ.N    ??print_string_ptr_28
        CMP      R0,#+12
        BEQ.N    ??print_string_ptr_29
        CMP      R0,#+13
        BEQ.N    ??print_string_ptr_30
        CMP      R0,#+34
        BEQ.N    ??print_string_ptr_31
        CMP      R0,#+92
        BNE.N    ??print_string_ptr_32
//  389             {
//  390             case '\\':
//  391                 *ptr2++ = '\\';
??print_string_ptr_33:
        MOVS     R0,#+92
        STRB     R0,[R8, #+0]
        ADDS     R8,R8,#+1
//  392                 break;
        B.N      ??print_string_ptr_22
//  393             case '\"':
//  394                 *ptr2++ = '\"';
??print_string_ptr_31:
        MOVS     R0,#+34
        STRB     R0,[R8, #+0]
        ADDS     R8,R8,#+1
//  395                 break;
        B.N      ??print_string_ptr_22
//  396             case '\b':
//  397                 *ptr2++ = 'b';
??print_string_ptr_26:
        MOVS     R0,#+98
        STRB     R0,[R8, #+0]
        ADDS     R8,R8,#+1
//  398                 break;
        B.N      ??print_string_ptr_22
//  399             case '\f':
//  400                 *ptr2++ = 'f';
??print_string_ptr_29:
        MOVS     R0,#+102
        STRB     R0,[R8, #+0]
        ADDS     R8,R8,#+1
//  401                 break;
        B.N      ??print_string_ptr_22
//  402             case '\n':
//  403                 *ptr2++ = 'n';
??print_string_ptr_28:
        MOVS     R0,#+110
        STRB     R0,[R8, #+0]
        ADDS     R8,R8,#+1
//  404                 break;
        B.N      ??print_string_ptr_22
//  405             case '\r':
//  406                 *ptr2++ = 'r';
??print_string_ptr_30:
        MOVS     R0,#+114
        STRB     R0,[R8, #+0]
        ADDS     R8,R8,#+1
//  407                 break;
        B.N      ??print_string_ptr_22
//  408             case '\t':
//  409                 *ptr2++ = 't';
??print_string_ptr_27:
        MOVS     R0,#+116
        STRB     R0,[R8, #+0]
        ADDS     R8,R8,#+1
//  410                 break;
        B.N      ??print_string_ptr_22
//  411             default:
//  412                 sprintf(ptr2, "u%04x", token);
??print_string_ptr_32:
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        MOV      R2,R9
        LDR.W    R1,??DataTable19
        MOV      R0,R8
        BL       sprintf
//  413                 ptr2 += 5;
        ADDW     R8,R8,#+5
//  414                 break;	/* escape and print */
        B.N      ??print_string_ptr_22
//  415             }
//  416         }
//  417     }
//  418     *ptr2++ = '\"';
??print_string_ptr_24:
        MOVS     R0,#+34
        STRB     R0,[R8, #+0]
        ADDS     R8,R8,#+1
//  419     *ptr2++ = 0;
        MOVS     R0,#+0
        STRB     R0,[R8, #+0]
        ADDS     R8,R8,#+1
//  420     return out;
        MOVS     R0,R7
??print_string_ptr_10:
        POP      {R1,R4-R9,PC}    ;; return
//  421 }
//  422 /* Invote print_string_ptr (which is useful) on an item. */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  423 static char *print_string(cJSON *item, printbuffer *p)
//  424 {
print_string:
        PUSH     {R7,LR}
//  425     return print_string_ptr(item->valuestring, p);
        LDR      R0,[R0, #+16]
        BL       print_string_ptr
        POP      {R1,PC}          ;; return
//  426 }
//  427 
//  428 /* Predeclare these prototypes. */
//  429 static const char *parse_value(cJSON *item, const char *value);
//  430 static char *print_value(cJSON *item, int depth, int fmt, printbuffer *p);
//  431 static const char *parse_array(cJSON *item, const char *value);
//  432 static char *print_array(cJSON *item, int depth, int fmt, printbuffer *p);
//  433 static const char *parse_object(cJSON *item, const char *value);
//  434 static char *print_object(cJSON *item, int depth, int fmt, printbuffer *p);
//  435 
//  436 /* Utility to jump whitespace and cr/lf */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  437 static const char *skip(const char *in)
//  438 {
skip:
        B.N      ??skip_0
//  439     while (in && *in && (unsigned char)*in <= 32) in++;
??skip_1:
        ADDS     R0,R0,#+1
??skip_0:
        CMP      R0,#+0
        BEQ.N    ??skip_2
        LDRB     R1,[R0, #+0]
        CMP      R1,#+0
        BEQ.N    ??skip_2
        LDRB     R1,[R0, #+0]
        CMP      R1,#+33
        BLT.N    ??skip_1
//  440     return in;
??skip_2:
        BX       LR               ;; return
//  441 }
//  442 
//  443 /* Parse an object - create a new root, and populate. */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  444 cJSON *cJSON_ParseWithOpts(const char *value, const char **return_parse_end, int require_null_terminated)
//  445 {
cJSON_ParseWithOpts:
        PUSH     {R4-R8,LR}
        MOVS     R5,R0
        MOVS     R6,R1
        MOVS     R7,R2
//  446     const char *end = 0;
        MOVS     R4,#+0
//  447     cJSON *c = cJSON_New_Item();
        BL       cJSON_New_Item
        MOV      R8,R0
//  448     ep = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable14
        STR      R0,[R1, #+0]
//  449     if (!c) return 0;       /* memory fail */
        CMP      R8,#+0
        BNE.N    ??cJSON_ParseWithOpts_0
        MOVS     R0,#+0
        B.N      ??cJSON_ParseWithOpts_1
//  450 
//  451     end = parse_value(c, skip(value));
??cJSON_ParseWithOpts_0:
        MOVS     R0,R5
        BL       skip
        MOVS     R1,R0
        MOV      R0,R8
        BL       parse_value
        MOVS     R4,R0
//  452     if (!end)
        CMP      R4,#+0
        BNE.N    ??cJSON_ParseWithOpts_2
//  453     {
//  454         cJSON_Delete(c);    /* parse failure. ep is set. */
        MOV      R0,R8
        BL       cJSON_Delete
//  455         return 0;
        MOVS     R0,#+0
        B.N      ??cJSON_ParseWithOpts_1
//  456     }
//  457 
//  458     /* if we require null-terminated JSON without appended garbage, skip and then check for a null terminator */
//  459     if (require_null_terminated)
??cJSON_ParseWithOpts_2:
        CMP      R7,#+0
        BEQ.N    ??cJSON_ParseWithOpts_3
//  460     {
//  461         end = skip(end);
        MOVS     R0,R4
        BL       skip
        MOVS     R4,R0
//  462         if (*end)
        LDRB     R0,[R4, #+0]
        CMP      R0,#+0
        BEQ.N    ??cJSON_ParseWithOpts_3
//  463         {
//  464             cJSON_Delete(c);
        MOV      R0,R8
        BL       cJSON_Delete
//  465             ep = end;
        LDR.N    R0,??DataTable14
        STR      R4,[R0, #+0]
//  466             return 0;
        MOVS     R0,#+0
        B.N      ??cJSON_ParseWithOpts_1
//  467         }
//  468     }
//  469     if (return_parse_end) *return_parse_end = end;
??cJSON_ParseWithOpts_3:
        CMP      R6,#+0
        BEQ.N    ??cJSON_ParseWithOpts_4
        STR      R4,[R6, #+0]
//  470     return c;
??cJSON_ParseWithOpts_4:
        MOV      R0,R8
??cJSON_ParseWithOpts_1:
        POP      {R4-R8,PC}       ;; return
//  471 }
//  472 /* Default options for cJSON_Parse */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  473 cJSON *cJSON_Parse(const char *value)
//  474 {
cJSON_Parse:
        PUSH     {R7,LR}
//  475     return cJSON_ParseWithOpts(value, 0, 0);
        MOVS     R2,#+0
        MOVS     R1,#+0
        BL       cJSON_ParseWithOpts
        POP      {R1,PC}          ;; return
//  476 }
//  477 
//  478 /* Render a cJSON item/entity/structure to text. */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  479 char *cJSON_Print(cJSON *item)
//  480 {
cJSON_Print:
        PUSH     {R7,LR}
//  481     return print_value(item, 0, 1, 0);
        MOVS     R3,#+0
        MOVS     R2,#+1
        MOVS     R1,#+0
        BL       print_value
        POP      {R1,PC}          ;; return
//  482 }

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  483 char *cJSON_PrintUnformatted(cJSON *item)
//  484 {
cJSON_PrintUnformatted:
        PUSH     {R7,LR}
//  485     return print_value(item, 0, 0, 0);
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOVS     R1,#+0
        BL       print_value
        POP      {R1,PC}          ;; return
//  486 }
//  487 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  488 char *cJSON_PrintBuffered(cJSON *item, int prebuffer, int fmt)
//  489 {
cJSON_PrintBuffered:
        PUSH     {R4-R6,LR}
        SUB      SP,SP,#+16
        MOVS     R4,R0
        MOVS     R6,R1
        MOVS     R5,R2
//  490     printbuffer p;
//  491     p.buffer = (char *)cJSON_malloc(prebuffer);
        MOVS     R0,R6
        LDR.W    R1,??DataTable19_1
        LDR      R1,[R1, #+0]
        BLX      R1
        STR      R0,[SP, #+0]
//  492     p.length = prebuffer;
        STR      R6,[SP, #+4]
//  493     p.offset = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+8]
//  494     return print_value(item, 0, fmt, &p);
        ADD      R3,SP,#+0
        MOVS     R2,R5
        MOVS     R1,#+0
        MOVS     R0,R4
        BL       print_value
        ADD      SP,SP,#+16
        POP      {R4-R6,PC}       ;; return
//  495     return p.buffer;
//  496 }
//  497 
//  498 
//  499 /* Parser core - when encountering text, process appropriately. */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  500 static const char *parse_value(cJSON *item, const char *value)
//  501 {
parse_value:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
//  502     if (!value)						return 0;	/* Fail on null. */
        CMP      R5,#+0
        BNE.N    ??parse_value_0
        MOVS     R0,#+0
        B.N      ??parse_value_1
//  503     if (!strncmp(value, "null", 4))
??parse_value_0:
        MOVS     R2,#+4
        LDR.W    R1,??DataTable19_2
        MOVS     R0,R5
        BL       strncmp
        CMP      R0,#+0
        BNE.N    ??parse_value_2
//  504     {
//  505         item->type = cJSON_NULL;
        MOVS     R0,#+2
        STR      R0,[R4, #+12]
//  506         return value + 4;
        ADDS     R0,R5,#+4
        B.N      ??parse_value_1
//  507     }
//  508     if (!strncmp(value, "false", 5))
??parse_value_2:
        MOVS     R2,#+5
        LDR.W    R1,??DataTable19_3
        MOVS     R0,R5
        BL       strncmp
        CMP      R0,#+0
        BNE.N    ??parse_value_3
//  509     {
//  510         item->type = cJSON_False;
        MOVS     R0,#+0
        STR      R0,[R4, #+12]
//  511         return value + 5;
        ADDS     R0,R5,#+5
        B.N      ??parse_value_1
//  512     }
//  513     if (!strncmp(value, "true", 4))
??parse_value_3:
        MOVS     R2,#+4
        LDR.W    R1,??DataTable19_4
        MOVS     R0,R5
        BL       strncmp
        CMP      R0,#+0
        BNE.N    ??parse_value_4
//  514     {
//  515         item->type = cJSON_True;
        MOVS     R0,#+1
        STR      R0,[R4, #+12]
//  516         item->valueint = 1;
        MOVS     R0,#+1
        STR      R0,[R4, #+20]
//  517         return value + 4;
        ADDS     R0,R5,#+4
        B.N      ??parse_value_1
//  518     }
//  519     if (*value == '\"')
??parse_value_4:
        LDRB     R0,[R5, #+0]
        CMP      R0,#+34
        BNE.N    ??parse_value_5
//  520     {
//  521         return parse_string(item, value);
        MOVS     R1,R5
        MOVS     R0,R4
        BL       parse_string
        B.N      ??parse_value_1
//  522     }
//  523     if (*value == '-' || (*value >= '0' && *value <= '9'))
??parse_value_5:
        LDRB     R0,[R5, #+0]
        CMP      R0,#+45
        BEQ.N    ??parse_value_6
        LDRB     R0,[R5, #+0]
        SUBS     R0,R0,#+48
        CMP      R0,#+10
        BCS.N    ??parse_value_7
//  524     {
//  525         return parse_number(item, value);
??parse_value_6:
        MOVS     R1,R5
        MOVS     R0,R4
        BL       parse_number
        B.N      ??parse_value_1
//  526     }
//  527     if (*value == '[')
??parse_value_7:
        LDRB     R0,[R5, #+0]
        CMP      R0,#+91
        BNE.N    ??parse_value_8
//  528     {
//  529         return parse_array(item, value);
        MOVS     R1,R5
        MOVS     R0,R4
        BL       parse_array
        B.N      ??parse_value_1
//  530     }
//  531     if (*value == '{')
??parse_value_8:
        LDRB     R0,[R5, #+0]
        CMP      R0,#+123
        BNE.N    ??parse_value_9
//  532     {
//  533         return parse_object(item, value);
        MOVS     R1,R5
        MOVS     R0,R4
        BL       parse_object
        B.N      ??parse_value_1
//  534     }
//  535 
//  536     ep = value;
??parse_value_9:
        LDR.N    R0,??DataTable14
        STR      R5,[R0, #+0]
//  537     return 0;	/* failure. */
        MOVS     R0,#+0
??parse_value_1:
        POP      {R1,R4,R5,PC}    ;; return
//  538 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12:
        DC8      0x22, 0x22, 0x00, 0x00
//  539 
//  540 /* Render a value to text. */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  541 static char *print_value(cJSON *item, int depth, int fmt, printbuffer *p)
//  542 {
print_value:
        PUSH     {R3-R5,LR}
//  543     char *out = 0;
        MOVS     R4,#+0
//  544     if (!item) return 0;
        CMP      R0,#+0
        BNE.N    ??print_value_0
        MOVS     R0,#+0
        B.N      ??print_value_1
//  545     if (p)
??print_value_0:
        CMP      R3,#+0
        BEQ.N    ??print_value_2
//  546     {
//  547         switch ((item->type) & 255)
        LDRB     R5,[R0, #+12]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??print_value_3
        CMP      R5,#+2
        BEQ.N    ??print_value_4
        BCC.N    ??print_value_5
        CMP      R5,#+4
        BEQ.N    ??print_value_6
        BCC.N    ??print_value_7
        CMP      R5,#+6
        BEQ.N    ??print_value_8
        BCC.N    ??print_value_9
        B.N      ??print_value_10
//  548         {
//  549         case cJSON_NULL:
//  550         {
//  551             out = ensure(p, 5);
??print_value_4:
        MOVS     R1,#+5
        MOVS     R0,R3
        BL       ensure
        MOVS     R4,R0
//  552             if (out) strcpy(out, "null");
        CMP      R4,#+0
        BEQ.N    ??print_value_11
        LDR.W    R1,??DataTable19_2
        MOVS     R0,R4
        BL       strcpy
//  553             break;
??print_value_11:
        B.N      ??print_value_10
//  554         }
//  555         case cJSON_False:
//  556         {
//  557             out = ensure(p, 6);
??print_value_3:
        MOVS     R1,#+6
        MOVS     R0,R3
        BL       ensure
        MOVS     R4,R0
//  558             if (out) strcpy(out, "false");
        CMP      R4,#+0
        BEQ.N    ??print_value_12
        LDR.W    R1,??DataTable19_3
        MOVS     R0,R4
        BL       strcpy
//  559             break;
??print_value_12:
        B.N      ??print_value_10
//  560         }
//  561         case cJSON_True:
//  562         {
//  563             out = ensure(p, 5);
??print_value_5:
        MOVS     R1,#+5
        MOVS     R0,R3
        BL       ensure
        MOVS     R4,R0
//  564             if (out) strcpy(out, "true");
        CMP      R4,#+0
        BEQ.N    ??print_value_13
        LDR.W    R1,??DataTable19_4
        MOVS     R0,R4
        BL       strcpy
//  565             break;
??print_value_13:
        B.N      ??print_value_10
//  566         }
//  567         case cJSON_Number:
//  568             out = print_number(item, p);
??print_value_7:
        MOVS     R1,R3
        BL       print_number
        MOVS     R4,R0
//  569             break;
        B.N      ??print_value_10
//  570         case cJSON_String:
//  571             out = print_string(item, p);
??print_value_6:
        MOVS     R1,R3
        BL       print_string
        MOVS     R4,R0
//  572             break;
        B.N      ??print_value_10
//  573         case cJSON_Array:
//  574             out = print_array(item, depth, fmt, p);
??print_value_9:
        BL       print_array
        MOVS     R4,R0
//  575             break;
        B.N      ??print_value_10
//  576         case cJSON_Object:
//  577             out = print_object(item, depth, fmt, p);
??print_value_8:
        BL       print_object
        MOVS     R4,R0
//  578             break;
        B.N      ??print_value_10
//  579         }
//  580     }
//  581     else
//  582     {
//  583         switch ((item->type) & 255)
??print_value_2:
        LDRB     R3,[R0, #+12]
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        CMP      R3,#+0
        BEQ.N    ??print_value_14
        CMP      R3,#+2
        BEQ.N    ??print_value_15
        BCC.N    ??print_value_16
        CMP      R3,#+4
        BEQ.N    ??print_value_17
        BCC.N    ??print_value_18
        CMP      R3,#+6
        BEQ.N    ??print_value_19
        BCC.N    ??print_value_20
        B.N      ??print_value_10
//  584         {
//  585         case cJSON_NULL:
//  586             out = cJSON_strdup("null");
??print_value_15:
        LDR.W    R0,??DataTable19_2
        BL       cJSON_strdup
        MOVS     R4,R0
//  587             break;
        B.N      ??print_value_10
//  588         case cJSON_False:
//  589             out = cJSON_strdup("false");
??print_value_14:
        LDR.W    R0,??DataTable19_3
        BL       cJSON_strdup
        MOVS     R4,R0
//  590             break;
        B.N      ??print_value_10
//  591         case cJSON_True:
//  592             out = cJSON_strdup("true");
??print_value_16:
        LDR.W    R0,??DataTable19_4
        BL       cJSON_strdup
        MOVS     R4,R0
//  593             break;
        B.N      ??print_value_10
//  594         case cJSON_Number:
//  595             out = print_number(item, 0);
??print_value_18:
        MOVS     R1,#+0
        BL       print_number
        MOVS     R4,R0
//  596             break;
        B.N      ??print_value_10
//  597         case cJSON_String:
//  598             out = print_string(item, 0);
??print_value_17:
        MOVS     R1,#+0
        BL       print_string
        MOVS     R4,R0
//  599             break;
        B.N      ??print_value_10
//  600         case cJSON_Array:
//  601             out = print_array(item, depth, fmt, 0);
??print_value_20:
        MOVS     R3,#+0
        BL       print_array
        MOVS     R4,R0
//  602             break;
        B.N      ??print_value_10
//  603         case cJSON_Object:
//  604             out = print_object(item, depth, fmt, 0);
??print_value_19:
        MOVS     R3,#+0
        BL       print_object
        MOVS     R4,R0
//  605             break;
//  606         }
//  607     }
//  608     return out;
??print_value_10:
        MOVS     R0,R4
??print_value_1:
        POP      {R1,R4,R5,PC}    ;; return
//  609 }
//  610 
//  611 /* Build an array from input text. */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  612 static const char *parse_array(cJSON *item, const char *value)
//  613 {
parse_array:
        PUSH     {R4-R6,LR}
        MOVS     R5,R0
        MOVS     R4,R1
//  614     cJSON *child;
//  615     if (*value != '[')
        LDRB     R0,[R4, #+0]
        CMP      R0,#+91
        BEQ.N    ??parse_array_0
//  616     {
//  617         ep = value;    /* not an array! */
        LDR.N    R0,??DataTable14
        STR      R4,[R0, #+0]
//  618         return 0;
        MOVS     R0,#+0
        B.N      ??parse_array_1
//  619     }
//  620 
//  621     item->type = cJSON_Array;
??parse_array_0:
        MOVS     R0,#+5
        STR      R0,[R5, #+12]
//  622     value = skip(value + 1);
        ADDS     R0,R4,#+1
        BL       skip
        MOVS     R4,R0
//  623     if (*value == ']') return value + 1;	/* empty array. */
        LDRB     R0,[R4, #+0]
        CMP      R0,#+93
        BNE.N    ??parse_array_2
        ADDS     R0,R4,#+1
        B.N      ??parse_array_1
//  624 
//  625     item->child = child = cJSON_New_Item();
??parse_array_2:
        BL       cJSON_New_Item
        MOVS     R6,R0
        STR      R6,[R5, #+8]
//  626     if (!item->child) return 0;		 /* memory fail */
        LDR      R0,[R5, #+8]
        CMP      R0,#+0
        BNE.N    ??parse_array_3
        MOVS     R0,#+0
        B.N      ??parse_array_1
//  627     value = skip(parse_value(child, skip(value)));	/* skip any spacing, get the value. */
??parse_array_3:
        MOVS     R0,R4
        BL       skip
        MOVS     R1,R0
        MOVS     R0,R6
        BL       parse_value
        BL       skip
        MOVS     R4,R0
//  628     if (!value) return 0;
        CMP      R4,#+0
        BNE.N    ??parse_array_4
        MOVS     R0,#+0
        B.N      ??parse_array_1
//  629 
//  630     while (*value == ',')
??parse_array_4:
        LDRB     R0,[R4, #+0]
        CMP      R0,#+44
        BNE.N    ??parse_array_5
//  631     {
//  632         cJSON *new_item;
//  633         if (!(new_item = cJSON_New_Item())) return 0; 	/* memory fail */
        BL       cJSON_New_Item
        CMP      R0,#+0
        BNE.N    ??parse_array_6
        MOVS     R0,#+0
        B.N      ??parse_array_1
//  634         child->next = new_item;
??parse_array_6:
        STR      R0,[R6, #+0]
//  635         new_item->prev = child;
        STR      R6,[R0, #+4]
//  636         child = new_item;
        MOVS     R6,R0
//  637         value = skip(parse_value(child, skip(value + 1)));
        ADDS     R0,R4,#+1
        BL       skip
        MOVS     R1,R0
        MOVS     R0,R6
        BL       parse_value
        BL       skip
        MOVS     R4,R0
//  638         if (!value) return 0;	/* memory fail */
        CMP      R4,#+0
        BNE.N    ??parse_array_4
        MOVS     R0,#+0
        B.N      ??parse_array_1
//  639     }
//  640 
//  641     if (*value == ']') return value + 1;	/* end of array */
??parse_array_5:
        LDRB     R0,[R4, #+0]
        CMP      R0,#+93
        BNE.N    ??parse_array_7
        ADDS     R0,R4,#+1
        B.N      ??parse_array_1
//  642     ep = value;
??parse_array_7:
        LDR.N    R0,??DataTable14
        STR      R4,[R0, #+0]
//  643     return 0;	/* malformed. */
        MOVS     R0,#+0
??parse_array_1:
        POP      {R4-R6,PC}       ;; return
//  644 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14:
        DC32     ep

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_1:
        DC32     cJSON_malloc

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_2:
        DC32     malloc

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_3:
        DC32     free

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_4:
        DC32     cJSON_free

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_5:
        DC32     0x3ff00000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_6:
        DC32     0xbff00000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_7:
        DC32     0x40240000
//  645 
//  646 /* Render an array to text */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  647 static char *print_array(cJSON *item, int depth, int fmt, printbuffer *p)
//  648 {
print_array:
        PUSH     {R0-R11,LR}
        SUB      SP,SP,#+4
//  649     char **entries;
//  650     char *out = 0, *ptr, *ret;
        MOVS     R7,#+0
//  651     int len = 5;
        MOVS     R6,#+5
//  652     cJSON *child = item->child;
        LDR      R0,[SP, #+4]
        LDR      R9,[R0, #+8]
//  653     int numentries = 0, i = 0, fail = 0;
        MOVS     R8,#+0
        MOVS     R5,#+0
        MOVS     R4,#+0
//  654     size_t tmplen = 0;
        MOVS     R11,#+0
        B.N      ??print_array_0
//  655 
//  656     /* How many entries in the array? */
//  657     while (child) numentries++, child = child->next;
??print_array_1:
        ADDS     R8,R8,#+1
        LDR      R9,[R9, #+0]
??print_array_0:
        CMP      R9,#+0
        BNE.N    ??print_array_1
//  658     /* Explicitly handle numentries==0 */
//  659     if (!numentries)
        CMP      R8,#+0
        BNE.N    ??print_array_2
//  660     {
//  661         if (p)	out = ensure(p, 3);
        LDR      R0,[SP, #+16]
        CMP      R0,#+0
        BEQ.N    ??print_array_3
        MOVS     R1,#+3
        LDR      R0,[SP, #+16]
        BL       ensure
        MOVS     R7,R0
        B.N      ??print_array_4
//  662         else	out = (char *)cJSON_malloc(3);
??print_array_3:
        MOVS     R0,#+3
        LDR.W    R1,??DataTable19_1
        LDR      R1,[R1, #+0]
        BLX      R1
        MOVS     R7,R0
//  663         if (out) strcpy(out, "[]");
??print_array_4:
        CMP      R7,#+0
        BEQ.N    ??print_array_5
        ADR.N    R1,??DataTable15  ;; 0x5B, 0x5D, 0x00, 0x00
        MOVS     R0,R7
        BL       strcpy
//  664         return out;
??print_array_5:
        MOVS     R0,R7
        B.N      ??print_array_6
//  665     }
//  666 
//  667     if (p)
??print_array_2:
        LDR      R0,[SP, #+16]
        CMP      R0,#+0
        BEQ.N    ??print_array_7
//  668     {
//  669         /* Compose the output array. */
//  670         i = p->offset;
        LDR      R0,[SP, #+16]
        LDR      R5,[R0, #+8]
//  671         ptr = ensure(p, 1);
        MOVS     R1,#+1
        LDR      R0,[SP, #+16]
        BL       ensure
        MOV      R10,R0
//  672         if (!ptr) return 0;
        CMP      R10,#+0
        BNE.N    ??print_array_8
        MOVS     R0,#+0
        B.N      ??print_array_6
//  673         *ptr = '[';
??print_array_8:
        MOVS     R0,#+91
        STRB     R0,[R10, #+0]
//  674         p->offset++;
        LDR      R0,[SP, #+16]
        LDR      R0,[R0, #+8]
        ADDS     R0,R0,#+1
        LDR      R1,[SP, #+16]
        STR      R0,[R1, #+8]
//  675         child = item->child;
        LDR      R0,[SP, #+4]
        LDR      R9,[R0, #+8]
        B.N      ??print_array_9
//  676         while (child && !fail)
//  677         {
//  678             print_value(child, depth + 1, fmt, p);
//  679             p->offset = update(p);
//  680             if (child->next)
//  681             {
//  682                 len = fmt ? 2 : 1;
//  683                 ptr = ensure(p, len + 1);
//  684                 if (!ptr) return 0;
//  685                 *ptr++ = ',';
??print_array_10:
        MOVS     R0,#+44
        STRB     R0,[R10, #+0]
        ADDS     R10,R10,#+1
//  686                 if(fmt)*ptr++ = ' ';
        LDR      R0,[SP, #+12]
        CMP      R0,#+0
        BEQ.N    ??print_array_11
        MOVS     R0,#+32
        STRB     R0,[R10, #+0]
        ADDS     R10,R10,#+1
//  687                 *ptr = 0;
??print_array_11:
        MOVS     R0,#+0
        STRB     R0,[R10, #+0]
//  688                 p->offset += len;
        LDR      R0,[SP, #+16]
        LDR      R0,[R0, #+8]
        ADDS     R0,R6,R0
        LDR      R1,[SP, #+16]
        STR      R0,[R1, #+8]
//  689             }
//  690             child = child->next;
??print_array_12:
        LDR      R9,[R9, #+0]
??print_array_9:
        CMP      R9,#+0
        BEQ.N    ??print_array_13
        CMP      R4,#+0
        BNE.N    ??print_array_13
        LDR      R3,[SP, #+16]
        LDR      R2,[SP, #+12]
        LDR      R0,[SP, #+8]
        ADDS     R1,R0,#+1
        MOV      R0,R9
        BL       print_value
        LDR      R0,[SP, #+16]
        BL       update
        LDR      R1,[SP, #+16]
        STR      R0,[R1, #+8]
        LDR      R0,[R9, #+0]
        CMP      R0,#+0
        BEQ.N    ??print_array_12
        LDR      R0,[SP, #+12]
        CMP      R0,#+0
        BEQ.N    ??print_array_14
        MOVS     R6,#+2
        B.N      ??print_array_15
??print_array_14:
        MOVS     R6,#+1
??print_array_15:
        ADDS     R1,R6,#+1
        LDR      R0,[SP, #+16]
        BL       ensure
        MOV      R10,R0
        CMP      R10,#+0
        BNE.N    ??print_array_10
        MOVS     R0,#+0
        B.N      ??print_array_6
//  691         }
//  692         ptr = ensure(p, 2);
??print_array_13:
        MOVS     R1,#+2
        LDR      R0,[SP, #+16]
        BL       ensure
        MOV      R10,R0
//  693         if (!ptr) return 0;
        CMP      R10,#+0
        BNE.N    ??print_array_16
        MOVS     R0,#+0
        B.N      ??print_array_6
//  694         *ptr++ = ']';
??print_array_16:
        MOVS     R0,#+93
        STRB     R0,[R10, #+0]
        ADDS     R10,R10,#+1
//  695         *ptr = 0;
        MOVS     R0,#+0
        STRB     R0,[R10, #+0]
//  696         out = (p->buffer) + i;
        LDR      R0,[SP, #+16]
        LDR      R0,[R0, #+0]
        ADDS     R7,R5,R0
        B.N      ??print_array_17
//  697     }
//  698     else
//  699     {
//  700         /* Allocate an array to hold the values for each */
//  701         entries = (char **)cJSON_malloc(numentries * sizeof(char *));
??print_array_7:
        LSLS     R0,R8,#+2
        LDR.W    R1,??DataTable19_1
        LDR      R1,[R1, #+0]
        BLX      R1
        STR      R0,[SP, #+0]
//  702         if (!entries) return 0;
        LDR      R0,[SP, #+0]
        CMP      R0,#+0
        BNE.N    ??print_array_18
        MOVS     R0,#+0
        B.N      ??print_array_6
//  703         memset(entries, 0, numentries * sizeof(char *));
??print_array_18:
        LSLS     R2,R8,#+2
        MOVS     R1,#+0
        LDR      R0,[SP, #+0]
        BL       memset
//  704         /* Retrieve all the results: */
//  705         child = item->child;
        LDR      R0,[SP, #+4]
        LDR      R9,[R0, #+8]
        B.N      ??print_array_19
//  706         while (child && !fail)
//  707         {
//  708             ret = print_value(child, depth + 1, fmt, 0);
//  709             entries[i++] = ret;
//  710             if (ret) len += strlen(ret) + 2 + (fmt ? 1 : 0);
//  711             else fail = 1;
??print_array_20:
        MOVS     R4,#+1
//  712             child = child->next;
??print_array_21:
        LDR      R9,[R9, #+0]
??print_array_19:
        CMP      R9,#+0
        BEQ.N    ??print_array_22
        CMP      R4,#+0
        BNE.N    ??print_array_22
        MOVS     R3,#+0
        LDR      R2,[SP, #+12]
        LDR      R0,[SP, #+8]
        ADDS     R1,R0,#+1
        MOV      R0,R9
        BL       print_value
        LDR      R1,[SP, #+0]
        STR      R0,[R1, R5, LSL #+2]
        ADDS     R5,R5,#+1
        CMP      R0,#+0
        BEQ.N    ??print_array_20
        BL       strlen
        LDR      R1,[SP, #+12]
        CMP      R1,#+0
        BEQ.N    ??print_array_23
        MOVS     R1,#+1
        B.N      ??print_array_24
??print_array_23:
        MOVS     R1,#+0
??print_array_24:
        ADDS     R0,R1,R0
        ADDS     R0,R0,#+2
        ADDS     R6,R0,R6
        B.N      ??print_array_21
//  713         }
//  714 
//  715         /* If we didn't fail, try to malloc the output string */
//  716         if (!fail)	out = (char *)cJSON_malloc(len);
??print_array_22:
        CMP      R4,#+0
        BNE.N    ??print_array_25
        MOVS     R0,R6
        LDR.W    R1,??DataTable19_1
        LDR      R1,[R1, #+0]
        BLX      R1
        MOVS     R7,R0
//  717         /* If that fails, we fail. */
//  718         if (!out) fail = 1;
??print_array_25:
        CMP      R7,#+0
        BNE.N    ??print_array_26
        MOVS     R4,#+1
//  719 
//  720         /* Handle failure. */
//  721         if (fail)
??print_array_26:
        CMP      R4,#+0
        BEQ.N    ??print_array_27
//  722         {
//  723             for (i = 0; i < numentries; i++) if (entries[i]) cJSON_free(entries[i]);
        MOVS     R5,#+0
        B.N      ??print_array_28
??print_array_29:
        LDR      R0,[SP, #+0]
        LDR      R0,[R0, R5, LSL #+2]
        CMP      R0,#+0
        BEQ.N    ??print_array_30
        LDR      R0,[SP, #+0]
        LDR      R0,[R0, R5, LSL #+2]
        LDR.W    R1,??DataTable19_5
        LDR      R1,[R1, #+0]
        BLX      R1
??print_array_30:
        ADDS     R5,R5,#+1
??print_array_28:
        CMP      R5,R8
        BLT.N    ??print_array_29
//  724             cJSON_free(entries);
        LDR      R0,[SP, #+0]
        LDR.W    R1,??DataTable19_5
        LDR      R1,[R1, #+0]
        BLX      R1
//  725             return 0;
        MOVS     R0,#+0
        B.N      ??print_array_6
//  726         }
//  727 
//  728         /* Compose the output array. */
//  729         *out = '[';
??print_array_27:
        MOVS     R0,#+91
        STRB     R0,[R7, #+0]
//  730         ptr = out + 1;
        ADDS     R10,R7,#+1
//  731         *ptr = 0;
        MOVS     R0,#+0
        STRB     R0,[R10, #+0]
//  732         for (i = 0; i < numentries; i++)
        MOVS     R5,#+0
        B.N      ??print_array_31
//  733         {
//  734             tmplen = strlen(entries[i]);
??print_array_32:
        LDR      R0,[SP, #+0]
        LDR      R0,[R0, R5, LSL #+2]
        BL       strlen
        MOV      R11,R0
//  735             memcpy(ptr, entries[i], tmplen);
        MOV      R2,R11
        LDR      R0,[SP, #+0]
        LDR      R1,[R0, R5, LSL #+2]
        MOV      R0,R10
        BL       memcpy
//  736             ptr += tmplen;
        ADDS     R10,R11,R10
//  737             if (i != numentries - 1)
        SUBS     R0,R8,#+1
        CMP      R5,R0
        BEQ.N    ??print_array_33
//  738             {
//  739                 *ptr++ = ',';
        MOVS     R0,#+44
        STRB     R0,[R10, #+0]
        ADDS     R10,R10,#+1
//  740                 if(fmt)*ptr++ = ' ';
        LDR      R0,[SP, #+12]
        CMP      R0,#+0
        BEQ.N    ??print_array_34
        MOVS     R0,#+32
        STRB     R0,[R10, #+0]
        ADDS     R10,R10,#+1
//  741                 *ptr = 0;
??print_array_34:
        MOVS     R0,#+0
        STRB     R0,[R10, #+0]
//  742             }
//  743             cJSON_free(entries[i]);
??print_array_33:
        LDR      R0,[SP, #+0]
        LDR      R0,[R0, R5, LSL #+2]
        LDR.W    R1,??DataTable19_5
        LDR      R1,[R1, #+0]
        BLX      R1
//  744         }
        ADDS     R5,R5,#+1
??print_array_31:
        CMP      R5,R8
        BLT.N    ??print_array_32
//  745         cJSON_free(entries);
        LDR      R0,[SP, #+0]
        LDR.W    R1,??DataTable19_5
        LDR      R1,[R1, #+0]
        BLX      R1
//  746         *ptr++ = ']';
        MOVS     R0,#+93
        STRB     R0,[R10, #+0]
        ADDS     R10,R10,#+1
//  747         *ptr++ = 0;
        MOVS     R0,#+0
        STRB     R0,[R10, #+0]
        ADDS     R10,R10,#+1
//  748     }
//  749     return out;
??print_array_17:
        MOVS     R0,R7
??print_array_6:
        ADD      SP,SP,#+20
        POP      {R4-R11,PC}      ;; return
//  750 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15:
        DC8      0x5B, 0x5D, 0x00, 0x00
//  751 
//  752 /* Build an object from the text. */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  753 static const char *parse_object(cJSON *item, const char *value)
//  754 {
parse_object:
        PUSH     {R4-R6,LR}
        MOVS     R6,R0
        MOVS     R5,R1
//  755     cJSON *child;
//  756     if (*value != '{')
        LDRB     R0,[R5, #+0]
        CMP      R0,#+123
        BEQ.N    ??parse_object_0
//  757     {
//  758         ep = value;    /* not an object! */
        LDR.N    R0,??DataTable16_11
        STR      R5,[R0, #+0]
//  759         return 0;
        MOVS     R0,#+0
        B.N      ??parse_object_1
//  760     }
//  761 
//  762     item->type = cJSON_Object;
??parse_object_0:
        MOVS     R0,#+6
        STR      R0,[R6, #+12]
//  763     value = skip(value + 1);
        ADDS     R0,R5,#+1
        BL       skip
        MOVS     R5,R0
//  764     if (*value == '}') return value + 1;	/* empty array. */
        LDRB     R0,[R5, #+0]
        CMP      R0,#+125
        BNE.N    ??parse_object_2
        ADDS     R0,R5,#+1
        B.N      ??parse_object_1
//  765 
//  766     item->child = child = cJSON_New_Item();
??parse_object_2:
        BL       cJSON_New_Item
        MOVS     R4,R0
        STR      R4,[R6, #+8]
//  767     if (!item->child) return 0;
        LDR      R0,[R6, #+8]
        CMP      R0,#+0
        BNE.N    ??parse_object_3
        MOVS     R0,#+0
        B.N      ??parse_object_1
//  768     value = skip(parse_string(child, skip(value)));
??parse_object_3:
        MOVS     R0,R5
        BL       skip
        MOVS     R1,R0
        MOVS     R0,R4
        BL       parse_string
        BL       skip
        MOVS     R5,R0
//  769     if (!value) return 0;
        CMP      R5,#+0
        BNE.N    ??parse_object_4
        MOVS     R0,#+0
        B.N      ??parse_object_1
//  770     child->string = child->valuestring;
??parse_object_4:
        LDR      R0,[R4, #+16]
        STR      R0,[R4, #+32]
//  771     child->valuestring = 0;
        MOVS     R0,#+0
        STR      R0,[R4, #+16]
//  772     if (*value != ':')
        LDRB     R0,[R5, #+0]
        CMP      R0,#+58
        BEQ.N    ??parse_object_5
//  773     {
//  774         ep = value;    /* fail! */
        LDR.N    R0,??DataTable16_11
        STR      R5,[R0, #+0]
//  775         return 0;
        MOVS     R0,#+0
        B.N      ??parse_object_1
//  776     }
//  777     value = skip(parse_value(child, skip(value + 1)));	/* skip any spacing, get the value. */
??parse_object_5:
        ADDS     R0,R5,#+1
        BL       skip
        MOVS     R1,R0
        MOVS     R0,R4
        BL       parse_value
        BL       skip
        MOVS     R5,R0
//  778     if (!value) return 0;
        CMP      R5,#+0
        BNE.N    ??parse_object_6
        MOVS     R0,#+0
        B.N      ??parse_object_1
//  779 
//  780     while (*value == ',')
??parse_object_6:
        LDRB     R0,[R5, #+0]
        CMP      R0,#+44
        BNE.N    ??parse_object_7
//  781     {
//  782         cJSON *new_item;
//  783         if (!(new_item = cJSON_New_Item()))	return 0; /* memory fail */
        BL       cJSON_New_Item
        CMP      R0,#+0
        BNE.N    ??parse_object_8
        MOVS     R0,#+0
        B.N      ??parse_object_1
//  784         child->next = new_item;
??parse_object_8:
        STR      R0,[R4, #+0]
//  785         new_item->prev = child;
        STR      R4,[R0, #+4]
//  786         child = new_item;
        MOVS     R4,R0
//  787         value = skip(parse_string(child, skip(value + 1)));
        ADDS     R0,R5,#+1
        BL       skip
        MOVS     R1,R0
        MOVS     R0,R4
        BL       parse_string
        BL       skip
        MOVS     R5,R0
//  788         if (!value) return 0;
        CMP      R5,#+0
        BNE.N    ??parse_object_9
        MOVS     R0,#+0
        B.N      ??parse_object_1
//  789         child->string = child->valuestring;
??parse_object_9:
        LDR      R0,[R4, #+16]
        STR      R0,[R4, #+32]
//  790         child->valuestring = 0;
        MOVS     R0,#+0
        STR      R0,[R4, #+16]
//  791         if (*value != ':')
        LDRB     R0,[R5, #+0]
        CMP      R0,#+58
        BEQ.N    ??parse_object_10
//  792         {
//  793             ep = value;    /* fail! */
        LDR.N    R0,??DataTable16_11
        STR      R5,[R0, #+0]
//  794             return 0;
        MOVS     R0,#+0
        B.N      ??parse_object_1
//  795         }
//  796         value = skip(parse_value(child, skip(value + 1)));	/* skip any spacing, get the value. */
??parse_object_10:
        ADDS     R0,R5,#+1
        BL       skip
        MOVS     R1,R0
        MOVS     R0,R4
        BL       parse_value
        BL       skip
        MOVS     R5,R0
//  797         if (!value) return 0;
        CMP      R5,#+0
        BNE.N    ??parse_object_6
        MOVS     R0,#+0
        B.N      ??parse_object_1
//  798     }
//  799 
//  800     if (*value == '}') return value + 1;	/* end of array */
??parse_object_7:
        LDRB     R0,[R5, #+0]
        CMP      R0,#+125
        BNE.N    ??parse_object_11
        ADDS     R0,R5,#+1
        B.N      ??parse_object_1
//  801     ep = value;
??parse_object_11:
        LDR.N    R0,??DataTable16_11
        STR      R5,[R0, #+0]
//  802     return 0;	/* malformed. */
        MOVS     R0,#+0
??parse_object_1:
        POP      {R4-R6,PC}       ;; return
//  803 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16:
        DC32     0x3cb00000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_1:
        DC32     0xffc00001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_2:
        DC32     0x41dfffff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_3:
        DC32     0xc1e00000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_4:
        DC32     0xe4c2f344

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_5:
        DC32     0x4c63e9e4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_6:
        DC32     `?<Constant "%.0f">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_7:
        DC32     0xa0b5ed8d

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_8:
        DC32     0x3eb0c6f7

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_9:
        DC32     0x41cdcd65

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_10:
        DC32     firstByteMark

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_11:
        DC32     ep
//  804 
//  805 /* Render an object to text. */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  806 static char *print_object(cJSON *item, int depth, int fmt, printbuffer *p)
//  807 {
print_object:
        PUSH     {R0,R4-R11,LR}
        SUB      SP,SP,#+24
        MOVS     R4,R1
        MOVS     R5,R2
        MOV      R11,R3
//  808     char **entries = 0, **names = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
//  809     char *out = 0, *ptr, *ret, *str;
        MOVS     R6,#+0
//  810     int len = 7, i = 0, j;
        MOVS     R7,#+7
        MOVS     R8,#+0
//  811     cJSON *child = item->child;
        LDR      R0,[SP, #+24]
        LDR      R9,[R0, #+8]
//  812     int numentries = 0, fail = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+8]
        MOVS     R10,#+0
//  813     size_t tmplen = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+12]
        B.N      ??print_object_0
//  814     /* Count the number of entries. */
//  815     while (child) numentries++, child = child->next;
??print_object_1:
        LDR      R0,[SP, #+8]
        ADDS     R0,R0,#+1
        STR      R0,[SP, #+8]
        LDR      R9,[R9, #+0]
??print_object_0:
        CMP      R9,#+0
        BNE.N    ??print_object_1
//  816     /* Explicitly handle empty object case */
//  817     if (!numentries)
        LDR      R0,[SP, #+8]
        CMP      R0,#+0
        BNE.N    ??print_object_2
//  818     {
//  819         if (p) out = ensure(p, fmt ? depth + 4 : 3);
        CMP      R11,#+0
        BEQ.N    ??print_object_3
        CMP      R5,#+0
        BEQ.N    ??print_object_4
        ADDS     R1,R4,#+4
        B.N      ??print_object_5
??print_object_4:
        MOVS     R1,#+3
??print_object_5:
        MOV      R0,R11
        BL       ensure
        MOVS     R6,R0
        B.N      ??print_object_6
//  820         else	out = (char *)cJSON_malloc(fmt ? depth + 4 : 3);
??print_object_3:
        CMP      R5,#+0
        BEQ.N    ??print_object_7
        ADDS     R0,R4,#+4
        B.N      ??print_object_8
??print_object_7:
        MOVS     R0,#+3
??print_object_8:
        LDR.W    R1,??DataTable19_1
        LDR      R1,[R1, #+0]
        BLX      R1
        MOVS     R6,R0
//  821         if (!out)	return 0;
??print_object_6:
        CMP      R6,#+0
        BNE.N    ??print_object_9
        MOVS     R0,#+0
        B.N      ??print_object_10
//  822         ptr = out;
??print_object_9:
        MOV      R10,R6
//  823         *ptr++ = '{';
        MOVS     R0,#+123
        STRB     R0,[R10, #+0]
        ADDS     R10,R10,#+1
//  824         if (fmt)
        CMP      R5,#+0
        BEQ.N    ??print_object_11
//  825         {
//  826             *ptr++ = '\n';
        MOVS     R0,#+10
        STRB     R0,[R10, #+0]
        ADDS     R10,R10,#+1
//  827             for (i = 0; i < depth - 1; i++) *ptr++ = '\t';
        MOVS     R8,#+0
        B.N      ??print_object_12
??print_object_13:
        MOVS     R0,#+9
        STRB     R0,[R10, #+0]
        ADDS     R10,R10,#+1
        ADDS     R8,R8,#+1
??print_object_12:
        SUBS     R0,R4,#+1
        CMP      R8,R0
        BLT.N    ??print_object_13
//  828         }
//  829         *ptr++ = '}';
??print_object_11:
        MOVS     R0,#+125
        STRB     R0,[R10, #+0]
        ADDS     R10,R10,#+1
//  830         *ptr++ = 0;
        MOVS     R0,#+0
        STRB     R0,[R10, #+0]
        ADDS     R10,R10,#+1
//  831         return out;
        MOVS     R0,R6
        B.N      ??print_object_10
//  832     }
//  833     if (p)
??print_object_2:
        CMP      R11,#+0
        BEQ.W    ??print_object_14
//  834     {
//  835         /* Compose the output: */
//  836         i = p->offset;
        LDR      R8,[R11, #+8]
//  837         len = fmt ? 2 : 1;
        CMP      R5,#+0
        BEQ.N    ??print_object_15
        MOVS     R7,#+2
        B.N      ??print_object_16
??print_object_15:
        MOVS     R7,#+1
//  838         ptr = ensure(p, len + 1);
??print_object_16:
        ADDS     R1,R7,#+1
        MOV      R0,R11
        BL       ensure
        MOV      R10,R0
//  839         if (!ptr) return 0;
        CMP      R10,#+0
        BNE.N    ??print_object_17
        MOVS     R0,#+0
        B.N      ??print_object_10
//  840         *ptr++ = '{';
??print_object_17:
        MOVS     R0,#+123
        STRB     R0,[R10, #+0]
        ADDS     R10,R10,#+1
//  841         if (fmt) *ptr++ = '\n';
        CMP      R5,#+0
        BEQ.N    ??print_object_18
        MOVS     R0,#+10
        STRB     R0,[R10, #+0]
        ADDS     R10,R10,#+1
//  842         *ptr = 0;
??print_object_18:
        MOVS     R0,#+0
        STRB     R0,[R10, #+0]
//  843         p->offset += len;
        LDR      R0,[R11, #+8]
        ADDS     R0,R7,R0
        STR      R0,[R11, #+8]
//  844         child = item->child;
        LDR      R0,[SP, #+24]
        LDR      R9,[R0, #+8]
//  845         depth++;
        ADDS     R4,R4,#+1
        B.N      ??print_object_19
//  846         while (child)
//  847         {
//  848             if (fmt)
//  849             {
//  850                 ptr = ensure(p, depth);
//  851                 if (!ptr) return 0;
//  852                 for (j = 0; j < depth; j++) *ptr++ = '\t';
//  853                 p->offset += depth;
//  854             }
//  855             print_string_ptr(child->string, p);
//  856             p->offset = update(p);
//  857 
//  858             len = fmt ? 2 : 1;
//  859             ptr = ensure(p, len);
//  860             if (!ptr) return 0;
//  861             *ptr++ = ':';
//  862             if (fmt) *ptr++ = '\t';
//  863             p->offset += len;
//  864 
//  865             print_value(child, depth, fmt, p);
//  866             p->offset = update(p);
//  867 
//  868             len = (fmt ? 1 : 0) + (child->next ? 1 : 0);
//  869             ptr = ensure(p, len + 1);
//  870             if (!ptr) return 0;
//  871             if (child->next) *ptr++ = ',';
??print_object_20:
        LDR      R0,[R9, #+0]
        CMP      R0,#+0
        BEQ.N    ??print_object_21
        MOVS     R0,#+44
        STRB     R0,[R10, #+0]
        ADDS     R10,R10,#+1
//  872             if (fmt) *ptr++ = '\n';
??print_object_21:
        CMP      R5,#+0
        BEQ.N    ??print_object_22
        MOVS     R0,#+10
        STRB     R0,[R10, #+0]
        ADDS     R10,R10,#+1
//  873             *ptr = 0;
??print_object_22:
        MOVS     R0,#+0
        STRB     R0,[R10, #+0]
//  874             p->offset += len;
        LDR      R0,[R11, #+8]
        ADDS     R0,R7,R0
        STR      R0,[R11, #+8]
//  875             child = child->next;
        LDR      R9,[R9, #+0]
??print_object_19:
        CMP      R9,#+0
        BEQ.N    ??print_object_23
        CMP      R5,#+0
        BEQ.N    ??print_object_24
        MOVS     R1,R4
        MOV      R0,R11
        BL       ensure
        MOV      R10,R0
        CMP      R10,#+0
        BNE.N    ??print_object_25
        MOVS     R0,#+0
        B.N      ??print_object_10
??print_object_25:
        MOVS     R0,#+0
        B.N      ??print_object_26
??print_object_27:
        MOVS     R1,#+9
        STRB     R1,[R10, #+0]
        ADDS     R10,R10,#+1
        ADDS     R0,R0,#+1
??print_object_26:
        CMP      R0,R4
        BLT.N    ??print_object_27
        LDR      R0,[R11, #+8]
        ADDS     R0,R4,R0
        STR      R0,[R11, #+8]
??print_object_24:
        MOV      R1,R11
        LDR      R0,[R9, #+32]
        BL       print_string_ptr
        MOV      R0,R11
        BL       update
        STR      R0,[R11, #+8]
        CMP      R5,#+0
        BEQ.N    ??print_object_28
        MOVS     R7,#+2
        B.N      ??print_object_29
??print_object_28:
        MOVS     R7,#+1
??print_object_29:
        MOVS     R1,R7
        MOV      R0,R11
        BL       ensure
        MOV      R10,R0
        CMP      R10,#+0
        BNE.N    ??print_object_30
        MOVS     R0,#+0
        B.N      ??print_object_10
??print_object_30:
        MOVS     R0,#+58
        STRB     R0,[R10, #+0]
        ADDS     R10,R10,#+1
        CMP      R5,#+0
        BEQ.N    ??print_object_31
        MOVS     R0,#+9
        STRB     R0,[R10, #+0]
        ADDS     R10,R10,#+1
??print_object_31:
        LDR      R0,[R11, #+8]
        ADDS     R0,R7,R0
        STR      R0,[R11, #+8]
        MOV      R3,R11
        MOVS     R2,R5
        MOVS     R1,R4
        MOV      R0,R9
        BL       print_value
        MOV      R0,R11
        BL       update
        STR      R0,[R11, #+8]
        CMP      R5,#+0
        BEQ.N    ??print_object_32
        MOVS     R0,#+1
        B.N      ??print_object_33
??print_object_32:
        MOVS     R0,#+0
??print_object_33:
        LDR      R1,[R9, #+0]
        CMP      R1,#+0
        BEQ.N    ??print_object_34
        MOVS     R1,#+1
        B.N      ??print_object_35
??print_object_34:
        MOVS     R1,#+0
??print_object_35:
        ADDS     R7,R1,R0
        ADDS     R1,R7,#+1
        MOV      R0,R11
        BL       ensure
        MOV      R10,R0
        CMP      R10,#+0
        BNE.W    ??print_object_20
        MOVS     R0,#+0
        B.N      ??print_object_10
//  876         }
//  877         ptr = ensure(p, fmt ? (depth + 1) : 2);
??print_object_23:
        CMP      R5,#+0
        BEQ.N    ??print_object_36
        ADDS     R1,R4,#+1
        B.N      ??print_object_37
??print_object_36:
        MOVS     R1,#+2
??print_object_37:
        MOV      R0,R11
        BL       ensure
        MOV      R10,R0
//  878         if (!ptr) return 0;
        CMP      R10,#+0
        BNE.N    ??print_object_38
        MOVS     R0,#+0
        B.N      ??print_object_10
//  879         if (fmt)	for (i = 0; i < depth - 1; i++) *ptr++ = '\t';
??print_object_38:
        CMP      R5,#+0
        BEQ.N    ??print_object_39
        MOVS     R8,#+0
        B.N      ??print_object_40
??print_object_41:
        MOVS     R0,#+9
        STRB     R0,[R10, #+0]
        ADDS     R10,R10,#+1
        ADDS     R8,R8,#+1
??print_object_40:
        SUBS     R0,R4,#+1
        CMP      R8,R0
        BLT.N    ??print_object_41
//  880         *ptr++ = '}';
??print_object_39:
        MOVS     R0,#+125
        STRB     R0,[R10, #+0]
        ADDS     R10,R10,#+1
//  881         *ptr = 0;
        MOVS     R0,#+0
        STRB     R0,[R10, #+0]
//  882         out = (p->buffer) + i;
        LDR      R0,[R11, #+0]
        ADDS     R6,R8,R0
        B.N      ??print_object_42
//  883     }
//  884     else
//  885     {
//  886         /* Allocate space for the names and the objects */
//  887         entries = (char **)cJSON_malloc(numentries * sizeof(char *));
??print_object_14:
        LDR      R0,[SP, #+8]
        LSLS     R0,R0,#+2
        LDR.N    R1,??DataTable19_1
        LDR      R1,[R1, #+0]
        BLX      R1
        STR      R0,[SP, #+0]
//  888         if (!entries) return 0;
        LDR      R0,[SP, #+0]
        CMP      R0,#+0
        BNE.N    ??print_object_43
        MOVS     R0,#+0
        B.N      ??print_object_10
//  889         names = (char **)cJSON_malloc(numentries * sizeof(char *));
??print_object_43:
        LDR      R0,[SP, #+8]
        LSLS     R0,R0,#+2
        LDR.N    R1,??DataTable19_1
        LDR      R1,[R1, #+0]
        BLX      R1
        STR      R0,[SP, #+4]
//  890         if (!names)
        LDR      R0,[SP, #+4]
        CMP      R0,#+0
        BNE.N    ??print_object_44
//  891         {
//  892             cJSON_free(entries);
        LDR      R0,[SP, #+0]
        LDR.N    R1,??DataTable19_5
        LDR      R1,[R1, #+0]
        BLX      R1
//  893             return 0;
        MOVS     R0,#+0
        B.N      ??print_object_10
//  894         }
//  895         memset(entries, 0, sizeof(char *)*numentries);
??print_object_44:
        LDR      R0,[SP, #+8]
        LSLS     R2,R0,#+2
        MOVS     R1,#+0
        LDR      R0,[SP, #+0]
        BL       memset
//  896         memset(names, 0, sizeof(char *)*numentries);
        LDR      R0,[SP, #+8]
        LSLS     R2,R0,#+2
        MOVS     R1,#+0
        LDR      R0,[SP, #+4]
        BL       memset
//  897 
//  898         /* Collect all the results into our arrays: */
//  899         child = item->child;
        LDR      R0,[SP, #+24]
        LDR      R9,[R0, #+8]
//  900         depth++;
        ADDS     R4,R4,#+1
//  901         if (fmt) len += depth;
        CMP      R5,#+0
        BEQ.N    ??print_object_45
        ADDS     R7,R4,R7
        B.N      ??print_object_45
//  902         while (child)
//  903         {
//  904             names[i] = str = print_string_ptr(child->string, 0);
//  905             entries[i++] = ret = print_value(child, depth, fmt, 0);
//  906             if (str && ret) len += strlen(ret) + strlen(str) + 2 + (fmt ? 2 + depth : 0);
//  907             else fail = 1;
??print_object_46:
        MOVS     R10,#+1
//  908             child = child->next;
??print_object_47:
        LDR      R9,[R9, #+0]
??print_object_45:
        CMP      R9,#+0
        BEQ.N    ??print_object_48
        MOVS     R1,#+0
        LDR      R0,[R9, #+32]
        BL       print_string_ptr
        STR      R0,[SP, #+16]
        LDR      R1,[SP, #+4]
        STR      R0,[R1, R8, LSL #+2]
        MOVS     R3,#+0
        MOVS     R2,R5
        MOVS     R1,R4
        MOV      R0,R9
        BL       print_value
        LDR      R1,[SP, #+0]
        STR      R0,[R1, R8, LSL #+2]
        ADDS     R8,R8,#+1
        LDR      R1,[SP, #+16]
        CMP      R1,#+0
        BEQ.N    ??print_object_46
        CMP      R0,#+0
        BEQ.N    ??print_object_46
        BL       strlen
        MOV      R11,R0
        LDR      R0,[SP, #+16]
        BL       strlen
        CMP      R5,#+0
        BEQ.N    ??print_object_49
        ADDS     R1,R4,#+2
        B.N      ??print_object_50
??print_object_49:
        MOVS     R1,#+0
??print_object_50:
        ADDS     R0,R0,R11
        ADDS     R0,R1,R0
        ADDS     R0,R0,#+2
        ADDS     R7,R0,R7
        B.N      ??print_object_47
//  909         }
//  910 
//  911         /* Try to allocate the output string */
//  912         if (!fail)	out = (char *)cJSON_malloc(len);
??print_object_48:
        CMP      R10,#+0
        BNE.N    ??print_object_51
        MOVS     R0,R7
        LDR.N    R1,??DataTable19_1
        LDR      R1,[R1, #+0]
        BLX      R1
        MOVS     R6,R0
//  913         if (!out) fail = 1;
??print_object_51:
        CMP      R6,#+0
        BNE.N    ??print_object_52
        MOVS     R10,#+1
//  914 
//  915         /* Handle failure */
//  916         if (fail)
??print_object_52:
        CMP      R10,#+0
        BEQ.N    ??print_object_53
//  917         {
//  918             for (i = 0; i < numentries; i++)
        MOVS     R8,#+0
        B.N      ??print_object_54
//  919             {
//  920                 if (names[i]) cJSON_free(names[i]);
??print_object_55:
        LDR      R0,[SP, #+4]
        LDR      R0,[R0, R8, LSL #+2]
        CMP      R0,#+0
        BEQ.N    ??print_object_56
        LDR      R0,[SP, #+4]
        LDR      R0,[R0, R8, LSL #+2]
        LDR.N    R1,??DataTable19_5
        LDR      R1,[R1, #+0]
        BLX      R1
//  921                 if (entries[i]) cJSON_free(entries[i]);
??print_object_56:
        LDR      R0,[SP, #+0]
        LDR      R0,[R0, R8, LSL #+2]
        CMP      R0,#+0
        BEQ.N    ??print_object_57
        LDR      R0,[SP, #+0]
        LDR      R0,[R0, R8, LSL #+2]
        LDR.N    R1,??DataTable19_5
        LDR      R1,[R1, #+0]
        BLX      R1
//  922             }
??print_object_57:
        ADDS     R8,R8,#+1
??print_object_54:
        LDR      R0,[SP, #+8]
        CMP      R8,R0
        BLT.N    ??print_object_55
//  923             cJSON_free(names);
        LDR      R0,[SP, #+4]
        LDR.N    R1,??DataTable19_5
        LDR      R1,[R1, #+0]
        BLX      R1
//  924             cJSON_free(entries);
        LDR      R0,[SP, #+0]
        LDR.N    R1,??DataTable19_5
        LDR      R1,[R1, #+0]
        BLX      R1
//  925             return 0;
        MOVS     R0,#+0
        B.N      ??print_object_10
//  926         }
//  927 
//  928         /* Compose the output: */
//  929         *out = '{';
??print_object_53:
        MOVS     R0,#+123
        STRB     R0,[R6, #+0]
//  930         ptr = out + 1;
        ADDS     R10,R6,#+1
//  931         if (fmt)*ptr++ = '\n';
        CMP      R5,#+0
        BEQ.N    ??print_object_58
        MOVS     R0,#+10
        STRB     R0,[R10, #+0]
        ADDS     R10,R10,#+1
//  932         *ptr = 0;
??print_object_58:
        MOVS     R0,#+0
        STRB     R0,[R10, #+0]
//  933         for (i = 0; i < numentries; i++)
        MOVS     R8,#+0
        B.N      ??print_object_59
//  934         {
//  935             if (fmt) for (j = 0; j < depth; j++) *ptr++ = '\t';
??print_object_60:
        MOVS     R1,#+9
        STRB     R1,[R10, #+0]
        ADDS     R10,R10,#+1
        ADDS     R0,R0,#+1
??print_object_61:
        CMP      R0,R4
        BLT.N    ??print_object_60
//  936             tmplen = strlen(names[i]);
??print_object_62:
        LDR      R0,[SP, #+4]
        LDR      R0,[R0, R8, LSL #+2]
        BL       strlen
        STR      R0,[SP, #+12]
//  937             memcpy(ptr, names[i], tmplen);
        LDR      R2,[SP, #+12]
        LDR      R0,[SP, #+4]
        LDR      R1,[R0, R8, LSL #+2]
        MOV      R0,R10
        BL       memcpy
//  938             ptr += tmplen;
        LDR      R0,[SP, #+12]
        ADDS     R10,R0,R10
//  939             *ptr++ = ':';
        MOVS     R0,#+58
        STRB     R0,[R10, #+0]
        ADDS     R10,R10,#+1
//  940             if (fmt) *ptr++ = '\t';
        CMP      R5,#+0
        BEQ.N    ??print_object_63
        MOVS     R0,#+9
        STRB     R0,[R10, #+0]
        ADDS     R10,R10,#+1
//  941             strcpy(ptr, entries[i]);
??print_object_63:
        LDR      R0,[SP, #+0]
        LDR      R1,[R0, R8, LSL #+2]
        MOV      R0,R10
        BL       strcpy
//  942             ptr += strlen(entries[i]);
        LDR      R0,[SP, #+0]
        LDR      R0,[R0, R8, LSL #+2]
        BL       strlen
        ADDS     R10,R0,R10
//  943             if (i != numentries - 1) *ptr++ = ',';
        LDR      R0,[SP, #+8]
        SUBS     R0,R0,#+1
        CMP      R8,R0
        BEQ.N    ??print_object_64
        MOVS     R0,#+44
        STRB     R0,[R10, #+0]
        ADDS     R10,R10,#+1
//  944             if (fmt) *ptr++ = '\n';
??print_object_64:
        CMP      R5,#+0
        BEQ.N    ??print_object_65
        MOVS     R0,#+10
        STRB     R0,[R10, #+0]
        ADDS     R10,R10,#+1
//  945             *ptr = 0;
??print_object_65:
        MOVS     R0,#+0
        STRB     R0,[R10, #+0]
//  946             cJSON_free(names[i]);
        LDR      R0,[SP, #+4]
        LDR      R0,[R0, R8, LSL #+2]
        LDR.N    R1,??DataTable19_5
        LDR      R1,[R1, #+0]
        BLX      R1
//  947             cJSON_free(entries[i]);
        LDR      R0,[SP, #+0]
        LDR      R0,[R0, R8, LSL #+2]
        LDR.N    R1,??DataTable19_5
        LDR      R1,[R1, #+0]
        BLX      R1
        ADDS     R8,R8,#+1
??print_object_59:
        LDR      R0,[SP, #+8]
        CMP      R8,R0
        BGE.N    ??print_object_66
        CMP      R5,#+0
        BEQ.N    ??print_object_62
        MOVS     R0,#+0
        B.N      ??print_object_61
//  948         }
//  949 
//  950         cJSON_free(names);
??print_object_66:
        LDR      R0,[SP, #+4]
        LDR.N    R1,??DataTable19_5
        LDR      R1,[R1, #+0]
        BLX      R1
//  951         cJSON_free(entries);
        LDR      R0,[SP, #+0]
        LDR.N    R1,??DataTable19_5
        LDR      R1,[R1, #+0]
        BLX      R1
//  952         if (fmt) for (i = 0; i < depth - 1; i++) *ptr++ = '\t';
        CMP      R5,#+0
        BEQ.N    ??print_object_67
        MOVS     R8,#+0
        B.N      ??print_object_68
??print_object_69:
        MOVS     R0,#+9
        STRB     R0,[R10, #+0]
        ADDS     R10,R10,#+1
        ADDS     R8,R8,#+1
??print_object_68:
        SUBS     R0,R4,#+1
        CMP      R8,R0
        BLT.N    ??print_object_69
//  953         *ptr++ = '}';
??print_object_67:
        MOVS     R0,#+125
        STRB     R0,[R10, #+0]
        ADDS     R10,R10,#+1
//  954         *ptr++ = 0;
        MOVS     R0,#+0
        STRB     R0,[R10, #+0]
        ADDS     R10,R10,#+1
//  955     }
//  956     return out;
??print_object_42:
        MOVS     R0,R6
??print_object_10:
        ADD      SP,SP,#+28
        POP      {R4-R11,PC}      ;; return
//  957 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17:
        DC32     `?<Constant "\\"\\\\\\b\\f\\n\\r\\t">`
//  958 
//  959 /* Get Array size/item / object item. */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  960 int    cJSON_GetArraySize(cJSON *array)
//  961 {
//  962     cJSON *c = array->child;
cJSON_GetArraySize:
        LDR      R1,[R0, #+8]
//  963     int i = 0;
        MOVS     R0,#+0
        B.N      ??cJSON_GetArraySize_0
//  964     while(c)i++, c = c->next;
??cJSON_GetArraySize_1:
        ADDS     R0,R0,#+1
        LDR      R1,[R1, #+0]
??cJSON_GetArraySize_0:
        CMP      R1,#+0
        BNE.N    ??cJSON_GetArraySize_1
//  965     return i;
        BX       LR               ;; return
//  966 }

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  967 cJSON *cJSON_GetArrayItem(cJSON *array, int item)
//  968 {
//  969     cJSON *c = array->child;
cJSON_GetArrayItem:
        LDR      R0,[R0, #+8]
        B.N      ??cJSON_GetArrayItem_0
//  970     while (c && item > 0) item--, c = c->next;
??cJSON_GetArrayItem_1:
        SUBS     R1,R1,#+1
        LDR      R0,[R0, #+0]
??cJSON_GetArrayItem_0:
        CMP      R0,#+0
        BEQ.N    ??cJSON_GetArrayItem_2
        CMP      R1,#+1
        BGE.N    ??cJSON_GetArrayItem_1
//  971     return c;
??cJSON_GetArrayItem_2:
        BX       LR               ;; return
//  972 }

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  973 cJSON *cJSON_GetObjectItem(cJSON *object, const char *string)
//  974 {
cJSON_GetObjectItem:
        PUSH     {R3-R5,LR}
        MOVS     R4,R1
//  975     cJSON *c = object->child;
        LDR      R5,[R0, #+8]
        B.N      ??cJSON_GetObjectItem_0
//  976     while (c && cJSON_strcasecmp(c->string, string)) c = c->next;
??cJSON_GetObjectItem_1:
        LDR      R5,[R5, #+0]
??cJSON_GetObjectItem_0:
        CMP      R5,#+0
        BEQ.N    ??cJSON_GetObjectItem_2
        MOVS     R1,R4
        LDR      R0,[R5, #+32]
        BL       cJSON_strcasecmp
        CMP      R0,#+0
        BNE.N    ??cJSON_GetObjectItem_1
//  977     return c;
??cJSON_GetObjectItem_2:
        MOVS     R0,R5
        POP      {R1,R4,R5,PC}    ;; return
//  978 }
//  979 
//  980 /* Utility for array list handling. */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  981 static void suffix_object(cJSON *prev, cJSON *item)
//  982 {
//  983     prev->next = item;
suffix_object:
        STR      R1,[R0, #+0]
//  984     item->prev = prev;
        STR      R0,[R1, #+4]
//  985 }
        BX       LR               ;; return
//  986 /* Utility for handling references. */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  987 static cJSON *create_reference(cJSON *item)
//  988 {
create_reference:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
//  989     cJSON *ref = cJSON_New_Item();
        BL       cJSON_New_Item
        MOVS     R5,R0
//  990     if (!ref) return 0;
        CMP      R5,#+0
        BNE.N    ??create_reference_0
        MOVS     R0,#+0
        B.N      ??create_reference_1
//  991     memcpy(ref, item, sizeof(cJSON));
??create_reference_0:
        MOVS     R2,#+40
        MOVS     R1,R4
        MOVS     R0,R5
        BL       memcpy
//  992     ref->string = 0;
        MOVS     R0,#+0
        STR      R0,[R5, #+32]
//  993     ref->type |= cJSON_IsReference;
        LDR      R0,[R5, #+12]
        ORRS     R0,R0,#0x100
        STR      R0,[R5, #+12]
//  994     ref->next = ref->prev = 0;
        MOVS     R0,#+0
        STR      R0,[R5, #+4]
        STR      R0,[R5, #+0]
//  995     return ref;
        MOVS     R0,R5
??create_reference_1:
        POP      {R1,R4,R5,PC}    ;; return
//  996 }
//  997 
//  998 /* Add item to array/object. */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  999 void   cJSON_AddItemToArray(cJSON *array, cJSON *item)
// 1000 {
cJSON_AddItemToArray:
        PUSH     {R7,LR}
// 1001     cJSON *c = array->child;
        LDR      R2,[R0, #+8]
// 1002     if (!item) return;
        CMP      R1,#+0
        BEQ.N    ??cJSON_AddItemToArray_0
// 1003     if (!c)
??cJSON_AddItemToArray_1:
        CMP      R2,#+0
        BNE.N    ??cJSON_AddItemToArray_2
// 1004     {
// 1005         array->child = item;
        STR      R1,[R0, #+8]
        B.N      ??cJSON_AddItemToArray_3
// 1006     }
// 1007     else
// 1008     {
// 1009         while (c && c->next) c = c->next;
??cJSON_AddItemToArray_4:
        LDR      R2,[R2, #+0]
??cJSON_AddItemToArray_2:
        CMP      R2,#+0
        BEQ.N    ??cJSON_AddItemToArray_5
        LDR      R0,[R2, #+0]
        CMP      R0,#+0
        BNE.N    ??cJSON_AddItemToArray_4
// 1010         suffix_object(c, item);
??cJSON_AddItemToArray_5:
        MOVS     R0,R2
        BL       suffix_object
// 1011     }
// 1012 }
??cJSON_AddItemToArray_3:
??cJSON_AddItemToArray_0:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1013 void   cJSON_AddItemToObject(cJSON *object, const char *string, cJSON *item)
// 1014 {
cJSON_AddItemToObject:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
// 1015     if (!item) return;
        CMP      R6,#+0
        BEQ.N    ??cJSON_AddItemToObject_0
// 1016     if (item->string) cJSON_free(item->string);
??cJSON_AddItemToObject_1:
        LDR      R0,[R6, #+32]
        CMP      R0,#+0
        BEQ.N    ??cJSON_AddItemToObject_2
        LDR      R0,[R6, #+32]
        LDR.N    R1,??DataTable19_5
        LDR      R1,[R1, #+0]
        BLX      R1
// 1017     item->string = cJSON_strdup(string);
??cJSON_AddItemToObject_2:
        MOVS     R0,R5
        BL       cJSON_strdup
        STR      R0,[R6, #+32]
// 1018     cJSON_AddItemToArray(object, item);
        MOVS     R1,R6
        MOVS     R0,R4
        BL       cJSON_AddItemToArray
// 1019 }
??cJSON_AddItemToObject_0:
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1020 void   cJSON_AddItemToObjectCS(cJSON *object, const char *string, cJSON *item)
// 1021 {
cJSON_AddItemToObjectCS:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R6,R1
        MOVS     R5,R2
// 1022     if (!item) return;
        CMP      R5,#+0
        BEQ.N    ??cJSON_AddItemToObjectCS_0
// 1023     if (!(item->type & cJSON_StringIsConst) && item->string) cJSON_free(item->string);
??cJSON_AddItemToObjectCS_1:
        LDR      R0,[R5, #+12]
        LSLS     R0,R0,#+22
        BMI.N    ??cJSON_AddItemToObjectCS_2
        LDR      R0,[R5, #+32]
        CMP      R0,#+0
        BEQ.N    ??cJSON_AddItemToObjectCS_2
        LDR      R0,[R5, #+32]
        LDR.N    R1,??DataTable19_5
        LDR      R1,[R1, #+0]
        BLX      R1
// 1024     item->string = (char *)string;
??cJSON_AddItemToObjectCS_2:
        STR      R6,[R5, #+32]
// 1025     item->type |= cJSON_StringIsConst;
        LDR      R0,[R5, #+12]
        ORRS     R0,R0,#0x200
        STR      R0,[R5, #+12]
// 1026     cJSON_AddItemToArray(object, item);
        MOVS     R1,R5
        MOVS     R0,R4
        BL       cJSON_AddItemToArray
// 1027 }
??cJSON_AddItemToObjectCS_0:
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable19:
        DC32     `?<Constant "u%04x">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable19_1:
        DC32     cJSON_malloc

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable19_2:
        DC32     `?<Constant "null">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable19_3:
        DC32     `?<Constant "false">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable19_4:
        DC32     `?<Constant "true">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable19_5:
        DC32     cJSON_free

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1028 void	cJSON_AddItemReferenceToArray(cJSON *array, cJSON *item)
// 1029 {
cJSON_AddItemReferenceToArray:
        PUSH     {R4,LR}
        MOVS     R4,R0
        MOVS     R0,R1
// 1030     cJSON_AddItemToArray(array, create_reference(item));
        BL       create_reference
        MOVS     R1,R0
        MOVS     R0,R4
        BL       cJSON_AddItemToArray
// 1031 }
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1032 void	cJSON_AddItemReferenceToObject(cJSON *object, const char *string, cJSON *item)
// 1033 {
cJSON_AddItemReferenceToObject:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R0,R2
// 1034     cJSON_AddItemToObject(object, string, create_reference(item));
        BL       create_reference
        MOVS     R2,R0
        MOVS     R1,R5
        MOVS     R0,R4
        BL       cJSON_AddItemToObject
// 1035 }
        POP      {R0,R4,R5,PC}    ;; return
// 1036 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1037 cJSON *cJSON_DetachItemFromArray(cJSON *array, int which)
// 1038 {
// 1039     cJSON *c = array->child;
cJSON_DetachItemFromArray:
        LDR      R2,[R0, #+8]
        B.N      ??cJSON_DetachItemFromArray_0
// 1040     while (c && which > 0) c = c->next, which--;
??cJSON_DetachItemFromArray_1:
        LDR      R2,[R2, #+0]
        SUBS     R1,R1,#+1
??cJSON_DetachItemFromArray_0:
        CMP      R2,#+0
        BEQ.N    ??cJSON_DetachItemFromArray_2
        CMP      R1,#+1
        BGE.N    ??cJSON_DetachItemFromArray_1
// 1041     if (!c) return 0;
??cJSON_DetachItemFromArray_2:
        CMP      R2,#+0
        BNE.N    ??cJSON_DetachItemFromArray_3
        MOVS     R0,#+0
        B.N      ??cJSON_DetachItemFromArray_4
// 1042     if (c->prev) c->prev->next = c->next;
??cJSON_DetachItemFromArray_3:
        LDR      R1,[R2, #+4]
        CMP      R1,#+0
        BEQ.N    ??cJSON_DetachItemFromArray_5
        LDR      R1,[R2, #+0]
        LDR      R3,[R2, #+4]
        STR      R1,[R3, #+0]
// 1043     if (c->next) c->next->prev = c->prev;
??cJSON_DetachItemFromArray_5:
        LDR      R1,[R2, #+0]
        CMP      R1,#+0
        BEQ.N    ??cJSON_DetachItemFromArray_6
        LDR      R1,[R2, #+4]
        LDR      R3,[R2, #+0]
        STR      R1,[R3, #+4]
// 1044     if (c == array->child) array->child = c->next;
??cJSON_DetachItemFromArray_6:
        LDR      R1,[R0, #+8]
        CMP      R2,R1
        BNE.N    ??cJSON_DetachItemFromArray_7
        LDR      R1,[R2, #+0]
        STR      R1,[R0, #+8]
// 1045     c->prev = c->next = 0;
??cJSON_DetachItemFromArray_7:
        MOVS     R0,#+0
        STR      R0,[R2, #+0]
        STR      R0,[R2, #+4]
// 1046     return c;
        MOVS     R0,R2
??cJSON_DetachItemFromArray_4:
        BX       LR               ;; return
// 1047 }

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1048 void   cJSON_DeleteItemFromArray(cJSON *array, int which)
// 1049 {
cJSON_DeleteItemFromArray:
        PUSH     {R7,LR}
// 1050     cJSON_Delete(cJSON_DetachItemFromArray(array, which));
        BL       cJSON_DetachItemFromArray
        BL       cJSON_Delete
// 1051 }
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1052 cJSON *cJSON_DetachItemFromObject(cJSON *object, const char *string)
// 1053 {
cJSON_DetachItemFromObject:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R5,R1
// 1054     int i = 0;
        MOVS     R6,#+0
// 1055     cJSON *c = object->child;
        LDR      R7,[R4, #+8]
        B.N      ??cJSON_DetachItemFromObject_0
// 1056     while (c && cJSON_strcasecmp(c->string, string)) i++, c = c->next;
??cJSON_DetachItemFromObject_1:
        ADDS     R6,R6,#+1
        LDR      R7,[R7, #+0]
??cJSON_DetachItemFromObject_0:
        CMP      R7,#+0
        BEQ.N    ??cJSON_DetachItemFromObject_2
        MOVS     R1,R5
        LDR      R0,[R7, #+32]
        BL       cJSON_strcasecmp
        CMP      R0,#+0
        BNE.N    ??cJSON_DetachItemFromObject_1
// 1057     if (c) return cJSON_DetachItemFromArray(object, i);
??cJSON_DetachItemFromObject_2:
        CMP      R7,#+0
        BEQ.N    ??cJSON_DetachItemFromObject_3
        MOVS     R1,R6
        MOVS     R0,R4
        BL       cJSON_DetachItemFromArray
        B.N      ??cJSON_DetachItemFromObject_4
// 1058     return 0;
??cJSON_DetachItemFromObject_3:
        MOVS     R0,#+0
??cJSON_DetachItemFromObject_4:
        POP      {R1,R4-R7,PC}    ;; return
// 1059 }

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1060 void   cJSON_DeleteItemFromObject(cJSON *object, const char *string)
// 1061 {
cJSON_DeleteItemFromObject:
        PUSH     {R7,LR}
// 1062     cJSON_Delete(cJSON_DetachItemFromObject(object, string));
        BL       cJSON_DetachItemFromObject
        BL       cJSON_Delete
// 1063 }
        POP      {R0,PC}          ;; return
// 1064 
// 1065 /* Replace array/object items with new ones. */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1066 void   cJSON_InsertItemInArray(cJSON *array, int which, cJSON *newitem)
// 1067 {
cJSON_InsertItemInArray:
        PUSH     {R7,LR}
// 1068     cJSON *c = array->child;
        LDR      R3,[R0, #+8]
        B.N      ??cJSON_InsertItemInArray_0
// 1069     while (c && which > 0) c = c->next, which--;
??cJSON_InsertItemInArray_1:
        LDR      R3,[R3, #+0]
        SUBS     R1,R1,#+1
??cJSON_InsertItemInArray_0:
        CMP      R3,#+0
        BEQ.N    ??cJSON_InsertItemInArray_2
        CMP      R1,#+1
        BGE.N    ??cJSON_InsertItemInArray_1
// 1070     if (!c)
??cJSON_InsertItemInArray_2:
        CMP      R3,#+0
        BNE.N    ??cJSON_InsertItemInArray_3
// 1071     {
// 1072         cJSON_AddItemToArray(array, newitem);
        MOVS     R1,R2
        BL       cJSON_AddItemToArray
// 1073         return;
        B.N      ??cJSON_InsertItemInArray_4
// 1074     }
// 1075     newitem->next = c;
??cJSON_InsertItemInArray_3:
        STR      R3,[R2, #+0]
// 1076     newitem->prev = c->prev;
        LDR      R1,[R3, #+4]
        STR      R1,[R2, #+4]
// 1077     c->prev = newitem;
        STR      R2,[R3, #+4]
// 1078     if (c == array->child) array->child = newitem;
        LDR      R1,[R0, #+8]
        CMP      R3,R1
        BNE.N    ??cJSON_InsertItemInArray_5
        STR      R2,[R0, #+8]
        B.N      ??cJSON_InsertItemInArray_6
// 1079     else newitem->prev->next = newitem;
??cJSON_InsertItemInArray_5:
        LDR      R0,[R2, #+4]
        STR      R2,[R0, #+0]
// 1080 }
??cJSON_InsertItemInArray_6:
??cJSON_InsertItemInArray_4:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1081 void   cJSON_ReplaceItemInArray(cJSON *array, int which, cJSON *newitem)
// 1082 {
cJSON_ReplaceItemInArray:
        PUSH     {R7,LR}
// 1083     cJSON *c = array->child;
        LDR      R3,[R0, #+8]
        B.N      ??cJSON_ReplaceItemInArray_0
// 1084     while (c && which > 0) c = c->next, which--;
??cJSON_ReplaceItemInArray_1:
        LDR      R3,[R3, #+0]
        SUBS     R1,R1,#+1
??cJSON_ReplaceItemInArray_0:
        CMP      R3,#+0
        BEQ.N    ??cJSON_ReplaceItemInArray_2
        CMP      R1,#+1
        BGE.N    ??cJSON_ReplaceItemInArray_1
// 1085     if (!c) return;
??cJSON_ReplaceItemInArray_2:
        CMP      R3,#+0
        BEQ.N    ??cJSON_ReplaceItemInArray_3
// 1086     newitem->next = c->next;
??cJSON_ReplaceItemInArray_4:
        LDR      R1,[R3, #+0]
        STR      R1,[R2, #+0]
// 1087     newitem->prev = c->prev;
        LDR      R1,[R3, #+4]
        STR      R1,[R2, #+4]
// 1088     if (newitem->next) newitem->next->prev = newitem;
        LDR      R1,[R2, #+0]
        CMP      R1,#+0
        BEQ.N    ??cJSON_ReplaceItemInArray_5
        LDR      R1,[R2, #+0]
        STR      R2,[R1, #+4]
// 1089     if (c == array->child) array->child = newitem;
??cJSON_ReplaceItemInArray_5:
        LDR      R1,[R0, #+8]
        CMP      R3,R1
        BNE.N    ??cJSON_ReplaceItemInArray_6
        STR      R2,[R0, #+8]
        B.N      ??cJSON_ReplaceItemInArray_7
// 1090     else newitem->prev->next = newitem;
??cJSON_ReplaceItemInArray_6:
        LDR      R0,[R2, #+4]
        STR      R2,[R0, #+0]
// 1091     c->next = c->prev = 0;
??cJSON_ReplaceItemInArray_7:
        MOVS     R0,#+0
        STR      R0,[R3, #+4]
        STR      R0,[R3, #+0]
// 1092     cJSON_Delete(c);
        MOVS     R0,R3
        BL       cJSON_Delete
// 1093 }
??cJSON_ReplaceItemInArray_3:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1094 void   cJSON_ReplaceItemInObject(cJSON *object, const char *string, cJSON *newitem)
// 1095 {
cJSON_ReplaceItemInObject:
        PUSH     {R4-R8,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
// 1096     int i = 0;
        MOVS     R7,#+0
// 1097     cJSON *c = object->child;
        LDR      R8,[R4, #+8]
        B.N      ??cJSON_ReplaceItemInObject_0
// 1098     while(c && cJSON_strcasecmp(c->string, string))i++, c = c->next;
??cJSON_ReplaceItemInObject_1:
        ADDS     R7,R7,#+1
        LDR      R8,[R8, #+0]
??cJSON_ReplaceItemInObject_0:
        CMP      R8,#+0
        BEQ.N    ??cJSON_ReplaceItemInObject_2
        MOVS     R1,R5
        LDR      R0,[R8, #+32]
        BL       cJSON_strcasecmp
        CMP      R0,#+0
        BNE.N    ??cJSON_ReplaceItemInObject_1
// 1099     if(c)
??cJSON_ReplaceItemInObject_2:
        CMP      R8,#+0
        BEQ.N    ??cJSON_ReplaceItemInObject_3
// 1100     {
// 1101         newitem->string = cJSON_strdup(string);
        MOVS     R0,R5
        BL       cJSON_strdup
        STR      R0,[R6, #+32]
// 1102         cJSON_ReplaceItemInArray(object, i, newitem);
        MOVS     R2,R6
        MOVS     R1,R7
        MOVS     R0,R4
        BL       cJSON_ReplaceItemInArray
// 1103     }
// 1104 }
??cJSON_ReplaceItemInObject_3:
        POP      {R4-R8,PC}       ;; return
// 1105 
// 1106 /* Create basic types: */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1107 cJSON *cJSON_CreateNull(void)
// 1108 {
cJSON_CreateNull:
        PUSH     {R7,LR}
// 1109     cJSON *item = cJSON_New_Item();
        BL       cJSON_New_Item
// 1110     if(item)item->type = cJSON_NULL;
        CMP      R0,#+0
        BEQ.N    ??cJSON_CreateNull_0
        MOVS     R1,#+2
        STR      R1,[R0, #+12]
// 1111     return item;
??cJSON_CreateNull_0:
        POP      {R1,PC}          ;; return
// 1112 }

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1113 cJSON *cJSON_CreateTrue(void)
// 1114 {
cJSON_CreateTrue:
        PUSH     {R7,LR}
// 1115     cJSON *item = cJSON_New_Item();
        BL       cJSON_New_Item
// 1116     if(item)item->type = cJSON_True;
        CMP      R0,#+0
        BEQ.N    ??cJSON_CreateTrue_0
        MOVS     R1,#+1
        STR      R1,[R0, #+12]
// 1117     return item;
??cJSON_CreateTrue_0:
        POP      {R1,PC}          ;; return
// 1118 }

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1119 cJSON *cJSON_CreateFalse(void)
// 1120 {
cJSON_CreateFalse:
        PUSH     {R7,LR}
// 1121     cJSON *item = cJSON_New_Item();
        BL       cJSON_New_Item
// 1122     if(item)item->type = cJSON_False;
        CMP      R0,#+0
        BEQ.N    ??cJSON_CreateFalse_0
        MOVS     R1,#+0
        STR      R1,[R0, #+12]
// 1123     return item;
??cJSON_CreateFalse_0:
        POP      {R1,PC}          ;; return
// 1124 }

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1125 cJSON *cJSON_CreateBool(int b)
// 1126 {
cJSON_CreateBool:
        PUSH     {R4,LR}
        MOVS     R4,R0
// 1127     cJSON *item = cJSON_New_Item();
        BL       cJSON_New_Item
// 1128     if(item)item->type = b ? cJSON_True : cJSON_False;
        CMP      R0,#+0
        BEQ.N    ??cJSON_CreateBool_0
        CMP      R4,#+0
        BEQ.N    ??cJSON_CreateBool_1
        MOVS     R1,#+1
        B.N      ??cJSON_CreateBool_2
??cJSON_CreateBool_1:
        MOVS     R1,#+0
??cJSON_CreateBool_2:
        STR      R1,[R0, #+12]
// 1129     return item;
??cJSON_CreateBool_0:
        POP      {R4,PC}          ;; return
// 1130 }

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1131 cJSON *cJSON_CreateNumber(double num)
// 1132 {
cJSON_CreateNumber:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
// 1133     cJSON *item = cJSON_New_Item();
        BL       cJSON_New_Item
        MOVS     R6,R0
// 1134     if(item)
        CMP      R6,#+0
        BEQ.N    ??cJSON_CreateNumber_0
// 1135     {
// 1136         item->type = cJSON_Number;
        MOVS     R0,#+3
        STR      R0,[R6, #+12]
// 1137         item->valuedouble = num;
        STRD     R4,R5,[R6, #+24]
// 1138         item->valueint = (int)num;
        MOVS     R0,R4
        MOVS     R1,R5
        BL       __aeabi_d2iz
        STR      R0,[R6, #+20]
// 1139     }
// 1140     return item;
??cJSON_CreateNumber_0:
        MOVS     R0,R6
        POP      {R4-R6,PC}       ;; return
// 1141 }

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1142 cJSON *cJSON_CreateString(const char *string)
// 1143 {
cJSON_CreateString:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
// 1144     cJSON *item = cJSON_New_Item();
        BL       cJSON_New_Item
        MOVS     R5,R0
// 1145     if(item)
        CMP      R5,#+0
        BEQ.N    ??cJSON_CreateString_0
// 1146     {
// 1147         item->type = cJSON_String;
        MOVS     R0,#+4
        STR      R0,[R5, #+12]
// 1148         item->valuestring = cJSON_strdup(string);
        MOVS     R0,R4
        BL       cJSON_strdup
        STR      R0,[R5, #+16]
// 1149     }
// 1150     return item;
??cJSON_CreateString_0:
        MOVS     R0,R5
        POP      {R1,R4,R5,PC}    ;; return
// 1151 }

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1152 cJSON *cJSON_CreateArray(void)
// 1153 {
cJSON_CreateArray:
        PUSH     {R7,LR}
// 1154     cJSON *item = cJSON_New_Item();
        BL       cJSON_New_Item
// 1155     if(item)item->type = cJSON_Array;
        CMP      R0,#+0
        BEQ.N    ??cJSON_CreateArray_0
        MOVS     R1,#+5
        STR      R1,[R0, #+12]
// 1156     return item;
??cJSON_CreateArray_0:
        POP      {R1,PC}          ;; return
// 1157 }

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1158 cJSON *cJSON_CreateObject(void)
// 1159 {
cJSON_CreateObject:
        PUSH     {R7,LR}
// 1160     cJSON *item = cJSON_New_Item();
        BL       cJSON_New_Item
// 1161     if(item)item->type = cJSON_Object;
        CMP      R0,#+0
        BEQ.N    ??cJSON_CreateObject_0
        MOVS     R1,#+6
        STR      R1,[R0, #+12]
// 1162     return item;
??cJSON_CreateObject_0:
        POP      {R1,PC}          ;; return
// 1163 }
// 1164 
// 1165 /* Create Arrays: */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1166 cJSON *cJSON_CreateIntArray(const int *numbers, int count)
// 1167 {
cJSON_CreateIntArray:
        PUSH     {R3-R9,LR}
        MOVS     R4,R0
        MOVS     R5,R1
// 1168     int i;
// 1169     cJSON *n = 0, *p = 0, *a = cJSON_CreateArray();
        MOVS     R7,#+0
        MOVS     R8,#+0
        BL       cJSON_CreateArray
        MOV      R9,R0
// 1170     for(i = 0; a && i < count; i++)
        MOVS     R6,#+0
        B.N      ??cJSON_CreateIntArray_0
// 1171     {
// 1172         n = cJSON_CreateNumber(numbers[i]);
// 1173         if(!i)a->child = n;
// 1174         else suffix_object(p, n);
??cJSON_CreateIntArray_1:
        MOVS     R1,R7
        MOV      R0,R8
        BL       suffix_object
// 1175         p = n;
??cJSON_CreateIntArray_2:
        MOV      R8,R7
        ADDS     R6,R6,#+1
??cJSON_CreateIntArray_0:
        CMP      R9,#+0
        BEQ.N    ??cJSON_CreateIntArray_3
        CMP      R6,R5
        BGE.N    ??cJSON_CreateIntArray_3
        LDR      R0,[R4, R6, LSL #+2]
        BL       __aeabi_i2d
        BL       cJSON_CreateNumber
        MOVS     R7,R0
        CMP      R6,#+0
        BNE.N    ??cJSON_CreateIntArray_1
        STR      R7,[R9, #+8]
        B.N      ??cJSON_CreateIntArray_2
// 1176     }
// 1177     return a;
??cJSON_CreateIntArray_3:
        MOV      R0,R9
        POP      {R1,R4-R9,PC}    ;; return
// 1178 }

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1179 cJSON *cJSON_CreateFloatArray(const float *numbers, int count)
// 1180 {
cJSON_CreateFloatArray:
        PUSH     {R3-R9,LR}
        MOVS     R4,R0
        MOVS     R5,R1
// 1181     int i;
// 1182     cJSON *n = 0, *p = 0, *a = cJSON_CreateArray();
        MOVS     R7,#+0
        MOVS     R8,#+0
        BL       cJSON_CreateArray
        MOV      R9,R0
// 1183     for(i = 0; a && i < count; i++)
        MOVS     R6,#+0
        B.N      ??cJSON_CreateFloatArray_0
// 1184     {
// 1185         n = cJSON_CreateNumber(numbers[i]);
// 1186         if(!i)a->child = n;
// 1187         else suffix_object(p, n);
??cJSON_CreateFloatArray_1:
        MOVS     R1,R7
        MOV      R0,R8
        BL       suffix_object
// 1188         p = n;
??cJSON_CreateFloatArray_2:
        MOV      R8,R7
        ADDS     R6,R6,#+1
??cJSON_CreateFloatArray_0:
        CMP      R9,#+0
        BEQ.N    ??cJSON_CreateFloatArray_3
        CMP      R6,R5
        BGE.N    ??cJSON_CreateFloatArray_3
        LDR      R0,[R4, R6, LSL #+2]
        BL       __aeabi_f2d
        BL       cJSON_CreateNumber
        MOVS     R7,R0
        CMP      R6,#+0
        BNE.N    ??cJSON_CreateFloatArray_1
        STR      R7,[R9, #+8]
        B.N      ??cJSON_CreateFloatArray_2
// 1189     }
// 1190     return a;
??cJSON_CreateFloatArray_3:
        MOV      R0,R9
        POP      {R1,R4-R9,PC}    ;; return
// 1191 }

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1192 cJSON *cJSON_CreateDoubleArray(const double *numbers, int count)
// 1193 {
cJSON_CreateDoubleArray:
        PUSH     {R3-R9,LR}
        MOVS     R4,R0
        MOVS     R5,R1
// 1194     int i;
// 1195     cJSON *n = 0, *p = 0, *a = cJSON_CreateArray();
        MOVS     R9,#+0
        MOVS     R7,#+0
        BL       cJSON_CreateArray
        MOVS     R6,R0
// 1196     for(i = 0; a && i < count; i++)
        MOVS     R8,#+0
        B.N      ??cJSON_CreateDoubleArray_0
// 1197     {
// 1198         n = cJSON_CreateNumber(numbers[i]);
// 1199         if(!i)a->child = n;
// 1200         else suffix_object(p, n);
??cJSON_CreateDoubleArray_1:
        MOV      R1,R9
        MOVS     R0,R7
        BL       suffix_object
// 1201         p = n;
??cJSON_CreateDoubleArray_2:
        MOV      R7,R9
        ADDS     R8,R8,#+1
??cJSON_CreateDoubleArray_0:
        CMP      R6,#+0
        BEQ.N    ??cJSON_CreateDoubleArray_3
        CMP      R8,R5
        BGE.N    ??cJSON_CreateDoubleArray_3
        ADDS     R2,R4,R8, LSL #+3
        LDRD     R0,R1,[R2, #+0]
        BL       cJSON_CreateNumber
        MOV      R9,R0
        CMP      R8,#+0
        BNE.N    ??cJSON_CreateDoubleArray_1
        STR      R9,[R6, #+8]
        B.N      ??cJSON_CreateDoubleArray_2
// 1202     }
// 1203     return a;
??cJSON_CreateDoubleArray_3:
        MOVS     R0,R6
        POP      {R1,R4-R9,PC}    ;; return
// 1204 }

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1205 cJSON *cJSON_CreateStringArray(const char **strings, int count)
// 1206 {
cJSON_CreateStringArray:
        PUSH     {R3-R9,LR}
        MOVS     R4,R0
        MOVS     R5,R1
// 1207     int i;
// 1208     cJSON *n = 0, *p = 0, *a = cJSON_CreateArray();
        MOVS     R7,#+0
        MOVS     R8,#+0
        BL       cJSON_CreateArray
        MOV      R9,R0
// 1209     for(i = 0; a && i < count; i++)
        MOVS     R6,#+0
        B.N      ??cJSON_CreateStringArray_0
// 1210     {
// 1211         n = cJSON_CreateString(strings[i]);
// 1212         if(!i)a->child = n;
// 1213         else suffix_object(p, n);
??cJSON_CreateStringArray_1:
        MOVS     R1,R7
        MOV      R0,R8
        BL       suffix_object
// 1214         p = n;
??cJSON_CreateStringArray_2:
        MOV      R8,R7
        ADDS     R6,R6,#+1
??cJSON_CreateStringArray_0:
        CMP      R9,#+0
        BEQ.N    ??cJSON_CreateStringArray_3
        CMP      R6,R5
        BGE.N    ??cJSON_CreateStringArray_3
        LDR      R0,[R4, R6, LSL #+2]
        BL       cJSON_CreateString
        MOVS     R7,R0
        CMP      R6,#+0
        BNE.N    ??cJSON_CreateStringArray_1
        STR      R7,[R9, #+8]
        B.N      ??cJSON_CreateStringArray_2
// 1215     }
// 1216     return a;
??cJSON_CreateStringArray_3:
        MOV      R0,R9
        POP      {R1,R4-R9,PC}    ;; return
// 1217 }
// 1218 
// 1219 /* Duplication */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1220 cJSON *cJSON_Duplicate(cJSON *item, int recurse)
// 1221 {
cJSON_Duplicate:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R5,R1
// 1222     cJSON *newitem, *cptr, *nptr = 0, *newchild;
        MOVS     R7,#+0
// 1223     /* Bail on bad ptr */
// 1224     if (!item) return 0;
        CMP      R4,#+0
        BNE.N    ??cJSON_Duplicate_0
        MOVS     R0,#+0
        B.N      ??cJSON_Duplicate_1
// 1225     /* Create new item */
// 1226     newitem = cJSON_New_Item();
??cJSON_Duplicate_0:
        BL       cJSON_New_Item
        MOVS     R6,R0
// 1227     if (!newitem) return 0;
        CMP      R6,#+0
        BNE.N    ??cJSON_Duplicate_2
        MOVS     R0,#+0
        B.N      ??cJSON_Duplicate_1
// 1228     /* Copy over all vars */
// 1229     newitem->type = item->type & (~cJSON_IsReference), newitem->valueint = item->valueint, newitem->valuedouble = item->valuedouble;
??cJSON_Duplicate_2:
        LDR      R0,[R4, #+12]
        BICS     R0,R0,#0x100
        STR      R0,[R6, #+12]
        LDR      R0,[R4, #+20]
        STR      R0,[R6, #+20]
        LDRD     R0,R1,[R4, #+24]
        STRD     R0,R1,[R6, #+24]
// 1230     if (item->valuestring)
        LDR      R0,[R4, #+16]
        CMP      R0,#+0
        BEQ.N    ??cJSON_Duplicate_3
// 1231     {
// 1232         newitem->valuestring = cJSON_strdup(item->valuestring);
        LDR      R0,[R4, #+16]
        BL       cJSON_strdup
        STR      R0,[R6, #+16]
// 1233         if (!newitem->valuestring)
        LDR      R0,[R6, #+16]
        CMP      R0,#+0
        BNE.N    ??cJSON_Duplicate_3
// 1234         {
// 1235             cJSON_Delete(newitem);
        MOVS     R0,R6
        BL       cJSON_Delete
// 1236             return 0;
        MOVS     R0,#+0
        B.N      ??cJSON_Duplicate_1
// 1237         }
// 1238     }
// 1239     if (item->string)
??cJSON_Duplicate_3:
        LDR      R0,[R4, #+32]
        CMP      R0,#+0
        BEQ.N    ??cJSON_Duplicate_4
// 1240     {
// 1241         newitem->string = cJSON_strdup(item->string);
        LDR      R0,[R4, #+32]
        BL       cJSON_strdup
        STR      R0,[R6, #+32]
// 1242         if (!newitem->string)
        LDR      R0,[R6, #+32]
        CMP      R0,#+0
        BNE.N    ??cJSON_Duplicate_4
// 1243         {
// 1244             cJSON_Delete(newitem);
        MOVS     R0,R6
        BL       cJSON_Delete
// 1245             return 0;
        MOVS     R0,#+0
        B.N      ??cJSON_Duplicate_1
// 1246         }
// 1247     }
// 1248     /* If non-recursive, then we're done! */
// 1249     if (!recurse) return newitem;
??cJSON_Duplicate_4:
        CMP      R5,#+0
        BNE.N    ??cJSON_Duplicate_5
        MOVS     R0,R6
        B.N      ??cJSON_Duplicate_1
// 1250     /* Walk the ->next chain for the child. */
// 1251     cptr = item->child;
??cJSON_Duplicate_5:
        LDR      R4,[R4, #+8]
        B.N      ??cJSON_Duplicate_6
// 1252     while (cptr)
// 1253     {
// 1254         newchild = cJSON_Duplicate(cptr, 1);		/* Duplicate (with recurse) each item in the ->next chain */
// 1255         if (!newchild)
// 1256         {
// 1257             cJSON_Delete(newitem);
// 1258             return 0;
// 1259         }
// 1260         if (nptr)
// 1261         {
// 1262             nptr->next = newchild, newchild->prev = nptr;    /* If newitem->child already set, then crosswire ->prev and ->next and move on */
// 1263             nptr = newchild;
// 1264         }
// 1265         else
// 1266         {
// 1267             newitem->child = newchild;    /* Set newitem->child and move to it */
??cJSON_Duplicate_7:
        STR      R0,[R6, #+8]
// 1268             nptr = newchild;
        MOVS     R7,R0
// 1269         }
// 1270         cptr = cptr->next;
??cJSON_Duplicate_8:
        LDR      R4,[R4, #+0]
??cJSON_Duplicate_6:
        CMP      R4,#+0
        BEQ.N    ??cJSON_Duplicate_9
        MOVS     R1,#+1
        MOVS     R0,R4
        BL       cJSON_Duplicate
        CMP      R0,#+0
        BNE.N    ??cJSON_Duplicate_10
        MOVS     R0,R6
        BL       cJSON_Delete
        MOVS     R0,#+0
        B.N      ??cJSON_Duplicate_1
??cJSON_Duplicate_10:
        CMP      R7,#+0
        BEQ.N    ??cJSON_Duplicate_7
        STR      R0,[R7, #+0]
        STR      R7,[R0, #+4]
        MOVS     R7,R0
        B.N      ??cJSON_Duplicate_8
// 1271     }
// 1272     return newitem;
??cJSON_Duplicate_9:
        MOVS     R0,R6
??cJSON_Duplicate_1:
        POP      {R1,R4-R7,PC}    ;; return
// 1273 }
// 1274 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1275 void cJSON_Minify(char *json)
// 1276 {
// 1277     char *into = json;
cJSON_Minify:
        MOVS     R1,R0
        B.N      ??cJSON_Minify_0
// 1278     while (*json)
// 1279     {
// 1280         if (*json == ' ') json++;
??cJSON_Minify_1:
        ADDS     R0,R0,#+1
??cJSON_Minify_0:
        LDRB     R2,[R0, #+0]
        CMP      R2,#+0
        BEQ.N    ??cJSON_Minify_2
        LDRB     R2,[R0, #+0]
        CMP      R2,#+32
        BEQ.N    ??cJSON_Minify_1
// 1281         else if (*json == '\t') json++;	/* Whitespace characters. */
        LDRB     R2,[R0, #+0]
        CMP      R2,#+9
        BNE.N    ??cJSON_Minify_3
        ADDS     R0,R0,#+1
        B.N      ??cJSON_Minify_0
// 1282         else if (*json == '\r') json++;
??cJSON_Minify_3:
        LDRB     R2,[R0, #+0]
        CMP      R2,#+13
        BNE.N    ??cJSON_Minify_4
        ADDS     R0,R0,#+1
        B.N      ??cJSON_Minify_0
// 1283         else if (*json == '\n') json++;
??cJSON_Minify_4:
        LDRB     R2,[R0, #+0]
        CMP      R2,#+10
        BNE.N    ??cJSON_Minify_5
        ADDS     R0,R0,#+1
        B.N      ??cJSON_Minify_0
// 1284         else if (*json == '/' && json[1] == '/')  while (*json && *json != '\n') json++;	/* double-slash comments, to end of line. */
??cJSON_Minify_5:
        LDRB     R2,[R0, #+0]
        CMP      R2,#+47
        BNE.N    ??cJSON_Minify_6
        LDRB     R2,[R0, #+1]
        CMP      R2,#+47
        BNE.N    ??cJSON_Minify_6
??cJSON_Minify_7:
        LDRB     R2,[R0, #+0]
        CMP      R2,#+0
        BEQ.N    ??cJSON_Minify_0
        LDRB     R2,[R0, #+0]
        CMP      R2,#+10
        BEQ.N    ??cJSON_Minify_0
        ADDS     R0,R0,#+1
        B.N      ??cJSON_Minify_7
// 1285         else if (*json == '/' && json[1] == '*')
??cJSON_Minify_6:
        LDRB     R2,[R0, #+0]
        CMP      R2,#+47
        BNE.N    ??cJSON_Minify_8
        LDRB     R2,[R0, #+1]
        CMP      R2,#+42
        BEQ.N    ??cJSON_Minify_9
// 1286         {
// 1287             while (*json && !(*json == '*' && json[1] == '/')) json++;    /* multiline comments. */
// 1288             json += 2;
// 1289         }
// 1290         else if (*json == '\"')
??cJSON_Minify_8:
        LDRB     R2,[R0, #+0]
        CMP      R2,#+34
        BNE.N    ??cJSON_Minify_10
// 1291         {
// 1292             *into++ = *json++;    /* string literals, which are \" sensitive. */
        LDRB     R2,[R0, #+0]
        STRB     R2,[R1, #+0]
        ADDS     R0,R0,#+1
        ADDS     R1,R1,#+1
        B.N      ??cJSON_Minify_11
??cJSON_Minify_12:
        ADDS     R0,R0,#+1
??cJSON_Minify_9:
        LDRB     R2,[R0, #+0]
        CMP      R2,#+0
        BEQ.N    ??cJSON_Minify_13
        LDRB     R2,[R0, #+0]
        CMP      R2,#+42
        BNE.N    ??cJSON_Minify_12
        LDRB     R2,[R0, #+1]
        CMP      R2,#+47
        BNE.N    ??cJSON_Minify_12
??cJSON_Minify_13:
        ADDS     R0,R0,#+2
        B.N      ??cJSON_Minify_0
// 1293             while (*json && *json != '\"')
// 1294             {
// 1295                 if (*json == '\\') *into++ = *json++;
??cJSON_Minify_14:
        LDRB     R2,[R0, #+0]
        CMP      R2,#+92
        BNE.N    ??cJSON_Minify_15
        LDRB     R2,[R0, #+0]
        STRB     R2,[R1, #+0]
        ADDS     R0,R0,#+1
        ADDS     R1,R1,#+1
// 1296                 *into++ = *json++;
??cJSON_Minify_15:
        LDRB     R2,[R0, #+0]
        STRB     R2,[R1, #+0]
        ADDS     R0,R0,#+1
        ADDS     R1,R1,#+1
// 1297             }*into++ = *json++;
??cJSON_Minify_11:
        LDRB     R2,[R0, #+0]
        CMP      R2,#+0
        BEQ.N    ??cJSON_Minify_16
        LDRB     R2,[R0, #+0]
        CMP      R2,#+34
        BNE.N    ??cJSON_Minify_14
??cJSON_Minify_16:
        LDRB     R2,[R0, #+0]
        STRB     R2,[R1, #+0]
        ADDS     R0,R0,#+1
        ADDS     R1,R1,#+1
        B.N      ??cJSON_Minify_0
// 1298         }
// 1299         else *into++ = *json++;			/* All other characters. */
??cJSON_Minify_10:
        LDRB     R2,[R0, #+0]
        STRB     R2,[R1, #+0]
        ADDS     R0,R0,#+1
        ADDS     R1,R1,#+1
        B.N      ??cJSON_Minify_0
// 1300     }
// 1301     *into = 0;	/* and null-terminate. */
??cJSON_Minify_2:
        MOVS     R0,#+0
        STRB     R0,[R1, #+0]
// 1302 }
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
// 
//     4 bytes in section .bss
//     8 bytes in section .data
//    78 bytes in section .rodata
// 6 922 bytes in section .text
// 
// 6 922 bytes of CODE  memory
//    78 bytes of CONST memory
//    12 bytes of DATA  memory
//
//Errors: none
//Warnings: 27
