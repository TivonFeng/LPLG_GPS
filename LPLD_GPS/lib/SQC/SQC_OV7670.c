/**
 * @file SQC_OV7670.c
 * @version 1.0[By finley]
 * @date 2015-04-16
 * @brief 摄像头模块相关函数
 *
 * 更改建议:不建议修改
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
#include "SQC_OV7670.h"
#include "DEV_SCCB.h"
#include "DEV_LCD.h"
#include "HW_GPIO.h"

static uint8 Is_DispPhoto = 0;               //图像发送标志

uint8 SQC_OV7670_Init(void)
{
  uint16 i = 0;
  uint8 device_id = 0;
  
  LPLD_SCCB_Init();
  
  delay();
  
  //复位OV7670寄存器
  while( 0 == LPLD_SCCB_WriteReg(0x12, 0x80 )) 
  {
    i++;
    if(i == 500)
    {
      return 0 ;
    }    
  }
  delay();
  
  //读取设备ID
  while( 0 == LPLD_SCCB_ReadReg(0x1C, &device_id, 1));	
  
  //如果为OV7670
  if(device_id == 0x7F)
  {  
    SQC_OV7670_Setreg();
    //while( 0 == LPLD_SCCB_WriteReg(0x1E, 0x21) );
    // while( 0 == LPLD_SCCB_WriteReg(0x3E, 0x19) );	
    //while( 0 == LPLD_SCCB_WriteReg(0x73, 0x09) );	
    //while( 0 == LPLD_SCCB_WriteReg(0x15, 0x20) );	
  }
  else
  {
    return 0;
  }
  
  return 1;
}

void SQC_OV7670_Setreg(void)
{
  LPLD_SCCB_WriteReg(0x3a, 0x04);
  LPLD_SCCB_WriteReg(0x40, 0xd0);
  LPLD_SCCB_WriteReg(0x12, 0x14);
  LPLD_SCCB_WriteReg(0x32, 0x80);
  LPLD_SCCB_WriteReg(0x17, 0x16);
  LPLD_SCCB_WriteReg(0x18, 0x04);
  LPLD_SCCB_WriteReg(0x19, 0x02);
  LPLD_SCCB_WriteReg(0x1a, 0x7b);
  LPLD_SCCB_WriteReg(0x03, 0x06);
  LPLD_SCCB_WriteReg(0x0c, 0x04);
  LPLD_SCCB_WriteReg(0x3e, 0x00);
  LPLD_SCCB_WriteReg(0x70, 0x3a);
  LPLD_SCCB_WriteReg(0x71, 0x35);
  LPLD_SCCB_WriteReg(0x72, 0x11);
  LPLD_SCCB_WriteReg(0x73, 0x00);
  LPLD_SCCB_WriteReg(0xa2, 0x02);
  LPLD_SCCB_WriteReg(0x11, 0x81);
  
  LPLD_SCCB_WriteReg(0x7a, 0x20);
  LPLD_SCCB_WriteReg(0x7b, 0x1c);
  LPLD_SCCB_WriteReg(0x7c, 0x28);
  LPLD_SCCB_WriteReg(0x7d, 0x3c);
  LPLD_SCCB_WriteReg(0x7e, 0x55);
  LPLD_SCCB_WriteReg(0x7f, 0x68);
  LPLD_SCCB_WriteReg(0x80, 0x76);
  LPLD_SCCB_WriteReg(0x81, 0x80);
  LPLD_SCCB_WriteReg(0x82, 0x88);
  LPLD_SCCB_WriteReg(0x83, 0x8f);
  LPLD_SCCB_WriteReg(0x84, 0x96);
  LPLD_SCCB_WriteReg(0x85, 0xa3);
  LPLD_SCCB_WriteReg(0x86, 0xaf);
  LPLD_SCCB_WriteReg(0x87, 0xc4);
  LPLD_SCCB_WriteReg(0x88, 0xd7);
  LPLD_SCCB_WriteReg(0x89, 0xe8);
  
  LPLD_SCCB_WriteReg(0x13, 0xe0);
  LPLD_SCCB_WriteReg(0x00, 0x00);
  
  LPLD_SCCB_WriteReg(0x10, 0x00);
  LPLD_SCCB_WriteReg(0x0d, 0x00);
  LPLD_SCCB_WriteReg(0x14, 0x28);
  LPLD_SCCB_WriteReg(0xa5, 0x05);
  LPLD_SCCB_WriteReg(0xab, 0x07);
  LPLD_SCCB_WriteReg(0x24, 0x75);
  LPLD_SCCB_WriteReg(0x25, 0x63);
  LPLD_SCCB_WriteReg(0x26, 0xA5);
  LPLD_SCCB_WriteReg(0x9f, 0x78);
  LPLD_SCCB_WriteReg(0xa0, 0x68);
  LPLD_SCCB_WriteReg(0xa1, 0x03);
  LPLD_SCCB_WriteReg(0xa6, 0xdf);
  LPLD_SCCB_WriteReg(0xa7, 0xdf);
  LPLD_SCCB_WriteReg(0xa8, 0xf0);
  LPLD_SCCB_WriteReg(0xa9, 0x90);
  LPLD_SCCB_WriteReg(0xaa, 0x94);
  LPLD_SCCB_WriteReg(0x13, 0xe5);
  
  LPLD_SCCB_WriteReg(0x0e, 0x61);
  LPLD_SCCB_WriteReg(0x0f, 0x4b);
  LPLD_SCCB_WriteReg(0x16, 0x02);
  LPLD_SCCB_WriteReg(0x1e, 0x07);
  LPLD_SCCB_WriteReg(0x21, 0x02);
  LPLD_SCCB_WriteReg(0x22, 0x91);
  LPLD_SCCB_WriteReg(0x29, 0x07);
  LPLD_SCCB_WriteReg(0x33, 0x0b);
  LPLD_SCCB_WriteReg(0x35, 0x0b);
  LPLD_SCCB_WriteReg(0x37, 0x1d);
  LPLD_SCCB_WriteReg(0x38, 0x71);
  LPLD_SCCB_WriteReg(0x39, 0x2a);
  LPLD_SCCB_WriteReg(0x3c, 0x78);
  LPLD_SCCB_WriteReg(0x4d, 0x40);
  LPLD_SCCB_WriteReg(0x4e, 0x20);
  LPLD_SCCB_WriteReg(0x69, 0x00);
  LPLD_SCCB_WriteReg(0x6b, 0x60);
  LPLD_SCCB_WriteReg(0x74, 0x19);
  LPLD_SCCB_WriteReg(0x8d, 0x4f);
  LPLD_SCCB_WriteReg(0x8e, 0x00);
  LPLD_SCCB_WriteReg(0x8f, 0x00);
  LPLD_SCCB_WriteReg(0x90, 0x00);
  LPLD_SCCB_WriteReg(0x91, 0x00);
  LPLD_SCCB_WriteReg(0x92, 0x00);
  LPLD_SCCB_WriteReg(0x96, 0x00);
  LPLD_SCCB_WriteReg(0x9a, 0x80);
  LPLD_SCCB_WriteReg(0xb0, 0x84);
  LPLD_SCCB_WriteReg(0xb1, 0x0c);
  LPLD_SCCB_WriteReg(0xb2, 0x0e);
  LPLD_SCCB_WriteReg(0xb3, 0x82);
  LPLD_SCCB_WriteReg(0xb8, 0x0a);
  
  
  
  LPLD_SCCB_WriteReg(0x43, 0x14);
  LPLD_SCCB_WriteReg(0x44, 0xf0);
  LPLD_SCCB_WriteReg(0x45, 0x34);
  LPLD_SCCB_WriteReg(0x46, 0x58);
  LPLD_SCCB_WriteReg(0x47, 0x28);
  LPLD_SCCB_WriteReg(0x48, 0x3a);
  LPLD_SCCB_WriteReg(0x59, 0x88);
  LPLD_SCCB_WriteReg(0x5a, 0x88);
  LPLD_SCCB_WriteReg(0x5b, 0x44);
  LPLD_SCCB_WriteReg(0x5c, 0x67);
  LPLD_SCCB_WriteReg(0x5d, 0x49);
  LPLD_SCCB_WriteReg(0x5e, 0x0e);
  LPLD_SCCB_WriteReg(0x64, 0x04);
  LPLD_SCCB_WriteReg(0x65, 0x20);
  LPLD_SCCB_WriteReg(0x66, 0x05);
  LPLD_SCCB_WriteReg(0x94, 0x04);
  LPLD_SCCB_WriteReg(0x95, 0x08);
  LPLD_SCCB_WriteReg(0x6c, 0x0a);
  LPLD_SCCB_WriteReg(0x6d, 0x55);
  LPLD_SCCB_WriteReg(0x6e, 0x11);
  LPLD_SCCB_WriteReg(0x6f, 0x9f);
  LPLD_SCCB_WriteReg(0x6a, 0x40);
  LPLD_SCCB_WriteReg(0x01, 0x40);
  LPLD_SCCB_WriteReg(0x02, 0x40);
  LPLD_SCCB_WriteReg(0x13, 0xe7);
  LPLD_SCCB_WriteReg(0x15, 0x00);  
  
  
  LPLD_SCCB_WriteReg(0x4f, 0x80);
  LPLD_SCCB_WriteReg(0x50, 0x80);
  LPLD_SCCB_WriteReg(0x51, 0x00);
  LPLD_SCCB_WriteReg(0x52, 0x22);
  LPLD_SCCB_WriteReg(0x53, 0x5e);
  LPLD_SCCB_WriteReg(0x54, 0x80);
  LPLD_SCCB_WriteReg(0x58, 0x9e);
  
  LPLD_SCCB_WriteReg(0x41, 0x08);
  LPLD_SCCB_WriteReg(0x3f, 0x00);
  LPLD_SCCB_WriteReg(0x75, 0x05);
  LPLD_SCCB_WriteReg(0x76, 0xe1);
  LPLD_SCCB_WriteReg(0x4c, 0x00);
  LPLD_SCCB_WriteReg(0x77, 0x01);
  LPLD_SCCB_WriteReg(0x3d, 0xc2);	
  LPLD_SCCB_WriteReg(0x4b, 0x09);
  LPLD_SCCB_WriteReg(0xc9, 0x60);
  LPLD_SCCB_WriteReg(0x41, 0x38);
  LPLD_SCCB_WriteReg(0x56, 0x40);
  
  LPLD_SCCB_WriteReg(0x34, 0x11);
  LPLD_SCCB_WriteReg(0x3b, 0x02); 
  
  LPLD_SCCB_WriteReg(0xa4, 0x89);
  LPLD_SCCB_WriteReg(0x96, 0x00);
  LPLD_SCCB_WriteReg(0x97, 0x30);
  LPLD_SCCB_WriteReg(0x98, 0x20);
  LPLD_SCCB_WriteReg(0x99, 0x30);
  LPLD_SCCB_WriteReg(0x9a, 0x84);
  LPLD_SCCB_WriteReg(0x9b, 0x29);
  LPLD_SCCB_WriteReg(0x9c, 0x03);
  LPLD_SCCB_WriteReg(0x9d, 0x4c);
  LPLD_SCCB_WriteReg(0x9e, 0x3f);
  LPLD_SCCB_WriteReg(0x78, 0x04);
  
  LPLD_SCCB_WriteReg(0x79, 0x01);
  LPLD_SCCB_WriteReg(0xc8, 0xf0);
  LPLD_SCCB_WriteReg(0x79, 0x0f);
  LPLD_SCCB_WriteReg(0xc8, 0x00);
  LPLD_SCCB_WriteReg(0x79, 0x10);
  LPLD_SCCB_WriteReg(0xc8, 0x7e);
  LPLD_SCCB_WriteReg(0x79, 0x0a);
  LPLD_SCCB_WriteReg(0xc8, 0x80);
  LPLD_SCCB_WriteReg(0x79, 0x0b);
  LPLD_SCCB_WriteReg(0xc8, 0x01);
  LPLD_SCCB_WriteReg(0x79, 0x0c);
  LPLD_SCCB_WriteReg(0xc8, 0x0f);
  LPLD_SCCB_WriteReg(0x79, 0x0d);
  LPLD_SCCB_WriteReg(0xc8, 0x20);
  LPLD_SCCB_WriteReg(0x79, 0x09);
  LPLD_SCCB_WriteReg(0xc8, 0x80);
  LPLD_SCCB_WriteReg(0x79, 0x02);
  LPLD_SCCB_WriteReg(0xc8, 0xc0);
  LPLD_SCCB_WriteReg(0x79, 0x03);
  LPLD_SCCB_WriteReg(0xc8, 0x40);
  LPLD_SCCB_WriteReg(0x79, 0x05);
  LPLD_SCCB_WriteReg(0xc8, 0x30);
  LPLD_SCCB_WriteReg(0x79, 0x26); 
  LPLD_SCCB_WriteReg(0x09, 0x00);	
  
  
  
  //     /*以下为OV7670 QVGA RGB565参数  */
  //  	LPLD_SCCB_WriteReg(0x3a, 0x04);//
  //	LPLD_SCCB_WriteReg(0x40, 0x10);
  //	LPLD_SCCB_WriteReg(0x12, 0x14);//QVGA,RGB输出
  //
  //	//输出窗口设置
  //	LPLD_SCCB_WriteReg(0x32, 0x80);
  //	LPLD_SCCB_WriteReg(0x17, 0x16);         
  //	LPLD_SCCB_WriteReg(0x18, 0x04);//5
  //	LPLD_SCCB_WriteReg(0x19, 0x02);
  //	LPLD_SCCB_WriteReg(0x1a, 0x7a);//0x7a,
  // 	LPLD_SCCB_WriteReg(0x03, 0x0a);//0x0a,
  //
  //
  //	LPLD_SCCB_WriteReg(0x0c, 0x0c);
  //	LPLD_SCCB_WriteReg(0x15, 0x00);
  //	LPLD_SCCB_WriteReg(0x3e, 0x00);//10
  //	LPLD_SCCB_WriteReg(0x70, 0x00);
  //	LPLD_SCCB_WriteReg(0x71, 0x01);
  //	LPLD_SCCB_WriteReg(0x72, 0x11);
  //	LPLD_SCCB_WriteReg(0x73, 0x09);//
  //        
  //	LPLD_SCCB_WriteReg(0xa2, 0x02);//15
  //	LPLD_SCCB_WriteReg(0x11, 0x00);//时钟分频设置,0,不分频.
  //	LPLD_SCCB_WriteReg(0x7a, 0x20);
  //	LPLD_SCCB_WriteReg(0x7b, 0x1c);
  //	LPLD_SCCB_WriteReg(0x7c, 0x28);
  //        
  //	LPLD_SCCB_WriteReg(0x7d, 0x3c);//20
  //	LPLD_SCCB_WriteReg(0x7e, 0x55);
  //	LPLD_SCCB_WriteReg(0x7f, 0x68);
  //	LPLD_SCCB_WriteReg(0x80, 0x76);
  //	LPLD_SCCB_WriteReg(0x81, 0x80);
  //        
  //	LPLD_SCCB_WriteReg(0x82, 0x88);
  //	LPLD_SCCB_WriteReg(0x83, 0x8f);
  //	LPLD_SCCB_WriteReg(0x84, 0x96);
  //	LPLD_SCCB_WriteReg(0x85, 0xa3);
  //	LPLD_SCCB_WriteReg(0x86, 0xaf);
  //        
  //	LPLD_SCCB_WriteReg(0x87, 0xc4);//30
  //	LPLD_SCCB_WriteReg(0x88, 0xd7);
  //	LPLD_SCCB_WriteReg(0x89, 0xe8);
  //	LPLD_SCCB_WriteReg(0x13, 0xe0);
  //	LPLD_SCCB_WriteReg(0x00, 0x00);//AGC
  //        
  //	LPLD_SCCB_WriteReg(0x10, 0x00);
  //	LPLD_SCCB_WriteReg(0x0d, 0x00); 
  //	LPLD_SCCB_WriteReg(0x14, 0x20);//0x38, limit the max gain
  //	LPLD_SCCB_WriteReg(0xa5, 0x05);
  //	LPLD_SCCB_WriteReg(0xab, 0x07);
  //        
  //	LPLD_SCCB_WriteReg(0x24, 0x75);//40
  //	LPLD_SCCB_WriteReg(0x25, 0x63);
  //	LPLD_SCCB_WriteReg(0x26, 0xA5);
  //	LPLD_SCCB_WriteReg(0x9f, 0x78);
  //	LPLD_SCCB_WriteReg(0xa0, 0x68);
  //        
  //	LPLD_SCCB_WriteReg(0xa1, 0x03);//0x0b,
  //	LPLD_SCCB_WriteReg(0xa6, 0xdf);//0xd8,
  //	LPLD_SCCB_WriteReg(0xa7, 0xdf);//0xd8,
  //	LPLD_SCCB_WriteReg(0xa8, 0xf0);
  //	LPLD_SCCB_WriteReg(0xa9, 0x90);
  //        
  //	LPLD_SCCB_WriteReg(0xaa, 0x94);//50
  //	LPLD_SCCB_WriteReg(0x13, 0xe5);
  //	LPLD_SCCB_WriteReg(0x0e, 0x61);
  //	LPLD_SCCB_WriteReg(0x0f, 0x4b);
  //	LPLD_SCCB_WriteReg(0x16, 0x02);
  //        
  //	LPLD_SCCB_WriteReg(0x1e, 0x27);//图像输出镜像控制.0x07,
  //	LPLD_SCCB_WriteReg(0x21, 0x02);
  //	LPLD_SCCB_WriteReg(0x22, 0x91);
  //	LPLD_SCCB_WriteReg(0x29, 0x07);
  //	LPLD_SCCB_WriteReg(0x33, 0x0b);
  //        
  //	LPLD_SCCB_WriteReg(0x35, 0x0b);//60
  //	LPLD_SCCB_WriteReg(0x37, 0x1d);
  //	LPLD_SCCB_WriteReg(0x38, 0x71);
  //	LPLD_SCCB_WriteReg(0x39, 0x2a);
  //	LPLD_SCCB_WriteReg(0x3c, 0x78);
  //        
  //	LPLD_SCCB_WriteReg(0x4d, 0x40);
  //	LPLD_SCCB_WriteReg(0x4e, 0x20);
  //	LPLD_SCCB_WriteReg(0x69, 0x5d);
  //	LPLD_SCCB_WriteReg(0x6b, 0x40);//PLL*4=48Mhz
  //	LPLD_SCCB_WriteReg(0x74, 0x19);
  //	LPLD_SCCB_WriteReg(0x8d, 0x4f);
  //        
  //	LPLD_SCCB_WriteReg(0x8e, 0x00);//70
  //	LPLD_SCCB_WriteReg(0x8f, 0x00);
  //	LPLD_SCCB_WriteReg(0x90, 0x00);
  //	LPLD_SCCB_WriteReg(0x91, 0x00);
  //	LPLD_SCCB_WriteReg(0x92, 0x00);//0x19,//0x66
  //        
  //	LPLD_SCCB_WriteReg(0x96, 0x00);
  //	LPLD_SCCB_WriteReg(0x9a, 0x80);
  //	LPLD_SCCB_WriteReg(0xb0, 0x84);
  //	LPLD_SCCB_WriteReg(0xb1, 0x0c);
  //	LPLD_SCCB_WriteReg(0xb2, 0x0e);
  //        
  //	LPLD_SCCB_WriteReg(0xb3, 0x82);//80
  //	LPLD_SCCB_WriteReg(0xb8, 0x0a);
  //	LPLD_SCCB_WriteReg(0x43, 0x14);
  //	LPLD_SCCB_WriteReg(0x44, 0xf0);
  //	LPLD_SCCB_WriteReg(0x45, 0x34);
  //        
  //	LPLD_SCCB_WriteReg(0x46, 0x58);
  //	LPLD_SCCB_WriteReg(0x47, 0x28);
  //	LPLD_SCCB_WriteReg(0x48, 0x3a);
  //	LPLD_SCCB_WriteReg(0x59, 0x88);
  //	LPLD_SCCB_WriteReg(0x5a, 0x88);
  //        
  //	LPLD_SCCB_WriteReg(0x5b, 0x44);//90
  //	LPLD_SCCB_WriteReg(0x5c, 0x67);
  //	LPLD_SCCB_WriteReg(0x5d, 0x49);
  //	LPLD_SCCB_WriteReg(0x5e, 0x0e);
  //	LPLD_SCCB_WriteReg(0x64, 0x04);
  //	LPLD_SCCB_WriteReg(0x65, 0x20);
  //        
  //	LPLD_SCCB_WriteReg(0x66, 0x05);
  //	LPLD_SCCB_WriteReg(0x94, 0x04);
  //	LPLD_SCCB_WriteReg(0x95, 0x08);
  //	LPLD_SCCB_WriteReg(0x6c, 0x0a);
  //	LPLD_SCCB_WriteReg(0x6d, 0x55);
  //        
  //        
  //	LPLD_SCCB_WriteReg(0x4f, 0x80);
  //	LPLD_SCCB_WriteReg(0x50, 0x80);
  //	LPLD_SCCB_WriteReg(0x51, 0x00);
  //	LPLD_SCCB_WriteReg(0x52, 0x22);
  //	LPLD_SCCB_WriteReg(0x53, 0x5e);
  //	LPLD_SCCB_WriteReg(0x54, 0x80);
  //        
  //	//LPLD_SCCB_WriteReg(0x54, 0x40);//110
  //        
  //        
  //	LPLD_SCCB_WriteReg(0x09, 0x03);//驱动能力最大
  //
  //	LPLD_SCCB_WriteReg(0x6e, 0x11);//100
  //	LPLD_SCCB_WriteReg(0x6f, 0x9f);//0x9e for advance AWB
  //    LPLD_SCCB_WriteReg(0x55, 0x00);//亮度
  //    LPLD_SCCB_WriteReg(0x56, 0x40);//对比度
  //    LPLD_SCCB_WriteReg(0x57, 0x80);//0x40,  change according to Jim's request	
  //  
  //  
  
  //    LPLD_SCCB_WriteReg(0x3a, 0x04);
  //  
  //    LPLD_SCCB_WriteReg(0x40, 0x10);
  //    LPLD_SCCB_WriteReg(0x12, 0x14);
  //    LPLD_SCCB_WriteReg(0x32, 0x80);
  //    LPLD_SCCB_WriteReg(0x17, 0x16);
  //    LPLD_SCCB_WriteReg(0x18, 0x04);
  //    LPLD_SCCB_WriteReg(0x19, 0x02);
  //    LPLD_SCCB_WriteReg(0x1a, 0x7a);
  //    LPLD_SCCB_WriteReg(0x03, 0x0a);
