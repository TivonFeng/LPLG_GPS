/**
 * @file SQC_UM220.h
 * @version 1.0[By Tivon]
 * @date 2015-04-16
 * @brief UM220 GPS ģ����غ���
 *
 * ���Ľ���:�������޸�
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
#include "SQC_UM220.h"
#include "HW_UART.h"
#include "DEV_LCD.h"
struct UM220_POS gps_pos;
struct UM220_VTG gps_vtg;
struct UM220_BUF gps_buf;
struct UM220_ZDA gps_zda;


//��ʼ��gpsģ��õ�λ����Ϣ
uint8 SQC_UM220_Init()
{
  
  uint8 recv[50];
  sprintf(recv,"$CFGMSG,0,0,0\r\n");
  LPLD_UART_PutCharArr(UART3, recv,strlen(recv));//gps�Ĵ���
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


//�����λ
uint8 SQC_UM220_Reset()
{
  uint8 recv[50];
  sprintf(recv,"$RESET,0,0xFF0\r\n");
  LPLD_UART_PutCharArr(UART3, recv,strlen(recv));
  return 0;
}
//��Ϣͷ����
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
//��Ϣ��ӡ
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
       //printf("��γ is %s��C\n",gps_pos.lat);
      LPLD_LCD_ShowStringno(100,120,"N",0x00ff);
      LPLD_LCD_ShowStringno(120,120,gps_pos.lat,0x00ff);
     }
    else
    {
       sprintf(gps_pos.lat,"%s",gps_pos.lat);
       //printf("��γ is %s��C\n",gps_pos.lat);
        LPLD_LCD_ShowStringno(100,120,"S",0x00ff);
      LPLD_LCD_ShowStringno(120,120,gps_pos.lat,0x00ff);
     }
    if(gps_pos.lon[0]=='-')
    {
       sprintf(gps_pos.lon,"%s",gps_pos.lon);
       //printf("���� is %s��C\n",gps_pos.lon);
        LPLD_LCD_ShowStringno(100,140,"W",0x00ff);
      LPLD_LCD_ShowStringno(120,140,gps_pos.lon,0x00ff);
    }
    else
    {
       sprintf(gps_pos.lat,"%s",gps_pos.lon);
      // printf("���� is %s��C\n",gps_pos.lon);
          LPLD_LCD_ShowStringno(100,140,"E",0x00ff);
      LPLD_LCD_ShowStringno(120,140,gps_pos.lon,0x00ff);
    }   
    gps_buf.gps_buf_len=0; 
    
    sprintf(gps_pos.height,"%s",gps_pos.height);
    printf("�߶� is %s ��\n",gps_pos.height);
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
    //printf("�ٶ� %s km/h\n",gps_vtg.kph);
    //printf("���� %s��C\n",gps_vtg.cogm);
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
//UTCʱ��ת������ʱ��
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
//���ݴ洢
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

//��ȡggaָ��
struct UM220_POS* Getpointer_pos()
{
  return &gps_pos;
}

//��ȡvtaָ��
struct UM220_VTG* Getpointer_vtg()
{
  return &gps_vtg;
}

//��ȡbufָ��
struct UM220_BUF* Getpointer_buf()
{
  return &gps_buf;
}