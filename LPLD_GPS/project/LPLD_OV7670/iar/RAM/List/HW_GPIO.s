///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.1.6676/W32 for ARM       26/Dec/2014  18:10:41
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  D:\LPLD_OSKinetis_V3www\lib\LPLD\HW\HW_GPIO.c
//    Command line =  
//        D:\LPLD_OSKinetis_V3www\lib\LPLD\HW\HW_GPIO.c -D LPLD_K60 -lCN
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
//        D:\LPLD_OSKinetis_V3www\project\LPLD_OV7670\iar\RAM\List\HW_GPIO.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN assert_failed

        PUBLIC GPIO_ISR
        PUBLIC LPLD_GPIO_DisableIrq
        PUBLIC LPLD_GPIO_EnableIrq
        PUBLIC LPLD_GPIO_Init
        PUBLIC LPLD_GPIO_Input
        PUBLIC LPLD_GPIO_Input_8b
        PUBLIC LPLD_GPIO_Input_b
        PUBLIC LPLD_GPIO_Output
        PUBLIC LPLD_GPIO_Output_8b
        PUBLIC LPLD_GPIO_Output_b
        PUBLIC LPLD_GPIO_Toggle
        PUBLIC LPLD_GPIO_Toggle_8b
        PUBLIC LPLD_GPIO_Toggle_b
        PUBLIC PORTA_IRQHandler
        PUBLIC PORTB_IRQHandler
        PUBLIC PORTC_IRQHandler
        PUBLIC PORTD_IRQHandler
        PUBLIC PORTE_IRQHandler

