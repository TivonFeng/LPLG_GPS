///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.1.6676/W32 for ARM       26/Dec/2014  19:02:43
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        D:\LPLD_OSKinetis_V3www\project\LPLD_OV7670\app\LPLD_OV7670.c
//    Command line =  
//        D:\LPLD_OSKinetis_V3www\project\LPLD_OV7670\app\LPLD_OV7670.c -D
//        LPLD_K60 -lCN
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
//        D:\LPLD_OSKinetis_V3www\project\LPLD_OV7670\iar\RAM\List\LPLD_OV7670.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN LPLD_DMA_Init
        EXTERN LPLD_GPIO_Init
        EXTERN LPLD_GPIO_Input_8b
        EXTERN LPLD_LCD_Init
        EXTERN LPLD_LCD_SetPoint
        EXTERN LPLD_SCCB_Init
        EXTERN LPLD_SCCB_ReadReg
        EXTERN LPLD_SCCB_WriteReg
        EXTERN __aeabi_memcpy4

        PUBLIC Is_DispPhoto
        PUBLIC Pix_Data
        PUBLIC V_Cnt
        PUBLIC coloer
        PUBLIC delay
        PUBLIC dma_init
        PUBLIC dma_init_struct
        PUBLIC gpio_init
        PUBLIC main
        PUBLIC ov7670_init
        PUBLIC ov7670_show
        PUBLIC porta_isr
        PUBLIC portb_isr
        PUBLIC pta_init
        PUBLIC ptb_init
        PUBLIC ptd_init
        PUBLIC pte_init
        PUBLIC read_fifo
        PUBLIC set_ov7670reg

