///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.1.6676/W32 for ARM       23/Apr/2015  14:23:19
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  G:\test\LPLD_OSKinetis_V3_now02\lib\LPLD\HW\HW_SPI.c
//    Command line =  
//        G:\test\LPLD_OSKinetis_V3_now02\lib\LPLD\HW\HW_SPI.c -D LPLD_K60 -lCN
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
//        G:\test\LPLD_OSKinetis_V3_now02\project\LPLD_OV7670\iar\FLASH\List\HW_SPI.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        PUBLIC LPLD_SPI_Deinit
        PUBLIC LPLD_SPI_DisableIrq
        PUBLIC LPLD_SPI_EnableIrq
        PUBLIC LPLD_SPI_Init
        PUBLIC LPLD_SPI_Master_Read
        PUBLIC LPLD_SPI_Master_Write
        PUBLIC LPLD_SPI_Master_WriteRead
        PUBLIC SPI0_IRQHandler
        PUBLIC SPI0_ISR
        PUBLIC SPI1_IRQHandler
        PUBLIC SPI1_ISR
        PUBLIC SPI2_IRQHandler
        PUBLIC SPI2_ISR

// G:\test\LPLD_OSKinetis_V3_now02\lib\LPLD\HW\HW_SPI.c
//    1 /**
//    2  * @file HW_SPI.c
//    3  * @version 3.03[By LPLD]
//    4  * @date 2014-2-10
//    5  * @brief SPI底层模块相关函数
//    6  *
//    7  * 更改建议:不建议修改
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
        LDR.W    R2,??DataTable8  ;; 0xe000e100
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
        LDR.W    R2,??DataTable8_1  ;; 0xe000e180
        STR      R1,[R2, R0, LSL #+2]
        BX       LR               ;; return
//   23 #include "HW_SPI.h"
//   24 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   25 SPI_ISR_CALLBACK SPI0_ISR[6];
SPI0_ISR:
        DS8 24

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   26 SPI_ISR_CALLBACK SPI1_ISR[6];
SPI1_ISR:
        DS8 24

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   27 SPI_ISR_CALLBACK SPI2_ISR[6];
SPI2_ISR:
        DS8 24
//   28 
//   29 /*
//   30  * LPLD_SPI_Init
//   31  * SPI初始化函数,在该函数中选择SPI通道，初始化SPI SCK总线时钟
//   32  * 选择使能Tx，Rx FIFO，选择开启SPI外设的发送完成，发送队列结束，
//   33  * Tx FIFO队列为空，Rx FIFO队列溢出，选择FIFO的中断方式和DMA请求等
//   34  * 
//   35  * 参数:
//   36  *    spi_init_structure--SPI初始化结构体，
//   37  *                        具体定义见SPI_InitTypeDef
//   38  *
//   39  * 输出:
//   40  *    0--配置错误
//   41  *    1--配置成功
//   42  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   43 uint8 LPLD_SPI_Init(SPI_InitTypeDef spi_init_structure)
//   44 {
LPLD_SPI_Init:
        PUSH     {R0-R3}
        PUSH     {R4-R11,LR}
        SUB      SP,SP,#+28
//   45   SPI_Type * spix = spi_init_structure.SPI_SPIx;
        LDR      R0,[SP, #+64]
//   46   uint8 spi_mode = spi_init_structure.SPI_ModeSelect;
        LDRB     R1,[SP, #+68]
        STRB     R1,[SP, #+24]
//   47   uint8 sck_div = spi_init_structure.SPI_SckDivider; 
        LDRB     R1,[SP, #+69]
        STRB     R1,[SP, #+11]
//   48   boolean txFIFO_enable = spi_init_structure.SPI_EnableTxFIFO;
        LDRB     R1,[SP, #+70]
        STRB     R1,[SP, #+10]
//   49   boolean rxFIFO_enable = spi_init_structure.SPI_EnableRxFIFO;
        LDRB     R1,[SP, #+71]
        STRB     R1,[SP, #+9]
//   50   //定义SPI外设中断变量
//   51   boolean tx_complete_int = spi_init_structure.SPI_TxCompleteIntEnable;
        LDRB     R1,[SP, #+72]
//   52   boolean QueueEnd_Request_int = spi_init_structure.SPI_QueueEndIntEnable; 
        LDRB     R2,[SP, #+73]
//   53   boolean txFIFO_underflow_int = spi_init_structure.SPI_TxFIFO_UnderflowIntEnable;
        LDRB     R3,[SP, #+74]
//   54   boolean rxFIFO_overflow_int = spi_init_structure.SPI_RxFIFO_OverflowIntEnable;
        LDRB     R4,[SP, #+75]
//   55   boolean txFIFO_Fill_int = spi_init_structure.SPI_TxFIFO_FillIntEnable;
        LDRB     R5,[SP, #+76]
//   56   boolean rxFIFO_Drain_int = spi_init_structure.SPI_RxFIFO_DrainIntEnable; 
        LDRB     R6,[SP, #+77]
//   57   boolean txFIFO_req = spi_init_structure.SPI_TxFIFO_RequestSelect;
        LDRB     R7,[SP, #+78]
//   58   boolean rxFIFO_req = spi_init_structure.SPI_RxFIFO_RequestSelect;
        LDRB     LR,[SP, #+79]
//   59   //选择SPI引脚
//   60   PortPinsEnum_Type miso_pin = spi_init_structure.SPI_MisoPin;//MISO 
        LDRB     R8,[SP, #+88]
        STRB     R8,[SP, #+4]
//   61   PortPinsEnum_Type mosi_pin = spi_init_structure.SPI_MosiPin;//MOSI
        LDRB     R8,[SP, #+87]
        STRB     R8,[SP, #+3]
//   62   PortPinsEnum_Type sck_pin = spi_init_structure.SPI_SckPin;  //SCK
        LDRB     R8,[SP, #+86]
        STRB     R8,[SP, #+2]
//   63   PortPinsEnum_Type pcs0_pin = spi_init_structure.SPI_Pcs0Pin;//PCS0
        LDRB     R8,[SP, #+80]
        STRB     R8,[SP, #+1]
//   64   PortPinsEnum_Type pcs1_pin = spi_init_structure.SPI_Pcs1Pin;//PCS1
        LDRB     R8,[SP, #+81]
        STRB     R8,[SP, #+0]
//   65   PortPinsEnum_Type pcs2_pin = spi_init_structure.SPI_Pcs2Pin;//PCS2
        LDRB     R8,[SP, #+82]
        STRB     R8,[SP, #+6]
//   66   PortPinsEnum_Type pcs3_pin = spi_init_structure.SPI_Pcs3Pin;//PCS3
        LDRB     R8,[SP, #+83]
        STRB     R8,[SP, #+5]
//   67   PortPinsEnum_Type pcs4_pin = spi_init_structure.SPI_Pcs4Pin;//PCS4
        LDRB     R8,[SP, #+84]
        STRB     R8,[SP, #+8]
//   68   PortPinsEnum_Type pcs5_pin = spi_init_structure.SPI_Pcs5Pin;//PCS5
        LDRB     R8,[SP, #+85]
        STRB     R8,[SP, #+7]
//   69   //定义中断回掉函数
//   70   SPI_ISR_CALLBACK TxComplete_isr = spi_init_structure.SPI_TxCompleteIntIsr;
        LDR      R8,[SP, #+92]
        STR      R8,[SP, #+20]
//   71   SPI_ISR_CALLBACK QueueEndReq_isr = spi_init_structure.SPI_QueueEndIntIsr;
        LDR      R8,[SP, #+96]
        STR      R8,[SP, #+16]
//   72   SPI_ISR_CALLBACK UnderflowInt_isr = spi_init_structure.SPI_TxFIFO_UnderflowIntIsr;
        LDR      R8,[SP, #+100]
        STR      R8,[SP, #+12]
//   73   SPI_ISR_CALLBACK OverflowInt_isr = spi_init_structure.SPI_RxFIFO_OverflowIntIsr;
        LDR      R12,[SP, #+104]
//   74   SPI_ISR_CALLBACK FillInt_isr = spi_init_structure.SPI_TxFIFO_FillIntIsr;
        LDR      R8,[SP, #+108]
//   75   SPI_ISR_CALLBACK DrainInt_isr = spi_init_structure.SPI_RxFIFO_DrainIntIsr;
        LDR      R9,[SP, #+112]
//   76   //检测参数
//   77   ASSERT(spi_mode <= SPI_MODE_MASTER);
//   78   ASSERT(sck_div <= SPI_SCK_DIV_32768);
//   79 
//   80   if(spix == SPI0)
        LDR.W    R10,??DataTable8_2  ;; 0x4002c000
        CMP      R0,R10
        BNE.W    ??LPLD_SPI_Init_0
//   81   {
//   82     SIM->SCGC6 |= SIM_SCGC6_DSPI0_MASK;  
        LDR.W    R10,??DataTable8_3  ;; 0x4004803c
        LDR      R10,[R10, #+0]
        ORRS     R10,R10,#0x1000
        LDR.W    R11,??DataTable8_3  ;; 0x4004803c
        STR      R10,[R11, #+0]
//   83 
//   84     //选择PCS0
//   85     if(pcs0_pin == PTA14)
        LDRB     R10,[SP, #+1]
        CMP      R10,#+14
        BNE.N    ??LPLD_SPI_Init_1
//   86     {
//   87       PORTA->PCR[14] = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK;
        MOV      R10,#+576
        LDR.W    R11,??DataTable8_4  ;; 0x40049038
        STR      R10,[R11, #+0]
        B.N      ??LPLD_SPI_Init_2
//   88     }
//   89     else//pcs0_pin == PTC4
//   90     {
//   91       PORTC->PCR[4] = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK;
??LPLD_SPI_Init_1:
        MOV      R10,#+576
        LDR.W    R11,??DataTable8_5  ;; 0x4004b010
        STR      R10,[R11, #+0]
//   92     }
//   93     //选择PCS1
//   94     if(pcs1_pin == PTC3)
??LPLD_SPI_Init_2:
        LDRB     R10,[SP, #+0]
        CMP      R10,#+63
        BNE.N    ??LPLD_SPI_Init_3
//   95     {
//   96       PORTC->PCR[3]  = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK;
        MOV      R10,#+576
        LDR.W    R11,??DataTable8_6  ;; 0x4004b00c
        STR      R10,[R11, #+0]
        B.N      ??LPLD_SPI_Init_4
//   97     }
//   98     else //pcs1_pin == PTD4
//   99     {
//  100       PORTD->PCR[4] = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK;
??LPLD_SPI_Init_3:
        MOV      R10,#+576
        LDR.W    R11,??DataTable8_7  ;; 0x4004c010
        STR      R10,[R11, #+0]
//  101     }
//  102     //选择PCS2
//  103     if(pcs2_pin == PTC2)
??LPLD_SPI_Init_4:
        LDRB     R10,[SP, #+6]
        CMP      R10,#+62
        BNE.N    ??LPLD_SPI_Init_5
//  104     {
//  105       PORTC->PCR[2]  = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK;
        MOV      R10,#+576
        LDR.W    R11,??DataTable8_8  ;; 0x4004b008
        STR      R10,[R11, #+0]
        B.N      ??LPLD_SPI_Init_6
//  106     }
//  107     else //pcs2_pin == PTD5
//  108     {
//  109       PORTD->PCR[5]  = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK;
??LPLD_SPI_Init_5:
        MOV      R10,#+576
        LDR.W    R11,??DataTable8_9  ;; 0x4004c014
        STR      R10,[R11, #+0]
//  110     }
//  111     //选择PCS3
//  112     if(pcs3_pin == PTC1)
??LPLD_SPI_Init_6:
        LDRB     R10,[SP, #+5]
        CMP      R10,#+61
        BNE.N    ??LPLD_SPI_Init_7
//  113     {
//  114       PORTC->PCR[1]  = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK;
        MOV      R10,#+576
        LDR.W    R11,??DataTable8_10  ;; 0x4004b004
        STR      R10,[R11, #+0]
        B.N      ??LPLD_SPI_Init_8
//  115     }
//  116     else //pcs3_pin == PTD6
//  117     {
//  118       PORTD->PCR[6]  = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK;
??LPLD_SPI_Init_7:
        MOV      R10,#+576
        LDR.W    R11,??DataTable8_11  ;; 0x4004c018
        STR      R10,[R11, #+0]
//  119     }
//  120     //选择PCS4
//  121     if(pcs4_pin == PTC0)
??LPLD_SPI_Init_8:
        LDRB     R10,[SP, #+8]
        CMP      R10,#+60
        BNE.N    ??LPLD_SPI_Init_9
//  122     {
//  123       PORTC->PCR[0]  = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK;
        MOV      R10,#+576
        LDR.W    R11,??DataTable8_12  ;; 0x4004b000
        STR      R10,[R11, #+0]
//  124     }
//  125     //选择PCS5
//  126     if(pcs5_pin == PTB23)
??LPLD_SPI_Init_9:
        LDRB     R10,[SP, #+7]
        CMP      R10,#+55
        BNE.N    ??LPLD_SPI_Init_10
//  127     {
//  128       PORTB->PCR[23] = 0 | PORT_PCR_MUX(3) | PORT_PCR_DSE_MASK;
        MOV      R10,#+832
        LDR.W    R11,??DataTable8_13  ;; 0x4004a05c
        STR      R10,[R11, #+0]
//  129     }
//  130 
//  131     //选择SCK
//  132     if(sck_pin == PTA15)
??LPLD_SPI_Init_10:
        LDRB     R10,[SP, #+2]
        CMP      R10,#+15
        BNE.N    ??LPLD_SPI_Init_11
//  133     {
//  134       PORTA->PCR[15] = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK;//SCK
        MOV      R10,#+576
        LDR.W    R11,??DataTable8_14  ;; 0x4004903c
        STR      R10,[R11, #+0]
        B.N      ??LPLD_SPI_Init_12
//  135     }
//  136     else //sck_pin == PTC5
//  137     {
//  138       PORTC->PCR[5] = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK;//SCK
??LPLD_SPI_Init_11:
        MOV      R10,#+576
        LDR.W    R11,??DataTable8_15  ;; 0x4004b014
        STR      R10,[R11, #+0]
//  139     }
//  140     //选择MOSI
//  141     if(mosi_pin == PTA16)
??LPLD_SPI_Init_12:
        LDRB     R10,[SP, #+3]
        CMP      R10,#+16
        BNE.N    ??LPLD_SPI_Init_13
//  142     {
//  143       PORTA->PCR[16] = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK;//SOUT
        MOV      R10,#+576
        LDR.W    R11,??DataTable8_16  ;; 0x40049040
        STR      R10,[R11, #+0]
        B.N      ??LPLD_SPI_Init_14
//  144     }
//  145     else //mosi_pin == PTC6
//  146     {
//  147       PORTC->PCR[6] = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK;//SOUT
??LPLD_SPI_Init_13:
        MOV      R10,#+576
        LDR.W    R11,??DataTable8_17  ;; 0x4004b018
        STR      R10,[R11, #+0]
//  148     }
//  149     //选择MISO
//  150     if(miso_pin == PTA17)
??LPLD_SPI_Init_14:
        LDRB     R10,[SP, #+4]
        CMP      R10,#+17
        BNE.N    ??LPLD_SPI_Init_15
//  151     {
//  152       PORTA->PCR[17] = 0 | PORT_PCR_MUX(2); //SIN
        MOV      R10,#+512
        LDR.W    R11,??DataTable8_18  ;; 0x40049044
        STR      R10,[R11, #+0]
//  153     }
//  154     else //miso_pin == PTC7
//  155     {
//  156       PORTC->PCR[7] = 0 | PORT_PCR_MUX(2); //SIN
//  157     } 
//  158   
//  159   }
//  160   else if(spix == SPI1)
//  161   {
//  162     SIM->SCGC6 |= SIM_SCGC6_SPI1_MASK;
//  163     //选择PCS0
//  164     if(pcs0_pin == PTB10)
//  165     {
//  166       PORTB->PCR[10] = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK;
//  167     }
//  168     else//pcs0_pin == PTE4
//  169     {
//  170       PORTE->PCR[4] = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK;
//  171     }
//  172     //选择PCS1
//  173     if(pcs1_pin == PTB9)
//  174     {
//  175       PORTB->PCR[9]  = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK;
//  176     }
//  177     else //pcs1_pin == PTE0
//  178     {
//  179       PORTE->PCR[0] = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK;
//  180     }
//  181     //选择PCS2
//  182     if(pcs2_pin == PTE5)
//  183     {
//  184       PORTE->PCR[5]  = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK;
//  185     }
//  186 
//  187     //选择PCS3
//  188     if(pcs3_pin == PTE6)
//  189     {
//  190       PORTE->PCR[6]  = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK;
//  191     }
//  192 
//  193     //选择SCK
//  194     if(sck_pin == PTB11)
//  195     {
//  196       PORTB->PCR[11] = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK;
//  197     }
//  198     else //sck_pin == PTE2
//  199     {
//  200       PORTE->PCR[2] = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK;//SCK
//  201     }
//  202     //选择MOSI
//  203     if(mosi_pin == PTB16)
//  204     {
//  205       PORTB->PCR[16] = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK;//SOUT
//  206     }
//  207     else //mosi_pin == PTE1
//  208     {
//  209       PORTE->PCR[1] = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK;//SOUT
//  210     }
//  211     //选择MISO
//  212     if(miso_pin == PTB17)
//  213     {
//  214       PORTB->PCR[17] = 0 | PORT_PCR_MUX(2); //SIN
//  215     }
//  216     else //miso_pin == PTE3
//  217     {
//  218       PORTE->PCR[3] = 0 | PORT_PCR_MUX(2); //SIN
//  219     } 
//  220   }
//  221   else if(spix == SPI2)
//  222   {
//  223     SIM->SCGC3 |= SIM_SCGC3_SPI2_MASK;
//  224     //选择PCS0
//  225     if(pcs0_pin == PTD11)
//  226     {
//  227       PORTD->PCR[11] = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK;
//  228     }
//  229     else//pcs0_pin == PTB20
//  230     {
//  231       PORTB->PCR[20] = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK;
//  232     }
//  233     //选择PCS1
//  234     if(pcs1_pin == PTD15)
//  235     {
//  236       PORTD->PCR[15]  = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK;
//  237     }
//  238 
//  239     //选择SCK
//  240     if(sck_pin == PTD12)
//  241     {
//  242       PORTD->PCR[12] = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK;
//  243     }
//  244     else //sck_pin == PTB21
//  245     {
//  246       PORTB->PCR[21] = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK;//SCK
//  247     }
//  248     //选择MOSI
//  249     if(mosi_pin == PTD13)
//  250     {
//  251       PORTD->PCR[13] = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK;//SOUT
//  252     }
//  253     else //mosi_pin == PTB22
//  254     {
//  255       PORTB->PCR[22] = 0 | PORT_PCR_MUX(2) | PORT_PCR_DSE_MASK;//SOUT
//  256     }
//  257     //选择MISO
//  258     if(miso_pin == PTD14)
//  259     {
//  260       PORTD->PCR[14] = 0 | PORT_PCR_MUX(2); //SIN
//  261     }
//  262     else //miso_pin == PTB23
//  263     {
//  264       PORTB->PCR[23] = 0 | PORT_PCR_MUX(2); //SIN
//  265     } 
//  266   }
//  267   else
//  268     return 0;
//  269   //配置SPI MCR寄存器
//  270   spix->MCR = 0 & (~SPI_MCR_MDIS_MASK)        
//  271                 |SPI_MCR_HALT_MASK        
//  272                 |SPI_MCR_PCSIS_MASK       
//  273                 |SPI_MCR_CLR_TXF_MASK    
//  274                 |SPI_MCR_CLR_RXF_MASK;  
??LPLD_SPI_Init_16:
        LDR.W    R10,??DataTable8_19  ;; 0x3f0c01
        STR      R10,[R0, #+0]
//  275   //选择SPI 工作模式
//  276   if(spi_mode == SPI_MODE_SLAVE)
        LDRB     R10,[SP, #+24]
        CMP      R10,#+1
        BNE.W    ??LPLD_SPI_Init_17
//  277   {
//  278     spix->MCR &= ~SPI_MCR_MSTR_MASK;//从机模式  
        LDR      R10,[R0, #+0]
        LSLS     R10,R10,#+1      ;; ZeroExtS R10,R10,#+1,#+1
        LSRS     R10,R10,#+1
        STR      R10,[R0, #+0]
        B.N      ??LPLD_SPI_Init_18
//  279   }
??LPLD_SPI_Init_15:
        MOV      R10,#+512
        LDR.W    R11,??DataTable8_20  ;; 0x4004b01c
        STR      R10,[R11, #+0]
        B.N      ??LPLD_SPI_Init_16
??LPLD_SPI_Init_0:
        LDR.W    R10,??DataTable8_21  ;; 0x4002d000
        CMP      R0,R10
        BNE.N    ??LPLD_SPI_Init_19
        LDR.W    R10,??DataTable8_3  ;; 0x4004803c
        LDR      R10,[R10, #+0]
        ORRS     R10,R10,#0x2000
        LDR.W    R11,??DataTable8_3  ;; 0x4004803c
        STR      R10,[R11, #+0]
        LDRB     R10,[SP, #+1]
        CMP      R10,#+42
        BNE.N    ??LPLD_SPI_Init_20
        MOV      R10,#+576
        LDR.W    R11,??DataTable8_22  ;; 0x4004a028
        STR      R10,[R11, #+0]
        B.N      ??LPLD_SPI_Init_21
??LPLD_SPI_Init_20:
        MOV      R10,#+576
        LDR.W    R11,??DataTable8_23  ;; 0x4004d010
        STR      R10,[R11, #+0]
??LPLD_SPI_Init_21:
        LDRB     R10,[SP, #+0]
        CMP      R10,#+41
        BNE.N    ??LPLD_SPI_Init_22
        MOV      R10,#+576
        LDR.W    R11,??DataTable8_24  ;; 0x4004a024
        STR      R10,[R11, #+0]
        B.N      ??LPLD_SPI_Init_23
??LPLD_SPI_Init_22:
        MOV      R10,#+576
        LDR.W    R11,??DataTable8_25  ;; 0x4004d000
        STR      R10,[R11, #+0]
??LPLD_SPI_Init_23:
        LDRB     R10,[SP, #+6]
        CMP      R10,#+129
        BNE.N    ??LPLD_SPI_Init_24
        MOV      R10,#+576
        LDR.W    R11,??DataTable8_26  ;; 0x4004d014
        STR      R10,[R11, #+0]
??LPLD_SPI_Init_24:
        LDRB     R10,[SP, #+5]
        CMP      R10,#+130
        BNE.N    ??LPLD_SPI_Init_25
        MOV      R10,#+576
        LDR.W    R11,??DataTable8_27  ;; 0x4004d018
        STR      R10,[R11, #+0]
??LPLD_SPI_Init_25:
        LDRB     R10,[SP, #+2]
        CMP      R10,#+43
        BNE.N    ??LPLD_SPI_Init_26
        MOV      R10,#+576
        LDR.W    R11,??DataTable8_28  ;; 0x4004a02c
        STR      R10,[R11, #+0]
        B.N      ??LPLD_SPI_Init_27
??LPLD_SPI_Init_26:
        MOV      R10,#+576
        LDR.W    R11,??DataTable8_29  ;; 0x4004d008
        STR      R10,[R11, #+0]
??LPLD_SPI_Init_27:
        LDRB     R10,[SP, #+3]
        CMP      R10,#+48
        BNE.N    ??LPLD_SPI_Init_28
        MOV      R10,#+576
        LDR.W    R11,??DataTable8_30  ;; 0x4004a040
        STR      R10,[R11, #+0]
        B.N      ??LPLD_SPI_Init_29
??LPLD_SPI_Init_28:
        MOV      R10,#+576
        LDR.W    R11,??DataTable8_31  ;; 0x4004d004
        STR      R10,[R11, #+0]
??LPLD_SPI_Init_29:
        LDRB     R10,[SP, #+4]
        CMP      R10,#+49
        BNE.N    ??LPLD_SPI_Init_30
        MOV      R10,#+512
        LDR.W    R11,??DataTable8_32  ;; 0x4004a044
        STR      R10,[R11, #+0]
        B.N      ??LPLD_SPI_Init_16
??LPLD_SPI_Init_30:
        MOV      R10,#+512
        LDR.W    R11,??DataTable8_33  ;; 0x4004d00c
        STR      R10,[R11, #+0]
        B.N      ??LPLD_SPI_Init_16
??LPLD_SPI_Init_19:
        LDR.W    R10,??DataTable8_34  ;; 0x400ac000
        CMP      R0,R10
        BNE.N    ??LPLD_SPI_Init_31
        LDR.W    R10,??DataTable8_35  ;; 0x40048030
        LDR      R10,[R10, #+0]
        ORRS     R10,R10,#0x1000
        LDR.W    R11,??DataTable8_35  ;; 0x40048030
        STR      R10,[R11, #+0]
        LDRB     R10,[SP, #+1]
        CMP      R10,#+103
        BNE.N    ??LPLD_SPI_Init_32
        MOV      R10,#+576
        LDR.W    R11,??DataTable8_36  ;; 0x4004c02c
        STR      R10,[R11, #+0]
        B.N      ??LPLD_SPI_Init_33
??LPLD_SPI_Init_32:
        MOV      R10,#+576
        LDR.W    R11,??DataTable8_37  ;; 0x4004a050
        STR      R10,[R11, #+0]
??LPLD_SPI_Init_33:
        LDRB     R10,[SP, #+0]
        CMP      R10,#+107
        BNE.N    ??LPLD_SPI_Init_34
        MOV      R10,#+576
        LDR.W    R11,??DataTable8_38  ;; 0x4004c03c
        STR      R10,[R11, #+0]
??LPLD_SPI_Init_34:
        LDRB     R10,[SP, #+2]
        CMP      R10,#+104
        BNE.N    ??LPLD_SPI_Init_35
        MOV      R10,#+576
        LDR.W    R11,??DataTable8_39  ;; 0x4004c030
        STR      R10,[R11, #+0]
        B.N      ??LPLD_SPI_Init_36
??LPLD_SPI_Init_35:
        MOV      R10,#+576
        LDR.W    R11,??DataTable8_40  ;; 0x4004a054
        STR      R10,[R11, #+0]
??LPLD_SPI_Init_36:
        LDRB     R10,[SP, #+3]
        CMP      R10,#+105
        BNE.N    ??LPLD_SPI_Init_37
        MOV      R10,#+576
        LDR.W    R11,??DataTable8_41  ;; 0x4004c034
        STR      R10,[R11, #+0]
        B.N      ??LPLD_SPI_Init_38
??LPLD_SPI_Init_37:
        MOV      R10,#+576
        LDR.W    R11,??DataTable8_42  ;; 0x4004a058
        STR      R10,[R11, #+0]
??LPLD_SPI_Init_38:
        LDRB     R10,[SP, #+4]
        CMP      R10,#+106
        BNE.N    ??LPLD_SPI_Init_39
        MOV      R10,#+512
        LDR.W    R11,??DataTable8_43  ;; 0x4004c038
        STR      R10,[R11, #+0]
        B.N      ??LPLD_SPI_Init_16
??LPLD_SPI_Init_39:
        MOV      R10,#+512
        LDR.W    R11,??DataTable8_13  ;; 0x4004a05c
        STR      R10,[R11, #+0]
        B.N      ??LPLD_SPI_Init_16
??LPLD_SPI_Init_31:
        MOVS     R0,#+0
        B.N      ??LPLD_SPI_Init_40
//  280   else
//  281   {
//  282     spix->MCR |= SPI_MCR_MSTR_MASK; //主机模式 
??LPLD_SPI_Init_17:
        LDR      R10,[R0, #+0]
        ORRS     R10,R10,#0x80000000
        STR      R10,[R0, #+0]
//  283   }
//  284   //选择使能tx FIFO
//  285   if(txFIFO_enable == TRUE)
??LPLD_SPI_Init_18:
        LDRB     R10,[SP, #+10]
        CMP      R10,#+1
        BNE.N    ??LPLD_SPI_Init_41
//  286   {
//  287     spix->MCR &= ~SPI_MCR_DIS_TXF_MASK; 
        LDR      R10,[R0, #+0]
        BICS     R10,R10,#0x2000
        STR      R10,[R0, #+0]
        B.N      ??LPLD_SPI_Init_42
//  288   }
//  289   else
//  290   {
//  291     spix->MCR |= SPI_MCR_DIS_TXF_MASK;//选择传统方式
??LPLD_SPI_Init_41:
        LDR      R10,[R0, #+0]
        ORRS     R10,R10,#0x2000
        STR      R10,[R0, #+0]
//  292   }
//  293   //选择使能Rx FIFO
//  294   if(rxFIFO_enable == TRUE)
??LPLD_SPI_Init_42:
        LDRB     R10,[SP, #+9]
        CMP      R10,#+1
        BNE.N    ??LPLD_SPI_Init_43
//  295   {
//  296     spix->MCR &= ~SPI_MCR_DIS_RXF_MASK;
        LDR      R10,[R0, #+0]
        BICS     R10,R10,#0x1000
        STR      R10,[R0, #+0]
        B.N      ??LPLD_SPI_Init_44
//  297   }
//  298   else
//  299   {
//  300     spix->MCR |= SPI_MCR_DIS_RXF_MASK; //选择传统方式
??LPLD_SPI_Init_43:
        LDR      R10,[R0, #+0]
        ORRS     R10,R10,#0x1000
        STR      R10,[R0, #+0]
//  301   }
//  302   //选择使能发送完成中断
//  303   if(tx_complete_int == TRUE)
??LPLD_SPI_Init_44:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+1
        BNE.N    ??LPLD_SPI_Init_45
//  304   {
//  305     spix->RSER |= SPI_RSER_TCF_RE_MASK; 
        LDR      R10,[R0, #+48]
        ORRS     R10,R10,#0x80000000
        STR      R10,[R0, #+48]
        B.N      ??LPLD_SPI_Init_46
//  306   }
//  307   else
//  308   { 
//  309     spix->RSER &= ~SPI_RSER_TCF_RE_MASK;
??LPLD_SPI_Init_45:
        LDR      R10,[R0, #+48]
        LSLS     R10,R10,#+1      ;; ZeroExtS R10,R10,#+1,#+1
        LSRS     R10,R10,#+1
        STR      R10,[R0, #+48]
//  310   }
//  311   //选择使能发送队列结束中断
//  312   if(QueueEnd_Request_int == TRUE)
??LPLD_SPI_Init_46:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+1
        BNE.N    ??LPLD_SPI_Init_47
//  313   {
//  314     spix->RSER |=SPI_RSER_EOQF_RE_MASK;
        LDR      R10,[R0, #+48]
        ORRS     R10,R10,#0x10000000
        STR      R10,[R0, #+48]
        B.N      ??LPLD_SPI_Init_48
//  315   }
//  316   else
//  317     spix->RSER &= ~SPI_RSER_EOQF_RE_MASK;
??LPLD_SPI_Init_47:
        LDR      R10,[R0, #+48]
        BICS     R10,R10,#0x10000000
        STR      R10,[R0, #+48]
//  318   //选择使能txFIFO为空中断
//  319   if(txFIFO_underflow_int== TRUE)
??LPLD_SPI_Init_48:
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        CMP      R3,#+1
        BNE.N    ??LPLD_SPI_Init_49
//  320   {
//  321     spix->RSER |=SPI_RSER_TFUF_RE_MASK;
        LDR      R10,[R0, #+48]
        ORRS     R10,R10,#0x8000000
        STR      R10,[R0, #+48]
        B.N      ??LPLD_SPI_Init_50
//  322   }
//  323   else
//  324     spix->RSER &= ~SPI_RSER_TFUF_RE_MASK;
??LPLD_SPI_Init_49:
        LDR      R10,[R0, #+48]
        BICS     R10,R10,#0x8000000
        STR      R10,[R0, #+48]
//  325   //选择使能rxFIFO溢出中断
//  326   if(rxFIFO_overflow_int== TRUE)
??LPLD_SPI_Init_50:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+1
        BNE.N    ??LPLD_SPI_Init_51
//  327   {
//  328     spix->RSER |=SPI_RSER_RFOF_RE_MASK;
        LDR      R10,[R0, #+48]
        ORRS     R10,R10,#0x80000
        STR      R10,[R0, #+48]
        B.N      ??LPLD_SPI_Init_52
//  329   }
//  330   else
//  331   {
//  332     spix->RSER &= ~SPI_RSER_RFOF_RE_MASK;
??LPLD_SPI_Init_51:
        LDR      R10,[R0, #+48]
        BICS     R10,R10,#0x80000
        STR      R10,[R0, #+48]
//  333   }
//  334   //选择使能txFIFO有数据进入队列中断或者DMA请求
//  335   if(txFIFO_Fill_int== TRUE)
??LPLD_SPI_Init_52:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+1
        BNE.N    ??LPLD_SPI_Init_53
//  336   {
//  337     spix->RSER |=SPI_RSER_TFFF_RE_MASK;
        LDR      R10,[R0, #+48]
        ORRS     R10,R10,#0x2000000
        STR      R10,[R0, #+48]
        B.N      ??LPLD_SPI_Init_54
//  338   }
//  339   else
//  340   {
//  341     spix->RSER &= ~SPI_RSER_TFFF_RE_MASK;
??LPLD_SPI_Init_53:
        LDR      R10,[R0, #+48]
        BICS     R10,R10,#0x2000000
        STR      R10,[R0, #+48]
//  342   }
//  343   //选择使能rxFIFO非空中断或者DMA请求
//  344   if(rxFIFO_Drain_int== TRUE)
??LPLD_SPI_Init_54:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+1
        BNE.N    ??LPLD_SPI_Init_55
//  345   {
//  346     spix->RSER |=SPI_RSER_RFDF_RE_MASK;
        LDR      R10,[R0, #+48]
        ORRS     R10,R10,#0x20000
        STR      R10,[R0, #+48]
        B.N      ??LPLD_SPI_Init_56
//  347   }
//  348   else
//  349   {
//  350     spix->RSER &= ~SPI_RSER_RFDF_RE_MASK;
??LPLD_SPI_Init_55:
        LDR      R10,[R0, #+48]
        BICS     R10,R10,#0x20000
        STR      R10,[R0, #+48]
//  351   }
//  352   //选择使能txFIFO中断或者DMA请求
//  353   if(txFIFO_req == SPI_FIFO_DMAREQUEST)
??LPLD_SPI_Init_56:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+1
        BNE.N    ??LPLD_SPI_Init_57
//  354   {
//  355     spix->RSER |=SPI_RSER_TFFF_DIRS_MASK;
        LDR      R10,[R0, #+48]
        ORRS     R10,R10,#0x1000000
        STR      R10,[R0, #+48]
        B.N      ??LPLD_SPI_Init_58
//  356   }
//  357   else
//  358   {
//  359     spix->RSER &= ~SPI_RSER_TFFF_DIRS_MASK;
??LPLD_SPI_Init_57:
        LDR      R10,[R0, #+48]
        BICS     R10,R10,#0x1000000
        STR      R10,[R0, #+48]
//  360   }
//  361   //选择使能rxFIFO中断或者DMA请求
//  362   if(rxFIFO_req == SPI_FIFO_DMAREQUEST)
??LPLD_SPI_Init_58:
        UXTB     LR,LR            ;; ZeroExt  LR,LR,#+24,#+24
        CMP      LR,#+1
        BNE.N    ??LPLD_SPI_Init_59
//  363   {
//  364     spix->RSER |= SPI_RSER_RFDF_DIRS_MASK;
        LDR      R10,[R0, #+48]
        ORRS     R10,R10,#0x10000
        STR      R10,[R0, #+48]
        B.N      ??LPLD_SPI_Init_60
//  365   }
//  366   else 
//  367   {
//  368     spix->RSER &= ~SPI_RSER_RFDF_DIRS_MASK;
??LPLD_SPI_Init_59:
        LDR      R10,[R0, #+48]
        BICS     R10,R10,#0x10000
        STR      R10,[R0, #+48]
//  369   }
//  370   //添加中断回调函数
//  371 
//  372   if(spix == SPI0)
??LPLD_SPI_Init_60:
        LDR.W    R10,??DataTable8_2  ;; 0x4002c000
        CMP      R0,R10
        BNE.N    ??LPLD_SPI_Init_61
//  373   {
//  374     if(tx_complete_int == TRUE)
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+1
        BNE.N    ??LPLD_SPI_Init_62
//  375     { SPI0_ISR[SPI_TxComplete_Int] = TxComplete_isr; }
        LDR      R1,[SP, #+20]
        LDR.W    R10,??DataTable8_44
        STR      R1,[R10, #+0]
//  376     if(QueueEnd_Request_int == TRUE)
??LPLD_SPI_Init_62:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+1
        BNE.N    ??LPLD_SPI_Init_63
//  377     { SPI0_ISR[SPI_QueueEndReq_Int] = QueueEndReq_isr; }
        LDR      R1,[SP, #+16]
        LDR.W    R2,??DataTable8_44
        STR      R1,[R2, #+4]
//  378     if(txFIFO_underflow_int == TRUE)
??LPLD_SPI_Init_63:
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        CMP      R3,#+1
        BNE.N    ??LPLD_SPI_Init_64
//  379     { SPI0_ISR[SPI_TxFIFO_UnderflowInt] = UnderflowInt_isr; }
        LDR      R1,[SP, #+12]
        LDR.W    R2,??DataTable8_44
        STR      R1,[R2, #+8]
//  380     if(rxFIFO_overflow_int == TRUE)
??LPLD_SPI_Init_64:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+1
        BNE.N    ??LPLD_SPI_Init_65
//  381     { SPI0_ISR[SPI_RxFIFO_OverflowInt] = OverflowInt_isr; }
        LDR.W    R1,??DataTable8_44
        STR      R12,[R1, #+12]
//  382     if(txFIFO_Fill_int == TRUE && txFIFO_req == SPI_FIFO_INTREQUEST)
??LPLD_SPI_Init_65:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+1
        BNE.N    ??LPLD_SPI_Init_66
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+0
        BNE.N    ??LPLD_SPI_Init_66
//  383     { SPI0_ISR[SPI_TxFIFO_FillInt] = FillInt_isr; }
        LDR.W    R1,??DataTable8_44
        STR      R8,[R1, #+16]
//  384     if(rxFIFO_Drain_int == TRUE && rxFIFO_req == SPI_FIFO_INTREQUEST)
??LPLD_SPI_Init_66:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+1
        BNE.N    ??LPLD_SPI_Init_67
        UXTB     LR,LR            ;; ZeroExt  LR,LR,#+24,#+24
        CMP      LR,#+0
        BNE.N    ??LPLD_SPI_Init_67
//  385     { SPI0_ISR[SPI_RxFIFO_DrainInt] = DrainInt_isr; }
        LDR.W    R1,??DataTable8_44
        STR      R9,[R1, #+20]
        B.N      ??LPLD_SPI_Init_67
//  386   }
//  387   else if (spix == SPI1)
??LPLD_SPI_Init_61:
        LDR.W    R10,??DataTable8_21  ;; 0x4002d000
        CMP      R0,R10
        BNE.N    ??LPLD_SPI_Init_68
//  388   {
//  389     if(tx_complete_int == TRUE)
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+1
        BNE.N    ??LPLD_SPI_Init_69
//  390     { SPI1_ISR[SPI_TxComplete_Int] = TxComplete_isr; }
        LDR      R1,[SP, #+20]
        LDR.W    R10,??DataTable8_45
        STR      R1,[R10, #+0]
//  391     if(QueueEnd_Request_int == TRUE)
??LPLD_SPI_Init_69:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+1
        BNE.N    ??LPLD_SPI_Init_70
//  392     { SPI1_ISR[SPI_QueueEndReq_Int] = QueueEndReq_isr; }
        LDR      R1,[SP, #+16]
        LDR.W    R2,??DataTable8_45
        STR      R1,[R2, #+4]
//  393     if(txFIFO_underflow_int == TRUE)
??LPLD_SPI_Init_70:
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        CMP      R3,#+1
        BNE.N    ??LPLD_SPI_Init_71
//  394     { SPI1_ISR[SPI_TxFIFO_UnderflowInt] = UnderflowInt_isr; }
        LDR      R1,[SP, #+12]
        LDR.W    R2,??DataTable8_45
        STR      R1,[R2, #+8]
//  395     if(rxFIFO_overflow_int == TRUE)
??LPLD_SPI_Init_71:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+1
        BNE.N    ??LPLD_SPI_Init_72
//  396     { SPI1_ISR[SPI_RxFIFO_OverflowInt] = OverflowInt_isr; }
        LDR.W    R1,??DataTable8_45
        STR      R12,[R1, #+12]
//  397     if(txFIFO_Fill_int == TRUE && txFIFO_req == SPI_FIFO_INTREQUEST)
??LPLD_SPI_Init_72:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+1
        BNE.N    ??LPLD_SPI_Init_73
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+0
        BNE.N    ??LPLD_SPI_Init_73
//  398     { SPI1_ISR[SPI_TxFIFO_FillInt] = FillInt_isr; }
        LDR.W    R1,??DataTable8_45
        STR      R8,[R1, #+16]
//  399     if(rxFIFO_Drain_int == TRUE && rxFIFO_req == SPI_FIFO_INTREQUEST)
??LPLD_SPI_Init_73:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+1
        BNE.N    ??LPLD_SPI_Init_67
        UXTB     LR,LR            ;; ZeroExt  LR,LR,#+24,#+24
        CMP      LR,#+0
        BNE.N    ??LPLD_SPI_Init_67
//  400     { SPI1_ISR[SPI_RxFIFO_DrainInt] = DrainInt_isr; }
        LDR.W    R1,??DataTable8_45
        STR      R9,[R1, #+20]
        B.N      ??LPLD_SPI_Init_67
//  401   }
//  402   else if (spix == SPI2)
??LPLD_SPI_Init_68:
        LDR.W    R10,??DataTable8_34  ;; 0x400ac000
        CMP      R0,R10
        BNE.N    ??LPLD_SPI_Init_67
//  403   {
//  404     if(tx_complete_int == TRUE)
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+1
        BNE.N    ??LPLD_SPI_Init_74
//  405     { SPI2_ISR[SPI_TxComplete_Int] = TxComplete_isr; }
        LDR      R1,[SP, #+20]
        LDR.W    R10,??DataTable8_46
        STR      R1,[R10, #+0]
//  406     if(QueueEnd_Request_int == TRUE)
??LPLD_SPI_Init_74:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+1
        BNE.N    ??LPLD_SPI_Init_75
//  407     { SPI2_ISR[SPI_QueueEndReq_Int] = QueueEndReq_isr; }
        LDR      R1,[SP, #+16]
        LDR.W    R2,??DataTable8_46
        STR      R1,[R2, #+4]
//  408     if(txFIFO_underflow_int == TRUE)
??LPLD_SPI_Init_75:
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        CMP      R3,#+1
        BNE.N    ??LPLD_SPI_Init_76
//  409     { SPI2_ISR[SPI_TxFIFO_UnderflowInt] = UnderflowInt_isr; }
        LDR      R1,[SP, #+12]
        LDR.W    R2,??DataTable8_46
        STR      R1,[R2, #+8]
//  410     if(rxFIFO_overflow_int == TRUE)
??LPLD_SPI_Init_76:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+1
        BNE.N    ??LPLD_SPI_Init_77
//  411     { SPI2_ISR[SPI_RxFIFO_OverflowInt] = OverflowInt_isr; }
        LDR.W    R1,??DataTable8_46
        STR      R12,[R1, #+12]
//  412     if(txFIFO_Fill_int == TRUE && txFIFO_req == SPI_FIFO_INTREQUEST)
??LPLD_SPI_Init_77:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+1
        BNE.N    ??LPLD_SPI_Init_78
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+0
        BNE.N    ??LPLD_SPI_Init_78
//  413     { SPI2_ISR[SPI_TxFIFO_FillInt] = FillInt_isr; }
        LDR.W    R1,??DataTable8_46
        STR      R8,[R1, #+16]
//  414     if(rxFIFO_Drain_int == TRUE && rxFIFO_req == SPI_FIFO_INTREQUEST)
??LPLD_SPI_Init_78:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+1
        BNE.N    ??LPLD_SPI_Init_67
        UXTB     LR,LR            ;; ZeroExt  LR,LR,#+24,#+24
        CMP      LR,#+0
        BNE.N    ??LPLD_SPI_Init_67
//  415     { SPI2_ISR[SPI_RxFIFO_DrainInt] = DrainInt_isr; }
        LDR.W    R1,??DataTable8_46
        STR      R9,[R1, #+20]
//  416   }
//  417   //配置SPI CTAR寄存器，设置SPI的总线时序
//  418   spix->CTAR[0] = 0 & (~SPI_CTAR_LSBFE_MASK)
//  419                       |SPI_CTAR_DBR_MASK  
//  420                       |SPI_CTAR_PBR(0)           
//  421                       |SPI_CTAR_FMSZ(7);        
??LPLD_SPI_Init_67:
        MOVS     R1,#-1207959552
        STR      R1,[R0, #+12]
//  422                        
//  423   //设置SPI总线频率
//  424   //SCK总线频率 = g_bus_clock/ SCK_DIV_x                                             
//  425   spix->CTAR[0] |=SPI_CTAR_BR(sck_div);
        LDR      R1,[R0, #+12]
        LDRB     R2,[SP, #+11]
        ANDS     R2,R2,#0xF
        ORRS     R1,R2,R1
        STR      R1,[R0, #+12]
//  426 
//  427   //tCSC = (1/g_bus_clock) x PCSSCK x CSSCK
//  428   //tCSC = 1/50,000,000 x PCSSCK x CSSCK
//  429   spix->CTAR[0] |=SPI_CTAR_PCSSCK(1); 
        LDR      R1,[R0, #+12]
        ORRS     R1,R1,#0x400000
        STR      R1,[R0, #+12]
//  430   spix->CTAR[0] |=SPI_CTAR_CSSCK(1);  
        LDR      R1,[R0, #+12]
        ORRS     R1,R1,#0x1000
        STR      R1,[R0, #+12]
//  431   
//  432   //tDT = (1/g_bus_clock) x PDT x DT
//  433   spix->CTAR[0] |=SPI_CTAR_DT(1);
        LDR      R1,[R0, #+12]
        ORRS     R1,R1,#0x10
        STR      R1,[R0, #+12]
//  434   spix->CTAR[0] |=SPI_CTAR_PDT(1);
        LDR      R1,[R0, #+12]
        ORRS     R1,R1,#0x40000
        STR      R1,[R0, #+12]
//  435   
//  436   //Config the Delay of the last edge of SCK and the negation of PCS
//  437   //tASC = (1/g_bus_clock) x PASC x ASC
//  438   spix->CTAR[0] |=SPI_CTAR_PASC(1);
        LDR      R1,[R0, #+12]
        ORRS     R1,R1,#0x100000
        STR      R1,[R0, #+12]
//  439   spix->CTAR[0] |=SPI_CTAR_ASC(1);
        LDR      R1,[R0, #+12]
        ORRS     R1,R1,#0x100
        STR      R1,[R0, #+12]
//  440   //清除标志位
//  441   spix->SR =  SPI_SR_RFDF_MASK   
//  442               |SPI_SR_RFOF_MASK
//  443               |SPI_SR_TFFF_MASK
//  444               |SPI_SR_TFUF_MASK
//  445               |SPI_SR_TCF_MASK
//  446               |SPI_SR_EOQF_MASK;
        LDR.W    R1,??DataTable8_47  ;; 0x9a0a0000
        STR      R1,[R0, #+44]
//  447   //使能SPIx
//  448   spix->MCR &=~SPI_MCR_HALT_MASK; 
        LDR      R1,[R0, #+0]
        LSRS     R1,R1,#+1
        LSLS     R1,R1,#+1
        STR      R1,[R0, #+0]
//  449   
//  450   return 1;
        MOVS     R0,#+1
??LPLD_SPI_Init_40:
        ADD      SP,SP,#+28
        POP      {R4-R11}
        LDR      PC,[SP], #+20    ;; return
//  451 }
//  452 
//  453 /*
//  454  * LPLD_SPI_Deinit
//  455  * SPI反初始化函数,在该函数中将SPI设置成为暂停模式，关闭SPI总线时钟，
//  456  * 关闭SPI外设中断
//  457  * 
//  458  * 参数:
//  459  *    spi_init_structure--SPI初始化结构体，
//  460  *                        具体定义见SPI_InitTypeDef
//  461  *
//  462  * 输出:
//  463  *    0--配置错误
//  464  *    1--配置成功
//  465  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  466 uint8 LPLD_SPI_Deinit(SPI_InitTypeDef spi_init_structure)
//  467 {
LPLD_SPI_Deinit:
        PUSH     {R0-R3}
        PUSH     {R7,LR}
//  468   SPI_Type * spix = spi_init_structure.SPI_SPIx;
        LDR      R0,[SP, #+8]
//  469   spix->MCR |= SPI_MCR_HALT_MASK; //
        LDR      R1,[R0, #+0]
        ORRS     R1,R1,#0x1
        STR      R1,[R0, #+0]
//  470   if(spix == SPI0)
        LDR.W    R1,??DataTable8_2  ;; 0x4002c000
        CMP      R0,R1
        BNE.N    ??LPLD_SPI_Deinit_0
//  471   {
//  472     disable_irq(SPI0_IRQn);
        MOVS     R0,#+26
        BL       NVIC_DisableIRQ
//  473     SIM->SCGC6 &= ~SIM_SCGC6_DSPI0_MASK;
        LDR.W    R0,??DataTable8_3  ;; 0x4004803c
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x1000
        LDR.W    R1,??DataTable8_3  ;; 0x4004803c
        STR      R0,[R1, #+0]
//  474   }
//  475   else if(spix == SPI1)
//  476   {
//  477     disable_irq(SPI1_IRQn);
//  478     SIM->SCGC6 &= ~SIM_SCGC6_SPI1_MASK;
//  479   }
//  480   else if(spix == SPI2)
//  481   {
//  482     disable_irq(SPI2_IRQn);
//  483     SIM->SCGC3 &= ~SIM_SCGC3_SPI2_MASK;
//  484   }
//  485   else
//  486     return 0;
//  487   return 1;
??LPLD_SPI_Deinit_1:
        MOVS     R0,#+1
??LPLD_SPI_Deinit_2:
        POP      {R1}
        LDR      PC,[SP], #+20    ;; return
??LPLD_SPI_Deinit_0:
        LDR.W    R1,??DataTable8_21  ;; 0x4002d000
        CMP      R0,R1
        BNE.N    ??LPLD_SPI_Deinit_3
        MOVS     R0,#+27
        BL       NVIC_DisableIRQ
        LDR.W    R0,??DataTable8_3  ;; 0x4004803c
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x2000
        LDR.W    R1,??DataTable8_3  ;; 0x4004803c
        STR      R0,[R1, #+0]
        B.N      ??LPLD_SPI_Deinit_1
??LPLD_SPI_Deinit_3:
        LDR.W    R1,??DataTable8_34  ;; 0x400ac000
        CMP      R0,R1
        BNE.N    ??LPLD_SPI_Deinit_4
        MOVS     R0,#+28
        BL       NVIC_DisableIRQ
        LDR.W    R0,??DataTable8_35  ;; 0x40048030
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x1000
        LDR.W    R1,??DataTable8_35  ;; 0x40048030
        STR      R0,[R1, #+0]
        B.N      ??LPLD_SPI_Deinit_1
??LPLD_SPI_Deinit_4:
        MOVS     R0,#+0
        B.N      ??LPLD_SPI_Deinit_2
//  488 }
//  489 
//  490 /*
//  491  * LPLD_SPI_EnableIrq
//  492  * 使能SPI外设中断
//  493  * 
//  494  * 参数:
//  495  *    spi_init_structure--SPI初始化结构体，
//  496  *                        具体定义见SPI_InitTypeDef
//  497  *
//  498  * 输出:
//  499  *    0--配置错误
//  500  *    1--配置成功
//  501  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  502 uint8 LPLD_SPI_EnableIrq(SPI_InitTypeDef spi_init_structure)
//  503 {
LPLD_SPI_EnableIrq:
        PUSH     {R0-R3}
        PUSH     {R7,LR}
//  504   SPI_Type * spix = spi_init_structure.SPI_SPIx;
        LDR      R0,[SP, #+8]
//  505   if(spix == SPI0)
        LDR.N    R1,??DataTable8_2  ;; 0x4002c000
        CMP      R0,R1
        BNE.N    ??LPLD_SPI_EnableIrq_0
//  506   {
//  507     enable_irq(SPI0_IRQn);
        MOVS     R0,#+26
        BL       NVIC_EnableIRQ
//  508   }
//  509   else if(spix == SPI1)
//  510   {
//  511     enable_irq(SPI1_IRQn);
//  512   }
//  513   else if(spix == SPI2)
//  514   {
//  515     enable_irq(SPI2_IRQn);
//  516   }
//  517   else
//  518     return 0;
//  519 
//  520   return 1;
??LPLD_SPI_EnableIrq_1:
        MOVS     R0,#+1
??LPLD_SPI_EnableIrq_2:
        POP      {R1}
        LDR      PC,[SP], #+20    ;; return
??LPLD_SPI_EnableIrq_0:
        LDR.W    R1,??DataTable8_21  ;; 0x4002d000
        CMP      R0,R1
        BNE.N    ??LPLD_SPI_EnableIrq_3
        MOVS     R0,#+27
        BL       NVIC_EnableIRQ
        B.N      ??LPLD_SPI_EnableIrq_1
??LPLD_SPI_EnableIrq_3:
        LDR.W    R1,??DataTable8_34  ;; 0x400ac000
        CMP      R0,R1
        BNE.N    ??LPLD_SPI_EnableIrq_4
        MOVS     R0,#+28
        BL       NVIC_EnableIRQ
        B.N      ??LPLD_SPI_EnableIrq_1
??LPLD_SPI_EnableIrq_4:
        MOVS     R0,#+0
        B.N      ??LPLD_SPI_EnableIrq_2
//  521 }
//  522 
//  523 /*
//  524  * LPLD_SPI_EnableIrq
//  525  * 禁止SPI外设中断
//  526  * 
//  527  * 参数:
//  528  *    spi_init_structure--SPI初始化结构体，
//  529  *                        具体定义见SPI_InitTypeDef
//  530  *
//  531  * 输出:
//  532  *    0--配置错误
//  533  *    1--配置成功
//  534  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  535 uint8 LPLD_SPI_DisableIrq(SPI_InitTypeDef spi_init_structure)
//  536 {
LPLD_SPI_DisableIrq:
        PUSH     {R0-R3}
        PUSH     {R7,LR}
//  537   SPI_Type * spix = spi_init_structure.SPI_SPIx;
        LDR      R0,[SP, #+8]
//  538   if(spix == SPI0)
        LDR.N    R1,??DataTable8_2  ;; 0x4002c000
        CMP      R0,R1
        BNE.N    ??LPLD_SPI_DisableIrq_0
//  539   {
//  540     disable_irq(SPI0_IRQn);
        MOVS     R0,#+26
        BL       NVIC_DisableIRQ
//  541   }
//  542   else if(spix == SPI1)
//  543   {
//  544     disable_irq(SPI1_IRQn);
//  545   }
//  546   else if(spix == SPI2)
//  547   {
//  548     disable_irq(SPI2_IRQn);
//  549   }
//  550   else
//  551     return 0;
//  552   return 1;
??LPLD_SPI_DisableIrq_1:
        MOVS     R0,#+1
??LPLD_SPI_DisableIrq_2:
        POP      {R1}
        LDR      PC,[SP], #+20    ;; return
??LPLD_SPI_DisableIrq_0:
        LDR.N    R1,??DataTable8_21  ;; 0x4002d000
        CMP      R0,R1
        BNE.N    ??LPLD_SPI_DisableIrq_3
        MOVS     R0,#+27
        BL       NVIC_DisableIRQ
        B.N      ??LPLD_SPI_DisableIrq_1
??LPLD_SPI_DisableIrq_3:
        LDR.W    R1,??DataTable8_34  ;; 0x400ac000
        CMP      R0,R1
        BNE.N    ??LPLD_SPI_DisableIrq_4
        MOVS     R0,#+28
        BL       NVIC_DisableIRQ
        B.N      ??LPLD_SPI_DisableIrq_1
??LPLD_SPI_DisableIrq_4:
        MOVS     R0,#+0
        B.N      ??LPLD_SPI_DisableIrq_2
//  553 }
//  554 
//  555 /*
//  556  * LPLD_SPI_Master_WriteRead
//  557  * K60主机SPI向从机写数据，并读取从机数据
//  558  * 
//  559  * 参数:
//  560  *    spix--SPI选择
//  561  *      |__SPI0 -选择SPI0模块
//  562  *      |__SPI1 -选择SPI1模块
//  563  *      |__SPI2 -选择SPI2模块
//  564  *    data--要发送数据
//  565  *      |__单位为一个字节，8位
//  566  *    pcsx--CS片选端口号
//  567  *      |__SPI_PCS0 -0号片选(SPI0、SPI1、SPI2含有)
//  568  *      |__SPI_PCS1 -1号片选(SPI0、SPI1、SPI2含有)
//  569  *      |__SPI_PCS2 -2号片选(SPI0、SPI1含有)
//  570  *      |__SPI_PCS3 -3号片选(SPI0、SPI1含有)
//  571  *      |__SPI_PCS4 -4号片选(SPI0含有)
//  572  *      |__SPI_PCS5 -5号片选(SPI0含有)
//  573  *    pcs_state--一帧数据传输完成后CS的状态
//  574  *      |__SPI_PCS_ASSERTED -保持片选有效,PCS信号保持为低电平
//  575  *      |__SPI_PCS_INACTIVE -片选无效,PCS信号变为高电平
//  576  * 输出:
//  577  *    读取从机8位的数据
//  578  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  579 uint8 LPLD_SPI_Master_WriteRead(SPI_Type *spix,uint8 data,uint8 pcsx,uint8 pcs_state)
//  580 {
//  581   uint8 temp;
//  582   
//  583   spix->PUSHR  = (((uint32_t)(((uint32_t)(pcs_state))<<SPI_PUSHR_CONT_SHIFT))&SPI_PUSHR_CONT_MASK)
//  584                |SPI_PUSHR_CTAS(0)
//  585                |SPI_PUSHR_PCS(pcsx)
//  586                |data;                 
LPLD_SPI_Master_WriteRead:
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LSLS     R2,R2,#+16
        ANDS     R2,R2,#0x3F0000
        ORRS     R2,R2,R3, LSL #+31
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ORRS     R1,R1,R2
        STR      R1,[R0, #+52]
//  587   
//  588   while(!(spix->SR & SPI_SR_TCF_MASK));
??LPLD_SPI_Master_WriteRead_0:
        LDR      R1,[R0, #+44]
        CMP      R1,#+0
        BPL.N    ??LPLD_SPI_Master_WriteRead_0
//  589   spix->SR |= SPI_SR_TCF_MASK ;               
        LDR      R1,[R0, #+44]
        ORRS     R1,R1,#0x80000000
        STR      R1,[R0, #+44]
//  590   
//  591   while(!(spix->SR & SPI_SR_RFDF_MASK)); 
??LPLD_SPI_Master_WriteRead_1:
        LDR      R1,[R0, #+44]
        LSLS     R1,R1,#+14
        BPL.N    ??LPLD_SPI_Master_WriteRead_1
//  592   temp = (uint8)(spix->POPR & 0xff);           
        LDR      R1,[R0, #+56]
//  593   spix->SR |= SPI_SR_RFDF_MASK;                
        LDR      R2,[R0, #+44]
        ORRS     R2,R2,#0x20000
        STR      R2,[R0, #+44]
//  594   return temp;
        MOVS     R0,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return
//  595   
//  596 }
//  597 
//  598 /*
//  599  * LPLD_SPI_Master_Read
//  600  * K60主机读取从机数据
//  601  * 
//  602  * 参数:
//  603  *    spix--SPI选择
//  604  *      |__SPI0 -选择SPI0模块
//  605  *      |__SPI1 -选择SPI1模块
//  606  *      |__SPI2 -选择SPI2模块
//  607  * 输出:
//  608  *    读取从机8位的数据
//  609  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  610 uint8 LPLD_SPI_Master_Read(SPI_Type *spix)
//  611 {
//  612   uint8 temp;
//  613 
//  614   while(!(spix->SR & SPI_SR_RFDF_MASK)); //=1 RIFO is not empty
LPLD_SPI_Master_Read:
??LPLD_SPI_Master_Read_0:
        LDR      R1,[R0, #+44]
        LSLS     R1,R1,#+14
        BPL.N    ??LPLD_SPI_Master_Read_0
//  615   temp=(uint8)spix->POPR;
        LDR      R1,[R0, #+56]
//  616   spix->SR |=SPI_SR_RFDF_MASK;
        LDR      R2,[R0, #+44]
        ORRS     R2,R2,#0x20000
        STR      R2,[R0, #+44]
//  617 
//  618   return temp;
        MOVS     R0,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return
//  619 }
//  620 /*
//  621  * LPLD_SPI_Master_Write
//  622  * K60主机SPI向从机写数据
//  623  * 
//  624  * 参数:
//  625  *    spix--SPI选择
//  626  *      |__SPI0 -选择SPI0模块
//  627  *      |__SPI1 -选择SPI1模块
//  628  *      |__SPI2 -选择SPI2模块
//  629  *    data--要发送数据
//  630  *      |__单位为一个字节，8位
//  631  *    pcsx--CS片选端口号
//  632  *      |__SPI_PCS0  -0号片选(SPI0、SPI1、SPI2含有)
//  633  *      |__SPI_PCS1  -1号片选(SPI0、SPI1、SPI2含有)
//  634  *      |__SPI_PCS2  -2号片选(SPI0、SPI1含有)
//  635  *      |__SPI_PCS3  -3号片选(SPI0、SPI1含有)
//  636  *      |__SPI_PCS4  -4号片选(SPI0含有)
//  637  *      |__SPI_PCS5  -5号片选(SPI0含有)
//  638  *    pcs_state--一帧数据传输完成后CS的状态
//  639  *      |__SPI_PCS_ASSERTED -保持片选有效,PCS信号保持为低电平
//  640  *      |__SPI_PCS_INACTIVE -片选无效,PCS信号变为高电平
//  641  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  642 void LPLD_SPI_Master_Write(SPI_Type *spix,uint8 data,uint8 pcsx,uint8 pcs_state)
//  643 {  
//  644   
//  645   spix->PUSHR = (((uint32_t)(((uint32_t)(pcs_state))<<SPI_PUSHR_CONT_SHIFT)) & SPI_PUSHR_CONT_MASK)
//  646                |SPI_PUSHR_CTAS(0)
//  647                |SPI_PUSHR_PCS(pcsx)
//  648                |data; 
LPLD_SPI_Master_Write:
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LSLS     R2,R2,#+16
        ANDS     R2,R2,#0x3F0000
        ORRS     R2,R2,R3, LSL #+31
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ORRS     R1,R1,R2
        STR      R1,[R0, #+52]
//  649 
//  650   while(!(spix->SR & SPI_SR_TCF_MASK));
??LPLD_SPI_Master_Write_0:
        LDR      R1,[R0, #+44]
        CMP      R1,#+0
        BPL.N    ??LPLD_SPI_Master_Write_0
//  651   spix->SR |= SPI_SR_TCF_MASK ;            
        LDR      R1,[R0, #+44]
        ORRS     R1,R1,#0x80000000
        STR      R1,[R0, #+44]
//  652 }
        BX       LR               ;; return
//  653 
//  654 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  655 void SPI0_IRQHandler(void)
//  656 {
SPI0_IRQHandler:
        PUSH     {R7,LR}
//  657 #if (UCOS_II > 0u)
//  658   OS_CPU_SR  cpu_sr = 0u;
//  659   OS_ENTER_CRITICAL(); 
//  660   OSIntEnter();
//  661   OS_EXIT_CRITICAL();
//  662 #endif
//  663   if( SPI0->SR & SPI_SR_TCF_MASK)
        LDR.N    R0,??DataTable8_48  ;; 0x4002c02c
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BPL.N    ??SPI0_IRQHandler_0
//  664   {
//  665     SPI0_ISR[SPI_TxComplete_Int]();
        LDR.N    R0,??DataTable8_44
        LDR      R0,[R0, #+0]
        BLX      R0
//  666     SPI0->SR |= SPI_SR_TCF_MASK;
        LDR.N    R0,??DataTable8_48  ;; 0x4002c02c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x80000000
        LDR.N    R1,??DataTable8_48  ;; 0x4002c02c
        STR      R0,[R1, #+0]
        B.N      ??SPI0_IRQHandler_1
//  667   }
//  668   else if( SPI0->SR & SPI_SR_EOQF_MASK)
??SPI0_IRQHandler_0:
        LDR.N    R0,??DataTable8_48  ;; 0x4002c02c
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+3
        BPL.N    ??SPI0_IRQHandler_2
//  669   {
//  670     SPI0_ISR[SPI_QueueEndReq_Int]();
        LDR.N    R0,??DataTable8_44
        LDR      R0,[R0, #+4]
        BLX      R0
//  671     SPI0->SR |= SPI_SR_EOQF_MASK;
        LDR.N    R0,??DataTable8_48  ;; 0x4002c02c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000000
        LDR.N    R1,??DataTable8_48  ;; 0x4002c02c
        STR      R0,[R1, #+0]
        B.N      ??SPI0_IRQHandler_1
//  672   }
//  673   else if( SPI0->SR & SPI_SR_TFUF_MASK)
??SPI0_IRQHandler_2:
        LDR.N    R0,??DataTable8_48  ;; 0x4002c02c
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+4
        BPL.N    ??SPI0_IRQHandler_3
//  674   {
//  675     SPI0_ISR[SPI_TxFIFO_UnderflowInt]();
        LDR.N    R0,??DataTable8_44
        LDR      R0,[R0, #+8]
        BLX      R0
//  676     SPI0->SR |= SPI_SR_TFUF_MASK;
        LDR.N    R0,??DataTable8_48  ;; 0x4002c02c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8000000
        LDR.N    R1,??DataTable8_48  ;; 0x4002c02c
        STR      R0,[R1, #+0]
        B.N      ??SPI0_IRQHandler_1
//  677   }
//  678   else if( SPI0->SR & SPI_SR_TFFF_MASK)
??SPI0_IRQHandler_3:
        LDR.N    R0,??DataTable8_48  ;; 0x4002c02c
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+6
        BPL.N    ??SPI0_IRQHandler_4
//  679   {  
//  680     SPI0_ISR[SPI_TxFIFO_FillInt]();    
        LDR.N    R0,??DataTable8_44
        LDR      R0,[R0, #+16]
        BLX      R0
//  681     SPI0->SR |= SPI_SR_TFFF_MASK;
        LDR.N    R0,??DataTable8_48  ;; 0x4002c02c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2000000
        LDR.N    R1,??DataTable8_48  ;; 0x4002c02c
        STR      R0,[R1, #+0]
        B.N      ??SPI0_IRQHandler_1
//  682   }
//  683   else if( SPI0->SR & SPI_SR_RFOF_MASK)
??SPI0_IRQHandler_4:
        LDR.N    R0,??DataTable8_48  ;; 0x4002c02c
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+12
        BPL.N    ??SPI0_IRQHandler_5
//  684   {   
//  685     SPI0_ISR[SPI_RxFIFO_OverflowInt]();
        LDR.N    R0,??DataTable8_44
        LDR      R0,[R0, #+12]
        BLX      R0
//  686     SPI0->SR |= SPI_SR_RFOF_MASK;
        LDR.N    R0,??DataTable8_48  ;; 0x4002c02c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x80000
        LDR.N    R1,??DataTable8_48  ;; 0x4002c02c
        STR      R0,[R1, #+0]
        B.N      ??SPI0_IRQHandler_1
//  687   }
//  688   else if( SPI0->SR & SPI_SR_RFDF_MASK)
??SPI0_IRQHandler_5:
        LDR.N    R0,??DataTable8_48  ;; 0x4002c02c
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+14
        BPL.N    ??SPI0_IRQHandler_1
//  689   {
//  690     SPI0_ISR[SPI_RxFIFO_DrainInt]();
        LDR.N    R0,??DataTable8_44
        LDR      R0,[R0, #+20]
        BLX      R0
//  691     SPI0->SR |= SPI_SR_RFDF_MASK;
        LDR.N    R0,??DataTable8_48  ;; 0x4002c02c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20000
        LDR.N    R1,??DataTable8_48  ;; 0x4002c02c
        STR      R0,[R1, #+0]
//  692   }
//  693 #if (UCOS_II > 0u)
//  694   OSIntExit();          
//  695 #endif
//  696 }
??SPI0_IRQHandler_1:
        POP      {R0,PC}          ;; return
//  697 
//  698 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  699 void SPI1_IRQHandler(void)
//  700 {
SPI1_IRQHandler:
        PUSH     {R7,LR}
//  701 #if (UCOS_II > 0u)
//  702   OS_CPU_SR  cpu_sr = 0u;
//  703   OS_ENTER_CRITICAL(); 
//  704   OSIntEnter();
//  705   OS_EXIT_CRITICAL();
//  706 #endif
//  707   if( SPI1->SR & SPI_SR_TCF_MASK)
        LDR.N    R0,??DataTable8_49  ;; 0x4002d02c
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BPL.N    ??SPI1_IRQHandler_0
//  708   {
//  709     SPI1_ISR[SPI_TxComplete_Int]();
        LDR.N    R0,??DataTable8_45
        LDR      R0,[R0, #+0]
        BLX      R0
//  710     SPI1->SR |= SPI_SR_TCF_MASK;
        LDR.N    R0,??DataTable8_49  ;; 0x4002d02c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x80000000
        LDR.N    R1,??DataTable8_49  ;; 0x4002d02c
        STR      R0,[R1, #+0]
        B.N      ??SPI1_IRQHandler_1
//  711   }
//  712   else if( SPI1->SR & SPI_SR_EOQF_MASK)
??SPI1_IRQHandler_0:
        LDR.N    R0,??DataTable8_49  ;; 0x4002d02c
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+3
        BPL.N    ??SPI1_IRQHandler_2
//  713   {
//  714     SPI1_ISR[SPI_QueueEndReq_Int]();
        LDR.N    R0,??DataTable8_45
        LDR      R0,[R0, #+4]
        BLX      R0
//  715     SPI1->SR |= SPI_SR_EOQF_MASK;
        LDR.N    R0,??DataTable8_49  ;; 0x4002d02c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000000
        LDR.N    R1,??DataTable8_49  ;; 0x4002d02c
        STR      R0,[R1, #+0]
        B.N      ??SPI1_IRQHandler_1
//  716   }
//  717   else if( SPI1->SR & SPI_SR_TFUF_MASK)
??SPI1_IRQHandler_2:
        LDR.N    R0,??DataTable8_49  ;; 0x4002d02c
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+4
        BPL.N    ??SPI1_IRQHandler_3
//  718   {
//  719     SPI1_ISR[SPI_TxFIFO_UnderflowInt]();
        LDR.N    R0,??DataTable8_45
        LDR      R0,[R0, #+8]
        BLX      R0
//  720     SPI1->SR |= SPI_SR_TFUF_MASK;
        LDR.N    R0,??DataTable8_49  ;; 0x4002d02c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8000000
        LDR.N    R1,??DataTable8_49  ;; 0x4002d02c
        STR      R0,[R1, #+0]
        B.N      ??SPI1_IRQHandler_1
//  721   }
//  722   else if( SPI1->SR & SPI_SR_TFFF_MASK)
??SPI1_IRQHandler_3:
        LDR.N    R0,??DataTable8_49  ;; 0x4002d02c
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+6
        BPL.N    ??SPI1_IRQHandler_4
//  723   {  
//  724     SPI1_ISR[SPI_TxFIFO_FillInt]();    
        LDR.N    R0,??DataTable8_45
        LDR      R0,[R0, #+16]
        BLX      R0
//  725     SPI1->SR |= SPI_SR_TFFF_MASK;
        LDR.N    R0,??DataTable8_49  ;; 0x4002d02c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2000000
        LDR.N    R1,??DataTable8_49  ;; 0x4002d02c
        STR      R0,[R1, #+0]
        B.N      ??SPI1_IRQHandler_1
//  726   }
//  727   else if( SPI1->SR & SPI_SR_RFOF_MASK)
??SPI1_IRQHandler_4:
        LDR.N    R0,??DataTable8_49  ;; 0x4002d02c
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+12
        BPL.N    ??SPI1_IRQHandler_5
//  728   {   
//  729     SPI1_ISR[SPI_RxFIFO_OverflowInt]();
        LDR.N    R0,??DataTable8_45
        LDR      R0,[R0, #+12]
        BLX      R0
//  730     SPI1->SR |= SPI_SR_RFOF_MASK;
        LDR.N    R0,??DataTable8_49  ;; 0x4002d02c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x80000
        LDR.N    R1,??DataTable8_49  ;; 0x4002d02c
        STR      R0,[R1, #+0]
        B.N      ??SPI1_IRQHandler_1
//  731   }
//  732   else if( SPI1->SR & SPI_SR_RFDF_MASK)
??SPI1_IRQHandler_5:
        LDR.N    R0,??DataTable8_49  ;; 0x4002d02c
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+14
        BPL.N    ??SPI1_IRQHandler_1
//  733   {
//  734     SPI1_ISR[SPI_RxFIFO_DrainInt]();
        LDR.N    R0,??DataTable8_45
        LDR      R0,[R0, #+20]
        BLX      R0
//  735     SPI1->SR |= SPI_SR_RFDF_MASK;
        LDR.N    R0,??DataTable8_49  ;; 0x4002d02c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20000
        LDR.N    R1,??DataTable8_49  ;; 0x4002d02c
        STR      R0,[R1, #+0]
//  736   }
//  737 #if (UCOS_II > 0u)
//  738   OSIntExit();         
//  739 #endif
//  740 }
??SPI1_IRQHandler_1:
        POP      {R0,PC}          ;; return
//  741 
//  742 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  743 void SPI2_IRQHandler(void)
//  744 {
SPI2_IRQHandler:
        PUSH     {R7,LR}
//  745 #if (UCOS_II > 0u)
//  746   OS_CPU_SR  cpu_sr = 0u;
//  747   OS_ENTER_CRITICAL(); 
//  748   OSIntEnter();
//  749   OS_EXIT_CRITICAL();
//  750 #endif
//  751   if( SPI2->SR & SPI_SR_TCF_MASK)
        LDR.N    R0,??DataTable8_50  ;; 0x400ac02c
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BPL.N    ??SPI2_IRQHandler_0
//  752   {
//  753     SPI2_ISR[SPI_TxComplete_Int]();
        LDR.N    R0,??DataTable8_46
        LDR      R0,[R0, #+0]
        BLX      R0
//  754     SPI2->SR |= SPI_SR_TCF_MASK;
        LDR.N    R0,??DataTable8_50  ;; 0x400ac02c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x80000000
        LDR.N    R1,??DataTable8_50  ;; 0x400ac02c
        STR      R0,[R1, #+0]
        B.N      ??SPI2_IRQHandler_1
//  755   }
//  756   else if( SPI2->SR & SPI_SR_EOQF_MASK)
??SPI2_IRQHandler_0:
        LDR.N    R0,??DataTable8_50  ;; 0x400ac02c
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+3
        BPL.N    ??SPI2_IRQHandler_2
//  757   {
//  758     SPI2_ISR[SPI_QueueEndReq_Int]();
        LDR.N    R0,??DataTable8_46
        LDR      R0,[R0, #+4]
        BLX      R0
//  759     SPI2->SR |= SPI_SR_EOQF_MASK;
        LDR.N    R0,??DataTable8_50  ;; 0x400ac02c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000000
        LDR.N    R1,??DataTable8_50  ;; 0x400ac02c
        STR      R0,[R1, #+0]
        B.N      ??SPI2_IRQHandler_1
//  760   }
//  761   else if( SPI2->SR & SPI_SR_TFUF_MASK)
??SPI2_IRQHandler_2:
        LDR.N    R0,??DataTable8_50  ;; 0x400ac02c
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+4
        BPL.N    ??SPI2_IRQHandler_3
//  762   {
//  763     SPI2_ISR[SPI_TxFIFO_UnderflowInt]();
        LDR.N    R0,??DataTable8_46
        LDR      R0,[R0, #+8]
        BLX      R0
//  764     SPI2->SR |= SPI_SR_TFUF_MASK;
        LDR.N    R0,??DataTable8_50  ;; 0x400ac02c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8000000
        LDR.N    R1,??DataTable8_50  ;; 0x400ac02c
        STR      R0,[R1, #+0]
        B.N      ??SPI2_IRQHandler_1
//  765   }
//  766   else if( SPI2->SR & SPI_SR_TFFF_MASK)
??SPI2_IRQHandler_3:
        LDR.N    R0,??DataTable8_50  ;; 0x400ac02c
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+6
        BPL.N    ??SPI2_IRQHandler_4
//  767   {  
//  768     SPI2_ISR[SPI_TxFIFO_FillInt]();    
        LDR.N    R0,??DataTable8_46
        LDR      R0,[R0, #+16]
        BLX      R0
//  769     SPI2->SR |= SPI_SR_TFFF_MASK;
        LDR.N    R0,??DataTable8_50  ;; 0x400ac02c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2000000
        LDR.N    R1,??DataTable8_50  ;; 0x400ac02c
        STR      R0,[R1, #+0]
        B.N      ??SPI2_IRQHandler_1
//  770   }
//  771   else if( SPI2->SR & SPI_SR_RFOF_MASK)
??SPI2_IRQHandler_4:
        LDR.N    R0,??DataTable8_50  ;; 0x400ac02c
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+12
        BPL.N    ??SPI2_IRQHandler_5
//  772   {   
//  773     SPI2_ISR[SPI_RxFIFO_OverflowInt]();
        LDR.N    R0,??DataTable8_46
        LDR      R0,[R0, #+12]
        BLX      R0
//  774     SPI2->SR |= SPI_SR_RFOF_MASK;
        LDR.N    R0,??DataTable8_50  ;; 0x400ac02c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x80000
        LDR.N    R1,??DataTable8_50  ;; 0x400ac02c
        STR      R0,[R1, #+0]
        B.N      ??SPI2_IRQHandler_1
//  775   }
//  776   else if( SPI2->SR & SPI_SR_RFDF_MASK)
??SPI2_IRQHandler_5:
        LDR.N    R0,??DataTable8_50  ;; 0x400ac02c
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+14
        BPL.N    ??SPI2_IRQHandler_1
//  777   {
//  778     SPI2_ISR[SPI_RxFIFO_DrainInt]();
        LDR.N    R0,??DataTable8_46
        LDR      R0,[R0, #+20]
        BLX      R0
//  779     SPI2->SR |= SPI_SR_RFDF_MASK;
        LDR.N    R0,??DataTable8_50  ;; 0x400ac02c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20000
        LDR.N    R1,??DataTable8_50  ;; 0x400ac02c
        STR      R0,[R1, #+0]
//  780   }
//  781 #if (UCOS_II > 0u)
//  782   OSIntExit();          
//  783 #endif
//  784 }
??SPI2_IRQHandler_1:
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
        DC32     0x4002c000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_3:
        DC32     0x4004803c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_4:
        DC32     0x40049038

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_5:
        DC32     0x4004b010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_6:
        DC32     0x4004b00c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_7:
        DC32     0x4004c010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_8:
        DC32     0x4004b008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_9:
        DC32     0x4004c014

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_10:
        DC32     0x4004b004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_11:
        DC32     0x4004c018

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_12:
        DC32     0x4004b000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_13:
        DC32     0x4004a05c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_14:
        DC32     0x4004903c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_15:
        DC32     0x4004b014

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_16:
        DC32     0x40049040

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_17:
        DC32     0x4004b018

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_18:
        DC32     0x40049044

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_19:
        DC32     0x3f0c01

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_20:
        DC32     0x4004b01c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_21:
        DC32     0x4002d000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_22:
        DC32     0x4004a028

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_23:
        DC32     0x4004d010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_24:
        DC32     0x4004a024

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_25:
        DC32     0x4004d000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_26:
        DC32     0x4004d014

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_27:
        DC32     0x4004d018

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_28:
        DC32     0x4004a02c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_29:
        DC32     0x4004d008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_30:
        DC32     0x4004a040

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_31:
        DC32     0x4004d004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_32:
        DC32     0x4004a044

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_33:
        DC32     0x4004d00c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_34:
        DC32     0x400ac000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_35:
        DC32     0x40048030

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_36:
        DC32     0x4004c02c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_37:
        DC32     0x4004a050

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_38:
        DC32     0x4004c03c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_39:
        DC32     0x4004c030

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_40:
        DC32     0x4004a054

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_41:
        DC32     0x4004c034

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_42:
        DC32     0x4004a058

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_43:
        DC32     0x4004c038

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_44:
        DC32     SPI0_ISR

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_45:
        DC32     SPI1_ISR

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_46:
        DC32     SPI2_ISR

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_47:
        DC32     0x9a0a0000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_48:
        DC32     0x4002c02c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_49:
        DC32     0x4002d02c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_50:
        DC32     0x400ac02c

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  785 
//  786 
//  787 
//  788 
//  789 
// 
//    72 bytes in section .bss
// 2 890 bytes in section .text
// 
// 2 890 bytes of CODE memory
//    72 bytes of DATA memory
//
//Errors: none
//Warnings: none