// D:\LPLD_OSKinetis_V3www\lib\LPLD\HW\HW_GPIO.c
//    1 /**
//    2  * @file HW_GPIO.c
//    3  * @version 3.03[By LPLD]
//    4  * @date 2014-2-10
//    5  * @brief GPIO�ײ�ģ����غ���
//    6  *
//    7  * ���Ľ���:�������޸�
//    8  *
//    9  * ��Ȩ����:�����������µ��Ӽ������޹�˾
//   10  * http://www.lpld.cn
//   11  * mail:support@lpld.cn
//   12  *
//   13  * @par
//   14  * ����������������[LPLD]������ά������������ʹ���߿���Դ���롣
//   15  * �����߿���������ʹ�û��Դ���롣�����μ�����ע��Ӧ���Ա�����
//   16  * ���ø��Ļ�ɾ��ԭ��Ȩ���������������ο����߿��Լ�ע���ΰ�Ȩ�����ߡ�
//   17  * ��Ӧ�����ش�Э��Ļ����ϣ�����Դ���롢���ó��۴��뱾����
//   18  * �������²���������ʹ�ñ��������������κ��¹ʡ��������λ���ز���Ӱ�졣
//   19  * ����������������͡�˵��������ľ���ԭ�������ܡ�ʵ�ַ�����
//   20  * ������������[LPLD]��Ȩ�������߲��ý�������������ҵ��Ʒ��
//   21  */
//   22 #include "common.h"

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// static __interwork __softfp void NVIC_EnableIRQ(IRQn_Type)
NVIC_EnableIRQ:
        MOVS     R1,#+1
        ANDS     R2,R0,#0x1F
        LSLS     R1,R1,R2
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        LSRS     R0,R0,#+5
        LDR.N    R2,??DataTable9  ;; 0xe000e100
        STR      R1,[R2, R0, LSL #+2]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// static __interwork __softfp void NVIC_DisableIRQ(IRQn_Type)
NVIC_DisableIRQ:
        MOVS     R1,#+1
        ANDS     R2,R0,#0x1F
        LSLS     R1,R1,R2
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        LSRS     R0,R0,#+5
        LDR.N    R2,??DataTable9_1  ;; 0xe000e180
        STR      R1,[R2, R0, LSL #+2]
        BX       LR               ;; return
//   23 #include "HW_GPIO.h"
//   24 
//   25 
//   26 //�û��Զ����жϷ���������

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   27 GPIO_ISR_CALLBACK GPIO_ISR[5];
GPIO_ISR:
        DS8 20
//   28 
//   29 /*
//   30  * LPLD_GPIO_Init
//   31  * GPIOͨ�ó�ʼ������
//   32  * 
//   33  * ����:
//   34  *    gpio_init_structure--GPIO��ʼ���ṹ�壬
//   35  *                        ���嶨���GPIO_InitTypeDef
//   36  *
//   37  * ���:
//   38  *    0--���ô���
//   39  *    1--���óɹ�
//   40  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   41 uint8 LPLD_GPIO_Init(GPIO_InitTypeDef gpio_init_structure)
//   42 {
LPLD_GPIO_Init:
        PUSH     {R0-R3}
        PUSH     {R3-R9,LR}
//   43   uint8 i;
//   44   PORT_Type *portx;
//   45   uint32 pcr = PORT_PCR_MUX(1)| gpio_init_structure.GPIO_PinControl; 
        LDR      R0,[SP, #+40]
        ORRS     R4,R0,#0x100
//   46   GPIO_Type *ptx = gpio_init_structure.GPIO_PTx;
        LDR      R7,[SP, #+32]
//   47   uint32 pins = gpio_init_structure.GPIO_Pins;
        LDR      R5,[SP, #+36]
//   48   uint8 dir = gpio_init_structure.GPIO_Dir;
        LDRB     R8,[SP, #+44]
//   49   uint8 output = gpio_init_structure.GPIO_Output;
        LDRB     R9,[SP, #+45]
//   50   GPIO_ISR_CALLBACK isr_func = gpio_init_structure.GPIO_Isr;
        LDR      R6,[SP, #+48]
//   51   
//   52   //�������
//   53   ASSERT( ptx <= PTE);                  //�ж϶˿�
        LDR.N    R0,??DataTable9_2  ;; 0x400ff101
        CMP      R7,R0
        BCC.N    ??LPLD_GPIO_Init_0
        MOVS     R1,#+53
        LDR.N    R0,??DataTable9_3
        BL       assert_failed
//   54   ASSERT( dir <= 1 );                   //�жϷ���
??LPLD_GPIO_Init_0:
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+2
        BLT.N    ??LPLD_GPIO_Init_1
        MOVS     R1,#+54
        LDR.N    R0,??DataTable9_3
        BL       assert_failed
//   55   ASSERT( output <= 1 );                //�ж������ƽ״̬
??LPLD_GPIO_Init_1:
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        CMP      R9,#+2
        BLT.N    ??LPLD_GPIO_Init_2
        MOVS     R1,#+55
        LDR.N    R0,??DataTable9_3
        BL       assert_failed
//   56   
//   57   if(ptx == PTA)
??LPLD_GPIO_Init_2:
        LDR.N    R0,??DataTable9_4  ;; 0x400ff000
        CMP      R7,R0
        BNE.N    ??LPLD_GPIO_Init_3
//   58   {
//   59     portx = PORTA;  
        LDR.N    R1,??DataTable9_5  ;; 0x40049000
//   60     i = 0;
        MOVS     R0,#+0
//   61   }
//   62   else if(ptx == PTB) 
//   63   {
//   64     portx = PORTB;
//   65     i = 1;
//   66   }
//   67   else if(ptx == PTC) 
//   68   {
//   69     portx = PORTC;
//   70     i = 2;
//   71   }
//   72   else if(ptx == PTD) 
//   73   {
//   74     portx = PORTD;
//   75     i = 3; 
//   76   }
//   77   else if(ptx == PTE) 
//   78   {
//   79     portx = PORTE;
//   80     i = 4;
//   81   }
//   82   else
//   83     return 0;
//   84   
//   85   //������������
//   86   if(dir==DIR_OUTPUT)
??LPLD_GPIO_Init_4:
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+1
        BNE.N    ??LPLD_GPIO_Init_5
//   87   {
//   88     ptx->PDDR |= pins;
        LDR      R2,[R7, #+20]
        ORRS     R2,R5,R2
        STR      R2,[R7, #+20]
//   89     //���ó�ʼ���
//   90     if(output==OUTPUT_H)
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        CMP      R9,#+1
        BNE.N    ??LPLD_GPIO_Init_6
//   91     {
//   92       ptx->PSOR = pins; 
        STR      R5,[R7, #+4]
        B.N      ??LPLD_GPIO_Init_7
//   93     }
??LPLD_GPIO_Init_3:
        LDR.N    R0,??DataTable9_6  ;; 0x400ff040
        CMP      R7,R0
        BNE.N    ??LPLD_GPIO_Init_8
        LDR.N    R1,??DataTable9_7  ;; 0x4004a000
        MOVS     R0,#+1
        B.N      ??LPLD_GPIO_Init_4
??LPLD_GPIO_Init_8:
        LDR.N    R0,??DataTable9_8  ;; 0x400ff080
        CMP      R7,R0
        BNE.N    ??LPLD_GPIO_Init_9
        LDR.N    R1,??DataTable9_9  ;; 0x4004b000
        MOVS     R0,#+2
        B.N      ??LPLD_GPIO_Init_4
??LPLD_GPIO_Init_9:
        LDR.N    R0,??DataTable9_10  ;; 0x400ff0c0
        CMP      R7,R0
        BNE.N    ??LPLD_GPIO_Init_10
        LDR.N    R1,??DataTable9_11  ;; 0x4004c000
        MOVS     R0,#+3
        B.N      ??LPLD_GPIO_Init_4
??LPLD_GPIO_Init_10:
        LDR.N    R0,??DataTable9_12  ;; 0x400ff100
        CMP      R7,R0
        BNE.N    ??LPLD_GPIO_Init_11
        LDR.N    R1,??DataTable9_13  ;; 0x4004d000
        MOVS     R0,#+4
        B.N      ??LPLD_GPIO_Init_4
??LPLD_GPIO_Init_11:
        MOVS     R0,#+0
        B.N      ??LPLD_GPIO_Init_12
//   94     else
//   95     {
//   96       ptx->PCOR = pins;
??LPLD_GPIO_Init_6:
        STR      R5,[R7, #+8]
        B.N      ??LPLD_GPIO_Init_7
//   97     }
//   98   }
//   99   else
//  100   { 
//  101     ptx->PDDR &= ~(pins);
??LPLD_GPIO_Init_5:
        LDR      R2,[R7, #+20]
        BICS     R2,R2,R5
        STR      R2,[R7, #+20]
//  102   }
//  103   
//  104   //������ѡ���ŵĿ��ƼĴ���
//  105   for(uint8 i=0; i<32; i++)
??LPLD_GPIO_Init_7:
        MOVS     R2,#+0
        B.N      ??LPLD_GPIO_Init_13
//  106   {
//  107     if(pins&(1ul<<i))
??LPLD_GPIO_Init_14:
        LSRS     R3,R5,R2
        LSLS     R3,R3,#+31
        BPL.N    ??LPLD_GPIO_Init_15
//  108     {
//  109       portx->PCR[i] = pcr;
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        STR      R4,[R1, R2, LSL #+2]
//  110     }
//  111   }
??LPLD_GPIO_Init_15:
        ADDS     R2,R2,#+1
??LPLD_GPIO_Init_13:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+32
        BLT.N    ??LPLD_GPIO_Init_14
//  112 
//  113   if(isr_func!=NULL)
        MOVS     R1,R6
        CMP      R1,#+0
        BEQ.N    ??LPLD_GPIO_Init_16
//  114     GPIO_ISR[i] = isr_func;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R1,??DataTable9_14
        STR      R6,[R1, R0, LSL #+2]
//  115   
//  116   return 1;
??LPLD_GPIO_Init_16:
        MOVS     R0,#+1
??LPLD_GPIO_Init_12:
        POP      {R1,R4-R9}
        LDR      PC,[SP], #+20    ;; return
//  117 }
//  118 
//  119 /*
//  120  * LPLD_GPIO_EnableIrq
//  121  * ʹ��GPIO�ⲿ�ж�
//  122  * 
//  123  * ����:
//  124  *    gpio_init_structure--GPIO��ʼ���ṹ�壬
//  125  *                        ���嶨���GPIO_InitTypeDef
//  126  *
//  127  * ���:
//  128  *    0--���ô���
//  129  *    1--���óɹ�
//  130  *
//  131  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  132 uint8 LPLD_GPIO_EnableIrq(GPIO_InitTypeDef gpio_init_structure)
//  133 {
LPLD_GPIO_EnableIrq:
        PUSH     {R0-R3}
        PUSH     {R4,LR}
//  134   uint8 i;
//  135   GPIO_Type *ptx = gpio_init_structure.GPIO_PTx;
        LDR      R4,[SP, #+8]
//  136   
//  137   //�������
//  138   ASSERT( ptx <= PTE);                  //�ж϶˿�
        LDR.N    R0,??DataTable9_2  ;; 0x400ff101
        CMP      R4,R0
        BCC.N    ??LPLD_GPIO_EnableIrq_0
        MOVS     R1,#+138
        LDR.N    R0,??DataTable9_3
        BL       assert_failed
//  139   
//  140   if(ptx == PTA)
??LPLD_GPIO_EnableIrq_0:
        LDR.N    R0,??DataTable9_4  ;; 0x400ff000
        CMP      R4,R0
        BNE.N    ??LPLD_GPIO_EnableIrq_1
//  141     i = 0;
        MOVS     R0,#+0
        B.N      ??LPLD_GPIO_EnableIrq_2
//  142   else if(ptx == PTB) 
??LPLD_GPIO_EnableIrq_1:
        LDR.N    R0,??DataTable9_6  ;; 0x400ff040
        CMP      R4,R0
        BNE.N    ??LPLD_GPIO_EnableIrq_3
//  143     i = 1;
        MOVS     R0,#+1
        B.N      ??LPLD_GPIO_EnableIrq_2
//  144   else if(ptx == PTC) 
??LPLD_GPIO_EnableIrq_3:
        LDR.N    R0,??DataTable9_8  ;; 0x400ff080
        CMP      R4,R0
        BNE.N    ??LPLD_GPIO_EnableIrq_4
//  145     i = 2;
        MOVS     R0,#+2
        B.N      ??LPLD_GPIO_EnableIrq_2
//  146   else if(ptx == PTD) 
??LPLD_GPIO_EnableIrq_4:
        LDR.N    R0,??DataTable9_10  ;; 0x400ff0c0
        CMP      R4,R0
        BNE.N    ??LPLD_GPIO_EnableIrq_5
//  147     i = 3;
        MOVS     R0,#+3
        B.N      ??LPLD_GPIO_EnableIrq_2
//  148   else
//  149     i = 4;
??LPLD_GPIO_EnableIrq_5:
        MOVS     R0,#+4
//  150 
//  151   enable_irq((IRQn_Type)(i + PORTA_IRQn));
??LPLD_GPIO_EnableIrq_2:
        ADDS     R0,R0,#+87
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        BL       NVIC_EnableIRQ
//  152   
//  153   return 1;
        MOVS     R0,#+1
        POP      {R4}
        LDR      PC,[SP], #+20    ;; return
//  154 }
//  155 
//  156 /*
//  157  * LPLD_GPIO_DisableIrq
//  158  * ����GPIO�ⲿ�ж�
//  159  * 
//  160  * ����:
//  161  *    gpio_init_structure--GPIO��ʼ���ṹ�壬
//  162  *                        ���嶨���GPIO_InitTypeDef
//  163  *
//  164  * ���:
//  165  *    0--���ô���
//  166  *    1--���óɹ�
//  167  *
//  168  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  169 uint8 LPLD_GPIO_DisableIrq(GPIO_InitTypeDef gpio_init_structure)
//  170 {
LPLD_GPIO_DisableIrq:
        PUSH     {R0-R3}
        PUSH     {R4,LR}
//  171   uint8 i;
//  172   GPIO_Type *ptx = gpio_init_structure.GPIO_PTx;
        LDR      R4,[SP, #+8]
//  173   
//  174   //�������
//  175   ASSERT( ptx <= PTE);                  //�ж϶˿�
        LDR.N    R0,??DataTable9_2  ;; 0x400ff101
        CMP      R4,R0
        BCC.N    ??LPLD_GPIO_DisableIrq_0
        MOVS     R1,#+175
        LDR.N    R0,??DataTable9_3
        BL       assert_failed
//  176   
//  177   if(ptx == PTA)
??LPLD_GPIO_DisableIrq_0:
        LDR.N    R0,??DataTable9_4  ;; 0x400ff000
        CMP      R4,R0
        BNE.N    ??LPLD_GPIO_DisableIrq_1
//  178     i = 0;
        MOVS     R0,#+0
        B.N      ??LPLD_GPIO_DisableIrq_2
//  179   else if(ptx == PTB) 
??LPLD_GPIO_DisableIrq_1:
        LDR.N    R0,??DataTable9_6  ;; 0x400ff040
        CMP      R4,R0
        BNE.N    ??LPLD_GPIO_DisableIrq_3
//  180     i = 1;
        MOVS     R0,#+1
        B.N      ??LPLD_GPIO_DisableIrq_2
//  181   else if(ptx == PTC) 
??LPLD_GPIO_DisableIrq_3:
        LDR.N    R0,??DataTable9_8  ;; 0x400ff080
        CMP      R4,R0
        BNE.N    ??LPLD_GPIO_DisableIrq_4
//  182     i = 2;
        MOVS     R0,#+2
        B.N      ??LPLD_GPIO_DisableIrq_2
//  183   else if(ptx == PTD) 
??LPLD_GPIO_DisableIrq_4:
        LDR.N    R0,??DataTable9_10  ;; 0x400ff0c0
        CMP      R4,R0
        BNE.N    ??LPLD_GPIO_DisableIrq_5
//  184     i = 3;
        MOVS     R0,#+3
        B.N      ??LPLD_GPIO_DisableIrq_2
//  185   else
//  186     i = 4;
??LPLD_GPIO_DisableIrq_5:
        MOVS     R0,#+4
//  187   
//  188   disable_irq((IRQn_Type)(i + PORTA_IRQn));
??LPLD_GPIO_DisableIrq_2:
        ADDS     R0,R0,#+87
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        BL       NVIC_DisableIRQ
//  189   
//  190   return 1;
        MOVS     R0,#+1
        POP      {R4}
        LDR      PC,[SP], #+20    ;; return
//  191 }
//  192 
//  193 /*
//  194  * LPLD_GPIO_Ouptut
//  195  * ����GPIO�˿�0~31λ�����
//  196  * 
//  197  * ����:
//  198  *    ptx--�˿ں�
//  199  *      |__PTA        --Port A
//  200  *      |__PTB        --Port B
//  201  *      |__PTC        --Port C
//  202  *      |__PTD        --Port D
//  203  *      |__PTE        --Port E
//  204  *    data32--�������
//  205  *      |__0x00000000~0xFFFFFFFF--�͵��ߴ���GPIO�ڵĵ�0~31λ����
//  206  *
//  207  * ���:
//  208  *
//  209  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  210 __INLINE void LPLD_GPIO_Output(GPIO_Type *ptx, uint32 data32)
//  211 { 
//  212   ptx->PDOR = data32;
LPLD_GPIO_Output:
        STR      R1,[R0, #+0]
//  213 }
        BX       LR               ;; return
//  214 
//  215 /*
//  216  * LPLD_GPIO_Ouptut_b
//  217  * ����GPIO�˿�һλ�����
//  218  * 
//  219  * ����:
//  220  *    ptx--�˿ں�
//  221  *      |__PTA        --Port A
//  222  *      |__PTB        --Port B
//  223  *      |__PTC        --Port C
//  224  *      |__PTD        --Port D
//  225  *      |__PTE        --Port E
//  226  *    lsb_num--�˿�����λ�����
//  227  *      |__0~31       --GPIO�ڵĵ�0~31λ
//  228  *    data1--�������
//  229  *      |__0          --����͵�ƽ
//  230  *      |__1          --����ߵ�ƽ
//  231  *
//  232  * ���:
//  233  *
//  234  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  235 __INLINE void LPLD_GPIO_Output_b(GPIO_Type *ptx, uint32 lsb_num, uint8 data1)
//  236 {
LPLD_GPIO_Output_b:
        PUSH     {R4}
//  237   ptx->PDOR = (ptx->PDOR & ~(0x01L<<lsb_num)) | (uint32)data1<<lsb_num;
        LDR      R3,[R0, #+0]
        MOVS     R4,#+1
        LSLS     R4,R4,R1
        BICS     R3,R3,R4
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LSLS     R1,R2,R1
        ORRS     R1,R1,R3
        STR      R1,[R0, #+0]
//  238 }
        POP      {R4}
        BX       LR               ;; return
//  239 
//  240 /*
//  241  * LPLD_GPIO_Ouptut_8b
//  242  * ����GPIO�˿�8λ�����
//  243  * 
//  244  * ����:
//  245  *    ptx--�˿ں�
//  246  *      |__PTA        --Port A
//  247  *      |__PTB        --Port B
//  248  *      |__PTC        --Port C
//  249  *      |__PTD        --Port D
//  250  *      |__PTE        --Port E
//  251  *    lsb_num--����8���˿����ŵ����λ�����
//  252  *      |__0~24       --GPIO�ڵĵ�0~24λ
//  253  *    data8--�������
//  254  *      |__0x00~0xFF--����GPIO�������8λ����
//  255  *
//  256  * ���:
//  257  *
//  258  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  259 __INLINE void LPLD_GPIO_Output_8b(GPIO_Type *ptx, uint8 lsb_num, uint8 data8)
//  260 {
LPLD_GPIO_Output_8b:
        PUSH     {R4}
//  261   ptx->PDOR = (ptx->PDOR & ~(0xFFL<<lsb_num)) | (uint32)data8<<lsb_num;
        LDR      R3,[R0, #+0]
        MOVS     R4,#+255
        LSLS     R4,R4,R1
        BICS     R3,R3,R4
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LSLS     R1,R2,R1
        ORRS     R1,R1,R3
        STR      R1,[R0, #+0]
//  262 }
        POP      {R4}
        BX       LR               ;; return
//  263 
//  264 /*
//  265  * LPLD_GPIO_Toggle
//  266  * ����GPIO�˿�0~31�ĵ�ƽ��ת
//  267  * 
//  268  * ����:
//  269  *    ptx--�˿ں�
//  270  *      |__PTA        --Port A
//  271  *      |__PTB        --Port B
//  272  *      |__PTC        --Port C
//  273  *      |__PTD        --Port D
//  274  *      |__PTE        --Port E
//  275  *    data32--��ת����
//  276  *      |__0x00000000~0xFFFFFFFF--�͵��ߴ���GPIO�ڵĵ�0~31λ�ķ�ת��1Ϊ��ת��0Ϊ���ֲ��䡣
//  277  *
//  278  * ���:
//  279  *
//  280  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  281 __INLINE void LPLD_GPIO_Toggle(GPIO_Type *ptx, uint32 data32)
//  282 {  
//  283   ptx->PTOR = data32;
LPLD_GPIO_Toggle:
        STR      R1,[R0, #+12]
//  284 }
        BX       LR               ;; return
//  285 
//  286 /*
//  287  * LPLD_GPIO_Toggle_b
//  288  * ����GPIO�˿�һλ�ķ�ת
//  289  * 
//  290  * ����:
//  291  *    ptx--�˿ں�
//  292  *      |__PTA        --Port A
//  293  *      |__PTB        --Port B
//  294  *      |__PTC        --Port C
//  295  *      |__PTD        --Port D
//  296  *      |__PTE        --Port E
//  297  *    lsb_num--�˿�����λ�����
//  298  *      |__0~31       --GPIO�ڵĵ�0~31λ
//  299  *
//  300  * ���:
//  301  *
//  302  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  303 __INLINE void LPLD_GPIO_Toggle_b(GPIO_Type *ptx, uint8 lsb_num)
//  304 {  
//  305   ptx->PTOR = 0x01L<<lsb_num;
LPLD_GPIO_Toggle_b:
        MOVS     R2,#+1
        LSLS     R1,R2,R1
        STR      R1,[R0, #+12]
//  306 }
        BX       LR               ;; return
//  307 
//  308 /*
//  309  * LPLD_GPIO_Toggle_8b
//  310  * ����GPIO�˿�8λ�ķ�ת
//  311  * 
//  312  * ����:
//  313  *    ptx--�˿ں�
//  314  *      |__PTA        --Port A
//  315  *      |__PTB        --Port B
//  316  *      |__PTC        --Port C
//  317  *      |__PTD        --Port D
//  318  *      |__PTE        --Port E
//  319  *    lsb_num--����8���˿����ŵ����λ�����
//  320  *      |__0~24       --GPIO�ڵĵ�0~24λ
//  321  *    data8--�������
//  322  *      |__0x00~0xFF--����GPIO�������8λ����
//  323  *
//  324  * ���:
//  325  *
//  326  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  327 __INLINE void LPLD_GPIO_Toggle_8b(GPIO_Type *ptx, uint8 lsb_num, uint8 data8)
//  328 {
//  329   ptx->PTOR = (uint32)data8<<lsb_num;
LPLD_GPIO_Toggle_8b:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LSLS     R1,R2,R1
        STR      R1,[R0, #+12]
//  330 }
        BX       LR               ;; return
//  331 
//  332 /*
//  333  * LPLD_GPIO_Input
//  334  * ȡ��GPIO��0~31λ������
//  335  * 
//  336  * ����:
//  337  *    ptx--�˿ں�
//  338  *      |__PTA        --Port A
//  339  *      |__PTB        --Port B
//  340  *      |__PTC        --Port C
//  341  *      |__PTD        --Port D
//  342  *      |__PTE        --Port E
//  343  *
//  344  * ���:
//  345  *    ָ��GPIO�ڵ�32λ����
//  346  *
//  347  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  348 __INLINE uint32 LPLD_GPIO_Input(GPIO_Type *ptx)
//  349 {
//  350   return ptx->PDIR;
LPLD_GPIO_Input:
        LDR      R0,[R0, #+16]
        BX       LR               ;; return
//  351 }
//  352 
//  353 /*
//  354  * LPLD_GPIO_Input_b
//  355  * ȡ��GPIO��ĳһλ������
//  356  * 
//  357  * ����:
//  358  *    ptx--�˿ں�
//  359  *      |__PTA        --Port A
//  360  *      |__PTB        --Port B
//  361  *      |__PTC        --Port C
//  362  *      |__PTD        --Port D
//  363  *      |__PTE        --Port E
//  364  *    lsb_num--�˿�����λ�����
//  365  *      |__0~31       --GPIO�ڵĵ�0~31λ
//  366  *
//  367  * ���:
//  368  *    ָ��GPIO�ڵ�ָ��λ���ĵ�ƽ
//  369  *
//  370  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  371 __INLINE uint8 LPLD_GPIO_Input_b(GPIO_Type *ptx, uint8 lsb_num)
//  372 {  
//  373   return (uint8)((ptx->PDIR>>lsb_num)&0x01L);
LPLD_GPIO_Input_b:
        LDR      R0,[R0, #+16]
        LSRS     R0,R0,R1
        ANDS     R0,R0,#0x1
        BX       LR               ;; return
//  374 }
//  375 
//  376 /*
//  377  * LPLD_GPIO_Input_8b
//  378  * ȡ��GPIO�˿�8λ���ݵ�����
//  379  * 
//  380  * ����:
//  381  *    ptx--�˿ں�
//  382  *      |__PTA        --Port A
//  383  *      |__PTB        --Port B
//  384  *      |__PTC        --Port C
//  385  *      |__PTD        --Port D
//  386  *      |__PTE        --Port E
//  387  *    lsb_num--����8���˿����ŵ����λ�����
//  388  *      |__0~24       --GPIO�ڵĵ�0~24λ
//  389  *
//  390  * ���:
//  391  *    ָ��GPIO�ڵ�8λ���ݵĵ�ƽ
//  392  *
//  393  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  394 __INLINE uint8 LPLD_GPIO_Input_8b(GPIO_Type *ptx, uint8 lsb_num)
//  395 {
//  396   return (uint8)((ptx->PDIR>>lsb_num)&0xFFL);
LPLD_GPIO_Input_8b:
        LDR      R0,[R0, #+16]
        LSRS     R0,R0,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return
//  397 }
//  398 
//  399 /*
//  400  * PORTA--PORTE�жϴ�������
//  401  * �������ļ�startup_K60.s�е��ж�����������
//  402  * �û������޸ģ������Զ������Ӧͨ���жϺ���
//  403  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  404 void PORTA_IRQHandler(void)
//  405 {
PORTA_IRQHandler:
        PUSH     {R7,LR}
//  406 #if (UCOS_II > 0u)
//  407   OS_CPU_SR  cpu_sr = 0u;
//  408   OS_ENTER_CRITICAL(); //��֪ϵͳ��ʱ�Ѿ��������жϷ����Ӻ���
//  409   OSIntEnter();
//  410   OS_EXIT_CRITICAL();
//  411 #endif
//  412   
//  413   //�����û��Զ����жϷ���
//  414   GPIO_ISR[0](); 
        LDR.N    R0,??DataTable9_14
        LDR      R0,[R0, #+0]
        BLX      R0
//  415   PORTA->ISFR =0xFFFFFFFF;
        MOVS     R0,#-1
        LDR.N    R1,??DataTable9_15  ;; 0x400490a0
        STR      R0,[R1, #+0]
//  416   
//  417 #if (UCOS_II > 0u)
//  418   OSIntExit();          //��֪ϵͳ��ʱ�����뿪�жϷ����Ӻ���
//  419 #endif
//  420 }//           ;87:  PORT A interrupt
        POP      {R0,PC}          ;; return
//  421 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  422 void PORTB_IRQHandler(void)
//  423 {
PORTB_IRQHandler:
        PUSH     {R7,LR}
//  424 #if (UCOS_II > 0u)
//  425   OS_CPU_SR  cpu_sr = 0u;
//  426   OS_ENTER_CRITICAL(); //��֪ϵͳ��ʱ�Ѿ��������жϷ����Ӻ���
//  427   OSIntEnter();
//  428   OS_EXIT_CRITICAL();
//  429 #endif
//  430   
//  431   //�����û��Զ����жϷ���
//  432   GPIO_ISR[1](); 
        LDR.N    R0,??DataTable9_14
        LDR      R0,[R0, #+4]
        BLX      R0
//  433   PORTB->ISFR =0xFFFFFFFF;
        MOVS     R0,#-1
        LDR.N    R1,??DataTable9_16  ;; 0x4004a0a0
        STR      R0,[R1, #+0]
//  434   
//  435 #if (UCOS_II > 0u)
//  436   OSIntExit();          //��֪ϵͳ��ʱ�����뿪�жϷ����Ӻ���
//  437 #endif
//  438 }//           ;88:  PORT B interrupt
        POP      {R0,PC}          ;; return
//  439 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  440 void PORTC_IRQHandler(void)
//  441 {
PORTC_IRQHandler:
        PUSH     {R7,LR}
//  442 #if (UCOS_II > 0u)
//  443   OS_CPU_SR  cpu_sr = 0u;
//  444   OS_ENTER_CRITICAL(); //��֪ϵͳ��ʱ�Ѿ��������жϷ����Ӻ���
//  445   OSIntEnter();
//  446   OS_EXIT_CRITICAL();
//  447 #endif
//  448   
//  449   //�����û��Զ����жϷ���
//  450   GPIO_ISR[2](); 
        LDR.N    R0,??DataTable9_14
        LDR      R0,[R0, #+8]
        BLX      R0
//  451   PORTC->ISFR =0xFFFFFFFF;
        MOVS     R0,#-1
        LDR.N    R1,??DataTable9_17  ;; 0x4004b0a0
        STR      R0,[R1, #+0]
//  452   
//  453 #if (UCOS_II > 0u)
//  454   OSIntExit();          //��֪ϵͳ��ʱ�����뿪�жϷ����Ӻ���
//  455 #endif
//  456 }//           ;89:  PORT C interrupt
        POP      {R0,PC}          ;; return
//  457 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  458 void PORTD_IRQHandler(void)
//  459 {
PORTD_IRQHandler:
        PUSH     {R7,LR}
//  460 #if (UCOS_II > 0u)
//  461   OS_CPU_SR  cpu_sr = 0u;
//  462   OS_ENTER_CRITICAL(); //��֪ϵͳ��ʱ�Ѿ��������жϷ����Ӻ���
//  463   OSIntEnter();
//  464   OS_EXIT_CRITICAL();
//  465 #endif
//  466   
//  467   //�����û��Զ����жϷ���
//  468   GPIO_ISR[3](); 
        LDR.N    R0,??DataTable9_14
        LDR      R0,[R0, #+12]
        BLX      R0
//  469   PORTD->ISFR =0xFFFFFFFF;
        MOVS     R0,#-1
        LDR.N    R1,??DataTable9_18  ;; 0x4004c0a0
        STR      R0,[R1, #+0]
//  470   
//  471 #if (UCOS_II > 0u)
//  472   OSIntExit();          //��֪ϵͳ��ʱ�����뿪�жϷ����Ӻ���
//  473 #endif
//  474 }//           ;90:  PORT D interrupt
        POP      {R0,PC}          ;; return
//  475 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  476 void PORTE_IRQHandler(void)
//  477 {
PORTE_IRQHandler:
        PUSH     {R7,LR}
//  478 #if (UCOS_II > 0u)
//  479   OS_CPU_SR  cpu_sr = 0u;
//  480   OS_ENTER_CRITICAL(); //��֪ϵͳ��ʱ�Ѿ��������жϷ����Ӻ���
//  481   OSIntEnter();
//  482   OS_EXIT_CRITICAL();
//  483 #endif
//  484   
//  485   //�����û��Զ����жϷ���
//  486   GPIO_ISR[4](); 
        LDR.N    R0,??DataTable9_14
        LDR      R0,[R0, #+16]
        BLX      R0
//  487   PORTE->ISFR =0xFFFFFFFF;
        MOVS     R0,#-1
        LDR.N    R1,??DataTable9_19  ;; 0x4004d0a0
        STR      R0,[R1, #+0]
//  488   
//  489 #if (UCOS_II > 0u)
//  490   OSIntExit();          //��֪ϵͳ��ʱ�����뿪�жϷ����Ӻ���
//  491 #endif
//  492 }//           ;91:  PORT E interrupt
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9:
        DC32     0xe000e100

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_1:
        DC32     0xe000e180

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_2:
        DC32     0x400ff101

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_3:
        DC32     `?<Constant "D:\\\\LPLD_OSKinetis_V3w...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_4:
        DC32     0x400ff000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_5:
        DC32     0x40049000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_6:
        DC32     0x400ff040

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_7:
        DC32     0x4004a000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_8:
        DC32     0x400ff080

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_9:
        DC32     0x4004b000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_10:
        DC32     0x400ff0c0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_11:
        DC32     0x4004c000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_12:
        DC32     0x400ff100

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_13:
        DC32     0x4004d000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_14:
        DC32     GPIO_ISR

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_15:
        DC32     0x400490a0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_16:
        DC32     0x4004a0a0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_17:
        DC32     0x4004b0a0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_18:
        DC32     0x4004c0a0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_19:
        DC32     0x4004d0a0

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "D:\\\\LPLD_OSKinetis_V3w...">`:
        DATA
        DC8 "D:\\LPLD_OSKinetis_V3www\\lib\\LPLD\\HW\\HW_GPIO.c"
        DC8 0, 0

        END
// 
//  20 bytes in section .bss
//  48 bytes in section .rodata
// 692 bytes in section .text
// 
// 692 bytes of CODE  memory
//  48 bytes of CONST memory
//  20 bytes of DATA  memory
//
//Errors: none
//Warnings: none