//    LPLD_SCCB_WriteReg(0x0c, 0x0c);
//    LPLD_SCCB_WriteReg(0x15, 0x00);
//    LPLD_SCCB_WriteReg(0x3e, 0x00);
//    LPLD_SCCB_WriteReg(0x70, 0x00);
//    LPLD_SCCB_WriteReg(0x71, 0x35);
//    LPLD_SCCB_WriteReg(0x72, 0x11);
//    LPLD_SCCB_WriteReg(0x73, 0x09);
//    LPLD_SCCB_WriteReg(0xa2, 0x02);//+++++++++++++++++++++++  
//    LPLD_SCCB_WriteReg(0x11, 0x00);
//    LPLD_SCCB_WriteReg(0x7a, 0x20);
//    LPLD_SCCB_WriteReg(0x7b, 0x1c);
//    LPLD_SCCB_WriteReg(0x7c, 0x28);
//    LPLD_SCCB_WriteReg(0x7d, 0x3c);
//    LPLD_SCCB_WriteReg(0x7e, 0x55);
//    LPLD_SCCB_WriteReg(0x7f, 0x68);
//    LPLD_SCCB_WriteReg(0x80, 0x76);
//    LPLD_SCCB_WriteReg(0x81, 0x80);
//    LPLD_SCCB_WriteReg(0x82, 0x88);
//    LPLD_SCCB_WriteReg(0x83, 0x8f);
//    LPLD_SCCB_WriteReg(0x84, 0x96);
//    LPLD_SCCB_WriteReg(0x85, 0xa3);
//    LPLD_SCCB_WriteReg(0x86, 0xaf);
//    LPLD_SCCB_WriteReg(0x87, 0xc4);
//    LPLD_SCCB_WriteReg(0x88, 0xd7);
//    LPLD_SCCB_WriteReg(0x89, 0xe8);
//    LPLD_SCCB_WriteReg(0x13, 0xe0);
//    LPLD_SCCB_WriteReg(0x00, 0x00);
//    LPLD_SCCB_WriteReg(0x10, 0x00);
//    LPLD_SCCB_WriteReg(0x0d, 0x00);
//    LPLD_SCCB_WriteReg(0x14, 0x20);
//    LPLD_SCCB_WriteReg(0xa5, 0x05);
//    LPLD_SCCB_WriteReg(0xab, 0x07);
//    LPLD_SCCB_WriteReg(0x24, 0x75);
//    LPLD_SCCB_WriteReg(0x25, 0x63);
//    LPLD_SCCB_WriteReg(0x26, 0xA5);
//    LPLD_SCCB_WriteReg(0x9f, 0x78);
//    LPLD_SCCB_WriteReg(0xa0, 0x68);
//    LPLD_SCCB_WriteReg(0xa1, 0x03);
//    LPLD_SCCB_WriteReg(0xa6, 0xdf);
//    LPLD_SCCB_WriteReg(0xa7, 0xdf);
//    LPLD_SCCB_WriteReg(0xa8, 0xf0);
//    LPLD_SCCB_WriteReg(0xa9, 0x90);
//    LPLD_SCCB_WriteReg(0xaa, 0x94); 
//    LPLD_SCCB_WriteReg(0x13, 0xe5);
//    LPLD_SCCB_WriteReg(0x0e, 0x61);
//    LPLD_SCCB_WriteReg(0x0f, 0x4b);
//    LPLD_SCCB_WriteReg(0x16, 0x02);
//    LPLD_SCCB_WriteReg(0x1e, 0x27);
//    LPLD_SCCB_WriteReg(0x21, 0x02);
//    LPLD_SCCB_WriteReg(0x22, 0x91);
//    LPLD_SCCB_WriteReg(0x29, 0x07);
//    LPLD_SCCB_WriteReg(0x33, 0x0b);
//    LPLD_SCCB_WriteReg(0x35, 0x0b);
//    LPLD_SCCB_WriteReg(0x37, 0x1d);
//    LPLD_SCCB_WriteReg(0x38, 0x71);
//    LPLD_SCCB_WriteReg(0x39, 0x2a);
//    LPLD_SCCB_WriteReg(0x3c, 0x78);
//    LPLD_SCCB_WriteReg(0x4d, 0x40);
//    LPLD_SCCB_WriteReg(0x4e, 0x20);
//    LPLD_SCCB_WriteReg(0x69, 0x5d);
//    LPLD_SCCB_WriteReg(0x6b, 0x40);
//    LPLD_SCCB_WriteReg(0x74, 0x19);
//    LPLD_SCCB_WriteReg(0x8d, 0x4f);
//    LPLD_SCCB_WriteReg(0x8e, 0x00);
//    LPLD_SCCB_WriteReg(0x8f, 0x00);
//    LPLD_SCCB_WriteReg(0x90, 0x00);
//    LPLD_SCCB_WriteReg(0x91, 0x00);
//    LPLD_SCCB_WriteReg(0x92, 0x00);
//    LPLD_SCCB_WriteReg(0x96, 0x00);
//    LPLD_SCCB_WriteReg(0x9a, 0x80);
//    LPLD_SCCB_WriteReg(0xb0, 0x84);
//    LPLD_SCCB_WriteReg(0xb1, 0x0c);
//    LPLD_SCCB_WriteReg(0xb2, 0x0e);
//    LPLD_SCCB_WriteReg(0xb3, 0x82); 
//    LPLD_SCCB_WriteReg(0xb8, 0x0a);
//    LPLD_SCCB_WriteReg(0x43, 0x14);
//    LPLD_SCCB_WriteReg(0x44, 0xf0);
//    LPLD_SCCB_WriteReg(0x45, 0x34);
//    LPLD_SCCB_WriteReg(0x46, 0x58);
//    LPLD_SCCB_WriteReg(0x47, 0x28);
//    LPLD_SCCB_WriteReg(0x48, 0x3a);
//    LPLD_SCCB_WriteReg(0x59, 0x88);
//    LPLD_SCCB_WriteReg(0x5a, 0x88);
//    LPLD_SCCB_WriteReg(0x5b, 0x44);
//    LPLD_SCCB_WriteReg(0x5c, 0x67);
//    LPLD_SCCB_WriteReg(0x5d, 0x49);
//    LPLD_SCCB_WriteReg(0x5e, 0x0e);
//    LPLD_SCCB_WriteReg(0x64, 0x04);
//    LPLD_SCCB_WriteReg(0x65, 0x20);
//    LPLD_SCCB_WriteReg(0x66, 0x05);
//    LPLD_SCCB_WriteReg(0x94, 0x04);
//    LPLD_SCCB_WriteReg(0x95, 0x08);
//    LPLD_SCCB_WriteReg(0x6c, 0x0a);
//    LPLD_SCCB_WriteReg(0x6d, 0x55);
//    LPLD_SCCB_WriteReg(0x4f, 0x80);
//    LPLD_SCCB_WriteReg(0x50, 0x80);
//    LPLD_SCCB_WriteReg(0x51, 0x00);
//    LPLD_SCCB_WriteReg(0x52, 0x22);
//    LPLD_SCCB_WriteReg(0x53, 0x5e);
//    LPLD_SCCB_WriteReg(0x54, 0x80);  
//    LPLD_SCCB_WriteReg(0x09, 0x03);
//    LPLD_SCCB_WriteReg(0x6e, 0x11);
//    LPLD_SCCB_WriteReg(0x6f, 0x9f);
//    LPLD_SCCB_WriteReg(0x55, 0x00);
//    LPLD_SCCB_WriteReg(0x56, 0x40);
//    LPLD_SCCB_WriteReg(0x57, 0x80);
//    LPLD_SCCB_WriteReg(0x14, 0x61);
//    LPLD_SCCB_WriteReg(0x70, 0x00);
//    LPLD_SCCB_WriteReg(0x71, 0xb0);
  
  
  
  
//  LPLD_SCCB_WriteReg(0x3a, 0x04);
//  LPLD_SCCB_WriteReg(0x40, 0xd0);
//  LPLD_SCCB_WriteReg(0x12, 0x14);
//  LPLD_SCCB_WriteReg(0x32, 0x80);
//  LPLD_SCCB_WriteReg(0x17, 0x16);
//  LPLD_SCCB_WriteReg(0x18, 0x04);
//  LPLD_SCCB_WriteReg(0x19, 0x02);
//  LPLD_SCCB_WriteReg(0x1a, 0x7b);
//  LPLD_SCCB_WriteReg(0x03, 0x06);
//  LPLD_SCCB_WriteReg(0x0c, 0x04);
//  LPLD_SCCB_WriteReg(0x3e, 0x00);
//  LPLD_SCCB_WriteReg(0x70, 0x3a);
//  LPLD_SCCB_WriteReg(0x71, 0x35);
//  LPLD_SCCB_WriteReg(0x72, 0x11);
//  LPLD_SCCB_WriteReg(0x73, 0x00);
//  LPLD_SCCB_WriteReg(0xa2, 0x02);
//  LPLD_SCCB_WriteReg(0x11, 0x00);  //++++++++++++++++  0x81
//  
//  LPLD_SCCB_WriteReg(0x7a, 0x20);
//  LPLD_SCCB_WriteReg(0x7b, 0x1c);
//  LPLD_SCCB_WriteReg(0x7c, 0x28);
//  LPLD_SCCB_WriteReg(0x7d, 0x3c);
//  LPLD_SCCB_WriteReg(0x7e, 0x55);
//  LPLD_SCCB_WriteReg(0x7f, 0x68);
//  LPLD_SCCB_WriteReg(0x80, 0x76);
//  LPLD_SCCB_WriteReg(0x81, 0x80);
//  LPLD_SCCB_WriteReg(0x82, 0x88);
//  LPLD_SCCB_WriteReg(0x83, 0x8f);
//  LPLD_SCCB_WriteReg(0x84, 0x96);
//  LPLD_SCCB_WriteReg(0x85, 0xa3);
//  LPLD_SCCB_WriteReg(0x86, 0xaf);
//  LPLD_SCCB_WriteReg(0x87, 0xc4);
//  LPLD_SCCB_WriteReg(0x88, 0xd7);
//  LPLD_SCCB_WriteReg(0x89, 0xe8);
//  
//  LPLD_SCCB_WriteReg(0x13, 0xe0);
//  LPLD_SCCB_WriteReg(0x00, 0x00);
//  
//  LPLD_SCCB_WriteReg(0x10, 0x00);
//  LPLD_SCCB_WriteReg(0x0d, 0x00);
//  LPLD_SCCB_WriteReg(0x14, 0x28);
//  LPLD_SCCB_WriteReg(0xa5, 0x05);
//  LPLD_SCCB_WriteReg(0xab, 0x07);
//  LPLD_SCCB_WriteReg(0x24, 0x75);
//  LPLD_SCCB_WriteReg(0x25, 0x63);
//  LPLD_SCCB_WriteReg(0x26, 0xA5);
//  LPLD_SCCB_WriteReg(0x9f, 0x78);
//  LPLD_SCCB_WriteReg(0xa0, 0x68);
//  LPLD_SCCB_WriteReg(0xa1, 0x03);
//  LPLD_SCCB_WriteReg(0xa6, 0xdf);
//  LPLD_SCCB_WriteReg(0xa7, 0xdf);
//  LPLD_SCCB_WriteReg(0xa8, 0xf0);
//  LPLD_SCCB_WriteReg(0xa9, 0x90);
//  LPLD_SCCB_WriteReg(0xaa, 0x94);
//  LPLD_SCCB_WriteReg(0x13, 0xe5);
//  
//  LPLD_SCCB_WriteReg(0x0e, 0x61);
//  LPLD_SCCB_WriteReg(0x0f, 0x4b);
//  LPLD_SCCB_WriteReg(0x16, 0x02);
//  LPLD_SCCB_WriteReg(0x1e, 0x07);
//  LPLD_SCCB_WriteReg(0x21, 0x02);
//  LPLD_SCCB_WriteReg(0x22, 0x91);
//  LPLD_SCCB_WriteReg(0x29, 0x07);
//  LPLD_SCCB_WriteReg(0x33, 0x0b);
//  LPLD_SCCB_WriteReg(0x35, 0x0b);
//  LPLD_SCCB_WriteReg(0x37, 0x1d);
//  LPLD_SCCB_WriteReg(0x38, 0x71);
//  LPLD_SCCB_WriteReg(0x39, 0x2a);
//  LPLD_SCCB_WriteReg(0x3c, 0x78);
//  LPLD_SCCB_WriteReg(0x4d, 0x40);
//  LPLD_SCCB_WriteReg(0x4e, 0x20);
//  LPLD_SCCB_WriteReg(0x69, 0x00);
//  LPLD_SCCB_WriteReg(0x6b, 0x60);
//  LPLD_SCCB_WriteReg(0x74, 0x19);
//  LPLD_SCCB_WriteReg(0x8d, 0x4f);
//  LPLD_SCCB_WriteReg(0x8e, 0x00);
//  LPLD_SCCB_WriteReg(0x8f, 0x00);
//  LPLD_SCCB_WriteReg(0x90, 0x00);
//  LPLD_SCCB_WriteReg(0x91, 0x00);
//  LPLD_SCCB_WriteReg(0x92, 0x00);
//  LPLD_SCCB_WriteReg(0x96, 0x00);
//  LPLD_SCCB_WriteReg(0x9a, 0x80);
//  LPLD_SCCB_WriteReg(0xb0, 0x84);
//  LPLD_SCCB_WriteReg(0xb1, 0x0c);
//  LPLD_SCCB_WriteReg(0xb2, 0x0e);
//  LPLD_SCCB_WriteReg(0xb3, 0x82);
//  LPLD_SCCB_WriteReg(0xb8, 0x0a);
//  
//  
//  
//  LPLD_SCCB_WriteReg(0x43, 0x14);
//  LPLD_SCCB_WriteReg(0x44, 0xf0);
//  LPLD_SCCB_WriteReg(0x45, 0x34);
//  LPLD_SCCB_WriteReg(0x46, 0x58);
//  LPLD_SCCB_WriteReg(0x47, 0x28);
//  LPLD_SCCB_WriteReg(0x48, 0x3a);
//  LPLD_SCCB_WriteReg(0x59, 0x88);
//  LPLD_SCCB_WriteReg(0x5a, 0x88);
//  LPLD_SCCB_WriteReg(0x5b, 0x44);
//  LPLD_SCCB_WriteReg(0x5c, 0x67);
//  LPLD_SCCB_WriteReg(0x5d, 0x49);
//  LPLD_SCCB_WriteReg(0x5e, 0x0e);
//  LPLD_SCCB_WriteReg(0x64, 0x04);
//  LPLD_SCCB_WriteReg(0x65, 0x20);
//  LPLD_SCCB_WriteReg(0x66, 0x05);
//  LPLD_SCCB_WriteReg(0x94, 0x04);
//  LPLD_SCCB_WriteReg(0x95, 0x08);
//  LPLD_SCCB_WriteReg(0x6c, 0x0a);
//  LPLD_SCCB_WriteReg(0x6d, 0x55);
//  LPLD_SCCB_WriteReg(0x6e, 0x11);
//  LPLD_SCCB_WriteReg(0x6f, 0x9f);
//  LPLD_SCCB_WriteReg(0x6a, 0x40);
//  LPLD_SCCB_WriteReg(0x01, 0x40);
//  LPLD_SCCB_WriteReg(0x02, 0x40);
//  LPLD_SCCB_WriteReg(0x13, 0xe7);
//  LPLD_SCCB_WriteReg(0x15, 0x00);  
//  
//  
//  LPLD_SCCB_WriteReg(0x4f, 0x80);
//  LPLD_SCCB_WriteReg(0x50, 0x80);
//  LPLD_SCCB_WriteReg(0x51, 0x00);
//  LPLD_SCCB_WriteReg(0x52, 0x22);
//  LPLD_SCCB_WriteReg(0x53, 0x5e);
//  LPLD_SCCB_WriteReg(0x54, 0x80);
//  LPLD_SCCB_WriteReg(0x58, 0x9e);
//  
//  LPLD_SCCB_WriteReg(0x41, 0x08);
//  LPLD_SCCB_WriteReg(0x3f, 0x00);
//  LPLD_SCCB_WriteReg(0x75, 0x05);
//  LPLD_SCCB_WriteReg(0x76, 0xe1);
//  LPLD_SCCB_WriteReg(0x4c, 0x00);
//  LPLD_SCCB_WriteReg(0x77, 0x01);
//  LPLD_SCCB_WriteReg(0x3d, 0xc2);	
//  LPLD_SCCB_WriteReg(0x4b, 0x09);
//  LPLD_SCCB_WriteReg(0xc9, 0x60);
//  LPLD_SCCB_WriteReg(0x41, 0x38);
//  LPLD_SCCB_WriteReg(0x56, 0x40);
//  
//  LPLD_SCCB_WriteReg(0x34, 0x11);
//  LPLD_SCCB_WriteReg(0x3b, 0x02); 
//  
//  LPLD_SCCB_WriteReg(0xa4, 0x89);
//  LPLD_SCCB_WriteReg(0x96, 0x00);
//  LPLD_SCCB_WriteReg(0x97, 0x30);
//  LPLD_SCCB_WriteReg(0x98, 0x20);
//  LPLD_SCCB_WriteReg(0x99, 0x30);
//  LPLD_SCCB_WriteReg(0x9a, 0x84);
//  LPLD_SCCB_WriteReg(0x9b, 0x29);
//  LPLD_SCCB_WriteReg(0x9c, 0x03);
//  LPLD_SCCB_WriteReg(0x9d, 0x4c);
//  LPLD_SCCB_WriteReg(0x9e, 0x3f);
//  LPLD_SCCB_WriteReg(0x78, 0x04);
//  
//  LPLD_SCCB_WriteReg(0x79, 0x01);
//  LPLD_SCCB_WriteReg(0xc8, 0xf0);
//  LPLD_SCCB_WriteReg(0x79, 0x0f);
//  LPLD_SCCB_WriteReg(0xc8, 0x00);
//  LPLD_SCCB_WriteReg(0x79, 0x10);
//  LPLD_SCCB_WriteReg(0xc8, 0x7e);
//  LPLD_SCCB_WriteReg(0x79, 0x0a);
//  LPLD_SCCB_WriteReg(0xc8, 0x80);
//  LPLD_SCCB_WriteReg(0x79, 0x0b);
//  LPLD_SCCB_WriteReg(0xc8, 0x01);
//  LPLD_SCCB_WriteReg(0x79, 0x0c);
//  LPLD_SCCB_WriteReg(0xc8, 0x0f);
//  LPLD_SCCB_WriteReg(0x79, 0x0d);
//  LPLD_SCCB_WriteReg(0xc8, 0x20);
//  LPLD_SCCB_WriteReg(0x79, 0x09);
//  LPLD_SCCB_WriteReg(0xc8, 0x80);
//  LPLD_SCCB_WriteReg(0x79, 0x02);
//  LPLD_SCCB_WriteReg(0xc8, 0xc0);
//  LPLD_SCCB_WriteReg(0x79, 0x03);
//  LPLD_SCCB_WriteReg(0xc8, 0x40);
//  LPLD_SCCB_WriteReg(0x79, 0x05);
//  LPLD_SCCB_WriteReg(0xc8, 0x30);
//  LPLD_SCCB_WriteReg(0x79, 0x26); 
//  LPLD_SCCB_WriteReg(0x09, 0x00);	
  
}

