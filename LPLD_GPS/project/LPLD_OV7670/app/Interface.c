/**
 * @file Interface.c
 * @version 1.0[By finley]
 * @date 2015-04-16
 * @brief 接口初始化函数
 *
 *
 * 版权所有:宿迁学院物联网实验室
 * http://www.sqc.edu.cn
 *
 * @par
 * 本代码由宿迁学院[SQC]开发并维护，并向所有使用者开放源代码。
 * 开发者可以随意修使用或改源代码。但本段及以上注释应予以保留。
 * 不得更改或删除原版权所有者姓名，二次开发者可以加注二次版权所有者。
 * 但应在遵守此协议的基础上，开放源代码、不得出售代码本身。
 * 宿迁学院不负责由于使用本代码所带来的任何事故、法律责任或相关不良影响。
 * 宿迁学院无义务解释、说明本代码的具体原理、功能、实现方法。
 * 除非宿迁学院[SQC]授权，开发者不得将本代码用于商业产品。
 */


#include "common.h"
#include "Interface.h"
#include "SQC_OV7670.h"
#include "SQC_ME3000.h"
#include "SQC_UM220.h"
#include <stdarg.h>


UART_InitTypeDef uart0_init_struct;
UART_InitTypeDef uart1_init_struct;
UART_InitTypeDef uart2_init_struct;
UART_InitTypeDef uart3_init_struct;
UART_InitTypeDef uart4_init_struct;
UART_InitTypeDef uart5_init_struct;

GPIO_InitTypeDef pta_init;
GPIO_InitTypeDef ptb_init;
GPIO_InitTypeDef ptc_init;
GPIO_InitTypeDef pte_init;
GPIO_InitTypeDef ptd_init;
    

void uart_init(void)
{

  
  /*
  UART0   TXD0:PTB17   RXD0:PTB16      USB->UART 
  UART1   TXD1:PTE0    RXD1:PTE1       WIFI
  //UART2   TXD2:PTE0    RXD2:PTE1    
  UART3   TXD3:PTE4    RXD3:PTE5       北斗/GPS
  UART4   TXD4:PTE24   RXD4:PTE25      Zigbee
  UART5   TXD5:PTE8    RXD5:PTE9       GPRS
  */
  /*   init uart0   USB->UART  115200*/
  uart0_init_struct.UART_Uartx = UART0; //使用UART0
  uart0_init_struct.UART_BaudRate = 9600; //设置波特率115200
  uart0_init_struct.UART_RxPin = PTB16;  //接收引脚为PTE16
  uart0_init_struct.UART_TxPin = PTB17;  //发送引脚为PTE17
  uart0_init_struct.UART_RxIntEnable = TRUE;    //使能接收中断
  uart0_init_struct.UART_RxIsr = uart0_isr;      //设置接收中断函数
  LPLD_UART_Init(uart0_init_struct);//初始化UART 
  LPLD_UART_EnableIrq(uart0_init_struct);//使能UART中断
  /*   init uart1  WIFI  115200     */
  uart1_init_struct.UART_Uartx = UART1; //使用UART1
  uart1_init_struct.UART_BaudRate = 115200; //设置波特率115200
  uart1_init_struct.UART_RxPin = PTE2;  //接收引脚为PTE2
  uart1_init_struct.UART_TxPin = PTE0;  //发送引脚为PTE0
  uart1_init_struct.UART_RxIntEnable = TRUE;    //使能接收中断
  uart1_init_struct.UART_RxIsr = uart1_isr;      //设置接收中断函数
  LPLD_UART_Init(uart1_init_struct);//初始化UART 
  LPLD_UART_EnableIrq(uart1_init_struct);//使能UART中断 
  ////  /*   init uart2  */
  ////  uart2_init_struct.UART_Uartx = UART2; //使用UART2
  ////  uart2_init_struct.UART_BaudRate = 115200; //设置波特率9600
  ////  uart2_init_struct.UART_RxPin = PTE1;  //接收引脚为PTE9
  ////  uart2_init_struct.UART_TxPin = PTE0;  //发送引脚为PTE8
  ////  uart2_init_struct.UART_RxIntEnable = TRUE;    //使能接收中断
  ////  uart2_init_struct.UART_RxIsr = uart2_isr;      //设置接收中断函数
  ////  LPLD_UART_Init(uart2_init_struct);//初始化UART 
  ////  LPLD_UART_EnableIrq(uart2_init_struct);//使能UART中断
  /*   init uart3  北斗/GPS  115200  */
  uart3_init_struct.UART_Uartx = UART3; //使用UART3
  uart3_init_struct.UART_BaudRate = 9600; //设置波特率9600
  uart3_init_struct.UART_RxPin = PTE5;  //接收引脚为PTE5
  uart3_init_struct.UART_TxPin = PTE4;  //发送引脚为PTE4
  uart3_init_struct.UART_RxIntEnable = TRUE;    //使能接收中断
  uart3_init_struct.UART_RxIsr = uart3_isr;      //设置接收中断函数
  LPLD_UART_Init(uart3_init_struct);//初始化UART 
  LPLD_UART_EnableIrq(uart3_init_struct);//使能UART中断
  /*   init uart4    Zigbee */
  uart4_init_struct.UART_Uartx = UART4; //使用UART4
  uart4_init_struct.UART_BaudRate = 115200; //设置波特率115200
  uart4_init_struct.UART_RxPin = PTE25;  //接收引脚为PTE25
  uart4_init_struct.UART_TxPin = PTE24;  //发送引脚为PTE24
  uart4_init_struct.UART_RxIntEnable = TRUE;    //使能接收中断
  uart4_init_struct.UART_RxIsr = uart4_isr;      //设置接收中断函数
  LPLD_UART_Init(uart4_init_struct);//初始化UART 
  LPLD_UART_EnableIrq(uart4_init_struct);//使能UART中断
  /*   init uart5   GPRS  115200 */
  uart5_init_struct.UART_Uartx = UART5; //使用UART5
  uart5_init_struct.UART_BaudRate = 115200; //设置波特率115200
  uart5_init_struct.UART_RxPin = PTE9;  //接收引脚为PTE9
  uart5_init_struct.UART_TxPin = PTE8;  //发送引脚为PTE8
  uart5_init_struct.UART_RxIntEnable = TRUE;    //使能接收中断
  uart5_init_struct.UART_RxIsr = uart5_isr;      //设置接收中断函数
  LPLD_UART_Init(uart5_init_struct);//初始化UART 
  LPLD_UART_EnableIrq(uart5_init_struct);//使能UART中断
  
  
}

