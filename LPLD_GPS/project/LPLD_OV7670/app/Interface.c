/**
 * @file Interface.c
 * @version 1.0[By finley]
 * @date 2015-04-16
 * @brief �ӿڳ�ʼ������
 *
 *
 * ��Ȩ����:��ǨѧԺ������ʵ����
 * http://www.sqc.edu.cn
 *
 * @par
 * ����������ǨѧԺ[SQC]������ά������������ʹ���߿���Դ���롣
 * �����߿���������ʹ�û��Դ���롣�����μ�����ע��Ӧ���Ա�����
 * ���ø��Ļ�ɾ��ԭ��Ȩ���������������ο����߿��Լ�ע���ΰ�Ȩ�����ߡ�
 * ��Ӧ�����ش�Э��Ļ����ϣ�����Դ���롢���ó��۴��뱾��
 * ��ǨѧԺ����������ʹ�ñ��������������κ��¹ʡ��������λ���ز���Ӱ�졣
 * ��ǨѧԺ��������͡�˵��������ľ���ԭ�����ܡ�ʵ�ַ�����
 * ������ǨѧԺ[SQC]��Ȩ�������߲��ý�������������ҵ��Ʒ��
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
  UART3   TXD3:PTE4    RXD3:PTE5       ����/GPS
  UART4   TXD4:PTE24   RXD4:PTE25      Zigbee
  UART5   TXD5:PTE8    RXD5:PTE9       GPRS
  */
  /*   init uart0   USB->UART  115200*/
  uart0_init_struct.UART_Uartx = UART0; //ʹ��UART0
  uart0_init_struct.UART_BaudRate = 9600; //���ò�����115200
  uart0_init_struct.UART_RxPin = PTB16;  //��������ΪPTE16
  uart0_init_struct.UART_TxPin = PTB17;  //��������ΪPTE17
  uart0_init_struct.UART_RxIntEnable = TRUE;    //ʹ�ܽ����ж�
  uart0_init_struct.UART_RxIsr = uart0_isr;      //���ý����жϺ���
  LPLD_UART_Init(uart0_init_struct);//��ʼ��UART 
  LPLD_UART_EnableIrq(uart0_init_struct);//ʹ��UART�ж�
  /*   init uart1  WIFI  115200     */
  uart1_init_struct.UART_Uartx = UART1; //ʹ��UART1
  uart1_init_struct.UART_BaudRate = 115200; //���ò�����115200
  uart1_init_struct.UART_RxPin = PTE2;  //��������ΪPTE2
  uart1_init_struct.UART_TxPin = PTE0;  //��������ΪPTE0
  uart1_init_struct.UART_RxIntEnable = TRUE;    //ʹ�ܽ����ж�
  uart1_init_struct.UART_RxIsr = uart1_isr;      //���ý����жϺ���
  LPLD_UART_Init(uart1_init_struct);//��ʼ��UART 
  LPLD_UART_EnableIrq(uart1_init_struct);//ʹ��UART�ж� 
  ////  /*   init uart2  */
  ////  uart2_init_struct.UART_Uartx = UART2; //ʹ��UART2
  ////  uart2_init_struct.UART_BaudRate = 115200; //���ò�����9600
  ////  uart2_init_struct.UART_RxPin = PTE1;  //��������ΪPTE9
  ////  uart2_init_struct.UART_TxPin = PTE0;  //��������ΪPTE8
  ////  uart2_init_struct.UART_RxIntEnable = TRUE;    //ʹ�ܽ����ж�
  ////  uart2_init_struct.UART_RxIsr = uart2_isr;      //���ý����жϺ���
  ////  LPLD_UART_Init(uart2_init_struct);//��ʼ��UART 
  ////  LPLD_UART_EnableIrq(uart2_init_struct);//ʹ��UART�ж�
  /*   init uart3  ����/GPS  115200  */
  uart3_init_struct.UART_Uartx = UART3; //ʹ��UART3
  uart3_init_struct.UART_BaudRate = 9600; //���ò�����9600
  uart3_init_struct.UART_RxPin = PTE5;  //��������ΪPTE5
  uart3_init_struct.UART_TxPin = PTE4;  //��������ΪPTE4
  uart3_init_struct.UART_RxIntEnable = TRUE;    //ʹ�ܽ����ж�
  uart3_init_struct.UART_RxIsr = uart3_isr;      //���ý����жϺ���
  LPLD_UART_Init(uart3_init_struct);//��ʼ��UART 
  LPLD_UART_EnableIrq(uart3_init_struct);//ʹ��UART�ж�
  /*   init uart4    Zigbee */
  uart4_init_struct.UART_Uartx = UART4; //ʹ��UART4
  uart4_init_struct.UART_BaudRate = 115200; //���ò�����115200
  uart4_init_struct.UART_RxPin = PTE25;  //��������ΪPTE25
  uart4_init_struct.UART_TxPin = PTE24;  //��������ΪPTE24
  uart4_init_struct.UART_RxIntEnable = TRUE;    //ʹ�ܽ����ж�
  uart4_init_struct.UART_RxIsr = uart4_isr;      //���ý����жϺ���
  LPLD_UART_Init(uart4_init_struct);//��ʼ��UART 
  LPLD_UART_EnableIrq(uart4_init_struct);//ʹ��UART�ж�
  /*   init uart5   GPRS  115200 */
  uart5_init_struct.UART_Uartx = UART5; //ʹ��UART5
  uart5_init_struct.UART_BaudRate = 115200; //���ò�����115200
  uart5_init_struct.UART_RxPin = PTE9;  //��������ΪPTE9
  uart5_init_struct.UART_TxPin = PTE8;  //��������ΪPTE8
  uart5_init_struct.UART_RxIntEnable = TRUE;    //ʹ�ܽ����ж�
  uart5_init_struct.UART_RxIsr = uart5_isr;      //���ý����жϺ���
  LPLD_UART_Init(uart5_init_struct);//��ʼ��UART 
  LPLD_UART_EnableIrq(uart5_init_struct);//ʹ��UART�ж�
  
  
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
  //OV���ݿڳ�ʼ����PTD9~PTD16
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
  
  /*  �̵���ģ���ʼ��  K1: PTE12    K2:PTE28 */
  pte_init.GPIO_PTx = PTE;
  pte_init.GPIO_Pins = GPIO_Pin12 |GPIO_Pin28;
  pte_init.GPIO_Dir = OUTPUT_H;
  pte_init.GPIO_PinControl = IRQC_DIS;
  LPLD_GPIO_Init(pte_init);
  
    /*  LEDģ���ʼ��  LED1: PTE26    LED2:PTE27 */
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

/*    uart0  USB->UART�жϷ�����    */
void uart0_isr(void)
{
  int8 recv;
  recv = LPLD_UART_GetChar(UART0);
  LPLD_UART_PutChar(UART0,recv);
  LPLD_UART_PutChar(UART3,recv);
}

/*    uart1 WIFI�жϷ�����    */
void uart1_isr(void)
{
  int8 recv;
  recv = LPLD_UART_GetChar(UART1);
  LPLD_UART_PutChar(UART0, recv);
  
}

/*    uart2 �жϷ�����    */
void uart2_isr(void)
{
  int8 recv;
  recv = LPLD_UART_GetChar(UART2);
  LPLD_UART_PutChar(UART0, recv);
}

/*    uart3  ����/GPS�жϷ�����    */
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

/*    uart4 Zigbee�жϷ�����    */
void uart4_isr(void)
{
  int8 recv;
  recv = LPLD_UART_GetChar(UART4);
  LPLD_UART_PutChar(UART0, recv);
}

/*    uart5  GPRS�жϷ�����    */
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


