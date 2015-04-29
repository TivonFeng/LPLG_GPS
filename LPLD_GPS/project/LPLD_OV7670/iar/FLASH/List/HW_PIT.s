///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.1.6676/W32 for ARM       23/Apr/2015  14:23:18
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  G:\test\LPLD_OSKinetis_V3_now02\lib\LPLD\HW\HW_PIT.c
//    Command line =  
//        G:\test\LPLD_OSKinetis_V3_now02\lib\LPLD\HW\HW_PIT.c -D LPLD_K60 -lCN
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
//        G:\test\LPLD_OSKinetis_V3_now02\project\LPLD_OV7670\iar\FLASH\List\HW_PIT.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN g_bus_clock

        PUBLIC LPLD_PIT_Deinit
        PUBLIC LPLD_PIT_DisableIrq
        PUBLIC LPLD_PIT_EnableIrq
        PUBLIC LPLD_PIT_Init
        PUBLIC PIT0_IRQHandler
        PUBLIC PIT1_IRQHandler
        PUBLIC PIT2_IRQHandler
        PUBLIC PIT3_IRQHandler
        PUBLIC PIT_ISR

// G:\test\LPLD_OSKinetis_V3_now02\lib\LPLD\HW\HW_PIT.c
//    1 /**
//    2  * @file HW_PIT.c
//    3  * @version 3.0[By LPLD]
//    4  * @date 2013-06-18
//    5  * @brief PIT�ײ�ģ����غ���
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
        LDR.N    R2,??DataTable7  ;; 0xe000e100
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
        LDR.N    R2,??DataTable7_1  ;; 0xe000e180
        STR      R1,[R2, R0, LSL #+2]
        BX       LR               ;; return
//   23 #include "HW_PIT.h"
//   24 
//   25 //�û��Զ����жϷ���������

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   26 PIT_ISR_CALLBACK PIT_ISR[4];
PIT_ISR:
        DS8 16
//   27 
//   28 /*
//   29  * LPLD_PIT_Init
//   30  * PITͨ�ó�ʼ��������ѡ��PITx�������ж����ڡ��жϺ���
//   31  * 
//   32  * ����:
//   33  *    pit_init_structure--PIT��ʼ���ṹ�壬
//   34  *                        ���嶨���PIT_InitTypeDef
//   35  *
//   36  * ���:
//   37  *    0--���ô���
//   38  *    1--���óɹ�
//   39  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   40 uint8 LPLD_PIT_Init(PIT_InitTypeDef pit_init_structure)
//   41 { 
LPLD_PIT_Init:
        PUSH     {R0-R3}
        PUSH     {R4}
//   42   //���㶨ʱ����ֵ
//   43   uint32 ldval = pit_init_structure.PIT_PeriodUs*(g_bus_clock/1000000)
//   44                + pit_init_structure.PIT_PeriodMs*1000*(g_bus_clock/1000000)
//   45                + pit_init_structure.PIT_PeriodS*1000000*(g_bus_clock/1000000);
        LDR      R0,[SP, #+8]
        LDR.N    R1,??DataTable7_2
        LDR      R1,[R1, #+0]
        LDR.N    R2,??DataTable7_3  ;; 0xf4240
        UDIV     R1,R1,R2
        LDR      R2,[SP, #+12]
        LDR.N    R3,??DataTable7_2
        LDR      R3,[R3, #+0]
        LDR.N    R4,??DataTable7_3  ;; 0xf4240
        UDIV     R3,R3,R4
        MULS     R2,R3,R2
        MOV      R3,#+1000
        MULS     R2,R3,R2
        MLA      R0,R1,R0,R2
        LDR      R1,[SP, #+16]
        LDR.N    R2,??DataTable7_2
        LDR      R2,[R2, #+0]
        LDR.N    R3,??DataTable7_3  ;; 0xf4240
        UDIV     R2,R2,R3
        MULS     R1,R2,R1
        LDR.N    R2,??DataTable7_3  ;; 0xf4240
        MLA      R1,R2,R1,R0
//   46   PITx pitx = pit_init_structure.PIT_Pitx;
        LDRB     R0,[SP, #+4]
//   47   PIT_ISR_CALLBACK isr_func = pit_init_structure.PIT_Isr;
        LDR      R2,[SP, #+20]
//   48   
//   49   //�������
//   50   ASSERT( pitx <= PIT3);        //�ж�ģ���
//   51   ASSERT( ldval > 0);           //�ж�ʱ����ֵ                
//   52   
//   53   //������ʱģ��ʱ��
//   54   SIM->SCGC6 |= SIM_SCGC6_PIT_MASK;
        LDR.N    R3,??DataTable7_4  ;; 0x4004803c
        LDR      R3,[R3, #+0]
        ORRS     R3,R3,#0x800000
        LDR.N    R4,??DataTable7_4  ;; 0x4004803c
        STR      R3,[R4, #+0]
//   55   
//   56   // ���� PIT
//   57   PIT->MCR = 0x00;
        MOVS     R3,#+0
        LDR.N    R4,??DataTable7_5  ;; 0x40037000
        STR      R3,[R4, #+0]
//   58  
//   59   if(isr_func != NULL){
        MOVS     R3,R2
        CMP      R3,#+0
        BEQ.N    ??LPLD_PIT_Init_0
//   60     PIT_ISR[pitx] = isr_func;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R3,??DataTable7_6
        STR      R2,[R3, R0, LSL #+2]
//   61     //ʹ���ж�
//   62     PIT->CHANNEL[pitx].TCTRL = PIT_TCTRL_TIE_MASK;
        MOVS     R2,#+2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R3,??DataTable7_7  ;; 0x40037100
        ADDS     R3,R3,R0, LSL #+4
        STR      R2,[R3, #+8]
//   63     //��NVIC��ʹ��PIT�ж�
//   64     //enable_irq((IRQn_Type)(PIT0_IRQn + (IRQn_Type)pitx)); 
//   65   }
//   66   
//   67   //period = (period_ns/bus_period_ns)-1
//   68   PIT->CHANNEL[pitx].LDVAL = ldval-1;
??LPLD_PIT_Init_0:
        SUBS     R1,R1,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R2,R0,#+4
        LDR.N    R3,??DataTable7_7  ;; 0x40037100
        STR      R1,[R2, R3]
//   69   //ʹ���ж�
//   70   //PIT->CHANNEL[pitx].TCTRL = PIT_TCTRL_TIE_MASK;
//   71   //��ʼ��ʱ
//   72   PIT->CHANNEL[pitx].TCTRL |= PIT_TCTRL_TEN_MASK;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R1,??DataTable7_7  ;; 0x40037100
        ADDS     R1,R1,R0, LSL #+4
        LDR      R1,[R1, #+8]
        ORRS     R1,R1,#0x1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R2,??DataTable7_7  ;; 0x40037100
        ADDS     R0,R2,R0, LSL #+4
        STR      R1,[R0, #+8]
//   73   
//   74   return 1;
        MOVS     R0,#+1
        POP      {R4}
        ADD      SP,SP,#+16
        BX       LR               ;; return
//   75 }
//   76 
//   77 /*
//   78  * LPLD_PIT_Deinit
//   79  * PIT����ʼ���������ر�ѡ���PITx
//   80  * 
//   81  * ����:
//   82  *    pit_init_structure--PIT��ʼ���ṹ�壬
//   83  *                        ���嶨���PIT_InitTypeDef
//   84  *
//   85  * ���:
//   86  *    ��
//   87  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   88 void LPLD_PIT_Deinit(PIT_InitTypeDef pit_init_structure)
//   89 { 
LPLD_PIT_Deinit:
        PUSH     {R0-R3}
        PUSH     {R4,LR}
//   90   PITx pitx = pit_init_structure.PIT_Pitx;
        LDRB     R4,[SP, #+8]
//   91   
//   92   //�������
//   93   ASSERT( pitx <= PIT3);        //�ж�ģ���              
//   94 
//   95   disable_irq((IRQn_Type)(PIT0_IRQn + (IRQn_Type)pitx)); 
        ADDS     R0,R4,#+68
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        BL       NVIC_DisableIRQ
//   96 
//   97   //�����ж�\ֹͣ��ʱ
//   98   PIT->CHANNEL[pitx].TCTRL = 0;
        MOVS     R0,#+0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R1,??DataTable7_7  ;; 0x40037100
        ADDS     R1,R1,R4, LSL #+4
        STR      R0,[R1, #+8]
//   99 }
        POP      {R4}
        LDR      PC,[SP], #+20    ;; return
//  100 
//  101 /*
//  102  * LPLD_PIT_EnableIrq
//  103  * ʹ��PITx�ж�
//  104  * 
//  105  * ����:
//  106  *    pit_init_structure--PIT��ʼ���ṹ�壬
//  107  *                        ���嶨���PIT_InitTypeDef
//  108  *
//  109  * ���:
//  110  *    ��
//  111  *
//  112  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  113 void LPLD_PIT_EnableIrq(PIT_InitTypeDef pit_init_structure)
//  114 {
LPLD_PIT_EnableIrq:
        PUSH     {R0-R3}
        PUSH     {R7,LR}
//  115   PITx pitx = pit_init_structure.PIT_Pitx;
        LDRB     R0,[SP, #+8]
//  116   
//  117   //�������
//  118   ASSERT( pitx <= PIT3);                //�ж�PITx
//  119 
//  120   enable_irq((IRQn_Type)(PIT0_IRQn + (IRQn_Type)pitx)); 
        ADDS     R0,R0,#+68
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        BL       NVIC_EnableIRQ
//  121 }
        POP      {R0}
        LDR      PC,[SP], #+20    ;; return
//  122 
//  123 /*
//  124  * LPLD_PIT_DisableIrq
//  125  * ����PITx�ж�
//  126  * 
//  127  * ����:
//  128  *    pit_init_structure--PIT��ʼ���ṹ�壬
//  129  *                        ���嶨���PIT_InitTypeDef
//  130  *
//  131  * ���:
//  132  *    ��
//  133  *
//  134  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  135 void LPLD_PIT_DisableIrq(PIT_InitTypeDef pit_init_structure)
//  136 {
LPLD_PIT_DisableIrq:
        PUSH     {R0-R3}
        PUSH     {R7,LR}
//  137   PITx pitx = pit_init_structure.PIT_Pitx;
        LDRB     R0,[SP, #+8]
//  138   
//  139   //�������
//  140   ASSERT( pitx <= PIT3);                //�ж�PITx
//  141   
//  142   disable_irq((IRQn_Type)(PIT0_IRQn + (IRQn_Type)pitx));
        ADDS     R0,R0,#+68
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        BL       NVIC_DisableIRQ
//  143 }
        POP      {R0}
        LDR      PC,[SP], #+20    ;; return
//  144 
//  145 
//  146 /*
//  147  * PIT0--PIT3�жϴ�������
//  148  * �������ļ�startup_K60.s�е��ж�����������
//  149  * �û������޸ģ������Զ������Ӧͨ���жϺ���
//  150  */
//  151 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  152 void PIT0_IRQHandler(void)
//  153 {
PIT0_IRQHandler:
        PUSH     {R7,LR}
//  154 #if (UCOS_II > 0u)
//  155   OS_CPU_SR  cpu_sr = 0u;
//  156   OS_ENTER_CRITICAL(); //��֪ϵͳ��ʱ�Ѿ��������жϷ����Ӻ���
//  157   OSIntEnter();
//  158   OS_EXIT_CRITICAL();
//  159 #endif
//  160   
//  161   //�����û��Զ����жϷ���
//  162   PIT_ISR[0]();  
        LDR.N    R0,??DataTable7_6
        LDR      R0,[R0, #+0]
        BLX      R0
//  163   //����жϱ�־λ
//  164   PIT->CHANNEL[0].TFLG |= PIT_TFLG_TIF_MASK;
        LDR.N    R0,??DataTable7_8  ;; 0x4003710c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable7_8  ;; 0x4003710c
        STR      R0,[R1, #+0]
//  165   
//  166 #if (UCOS_II > 0u)
//  167   OSIntExit();          //��֪ϵͳ��ʱ�����뿪�жϷ����Ӻ���
//  168 #endif
//  169 }
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  170 void PIT1_IRQHandler(void)
//  171 {
PIT1_IRQHandler:
        PUSH     {R7,LR}
//  172 #if (UCOS_II > 0u)
//  173   OS_CPU_SR  cpu_sr = 0u;
//  174   OS_ENTER_CRITICAL(); //��֪ϵͳ��ʱ�Ѿ��������жϷ����Ӻ���
//  175   OSIntEnter();
//  176   OS_EXIT_CRITICAL();
//  177 #endif
//  178   
//  179   //�����û��Զ����жϷ���
//  180   PIT_ISR[1]();  
        LDR.N    R0,??DataTable7_6
        LDR      R0,[R0, #+4]
        BLX      R0
//  181   //����жϱ�־λ
//  182   PIT->CHANNEL[1].TFLG |= PIT_TFLG_TIF_MASK;
        LDR.N    R0,??DataTable7_9  ;; 0x4003711c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable7_9  ;; 0x4003711c
        STR      R0,[R1, #+0]
//  183   
//  184 #if (UCOS_II > 0u)
//  185   OSIntExit();          //��֪ϵͳ��ʱ�����뿪�жϷ����Ӻ���
//  186 #endif
//  187 }
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  188 void PIT2_IRQHandler(void)
//  189 {
PIT2_IRQHandler:
        PUSH     {R7,LR}
//  190 #if (UCOS_II > 0u)
//  191   OS_CPU_SR  cpu_sr = 0u;
//  192   OS_ENTER_CRITICAL(); //��֪ϵͳ��ʱ�Ѿ��������жϷ����Ӻ���
//  193   OSIntEnter();
//  194   OS_EXIT_CRITICAL();
//  195 #endif
//  196   
//  197   //�����û��Զ����жϷ���
//  198   PIT_ISR[2]();  
        LDR.N    R0,??DataTable7_6
        LDR      R0,[R0, #+8]
        BLX      R0
//  199   //����жϱ�־λ
//  200   PIT->CHANNEL[2].TFLG |= PIT_TFLG_TIF_MASK;
        LDR.N    R0,??DataTable7_10  ;; 0x4003712c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable7_10  ;; 0x4003712c
        STR      R0,[R1, #+0]
//  201   
//  202 #if (UCOS_II > 0u)
//  203   OSIntExit();          //��֪ϵͳ��ʱ�����뿪�жϷ����Ӻ���
//  204 #endif
//  205 }
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  206 void PIT3_IRQHandler(void)
//  207 {
PIT3_IRQHandler:
        PUSH     {R7,LR}
//  208 #if (UCOS_II > 0u)
//  209   OS_CPU_SR  cpu_sr = 0u;
//  210   OS_ENTER_CRITICAL(); //��֪ϵͳ��ʱ�Ѿ��������жϷ����Ӻ���
//  211   OSIntEnter();
//  212   OS_EXIT_CRITICAL();
//  213 #endif
//  214   
//  215   //�����û��Զ����жϷ���
//  216   PIT_ISR[3]();  
        LDR.N    R0,??DataTable7_6
        LDR      R0,[R0, #+12]
        BLX      R0
//  217   //����жϱ�־λ
//  218   PIT->CHANNEL[3].TFLG |= PIT_TFLG_TIF_MASK;
        LDR.N    R0,??DataTable7_11  ;; 0x4003713c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable7_11  ;; 0x4003713c
        STR      R0,[R1, #+0]
//  219   
//  220 #if (UCOS_II > 0u)
//  221   OSIntExit();          //��֪ϵͳ��ʱ�����뿪�жϷ����Ӻ���
//  222 #endif
//  223 }
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7:
        DC32     0xe000e100

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_1:
        DC32     0xe000e180

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_2:
        DC32     g_bus_clock

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_3:
        DC32     0xf4240

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_4:
        DC32     0x4004803c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_5:
        DC32     0x40037000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_6:
        DC32     PIT_ISR

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_7:
        DC32     0x40037100

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_8:
        DC32     0x4003710c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_9:
        DC32     0x4003711c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_10:
        DC32     0x4003712c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_11:
        DC32     0x4003713c

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
//  16 bytes in section .bss
// 408 bytes in section .text
// 
// 408 bytes of CODE memory
//  16 bytes of DATA memory
//
//Errors: none
//Warnings: none