void gpio_init()
{
  /*
  wrst     PTA6
  rrst     PTA7
  oe       PTA8
  Y0~~Y7   PTA9-16
  RCK      PTA17
  VSYNC    PTA24
  wr       PTA25
  */
  //OV数据口初始化：PTD9~PTD16
  pta_init.GPIO_PTx = PTA;
  pta_init.GPIO_Dir = DIR_INPUT;
  pta_init.GPIO_Pins = GPIO_Pin9_16;
  // pta_init.GPIO_PinControl = IRQC_DIS | INPUT_PULL_DIS;
  pta_init.GPIO_PinControl = IRQC_DIS | INPUT_PULL_UP;
  LPLD_GPIO_Init(pta_init);
  
  pta_init.GPIO_PTx = PTA;
  pta_init.GPIO_Dir = DIR_INPUT;
  pta_init.GPIO_Pins = GPIO_Pin24;
  pta_init.GPIO_PinControl = IRQC_RI|INPUT_PULL_DOWN;
  pta_init.GPIO_Isr = SQC_OV7670_Isr;
  LPLD_GPIO_Init(pta_init); 
  
  //ov7670_wr   :PTA19
  pta_init.GPIO_PTx = PTA;
  pta_init.GPIO_Pins = GPIO_Pin6 |GPIO_Pin7 | GPIO_Pin17  | GPIO_Pin25;
  pta_init.GPIO_Dir = OUTPUT_H;
  pta_init.GPIO_PinControl = IRQC_DIS;
  LPLD_GPIO_Init(pta_init);
  
  pta_init.GPIO_PTx = PTA;
  pta_init.GPIO_Pins = GPIO_Pin8;
  pta_init.GPIO_Dir = OUTPUT_L;
  pta_init.GPIO_PinControl = IRQC_DIS;
  LPLD_GPIO_Init(pta_init);
  
  /*  继电器模块初始化  K1: PTE12    K2:PTE28 */
  pte_init.GPIO_PTx = PTE;
  pte_init.GPIO_Pins = GPIO_Pin12 |GPIO_Pin28;
  pte_init.GPIO_Dir = OUTPUT_H;
  pte_init.GPIO_PinControl = IRQC_DIS;
  LPLD_GPIO_Init(pte_init);
  
    /*  LED模块初始化  LED1: PTE26    LED2:PTE27 */
  pte_init.GPIO_PTx = PTE;
  pte_init.GPIO_Pins = GPIO_Pin26 |GPIO_Pin27;
  pte_init.GPIO_Dir = OUTPUT_H;
  pte_init.GPIO_PinControl = IRQC_DIS;
  LPLD_GPIO_Init(pte_init);
  
  
  /* GPRS PTC14 */
  ptc_init.GPIO_PTx = PTC;
  ptc_init.GPIO_Pins = GPIO_Pin14 | GPIO_Pin19;
  ptc_init.GPIO_Dir = OUTPUT_H;
  ptc_init.GPIO_PinControl = IRQC_DIS;
  LPLD_GPIO_Init(ptc_init);
}