void SQC_OV7670_Show(void)
{
  uint16 i,j;
  uint16 coloer;
  
  for(i=0;i<240;i++)
    for(j=0;j<320;j++)
    {
      coloer = 0;
      coloer = SQC_OV7670_Readfifo();
      LPLD_LCD_SetPoint(j,i,coloer);  
    }
}

uint16 SQC_OV7670_Readfifo(void)
{
  uint16 c1 = 0,c2 = 0 ;
  ov7670_rck=0;
  c1 = LPLD_GPIO_Input_8b(PTA,9)&0xff;
  ov7670_rck = 1;
  ov7670_rck = 0;
  c2 = LPLD_GPIO_Input_8b(PTA,9)&0xff;
  ov7670_rck = 1;
  c1<<=8;
  c2=c1|c2;
  return c2;  
}

void SQC_OV7670_Isr()
{
  if(Is_DispPhoto==1 && LPLD_GPIO_IsPinxExt(PORTA, GPIO_Pin24))
  {
    ov7670_wrst=0;  //写指针复位
    ov7670_wr=1;   //写使能
    Is_DispPhoto =2;
    ov7670_wr=1;   //写使能
    ov7670_wrst=1;
    
  }
  else if(Is_DispPhoto == 2 && LPLD_GPIO_IsPinxExt(PORTA, GPIO_Pin24))
  {
    ov7670_wr=0;
    Is_DispPhoto = 3;
    
  }
  else if(Is_DispPhoto==3)
        { 
          ov7670_rrst=0;
          ov7670_rck = 0;
          ov7670_rck=1;
          ov7670_rrst=1;
          ov7670_rck=0;
          ov7670_rck=1; 
          SQC_OV7670_Show();
          //清PORTA中断标志
          LPLD_GPIO_ClearIntFlag(PORTA);       
          //使能PORTA中断
          Is_DispPhoto = 1;
          enable_irq(PORTA_IRQn);
          
        } 
  
}

