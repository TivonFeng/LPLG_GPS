/**
 * @file SQC_UM220.h
 * @version 1.0[By Tivon]
 * @date 2015-04-16
 * @brief UM220 GPS 模块相关函数
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
#include "SQC_UM220.h"
#include "HW_UART.h"
#include "DEV_LCD.h"
struct UM220_POS gps_pos;
struct UM220_VTG gps_vtg;
struct UM220_BUF gps_buf;
struct UM220_ZDA gps_zda;


//初始化gps模块得到位置信息
uint8 SQC_UM220_Init()
{
  
  uint8 recv[50];
  sprintf(recv,"$CFGMSG,0,0,0\r\n");
  LPLD_UART_PutCharArr(UART3, recv,strlen(recv));//gps的串口
  sprintf(recv,"$CFGMSG,0,1,0\r\n");
  LPLD_UART_PutCharArr(UART3, recv,strlen(recv));
  sprintf(recv,"$CFGMSG,0,2,0\r\n");
  LPLD_UART_PutCharArr(UART3, recv,strlen(recv));
  sprintf(recv,"$CFGMSG,0,3,0\r\n");
  LPLD_UART_PutCharArr(UART3, recv,strlen(recv));
  sprintf(recv,"$CFGMSG,0,4,0\r\n");
  LPLD_UART_PutCharArr(UART3, recv,strlen(recv));
  sprintf(recv,"$CFGMSG,0,5,8\r\n");
  LPLD_UART_PutCharArr(UART3, recv,strlen(recv));
  return 0 ;
}


//软件复位
uint8 SQC_UM220_Reset()
{
  uint8 recv[50];
  sprintf(recv,"$RESET,0,0xFF0\r\n");
  LPLD_UART_PutCharArr(UART3, recv,strlen(recv));
  return 0;
}
//信息头解析
 uint8 SQC_UM220_Recog()
{
 
  if(gps_buf.gps_Rxbuf[0]=='$'&&gps_buf.gps_Rxbuf[1]=='N'&&gps_buf.gps_Rxbuf[2]=='A'
     &&gps_buf.gps_Rxbuf[3]=='V'&&gps_buf.gps_Rxbuf[4]=='P'&&gps_buf.gps_Rxbuf[5]=='O'
       &&gps_buf.gps_Rxbuf[6]=='S')
    return 1;
  if(gps_buf.gps_Rxbuf[0]=='$'&&gps_buf.gps_Rxbuf[1]=='G'&&gps_buf.gps_Rxbuf[2]=='N'
     &&gps_buf.gps_Rxbuf[3]=='V'&&gps_buf.gps_Rxbuf[4]=='T'&&gps_buf.gps_Rxbuf[5]=='G')
  return 2;
  if(gps_buf.gps_Rxbuf[0]=='$'&&gps_buf.gps_Rxbuf[1]=='G'&&gps_buf.gps_Rxbuf[2]=='N'
     &&gps_buf.gps_Rxbuf[3]=='Z'&&gps_buf.gps_Rxbuf[4]=='D'&&gps_buf.gps_Rxbuf[5]=='A')
    return 3;
  
}
//信息打印
uint8 SQC_UM220_Req()
{
  int8 i=0,j=1,k=0;
  uint8 recv[50],t1;
 
  switch(SQC_UM220_Recog())
  {
    
  case 1:
    SQC_UM220_save(gps_pos.lat,8,-1);
    SQC_UM220_save(gps_pos.lon,9,-1);
    SQC_UM220_save(gps_pos.height,10,-1);
    if(gps_pos.lat[0]=='-')
    {
       sprintf(gps_pos.lat,"%s",gps_pos.lat);
       //printf("北纬 is %s°C\n",gps_pos.lat);
      LPLD_LCD_ShowStringno(100,120,"N",0x00ff);
      LPLD_LCD_ShowStringno(120,120,gps_pos.lat,0x00ff);
     }
    else
    {
       sprintf(gps_pos.lat,"%s",gps_pos.lat);
       //printf("南纬 is %s°C\n",gps_pos.lat);
        LPLD_LCD_ShowStringno(100,120,"S",0x00ff);
      LPLD_LCD_ShowStringno(120,120,gps_pos.lat,0x00ff);
     }
    if(gps_pos.lon[0]=='-')
    {
       sprintf(gps_pos.lon,"%s",gps_pos.lon);
       //printf("西经 is %s°C\n",gps_pos.lon);
        LPLD_LCD_ShowStringno(100,140,"W",0x00ff);
      LPLD_LCD_ShowStringno(120,140,gps_pos.lon,0x00ff);
    }
    else
    {
       sprintf(gps_pos.lat,"%s",gps_pos.lon);
      // printf("东经 is %s°C\n",gps_pos.lon);
          LPLD_LCD_ShowStringno(100,140,"E",0x00ff);
      LPLD_LCD_ShowStringno(120,140,gps_pos.lon,0x00ff);
    }   
    gps_buf.gps_buf_len=0; 
    
    sprintf(gps_pos.height,"%s",gps_pos.height);
    printf("高度 is %s 米\n",gps_pos.height);
    sprintf(recv,"$CFGMSG,1,0,0\r\n");
    LPLD_UART_PutCharArr(UART3, recv,strlen(recv)); 
    sprintf(recv,"$CFGMSG,0,5,5\r\n");
    LPLD_UART_PutCharArr(UART3, recv,strlen(recv));
    break;
    
  case 2:
    SQC_UM220_save(gps_vtg.cogm,2,-1);
    SQC_UM220_save(gps_vtg.kph,8,-1);
    sprintf(gps_vtg.cogm,"%s",gps_vtg.cogm);
    sprintf(gps_vtg.kph,"%s",gps_vtg.kph);
    //printf("速度 %s km/h\n",gps_vtg.kph);
    //printf("方向 %s°C\n",gps_vtg.cogm);
     LPLD_LCD_ShowStringno(100,80,"speed is",0x00ff);
    LPLD_LCD_ShowStringno(170,80,gps_vtg.kph,0x00ff);
     LPLD_LCD_ShowStringno(100,100,"dir is",0x00ff);
    LPLD_LCD_ShowStringno(160,100,gps_vtg.cogm,0x00ff);
    gps_buf.gps_buf_len=0; 
    sprintf(recv,"$CFGMSG,0,5,0\r\n");
    LPLD_UART_PutCharArr(UART3, recv,strlen(recv));
    sprintf(recv,"$CFGMSG,0,6,5\r\n");
    LPLD_UART_PutCharArr(UART3, recv,strlen(recv));
    break;
    
  case 3:
    SQC_UM220_save(gps_zda.time,2,4);
    SQC_UM220_Time(gps_zda.time);
    sprintf(gps_zda.time,"%s",gps_zda.time); 
    //printf("time is %s\n",gps_zda.time);
    LPLD_LCD_ShowStringno(100,60,"time is",0x00ff);
    LPLD_LCD_ShowStringno(160,60,gps_zda.time,0x00ff);
    gps_buf.gps_buf_len=0;
    sprintf(recv,"$CFGMSG,0,6,0\r\n");
    LPLD_UART_PutCharArr(UART3, recv,strlen(recv));
    sprintf(recv,"$CFGMSG,1,0,5\r\n");
    LPLD_UART_PutCharArr(UART3, recv,strlen(recv));
    break;
  default:
    return 0;
    
  }
     
}
//UTC时间转化当地时间
void  SQC_UM220_Time(uint8 time[])
{
  uint8 t1;  
  t1=(gps_zda.time[0]-0x30)*10;
       t1+=(gps_zda.time[1]-0x30);
       t1+=8;
       if(t1>23) 
       t1-=24;
       gps_zda.time[0]=t1/10+0x30;
       gps_zda.time[1]=t1%10+0x30; 
       gps_zda.time[4]=gps_zda.time[3];
       gps_zda.time[3]=gps_zda.time[2]; 
       gps_zda.time[2]=':';
}
//数据存储
void SQC_UM220_save(uint8 a[],int q,int p)
{
  int8 i=0,j=1,k=0;
  uint8 recv[50],t1;
 for(int i=0;i<gps_buf.gps_buf_len;i++)
   {
     if(gps_buf.gps_Rxbuf[i]=='*')
       break;
     if(gps_buf.gps_Rxbuf[i]==',')
     {
       j++;
       k=0;
       continue;
     }
     if(j==q)
     {
       if(k==p)
       {
         break;
       }
       a[k]=gps_buf.gps_Rxbuf[i];
       k++;
       
     }  
    
   }
}

//获取gga指针
struct UM220_POS* Getpointer_pos()
{
  return &gps_pos;
}

//获取vta指针
struct UM220_VTG* Getpointer_vtg()
{
  return &gps_vtg;
}

//获取buf指针
struct UM220_BUF* Getpointer_buf()
{
  return &gps_buf;
}