/*    uart0  USB->UART中断服务函数    */
void uart0_isr(void)
{
  int8 recv;
  recv = LPLD_UART_GetChar(UART0);
  LPLD_UART_PutChar(UART0,recv);
  LPLD_UART_PutChar(UART3,recv);
}

/*    uart1 WIFI中断服务函数    */
void uart1_isr(void)
{
  int8 recv;
  recv = LPLD_UART_GetChar(UART1);
  LPLD_UART_PutChar(UART0, recv);
  
}

/*    uart2 中断服务函数    */
void uart2_isr(void)
{
  int8 recv;
  recv = LPLD_UART_GetChar(UART2);
  LPLD_UART_PutChar(UART0, recv);
}

/*    uart3  北斗/GPS中断服务函数    */
void uart3_isr(void)
{
  
  uint8 recv;
  struct UM220_BUF *buf;
  buf=Getpointer_buf();
  recv = LPLD_UART_GetChar(UART3);
  

if(buf->gps_HeadFlag==1)
  {
   buf->gps_Rxbuf[buf->gps_buf_len]=recv;
   //LPLD_UART_PutChar(UART0,buf->gps_Rxbuf[buf->gps_buf_len]);
    buf->gps_buf_len++;
    if(buf->gps_Rxbuf[buf->gps_buf_len-1]=='\n'
       &&buf->gps_Rxbuf[buf->gps_buf_len-2]=='\r')
    {
      
      buf->gps_HeadFlag=0;
      
      
    }
  }
if(recv=='$')
  {
    buf->gps_HeadFlag=1;
    buf->gps_buf_len=0;  
    buf->gps_Rxbuf[buf->gps_buf_len]=recv;
    //LPLD_UART_PutChar(UART0,buf->gps_Rxbuf[buf->gps_buf_len]);
    buf->gps_buf_len++;
   }

}

/*    uart4 Zigbee中断服务函数    */
void uart4_isr(void)
{
  int8 recv;
  recv = LPLD_UART_GetChar(UART4);
  LPLD_UART_PutChar(UART0, recv);
}

/*    uart5  GPRS中断服务函数    */
void uart5_isr(void)
{
  int8 recv;
  struct _ME3000_PIB * pib;
  pib = SQC_ME3000_GetPib();
  recv = LPLD_UART_GetChar(UART5);
  if(recv == '+')
  {
    pib->Rxflag = 1;
    pib->Rxlen = 0;
    pib->Rxbuf[pib->Rxlen] = recv;
    pib->Rxlen ++;
    return;
  }
  if(recv == '>' && pib->Rxflag == 0)
  {
    pib->Rxflag = 3;
    pib->Rxlen = 0;
    return;
  }
  if(pib->Rxflag == 1)
  {
    pib->Rxbuf[pib->Rxlen] = recv;
    pib->Rxlen ++;
    if(    pib->Rxbuf[pib->Rxlen-1] == 0x0A
        && pib->Rxbuf[pib->Rxlen-2] == 0x0D)
        //&& pib->Rxbuf[pib->Rxlen-3] == 0x4B
        //&& pib->Rxbuf[pib->Rxlen-4] == 0x4F)
    {
      pib->Rxbuf[pib->Rxlen] = 0;
      if(strchr(pib->Rxbuf,':') == 0)
      {
        pib->Rxflag =0;
        pib->Rxlen = 0;
        return;
      }
      else
      {
        if(!SQC_ME3000_Recive(pib->Rxbuf,pib->Rxlen))
        {
          pib->Rxflag =2;
          return;
        }
        else
        {
          pib->Rxflag =0;
          pib->Rxlen = 0;
          return;
        }      
      }
    }          
    return;
  }
  
    
  
}