// D:\LPLD_OSKinetis_V3www\project\LPLD_OV7670\app\LPLD_OV7670.c
//    1 /**
//    2 * --------------基于"拉普兰德K60底层库V3"的工程（LPLD_OV7670）-----------------
//    3 * @file LPLD_OV7670.c
//    4 * @version 0.1
//    5 * @date 2013-9-29
//    6 * @brief 利用DMA模块，实现数字摄像头OV7670的图像读取。
//    7 *
//    8 * 版权所有:北京拉普兰德电子技术有限公司
//    9 * http://www.lpld.cn
//   10 * mail:support@lpld.cn
//   11 * 硬件平台:  LPLD K60 Card / LPLD K60 Nano
//   12 *
//   13 * 本工程基于"拉普兰德K60底层库V3"开发，
//   14 * 所有开源代码均在"lib"文件夹下，用户不必更改该目录下代码，
//   15 * 所有用户工程需保存在"project"文件夹下，以工程名定义文件夹名，
//   16 * 底层库使用方法见相关文档。 
//   17 *
//   18 */
//   19 #include "common.h"

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// static __interwork __softfp void NVIC_EnableIRQ(IRQn_Type)
NVIC_EnableIRQ:
        MOVS     R1,#+1
        ANDS     R2,R0,#0x1F
        LSLS     R1,R1,R2
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        LSRS     R0,R0,#+5
        LDR.N    R2,??DataTable8  ;; 0xe000e100
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
        LDR.N    R2,??DataTable8_1  ;; 0xe000e180
        STR      R1,[R2, R0, LSL #+2]
        BX       LR               ;; return
//   20 #include "DEV_SCCB.h"
//   21 #include "DEV_LCD.h"
//   22 
//   23 /****************************************
//   24 说明：
//   25 *将MiniUSB线插入RUSH Kinetis开发板的USB
//   26 插座，并连接至电脑USB接口。
//   27 *将OV7670上位机波特率设置为115200
//   28 *使用上位机查看运行结果
//   29 ****************************************/
//   30 
//   31 //图像宽度
//   32 #define H 250
//   33 //图像高度
//   34 #define V 200
//   35 #define PHOTO_SIZE H*V
//   36 
//   37 void porta_isr(void);
//   38 void portb_isr(void);
//   39 void gpio_init(void);
//   40 void dma_init(void);
//   41 
//   42 uint8 ov7670_init();
//   43 void delay(void);
//   44 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   45 GPIO_InitTypeDef pta_init;
pta_init:
        DS8 20

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   46 GPIO_InitTypeDef ptb_init;
ptb_init:
        DS8 20

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   47 GPIO_InitTypeDef pte_init;
pte_init:
        DS8 20

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   48 GPIO_InitTypeDef ptd_init;
ptd_init:
        DS8 20

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   49 DMA_InitTypeDef dma_init_struct;
dma_init_struct:
        DS8 44
//   50 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   51 uint8 Pix_Data[PHOTO_SIZE];       //采集50行 200列的图像数据  
Pix_Data:
        DS8 50000

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   52 uint32 V_Cnt;                     //行采集计数
V_Cnt:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   53 uint8 Is_DispPhoto;               //图像发送标志
Is_DispPhoto:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   54 uint16 coloer;
coloer:
        DS8 2
//   55 
//   56 #define ov7670_wrst  PTA25_O         //输出   写指针复位
//   57 #define ov7670_wr    PTA19_O         //输出   写使能
//   58 #define ov7670_rrst  PTA26_O         //输出    读指针复位
//   59 #define ov7670_rck   PTA17_O         //输出   读时钟  a16
//   60 #define ov7670_oe    PTA24_O         //输出   读时钟  a24
//   61 #define test         PTD8_O         //输出   读时钟
//   62 
//   63 uint16 read_fifo(void);
//   64 void ov7670_show(void);
//   65 void set_ov7670reg(void);
//   66 
//   67 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   68 void main (void)
//   69 {
main:
        PUSH     {R7,LR}
//   70   
//   71   //关闭全局中断
//   72   DisableInterrupts;
        CPSID    I
//   73   LPLD_LCD_Init(); 
        BL       LPLD_LCD_Init
//   74   ov7670_init();
        BL       ov7670_init
//   75   delay();
        BL       delay
//   76   
//   77   V_Cnt=0;          //行计数
        MOVS     R0,#+0
        LDR.N    R1,??DataTable8_2
        STR      R0,[R1, #+0]
//   78   Is_DispPhoto=1;   //显示图像
        MOVS     R0,#+1
        LDR.N    R1,??DataTable8_3
        STRB     R0,[R1, #+0]
//   79   
//   80   gpio_init();
        BL       gpio_init
//   81   dma_init();
        BL       dma_init
//   82   
//   83   //使能PORTA、PORTB中断
//   84   //enable_irq(PORTB_IRQn);
//   85   enable_irq(PORTA_IRQn);
        MOVS     R0,#+87
        BL       NVIC_EnableIRQ
//   86   //使能全局中断
//   87   EnableInterrupts;
        CPSIE    I
//   88   
//   89   
//   90   while(1)
//   91   {
//   92     
//   93     if(Is_DispPhoto==3)
??main_0:
        LDR.N    R0,??DataTable8_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+3
        BNE.N    ??main_0
//   94     {   
//   95       
//   96       //  Is_DispPhoto = 0;
//   97       //显示或发送图像数据
//   98       //可根据上位机软件自行修改此处
//   99       ov7670_rrst=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable8_4  ;; 0x43fe0068
        STR      R0,[R1, #+0]
//  100       ov7670_rck = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable8_5  ;; 0x43fe0044
        STR      R0,[R1, #+0]
//  101       ov7670_rck=1;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable8_5  ;; 0x43fe0044
        STR      R0,[R1, #+0]
//  102       ov7670_rrst=1;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable8_4  ;; 0x43fe0068
        STR      R0,[R1, #+0]
//  103       ov7670_rck=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable8_5  ;; 0x43fe0044
        STR      R0,[R1, #+0]
//  104       ov7670_rck=1;      
        MOVS     R0,#+1
        LDR.N    R1,??DataTable8_5  ;; 0x43fe0044
        STR      R0,[R1, #+0]
//  105       
//  106       
//  107       ov7670_show();
        BL       ov7670_show
//  108       //清PORTA中断标志
//  109       LPLD_GPIO_ClearIntFlag(PORTA);
        MOVS     R0,#-1
        LDR.N    R1,??DataTable8_6  ;; 0x400490a0
        STR      R0,[R1, #+0]
//  110       
//  111       //使能PORTA中断
//  112       Is_DispPhoto = 1;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable8_3
        STRB     R0,[R1, #+0]
//  113       enable_irq(PORTA_IRQn);
        MOVS     R0,#+87
        BL       NVIC_EnableIRQ
        B.N      ??main_0
//  114       
//  115     } 
//  116     
//  117   } 
//  118 }
//  119 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  120 void ov7670_show(void)
//  121 {
ov7670_show:
        PUSH     {R3-R5,LR}
//  122   uint16 i,j;
//  123   
//  124   for(i=0;i<240;i++)
        MOVS     R4,#+0
        B.N      ??ov7670_show_0
//  125     for(j=0;j<320;j++)
//  126     {
//  127       coloer = read_fifo();
??ov7670_show_1:
        BL       read_fifo
        LDR.N    R1,??DataTable8_7
        STRH     R0,[R1, #+0]
//  128       LPLD_LCD_SetPoint(j,i,coloer);
        LDR.N    R0,??DataTable8_7
        LDRH     R2,[R0, #+0]
        MOVS     R1,R4
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R5
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       LPLD_LCD_SetPoint
//  129     }
        ADDS     R5,R5,#+1
??ov7670_show_2:
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,#+320
        BLT.N    ??ov7670_show_1
        ADDS     R4,R4,#+1
??ov7670_show_0:
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        CMP      R4,#+240
        BGE.N    ??ov7670_show_3
        MOVS     R5,#+0
        B.N      ??ov7670_show_2
//  130   
//  131   
//  132 }
??ov7670_show_3:
        POP      {R0,R4,R5,PC}    ;; return
//  133 
//  134 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  135 uint16 read_fifo(void)
//  136 {
read_fifo:
        PUSH     {R3-R5,LR}
//  137   uint16 c1 = 0,c2 = 0 ;
        MOVS     R4,#+0
        MOVS     R5,#+0
//  138   ov7670_rck=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable8_5  ;; 0x43fe0044
        STR      R0,[R1, #+0]
//  139   c1 = LPLD_GPIO_Input_8b(PTA,6);
        MOVS     R1,#+6
        LDR.N    R0,??DataTable8_8  ;; 0x400ff000
        BL       LPLD_GPIO_Input_8b
        MOVS     R4,R0
//  140   ov7670_rck = 1;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable8_5  ;; 0x43fe0044
        STR      R0,[R1, #+0]
//  141   ov7670_rck = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable8_5  ;; 0x43fe0044
        STR      R0,[R1, #+0]
//  142   c2 = LPLD_GPIO_Input_8b(PTA,6);
        MOVS     R1,#+6
        LDR.N    R0,??DataTable8_8  ;; 0x400ff000
        BL       LPLD_GPIO_Input_8b
        MOVS     R5,R0
//  143   c1<<=8;
        LSLS     R4,R4,#+8
//  144   c2=c1|c2;
        ORRS     R5,R4,R5
//  145   return c2;  
        MOVS     R0,R5
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        POP      {R1,R4,R5,PC}    ;; return
//  146 }
//  147 
//  148 
//  149 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  150 void gpio_init()
//  151 {
gpio_init:
        PUSH     {R7,LR}
//  152   //OV数据口初始化：PTD8~PTD15
//  153   pta_init.GPIO_PTx = PTA;
        LDR.N    R0,??DataTable8_8  ;; 0x400ff000
        LDR.N    R1,??DataTable8_9
        STR      R0,[R1, #+0]
//  154   pta_init.GPIO_Dir = DIR_INPUT;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable8_9
        STRB     R0,[R1, #+12]
//  155   pta_init.GPIO_Pins = GPIO_Pin6_13;
        MOV      R0,#+16320
        LDR.N    R1,??DataTable8_9
        STR      R0,[R1, #+4]
//  156   pta_init.GPIO_PinControl = IRQC_DIS | INPUT_PULL_DIS;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable8_9
        STR      R0,[R1, #+8]
//  157   LPLD_GPIO_Init(pta_init);
        LDR.N    R1,??DataTable8_9
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_GPIO_Init
//  158   
//  159   //  //OV行信号接口初始化：PTB3-H
//  160   //  ptb_init.GPIO_PTx = PTB;
//  161   //  ptb_init.GPIO_Dir = DIR_INPUT;
//  162   //  ptb_init.GPIO_Pins = GPIO_Pin3;
//  163   //  ptb_init.GPIO_PinControl = IRQC_RI|INPUT_PULL_DOWN;
//  164   //  ptb_init.GPIO_Isr = portb_isr;
//  165   //  LPLD_GPIO_Init(ptb_init); 
//  166   
//  167   //OV场信号接口初始化：PTA5-V
//  168   pta_init.GPIO_PTx = PTA;
        LDR.N    R0,??DataTable8_8  ;; 0x400ff000
        LDR.N    R1,??DataTable8_9
        STR      R0,[R1, #+0]
//  169   pta_init.GPIO_Dir = DIR_INPUT;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable8_9
        STRB     R0,[R1, #+12]
//  170   pta_init.GPIO_Pins = GPIO_Pin5;
        MOVS     R0,#+32
        LDR.N    R1,??DataTable8_9
        STR      R0,[R1, #+4]
//  171   pta_init.GPIO_PinControl = IRQC_RI|INPUT_PULL_DOWN;
        LDR.N    R0,??DataTable8_10  ;; 0x90002
        LDR.N    R1,??DataTable8_9
        STR      R0,[R1, #+8]
//  172   pta_init.GPIO_Isr = porta_isr;
        ADR.W    R0,porta_isr
        LDR.N    R1,??DataTable8_9
        STR      R0,[R1, #+16]
//  173   LPLD_GPIO_Init(pta_init); 
        LDR.N    R1,??DataTable8_9
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_GPIO_Init
//  174   
//  175   //ov7670_wr   :PTA19
//  176   pta_init.GPIO_PTx = PTA;
        LDR.N    R0,??DataTable8_8  ;; 0x400ff000
        LDR.N    R1,??DataTable8_9
        STR      R0,[R1, #+0]
//  177   pta_init.GPIO_Pins = GPIO_Pin14 |GPIO_Pin19 | GPIO_Pin26 | GPIO_Pin17  | GPIO_Pin25;
        LDR.N    R0,??DataTable8_11  ;; 0x60a4000
        LDR.N    R1,??DataTable8_9
        STR      R0,[R1, #+4]
//  178   pta_init.GPIO_Dir = OUTPUT_H;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable8_9
        STRB     R0,[R1, #+12]
//  179   pta_init.GPIO_PinControl = IRQC_DIS;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable8_9
        STR      R0,[R1, #+8]
//  180   LPLD_GPIO_Init(pta_init);
        LDR.N    R1,??DataTable8_9
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_GPIO_Init
//  181   
//  182   
//  183   pta_init.GPIO_PTx = PTA;
        LDR.N    R0,??DataTable8_8  ;; 0x400ff000
        LDR.N    R1,??DataTable8_9
        STR      R0,[R1, #+0]
//  184   pta_init.GPIO_Pins = GPIO_Pin24;
        MOVS     R0,#+16777216
        LDR.N    R1,??DataTable8_9
        STR      R0,[R1, #+4]
//  185   pta_init.GPIO_Dir = OUTPUT_L;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable8_9
        STRB     R0,[R1, #+12]
//  186   pta_init.GPIO_PinControl = IRQC_DIS;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable8_9
        STR      R0,[R1, #+8]
//  187   LPLD_GPIO_Init(pta_init);
        LDR.N    R1,??DataTable8_9
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_GPIO_Init
//  188   
//  189   //OV PCLK信号接口初始化：PTE6-PCLK
//  190   //  pte_init.GPIO_PTx = PTE;
//  191   //  pte_init.GPIO_Pins = GPIO_Pin6;
//  192   //  pte_init.GPIO_Dir = DIR_INPUT;
//  193   //  pte_init.GPIO_PinControl = IRQC_DMARI | INPUT_PULL_DIS;
//  194   //  LPLD_GPIO_Init(pte_init); 
//  195   
//  196 }
        POP      {R0,PC}          ;; return
//  197 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  198 void dma_init()
//  199 {
dma_init:
        PUSH     {LR}
        SUB      SP,SP,#+28
//  200   //DMA参数配置
//  201   dma_init_struct.DMA_CHx = DMA_CH0;    //CH0通道
        MOVS     R0,#+0
        LDR.N    R1,??DataTable8_12
        STRB     R0,[R1, #+0]
//  202   dma_init_struct.DMA_Req = PORTE_DMAREQ;       //PORTE为请求源
        MOVS     R0,#+53
        LDR.N    R1,??DataTable8_12
        STRB     R0,[R1, #+1]
//  203   dma_init_struct.DMA_MajorLoopCnt = H; //主循环计数值：行采集点数，宽度
        MOVS     R0,#+250
        LDR.N    R1,??DataTable8_12
        STRH     R0,[R1, #+4]
//  204   dma_init_struct.DMA_MinorByteCnt = 1; //次循环字节计数：每次读入1字节
        MOVS     R0,#+1
        LDR.N    R1,??DataTable8_12
        STR      R0,[R1, #+8]
//  205   dma_init_struct.DMA_SourceAddr = (uint32)&PTD->PDIR+1;        //源地址：PTD8~15
        LDR.N    R0,??DataTable8_13  ;; 0x400ff0d1
        LDR.N    R1,??DataTable8_12
        STR      R0,[R1, #+12]
//  206   dma_init_struct.DMA_DestAddr = (uint32)Pix_Data;      //目的地址：存放图像的数组
        LDR.N    R0,??DataTable8_14
        LDR.N    R1,??DataTable8_12
        STR      R0,[R1, #+24]
//  207   dma_init_struct.DMA_DestAddrOffset = 1;       //目的地址偏移：每次读入增加1
        MOVS     R0,#+1
        LDR.N    R1,??DataTable8_12
        STRH     R0,[R1, #+30]
//  208   dma_init_struct.DMA_AutoDisableReq = TRUE;    //自动禁用请求
        MOVS     R0,#+1
        LDR.N    R1,??DataTable8_12
        STRB     R0,[R1, #+36]
//  209   //初始化DMA
//  210   LPLD_DMA_Init(dma_init_struct);
        LDR.N    R1,??DataTable8_12
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+44
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_DMA_Init
//  211 }
        ADD      SP,SP,#+28
        POP      {PC}             ;; return
//  212 
//  213 

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//  214 void porta_isr()
//  215 {
//  216   if(Is_DispPhoto==1 && LPLD_GPIO_IsPinxExt(PORTA, GPIO_Pin5))
porta_isr:
        LDR.N    R0,??DataTable8_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??porta_isr_0
        LDR.N    R0,??DataTable8_6  ;; 0x400490a0
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+26
        BPL.N    ??porta_isr_0
//  217   {
//  218     //    //检测到场开始信号，加载目的地址
//  219     //    LPLD_DMA_LoadDstAddr(DMA_CH0, Pix_Data);
//  220     //    //清行中断标志，防止进入无效行中断
//  221     //    LPLD_GPIO_ClearIntFlag(PORTB);
//  222     //    enable_irq(PORTB_IRQn);
//  223     
//  224     ov7670_wrst=0;  //写指针复位
        MOVS     R0,#+0
        LDR.N    R1,??DataTable8_15  ;; 0x43fe0064
        STR      R0,[R1, #+0]
//  225     ov7670_wr=1;   //写使能
        MOVS     R0,#+1
        LDR.N    R1,??DataTable8_16  ;; 0x43fe004c
        STR      R0,[R1, #+0]
//  226     Is_DispPhoto =2;
        MOVS     R0,#+2
        LDR.N    R1,??DataTable8_3
        STRB     R0,[R1, #+0]
//  227     ov7670_wr=1;   //写使能
        MOVS     R0,#+1
        LDR.N    R1,??DataTable8_16  ;; 0x43fe004c
        STR      R0,[R1, #+0]
//  228     ov7670_wrst=1;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable8_15  ;; 0x43fe0064
        STR      R0,[R1, #+0]
        B.N      ??porta_isr_1
//  229     
//  230   }
//  231   else if(Is_DispPhoto == 2 && LPLD_GPIO_IsPinxExt(PORTA, GPIO_Pin5))
??porta_isr_0:
        LDR.N    R0,??DataTable8_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+2
        BNE.N    ??porta_isr_1
        LDR.N    R0,??DataTable8_6  ;; 0x400490a0
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+26
        BPL.N    ??porta_isr_1
//  232   {
//  233     ov7670_wr=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable8_16  ;; 0x43fe004c
        STR      R0,[R1, #+0]
//  234     Is_DispPhoto = 3;
        MOVS     R0,#+3
        LDR.N    R1,??DataTable8_3
        STRB     R0,[R1, #+0]
//  235     
//  236   }
//  237   else ;
//  238   
//  239 }
??porta_isr_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  240 void portb_isr()
//  241 {
portb_isr:
        PUSH     {R7,LR}
//  242   if(LPLD_GPIO_IsPinxExt(PORTB, GPIO_Pin3))
        LDR.N    R0,??DataTable8_17  ;; 0x4004a0a0
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+28
        BPL.N    ??portb_isr_0
//  243   {
//  244     //检测到行开始信号，使能DMA请求
//  245     if(V_Cnt<V){
        LDR.N    R0,??DataTable8_2
        LDR      R0,[R0, #+0]
        CMP      R0,#+200
        BCS.N    ??portb_isr_1
//  246       LPLD_DMA_EnableReq(DMA_CH0);  
        LDR.N    R0,??DataTable8_18  ;; 0x4000800c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable8_18  ;; 0x4000800c
        STR      R0,[R1, #+0]
//  247       V_Cnt++; 
        LDR.N    R0,??DataTable8_2
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable8_2
        STR      R0,[R1, #+0]
        B.N      ??portb_isr_0
//  248     }
//  249     //行数采集已满，关闭中断
//  250     else
//  251     {
//  252       //关GPIO中断 
//  253       disable_irq(PORTA_IRQn);
??portb_isr_1:
        MOVS     R0,#+87
        BL       NVIC_DisableIRQ
//  254       disable_irq(PORTB_IRQn);
        MOVS     R0,#+88
        BL       NVIC_DisableIRQ
//  255       Is_DispPhoto = 1;//可以显示图像
        MOVS     R0,#+1
        LDR.N    R1,??DataTable8_3
        STRB     R0,[R1, #+0]
//  256       V_Cnt=0;  
        MOVS     R0,#+0
        LDR.N    R1,??DataTable8_2
        STR      R0,[R1, #+0]
//  257     }
//  258   }
//  259 }
??portb_isr_0:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8:
        DC32     0xe000e100

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_1:
        DC32     0xe000e180

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_2:
        DC32     V_Cnt

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_3:
        DC32     Is_DispPhoto

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_4:
        DC32     0x43fe0068

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_5:
        DC32     0x43fe0044

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_6:
        DC32     0x400490a0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_7:
        DC32     coloer

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_8:
        DC32     0x400ff000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_9:
        DC32     pta_init

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_10:
        DC32     0x90002

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_11:
        DC32     0x60a4000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_12:
        DC32     dma_init_struct

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_13:
        DC32     0x400ff0d1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_14:
        DC32     Pix_Data

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_15:
        DC32     0x43fe0064

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_16:
        DC32     0x43fe004c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_17:
        DC32     0x4004a0a0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_18:
        DC32     0x4000800c
//  260 
//  261 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  262 uint8 ov7670_init(void)
//  263 {
ov7670_init:
        PUSH     {R4,LR}
        SUB      SP,SP,#+8
//  264   uint16 i = 0;
        MOVS     R4,#+0
//  265   uint8 device_id = 0;
        MOVS     R0,#+0
        STRB     R0,[SP, #+0]
//  266   
//  267   LPLD_SCCB_Init();
        BL       LPLD_SCCB_Init
//  268   
//  269   delay();
        BL       delay
//  270   
//  271   //复位OV7670寄存器
//  272   while( 0 == LPLD_SCCB_WriteReg(0x12, 0x80 )) 
??ov7670_init_0:
        MOVS     R1,#+128
        MOVS     R0,#+18
        BL       LPLD_SCCB_WriteReg
        CMP      R0,#+0
        BNE.N    ??ov7670_init_1
//  273   {
//  274     i++;
        ADDS     R4,R4,#+1
//  275     if(i == 500)
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        CMP      R4,#+500
        BNE.N    ??ov7670_init_0
//  276     {
//  277       return 0 ;
        MOVS     R0,#+0
        B.N      ??ov7670_init_2
//  278     }    
//  279   }
//  280   delay();
??ov7670_init_1:
        BL       delay
//  281   
//  282   //读取设备ID
//  283   while( 0 == LPLD_SCCB_ReadReg(0x1C, &device_id, 1));	
??ov7670_init_3:
        MOVS     R2,#+1
        ADD      R1,SP,#+0
        MOVS     R0,#+28
        BL       LPLD_SCCB_ReadReg
        CMP      R0,#+0
        BEQ.N    ??ov7670_init_3
//  284   
//  285   //如果为OV7670
//  286   if(device_id == 0x7F)
        LDRB     R0,[SP, #+0]
        CMP      R0,#+127
        BNE.N    ??ov7670_init_4
//  287   {  
//  288     set_ov7670reg();
        BL       set_ov7670reg
//  289     //while( 0 == LPLD_SCCB_WriteReg(0x1E, 0x21) );
//  290     // while( 0 == LPLD_SCCB_WriteReg(0x3E, 0x19) );	
//  291     //while( 0 == LPLD_SCCB_WriteReg(0x73, 0x09) );	
//  292     //while( 0 == LPLD_SCCB_WriteReg(0x15, 0x20) );	
//  293   }
//  294   else
//  295   {
//  296     return 0;
//  297   }
//  298   
//  299   return 1;
        MOVS     R0,#+1
        B.N      ??ov7670_init_2
??ov7670_init_4:
        MOVS     R0,#+0
??ov7670_init_2:
        POP      {R1,R2,R4,PC}    ;; return
//  300 }
//  301 
//  302 /*
//  303 * 延时一段时间
//  304 */

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//  305 void delay()
//  306 {
//  307   uint16 i, n;
//  308   for(i=0;i<30000;i++)
delay:
        MOVS     R0,#+0
        B.N      ??delay_0
//  309   {
//  310     for(n=0;n<200;n++)
//  311     {
//  312       asm("nop");
??delay_1:
        nop
//  313     }
        ADDS     R1,R1,#+1
??delay_2:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R1,#+200
        BLT.N    ??delay_1
        ADDS     R0,R0,#+1
??delay_0:
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        MOVW     R1,#+30000
        CMP      R0,R1
        BGE.N    ??delay_3
        MOVS     R1,#+0
        B.N      ??delay_2
//  314   }
//  315 }
??delay_3:
        BX       LR               ;; return
//  316 
//  317 
//  318 
//  319 
//  320 
//  321 
//  322 
//  323 
//  324 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  325 void set_ov7670reg(void)
//  326 {
set_ov7670reg:
        PUSH     {R7,LR}
//  327   LPLD_SCCB_WriteReg(0x3a, 0x04);
        MOVS     R1,#+4
        MOVS     R0,#+58
        BL       LPLD_SCCB_WriteReg
//  328   LPLD_SCCB_WriteReg(0x40, 0xd0);
        MOVS     R1,#+208
        MOVS     R0,#+64
        BL       LPLD_SCCB_WriteReg
//  329   LPLD_SCCB_WriteReg(0x12, 0x14);
        MOVS     R1,#+20
        MOVS     R0,#+18
        BL       LPLD_SCCB_WriteReg
//  330   LPLD_SCCB_WriteReg(0x32, 0x80);
        MOVS     R1,#+128
        MOVS     R0,#+50
        BL       LPLD_SCCB_WriteReg
//  331   LPLD_SCCB_WriteReg(0x17, 0x16);
        MOVS     R1,#+22
        MOVS     R0,#+23
        BL       LPLD_SCCB_WriteReg
//  332   LPLD_SCCB_WriteReg(0x18, 0x04);
        MOVS     R1,#+4
        MOVS     R0,#+24
        BL       LPLD_SCCB_WriteReg
//  333   LPLD_SCCB_WriteReg(0x19, 0x02);
        MOVS     R1,#+2
        MOVS     R0,#+25
        BL       LPLD_SCCB_WriteReg
//  334   LPLD_SCCB_WriteReg(0x1a, 0x7b);
        MOVS     R1,#+123
        MOVS     R0,#+26
        BL       LPLD_SCCB_WriteReg
//  335   LPLD_SCCB_WriteReg(0x03, 0x06);
        MOVS     R1,#+6
        MOVS     R0,#+3
        BL       LPLD_SCCB_WriteReg
//  336   LPLD_SCCB_WriteReg(0x0c, 0x00);
        MOVS     R1,#+0
        MOVS     R0,#+12
        BL       LPLD_SCCB_WriteReg
//  337   LPLD_SCCB_WriteReg(0x3e, 0x00);
        MOVS     R1,#+0
        MOVS     R0,#+62
        BL       LPLD_SCCB_WriteReg
//  338   LPLD_SCCB_WriteReg(0x70, 0x3a);
        MOVS     R1,#+58
        MOVS     R0,#+112
        BL       LPLD_SCCB_WriteReg
//  339   LPLD_SCCB_WriteReg(0x71, 0x35);
        MOVS     R1,#+53
        MOVS     R0,#+113
        BL       LPLD_SCCB_WriteReg
//  340   LPLD_SCCB_WriteReg(0x72, 0x11);
        MOVS     R1,#+17
        MOVS     R0,#+114
        BL       LPLD_SCCB_WriteReg
//  341   LPLD_SCCB_WriteReg(0x73, 0x00);
        MOVS     R1,#+0
        MOVS     R0,#+115
        BL       LPLD_SCCB_WriteReg
//  342   LPLD_SCCB_WriteReg(0xa2, 0x02);
        MOVS     R1,#+2
        MOVS     R0,#+162
        BL       LPLD_SCCB_WriteReg
//  343   LPLD_SCCB_WriteReg(0x11, 0x00);//+++++++++++++++++++++++
        MOVS     R1,#+0
        MOVS     R0,#+17
        BL       LPLD_SCCB_WriteReg
//  344   
//  345   LPLD_SCCB_WriteReg(0x7a, 0x20);
        MOVS     R1,#+32
        MOVS     R0,#+122
        BL       LPLD_SCCB_WriteReg
//  346   LPLD_SCCB_WriteReg(0x7b, 0x1c);
        MOVS     R1,#+28
        MOVS     R0,#+123
        BL       LPLD_SCCB_WriteReg
//  347   LPLD_SCCB_WriteReg(0x7c, 0x28);
        MOVS     R1,#+40
        MOVS     R0,#+124
        BL       LPLD_SCCB_WriteReg
//  348   LPLD_SCCB_WriteReg(0x7d, 0x3c);
        MOVS     R1,#+60
        MOVS     R0,#+125
        BL       LPLD_SCCB_WriteReg
//  349   LPLD_SCCB_WriteReg(0x7e, 0x55);
        MOVS     R1,#+85
        MOVS     R0,#+126
        BL       LPLD_SCCB_WriteReg
//  350   LPLD_SCCB_WriteReg(0x7f, 0x68);
        MOVS     R1,#+104
        MOVS     R0,#+127
        BL       LPLD_SCCB_WriteReg
//  351   LPLD_SCCB_WriteReg(0x80, 0x76);
        MOVS     R1,#+118
        MOVS     R0,#+128
        BL       LPLD_SCCB_WriteReg
//  352   LPLD_SCCB_WriteReg(0x81, 0x80);
        MOVS     R1,#+128
        MOVS     R0,#+129
        BL       LPLD_SCCB_WriteReg
//  353   LPLD_SCCB_WriteReg(0x82, 0x88);
        MOVS     R1,#+136
        MOVS     R0,#+130
        BL       LPLD_SCCB_WriteReg
//  354   LPLD_SCCB_WriteReg(0x83, 0x8f);
        MOVS     R1,#+143
        MOVS     R0,#+131
        BL       LPLD_SCCB_WriteReg
//  355   LPLD_SCCB_WriteReg(0x84, 0x96);
        MOVS     R1,#+150
        MOVS     R0,#+132
        BL       LPLD_SCCB_WriteReg
//  356   LPLD_SCCB_WriteReg(0x85, 0xa3);
        MOVS     R1,#+163
        MOVS     R0,#+133
        BL       LPLD_SCCB_WriteReg
//  357   LPLD_SCCB_WriteReg(0x86, 0xaf);
        MOVS     R1,#+175
        MOVS     R0,#+134
        BL       LPLD_SCCB_WriteReg
//  358   LPLD_SCCB_WriteReg(0x87, 0xc4);
        MOVS     R1,#+196
        MOVS     R0,#+135
        BL       LPLD_SCCB_WriteReg
//  359   LPLD_SCCB_WriteReg(0x88, 0xd7);
        MOVS     R1,#+215
        MOVS     R0,#+136
        BL       LPLD_SCCB_WriteReg
//  360   LPLD_SCCB_WriteReg(0x89, 0xe8);
        MOVS     R1,#+232
        MOVS     R0,#+137
        BL       LPLD_SCCB_WriteReg
//  361   
//  362   LPLD_SCCB_WriteReg(0x13, 0xe0);
        MOVS     R1,#+224
        MOVS     R0,#+19
        BL       LPLD_SCCB_WriteReg
//  363   LPLD_SCCB_WriteReg(0x00, 0x00);
        MOVS     R1,#+0
        MOVS     R0,#+0
        BL       LPLD_SCCB_WriteReg
//  364   
//  365   LPLD_SCCB_WriteReg(0x10, 0x00);
        MOVS     R1,#+0
        MOVS     R0,#+16
        BL       LPLD_SCCB_WriteReg
//  366   LPLD_SCCB_WriteReg(0x0d, 0x00);
        MOVS     R1,#+0
        MOVS     R0,#+13
        BL       LPLD_SCCB_WriteReg
//  367   LPLD_SCCB_WriteReg(0x14, 0x28);
        MOVS     R1,#+40
        MOVS     R0,#+20
        BL       LPLD_SCCB_WriteReg
//  368   LPLD_SCCB_WriteReg(0xa5, 0x05);
        MOVS     R1,#+5
        MOVS     R0,#+165
        BL       LPLD_SCCB_WriteReg
//  369   LPLD_SCCB_WriteReg(0xab, 0x07);
        MOVS     R1,#+7
        MOVS     R0,#+171
        BL       LPLD_SCCB_WriteReg
//  370   LPLD_SCCB_WriteReg(0x24, 0x75);
        MOVS     R1,#+117
        MOVS     R0,#+36
        BL       LPLD_SCCB_WriteReg
//  371   LPLD_SCCB_WriteReg(0x25, 0x63);
        MOVS     R1,#+99
        MOVS     R0,#+37
        BL       LPLD_SCCB_WriteReg
//  372   LPLD_SCCB_WriteReg(0x26, 0xA5);
        MOVS     R1,#+165
        MOVS     R0,#+38
        BL       LPLD_SCCB_WriteReg
//  373   LPLD_SCCB_WriteReg(0x9f, 0x78);
        MOVS     R1,#+120
        MOVS     R0,#+159
        BL       LPLD_SCCB_WriteReg
//  374   LPLD_SCCB_WriteReg(0xa0, 0x68);
        MOVS     R1,#+104
        MOVS     R0,#+160
        BL       LPLD_SCCB_WriteReg
//  375   LPLD_SCCB_WriteReg(0xa1, 0x03);
        MOVS     R1,#+3
        MOVS     R0,#+161
        BL       LPLD_SCCB_WriteReg
//  376   LPLD_SCCB_WriteReg(0xa6, 0xdf);
        MOVS     R1,#+223
        MOVS     R0,#+166
        BL       LPLD_SCCB_WriteReg
//  377   LPLD_SCCB_WriteReg(0xa7, 0xdf);
        MOVS     R1,#+223
        MOVS     R0,#+167
        BL       LPLD_SCCB_WriteReg
//  378   LPLD_SCCB_WriteReg(0xa8, 0xf0);
        MOVS     R1,#+240
        MOVS     R0,#+168
        BL       LPLD_SCCB_WriteReg
//  379   LPLD_SCCB_WriteReg(0xa9, 0x90);
        MOVS     R1,#+144
        MOVS     R0,#+169
        BL       LPLD_SCCB_WriteReg
//  380   LPLD_SCCB_WriteReg(0xaa, 0x94);
        MOVS     R1,#+148
        MOVS     R0,#+170
        BL       LPLD_SCCB_WriteReg
//  381   LPLD_SCCB_WriteReg(0x13, 0xe5);
        MOVS     R1,#+229
        MOVS     R0,#+19
        BL       LPLD_SCCB_WriteReg
//  382   
//  383   LPLD_SCCB_WriteReg(0x0e, 0x61);
        MOVS     R1,#+97
        MOVS     R0,#+14
        BL       LPLD_SCCB_WriteReg
//  384   LPLD_SCCB_WriteReg(0x0f, 0x4b);
        MOVS     R1,#+75
        MOVS     R0,#+15
        BL       LPLD_SCCB_WriteReg
//  385   LPLD_SCCB_WriteReg(0x16, 0x02);
        MOVS     R1,#+2
        MOVS     R0,#+22
        BL       LPLD_SCCB_WriteReg
//  386   LPLD_SCCB_WriteReg(0x1e, 0x37);
        MOVS     R1,#+55
        MOVS     R0,#+30
        BL       LPLD_SCCB_WriteReg
//  387   LPLD_SCCB_WriteReg(0x21, 0x02);
        MOVS     R1,#+2
        MOVS     R0,#+33
        BL       LPLD_SCCB_WriteReg
//  388   LPLD_SCCB_WriteReg(0x22, 0x91);
        MOVS     R1,#+145
        MOVS     R0,#+34
        BL       LPLD_SCCB_WriteReg
//  389   LPLD_SCCB_WriteReg(0x29, 0x07);
        MOVS     R1,#+7
        MOVS     R0,#+41
        BL       LPLD_SCCB_WriteReg
//  390   LPLD_SCCB_WriteReg(0x33, 0x0b);
        MOVS     R1,#+11
        MOVS     R0,#+51
        BL       LPLD_SCCB_WriteReg
//  391   LPLD_SCCB_WriteReg(0x35, 0x0b);
        MOVS     R1,#+11
        MOVS     R0,#+53
        BL       LPLD_SCCB_WriteReg
//  392   LPLD_SCCB_WriteReg(0x37, 0x1d);
        MOVS     R1,#+29
        MOVS     R0,#+55
        BL       LPLD_SCCB_WriteReg
//  393   LPLD_SCCB_WriteReg(0x38, 0x71);
        MOVS     R1,#+113
        MOVS     R0,#+56
        BL       LPLD_SCCB_WriteReg
//  394   LPLD_SCCB_WriteReg(0x39, 0x2a);
        MOVS     R1,#+42
        MOVS     R0,#+57
        BL       LPLD_SCCB_WriteReg
//  395   LPLD_SCCB_WriteReg(0x3c, 0x78);
        MOVS     R1,#+120
        MOVS     R0,#+60
        BL       LPLD_SCCB_WriteReg
//  396   LPLD_SCCB_WriteReg(0x4d, 0x40);
        MOVS     R1,#+64
        MOVS     R0,#+77
        BL       LPLD_SCCB_WriteReg
//  397   LPLD_SCCB_WriteReg(0x4e, 0x20);
        MOVS     R1,#+32
        MOVS     R0,#+78
        BL       LPLD_SCCB_WriteReg
//  398   LPLD_SCCB_WriteReg(0x69, 0x00);
        MOVS     R1,#+0
        MOVS     R0,#+105
        BL       LPLD_SCCB_WriteReg
//  399   LPLD_SCCB_WriteReg(0x6b, 0x60);
        MOVS     R1,#+96
        MOVS     R0,#+107
        BL       LPLD_SCCB_WriteReg
//  400   LPLD_SCCB_WriteReg(0x74, 0x19);
        MOVS     R1,#+25
        MOVS     R0,#+116
        BL       LPLD_SCCB_WriteReg
//  401   LPLD_SCCB_WriteReg(0x8d, 0x4f);
        MOVS     R1,#+79
        MOVS     R0,#+141
        BL       LPLD_SCCB_WriteReg
//  402   LPLD_SCCB_WriteReg(0x8e, 0x00);
        MOVS     R1,#+0
        MOVS     R0,#+142
        BL       LPLD_SCCB_WriteReg
//  403   LPLD_SCCB_WriteReg(0x8f, 0x00);
        MOVS     R1,#+0
        MOVS     R0,#+143
        BL       LPLD_SCCB_WriteReg
//  404   LPLD_SCCB_WriteReg(0x90, 0x00);
        MOVS     R1,#+0
        MOVS     R0,#+144
        BL       LPLD_SCCB_WriteReg
//  405   LPLD_SCCB_WriteReg(0x91, 0x00);
        MOVS     R1,#+0
        MOVS     R0,#+145
        BL       LPLD_SCCB_WriteReg
//  406   LPLD_SCCB_WriteReg(0x92, 0x00);
        MOVS     R1,#+0
        MOVS     R0,#+146
        BL       LPLD_SCCB_WriteReg
//  407   LPLD_SCCB_WriteReg(0x96, 0x00);
        MOVS     R1,#+0
        MOVS     R0,#+150
        BL       LPLD_SCCB_WriteReg
//  408   LPLD_SCCB_WriteReg(0x9a, 0x80);
        MOVS     R1,#+128
        MOVS     R0,#+154
        BL       LPLD_SCCB_WriteReg
//  409   LPLD_SCCB_WriteReg(0xb0, 0x84);
        MOVS     R1,#+132
        MOVS     R0,#+176
        BL       LPLD_SCCB_WriteReg
//  410   LPLD_SCCB_WriteReg(0xb1, 0x0c);
        MOVS     R1,#+12
        MOVS     R0,#+177
        BL       LPLD_SCCB_WriteReg
//  411   LPLD_SCCB_WriteReg(0xb2, 0x0e);
        MOVS     R1,#+14
        MOVS     R0,#+178
        BL       LPLD_SCCB_WriteReg
//  412   LPLD_SCCB_WriteReg(0xb3, 0x82);
        MOVS     R1,#+130
        MOVS     R0,#+179
        BL       LPLD_SCCB_WriteReg
//  413   LPLD_SCCB_WriteReg(0xb8, 0x0a);
        MOVS     R1,#+10
        MOVS     R0,#+184
        BL       LPLD_SCCB_WriteReg
//  414   
//  415   
//  416   
//  417   LPLD_SCCB_WriteReg(0x43, 0x14);
        MOVS     R1,#+20
        MOVS     R0,#+67
        BL       LPLD_SCCB_WriteReg
//  418   LPLD_SCCB_WriteReg(0x44, 0xf0);
        MOVS     R1,#+240
        MOVS     R0,#+68
        BL       LPLD_SCCB_WriteReg
//  419   LPLD_SCCB_WriteReg(0x45, 0x34);
        MOVS     R1,#+52
        MOVS     R0,#+69
        BL       LPLD_SCCB_WriteReg
//  420   LPLD_SCCB_WriteReg(0x46, 0x58);
        MOVS     R1,#+88
        MOVS     R0,#+70
        BL       LPLD_SCCB_WriteReg
//  421   LPLD_SCCB_WriteReg(0x47, 0x28);
        MOVS     R1,#+40
        MOVS     R0,#+71
        BL       LPLD_SCCB_WriteReg
//  422   LPLD_SCCB_WriteReg(0x48, 0x3a);
        MOVS     R1,#+58
        MOVS     R0,#+72
        BL       LPLD_SCCB_WriteReg
//  423   LPLD_SCCB_WriteReg(0x59, 0x88);
        MOVS     R1,#+136
        MOVS     R0,#+89
        BL       LPLD_SCCB_WriteReg
//  424   LPLD_SCCB_WriteReg(0x5a, 0x88);
        MOVS     R1,#+136
        MOVS     R0,#+90
        BL       LPLD_SCCB_WriteReg
//  425   LPLD_SCCB_WriteReg(0x5b, 0x44);
        MOVS     R1,#+68
        MOVS     R0,#+91
        BL       LPLD_SCCB_WriteReg
//  426   LPLD_SCCB_WriteReg(0x5c, 0x67);
        MOVS     R1,#+103
        MOVS     R0,#+92
        BL       LPLD_SCCB_WriteReg
//  427   LPLD_SCCB_WriteReg(0x5d, 0x49);
        MOVS     R1,#+73
        MOVS     R0,#+93
        BL       LPLD_SCCB_WriteReg
//  428   LPLD_SCCB_WriteReg(0x5e, 0x0e);
        MOVS     R1,#+14
        MOVS     R0,#+94
        BL       LPLD_SCCB_WriteReg
//  429   LPLD_SCCB_WriteReg(0x64, 0x04);
        MOVS     R1,#+4
        MOVS     R0,#+100
        BL       LPLD_SCCB_WriteReg
//  430   LPLD_SCCB_WriteReg(0x65, 0x20);
        MOVS     R1,#+32
        MOVS     R0,#+101
        BL       LPLD_SCCB_WriteReg
//  431   LPLD_SCCB_WriteReg(0x66, 0x05);
        MOVS     R1,#+5
        MOVS     R0,#+102
        BL       LPLD_SCCB_WriteReg
//  432   LPLD_SCCB_WriteReg(0x94, 0x04);
        MOVS     R1,#+4
        MOVS     R0,#+148
        BL       LPLD_SCCB_WriteReg
//  433   LPLD_SCCB_WriteReg(0x95, 0x08);
        MOVS     R1,#+8
        MOVS     R0,#+149
        BL       LPLD_SCCB_WriteReg
//  434   LPLD_SCCB_WriteReg(0x6c, 0x0a);
        MOVS     R1,#+10
        MOVS     R0,#+108
        BL       LPLD_SCCB_WriteReg
//  435   LPLD_SCCB_WriteReg(0x6d, 0x55);
        MOVS     R1,#+85
        MOVS     R0,#+109
        BL       LPLD_SCCB_WriteReg
//  436   LPLD_SCCB_WriteReg(0x6e, 0x11);
        MOVS     R1,#+17
        MOVS     R0,#+110
        BL       LPLD_SCCB_WriteReg
//  437   LPLD_SCCB_WriteReg(0x6f, 0x9f);
        MOVS     R1,#+159
        MOVS     R0,#+111
        BL       LPLD_SCCB_WriteReg
//  438   LPLD_SCCB_WriteReg(0x6a, 0x40);
        MOVS     R1,#+64
        MOVS     R0,#+106
        BL       LPLD_SCCB_WriteReg
//  439   LPLD_SCCB_WriteReg(0x01, 0x40);
        MOVS     R1,#+64
        MOVS     R0,#+1
        BL       LPLD_SCCB_WriteReg
//  440   LPLD_SCCB_WriteReg(0x02, 0x40);
        MOVS     R1,#+64
        MOVS     R0,#+2
        BL       LPLD_SCCB_WriteReg
//  441   LPLD_SCCB_WriteReg(0x13, 0xe7);
        MOVS     R1,#+231
        MOVS     R0,#+19
        BL       LPLD_SCCB_WriteReg
//  442   LPLD_SCCB_WriteReg(0x15, 0x00);  
        MOVS     R1,#+0
        MOVS     R0,#+21
        BL       LPLD_SCCB_WriteReg
//  443   
//  444   
//  445   LPLD_SCCB_WriteReg(0x4f, 0x80);
        MOVS     R1,#+128
        MOVS     R0,#+79
        BL       LPLD_SCCB_WriteReg
//  446   LPLD_SCCB_WriteReg(0x50, 0x80);
        MOVS     R1,#+128
        MOVS     R0,#+80
        BL       LPLD_SCCB_WriteReg
//  447   LPLD_SCCB_WriteReg(0x51, 0x00);
        MOVS     R1,#+0
        MOVS     R0,#+81
        BL       LPLD_SCCB_WriteReg
//  448   LPLD_SCCB_WriteReg(0x52, 0x22);
        MOVS     R1,#+34
        MOVS     R0,#+82
        BL       LPLD_SCCB_WriteReg
//  449   LPLD_SCCB_WriteReg(0x53, 0x5e);
        MOVS     R1,#+94
        MOVS     R0,#+83
        BL       LPLD_SCCB_WriteReg
//  450   LPLD_SCCB_WriteReg(0x54, 0x80);
        MOVS     R1,#+128
        MOVS     R0,#+84
        BL       LPLD_SCCB_WriteReg
//  451   LPLD_SCCB_WriteReg(0x58, 0x9e);
        MOVS     R1,#+158
        MOVS     R0,#+88
        BL       LPLD_SCCB_WriteReg
//  452   
//  453   LPLD_SCCB_WriteReg(0x41, 0x08);
        MOVS     R1,#+8
        MOVS     R0,#+65
        BL       LPLD_SCCB_WriteReg
//  454   LPLD_SCCB_WriteReg(0x3f, 0x00);
        MOVS     R1,#+0
        MOVS     R0,#+63
        BL       LPLD_SCCB_WriteReg
//  455   LPLD_SCCB_WriteReg(0x75, 0x05);
        MOVS     R1,#+5
        MOVS     R0,#+117
        BL       LPLD_SCCB_WriteReg
//  456   LPLD_SCCB_WriteReg(0x76, 0xe1);
        MOVS     R1,#+225
        MOVS     R0,#+118
        BL       LPLD_SCCB_WriteReg
//  457   LPLD_SCCB_WriteReg(0x4c, 0x00);
        MOVS     R1,#+0
        MOVS     R0,#+76
        BL       LPLD_SCCB_WriteReg
//  458   LPLD_SCCB_WriteReg(0x77, 0x01);
        MOVS     R1,#+1
        MOVS     R0,#+119
        BL       LPLD_SCCB_WriteReg
//  459   LPLD_SCCB_WriteReg(0x3d, 0xc2);	
        MOVS     R1,#+194
        MOVS     R0,#+61
        BL       LPLD_SCCB_WriteReg
//  460   LPLD_SCCB_WriteReg(0x4b, 0x09);
        MOVS     R1,#+9
        MOVS     R0,#+75
        BL       LPLD_SCCB_WriteReg
//  461   LPLD_SCCB_WriteReg(0xc9, 0x60);
        MOVS     R1,#+96
        MOVS     R0,#+201
        BL       LPLD_SCCB_WriteReg
//  462   LPLD_SCCB_WriteReg(0x41, 0x38);
        MOVS     R1,#+56
        MOVS     R0,#+65
        BL       LPLD_SCCB_WriteReg
//  463   LPLD_SCCB_WriteReg(0x56, 0x40);
        MOVS     R1,#+64
        MOVS     R0,#+86
        BL       LPLD_SCCB_WriteReg
//  464   
//  465   LPLD_SCCB_WriteReg(0x34, 0x11);
        MOVS     R1,#+17
        MOVS     R0,#+52
        BL       LPLD_SCCB_WriteReg
//  466   LPLD_SCCB_WriteReg(0x3b, 0x02); 
        MOVS     R1,#+2
        MOVS     R0,#+59
        BL       LPLD_SCCB_WriteReg
//  467   
//  468   LPLD_SCCB_WriteReg(0xa4, 0x89);
        MOVS     R1,#+137
        MOVS     R0,#+164
        BL       LPLD_SCCB_WriteReg
//  469   LPLD_SCCB_WriteReg(0x96, 0x00);
        MOVS     R1,#+0
        MOVS     R0,#+150
        BL       LPLD_SCCB_WriteReg
//  470   LPLD_SCCB_WriteReg(0x97, 0x30);
        MOVS     R1,#+48
        MOVS     R0,#+151
        BL       LPLD_SCCB_WriteReg
//  471   LPLD_SCCB_WriteReg(0x98, 0x20);
        MOVS     R1,#+32
        MOVS     R0,#+152
        BL       LPLD_SCCB_WriteReg
//  472   LPLD_SCCB_WriteReg(0x99, 0x30);
        MOVS     R1,#+48
        MOVS     R0,#+153
        BL       LPLD_SCCB_WriteReg
//  473   LPLD_SCCB_WriteReg(0x9a, 0x84);
        MOVS     R1,#+132
        MOVS     R0,#+154
        BL       LPLD_SCCB_WriteReg
//  474   LPLD_SCCB_WriteReg(0x9b, 0x29);
        MOVS     R1,#+41
        MOVS     R0,#+155
        BL       LPLD_SCCB_WriteReg
//  475   LPLD_SCCB_WriteReg(0x9c, 0x03);
        MOVS     R1,#+3
        MOVS     R0,#+156
        BL       LPLD_SCCB_WriteReg
//  476   LPLD_SCCB_WriteReg(0x9d, 0x4c);
        MOVS     R1,#+76
        MOVS     R0,#+157
        BL       LPLD_SCCB_WriteReg
//  477   LPLD_SCCB_WriteReg(0x9e, 0x3f);
        MOVS     R1,#+63
        MOVS     R0,#+158
        BL       LPLD_SCCB_WriteReg
//  478   LPLD_SCCB_WriteReg(0x78, 0x04);
        MOVS     R1,#+4
        MOVS     R0,#+120
        BL       LPLD_SCCB_WriteReg
//  479   
//  480   LPLD_SCCB_WriteReg(0x79, 0x01);
        MOVS     R1,#+1
        MOVS     R0,#+121
        BL       LPLD_SCCB_WriteReg
//  481   LPLD_SCCB_WriteReg(0xc8, 0xf0);
        MOVS     R1,#+240
        MOVS     R0,#+200
        BL       LPLD_SCCB_WriteReg
//  482   LPLD_SCCB_WriteReg(0x79, 0x0f);
        MOVS     R1,#+15
        MOVS     R0,#+121
        BL       LPLD_SCCB_WriteReg
//  483   LPLD_SCCB_WriteReg(0xc8, 0x00);
        MOVS     R1,#+0
        MOVS     R0,#+200
        BL       LPLD_SCCB_WriteReg
//  484   LPLD_SCCB_WriteReg(0x79, 0x10);
        MOVS     R1,#+16
        MOVS     R0,#+121
        BL       LPLD_SCCB_WriteReg
//  485   LPLD_SCCB_WriteReg(0xc8, 0x7e);
        MOVS     R1,#+126
        MOVS     R0,#+200
        BL       LPLD_SCCB_WriteReg
//  486   LPLD_SCCB_WriteReg(0x79, 0x0a);
        MOVS     R1,#+10
        MOVS     R0,#+121
        BL       LPLD_SCCB_WriteReg
//  487   LPLD_SCCB_WriteReg(0xc8, 0x80);
        MOVS     R1,#+128
        MOVS     R0,#+200
        BL       LPLD_SCCB_WriteReg
//  488   LPLD_SCCB_WriteReg(0x79, 0x0b);
        MOVS     R1,#+11
        MOVS     R0,#+121
        BL       LPLD_SCCB_WriteReg
//  489   LPLD_SCCB_WriteReg(0xc8, 0x01);
        MOVS     R1,#+1
        MOVS     R0,#+200
        BL       LPLD_SCCB_WriteReg
//  490   LPLD_SCCB_WriteReg(0x79, 0x0c);
        MOVS     R1,#+12
        MOVS     R0,#+121
        BL       LPLD_SCCB_WriteReg
//  491   LPLD_SCCB_WriteReg(0xc8, 0x0f);
        MOVS     R1,#+15
        MOVS     R0,#+200
        BL       LPLD_SCCB_WriteReg
//  492   LPLD_SCCB_WriteReg(0x79, 0x0d);
        MOVS     R1,#+13
        MOVS     R0,#+121
        BL       LPLD_SCCB_WriteReg
//  493   LPLD_SCCB_WriteReg(0xc8, 0x20);
        MOVS     R1,#+32
        MOVS     R0,#+200
        BL       LPLD_SCCB_WriteReg
//  494   LPLD_SCCB_WriteReg(0x79, 0x09);
        MOVS     R1,#+9
        MOVS     R0,#+121
        BL       LPLD_SCCB_WriteReg
//  495   LPLD_SCCB_WriteReg(0xc8, 0x80);
        MOVS     R1,#+128
        MOVS     R0,#+200
        BL       LPLD_SCCB_WriteReg
//  496   LPLD_SCCB_WriteReg(0x79, 0x02);
        MOVS     R1,#+2
        MOVS     R0,#+121
        BL       LPLD_SCCB_WriteReg
//  497   LPLD_SCCB_WriteReg(0xc8, 0xc0);
        MOVS     R1,#+192
        MOVS     R0,#+200
        BL       LPLD_SCCB_WriteReg
//  498   LPLD_SCCB_WriteReg(0x79, 0x03);
        MOVS     R1,#+3
        MOVS     R0,#+121
        BL       LPLD_SCCB_WriteReg
//  499   LPLD_SCCB_WriteReg(0xc8, 0x40);
        MOVS     R1,#+64
        MOVS     R0,#+200
        BL       LPLD_SCCB_WriteReg
//  500   LPLD_SCCB_WriteReg(0x79, 0x05);
        MOVS     R1,#+5
        MOVS     R0,#+121
        BL       LPLD_SCCB_WriteReg
//  501   LPLD_SCCB_WriteReg(0xc8, 0x30);
        MOVS     R1,#+48
        MOVS     R0,#+200
        BL       LPLD_SCCB_WriteReg
//  502   LPLD_SCCB_WriteReg(0x79, 0x26); 
        MOVS     R1,#+38
        MOVS     R0,#+121
        BL       LPLD_SCCB_WriteReg
//  503   LPLD_SCCB_WriteReg(0x09, 0x00);	
        MOVS     R1,#+0
        MOVS     R0,#+9
        BL       LPLD_SCCB_WriteReg
//  504 }
        POP      {R0,PC}          ;; return

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
// 50 131 bytes in section .bss
//  2 176 bytes in section .text
// 
//  2 176 bytes of CODE memory
// 50 131 bytes of DATA memory
//
//Errors: none
//Warnings: none
