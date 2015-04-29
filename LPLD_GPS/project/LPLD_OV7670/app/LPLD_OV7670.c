/**
* --------------基于"拉普兰德K60底层库V3"的工程（LPLD_OV7670）-----------------
* @file LPLD_OV7670.c
* @version 0.1
* @date 2013-9-29
* @brief 利用DMA模块，实现数字摄像头OV7670的图像读取。
*
* 版权所有:北京拉普兰德电子技术有限公司
* http://www.lpld.cn
* mail:support@lpld.cn
* 硬件平台:  LPLD K60 Card / LPLD K60 Nano
*
* 本工程基于"拉普兰德K60底层库V3"开发，
* 所有开源代码均在"lib"文件夹下，用户不必更改该目录下代码，
* 所有用户工程需保存在"project"文件夹下，以工程名定义文件夹名，
* 底层库使用方法见相关文档。 
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
说明：
*将MiniUSB线插入RUSH Kinetis开发板的USB
插座，并连接至电脑USB接口。
*将OV7670上位机波特率设置为115200
*使用上位机查看运行结果
****************************************/

void clr_lcd(uint16 coloer);
void Command(uint8,uint8*);


void main (void)
{  
  //关闭全局中断
  uint8 q[50];
  DisableInterrupts;
  LPLD_LCD_Init(); 
  clr_lcd(0xf000);
  //SQC_OV7670_Init();   
  gpio_init();
  uart_init();
  SQC_UM220_Init();
  //使能PORTA中断(摄像头中断）
  enable_irq(PORTA_IRQn);
  //使能全局中断
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



