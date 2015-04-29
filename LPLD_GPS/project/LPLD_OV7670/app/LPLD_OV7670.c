/**
* --------------����"��������K60�ײ��V3"�Ĺ��̣�LPLD_OV7670��-----------------
* @file LPLD_OV7670.c
* @version 0.1
* @date 2013-9-29
* @brief ����DMAģ�飬ʵ����������ͷOV7670��ͼ���ȡ��
*
* ��Ȩ����:�����������µ��Ӽ������޹�˾
* http://www.lpld.cn
* mail:support@lpld.cn
* Ӳ��ƽ̨:  LPLD K60 Card / LPLD K60 Nano
*
* �����̻���"��������K60�ײ��V3"������
* ���п�Դ�������"lib"�ļ����£��û����ظ��ĸ�Ŀ¼�´��룬
* �����û������豣����"project"�ļ����£��Թ����������ļ�������
* �ײ��ʹ�÷���������ĵ��� 
*
*/

#include "common.h"
#include "SQC_OV7670.h"
#include "cJSON.h"
#include "Resource.h"
#include "Interface.h"
#include "SQC_ME3000.h"
#include "SQC_UM220.h"
#include "SQC_Security.h"


/****************************************
˵����
*��MiniUSB�߲���RUSH Kinetis�������USB
������������������USB�ӿڡ�
*��OV7670��λ������������Ϊ115200
*ʹ����λ���鿴���н��
****************************************/

void clr_lcd(uint16 coloer);
void Command(uint8,uint8*);


void main (void)
{  
  //�ر�ȫ���ж�
  uint8 q[50];
  DisableInterrupts;
  LPLD_LCD_Init(); 
  clr_lcd(0xf000);
  //SQC_OV7670_Init();   
  gpio_init();
  uart_init();
  SQC_UM220_Init();
  //ʹ��PORTA�ж�(����ͷ�жϣ�
  enable_irq(PORTA_IRQn);
  //ʹ��ȫ���ж�
  EnableInterrupts; 
struct UM220_POS *test;
test=Getpointer_pos();
  //Command(SQC_ME3000_Init(),"ME3000_Init");

  while(1)
  {
    delay();
    SQC_UM220_Req();
   
    
  } 
}

void clr_lcd(uint16 coloer)
{
  uint16 i=0,j=0,coloer1;
  for(i=0;i<320;i++)
    for(j=0;j<240;j++)
    {
      coloer1=gImage_suqian[2*(j*320+i)];
      coloer1<<=8;
      coloer1=coloer1&0xff00;
      coloer1 |= gImage_suqian[2*(j*320+i)+1];
      LPLD_LCD_SetPoint(i,j,coloer1);  
    }
}

void Command(uint8 result,uint8* command)
{
  switch(result)
  {
  case TRUE:printf("%s SUCCEED!\n",command);return;
  case FALSE:printf("%s FAILED!\n",command);return;
  }
}



