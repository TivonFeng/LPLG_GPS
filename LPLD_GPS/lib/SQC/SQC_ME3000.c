/**
 * @file SQC_ME3000.c
 * @version 1.0[By finley]
 * @date 2015-04-16
 * @brief ZTE-ME3000 3G/GPRS 模块相关函数
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
#include "SQC_ME3000.h"
#include "HW_UART.h"

struct _ME3000_PIB  gprs_pib;  
   
//初始化模块
uint8 SQC_ME3000_Init()
{
  uint8 temp =0;
  printf("Start device,waiting...\n"); 
  gprs_pib.Rxlen= 0;
  gprs_pib.Rxflag = 0;
  gprs_pib.msgnum = 0;
  LPLD_GPIO_Output_b(PTC,14,0);
  delay();
  LPLD_GPIO_Output_b(PTC,14,1);
  LPLD_GPIO_Output_b(PTC,19,1);
  delay();  delay();
  delay();  delay();
  delay();  delay();
  delay();  delay();
  LPLD_GPIO_Output_b(PTC,19,0);
  while(1)
  {
    if(gprs_pib.Rxflag == 2 && temp == 0)
    {
      if (strstr(gprs_pib.Rxbuf,"+CFUN: 1") != 0)
        temp += 2;
      else 
        temp += 1;
      gprs_pib.Rxflag = 0;
    }
    if(gprs_pib.Rxflag == 2 && temp > 0)
    {
      if (strstr(gprs_pib.Rxbuf,"+CPIN: READY") != 0)
        temp += 2;
      else 
        temp +=1;
      if (temp == 4)
      {
        gprs_pib.Rxflag = 0;
        break;
      }
      else
      {
        gprs_pib.Rxflag = 0;
        return FALSE;
      }
    }   
  }
  return SQC_ME3000_Creg();

}

//获取pib指针
struct _ME3000_PIB* SQC_ME3000_GetPib()
{
  return &gprs_pib;
}
 
//查询是否入网
uint8 SQC_ME3000_Creg()
{
  uint8 cmd[20];
  gprs_pib.Rxflag = 0;
  sprintf(cmd,"AT+CREG?\r\n");
  while(1)
  {
    LPLD_UART_PutCharArr(UART5,cmd,strlen(cmd));
    delay();delay();
    if(gprs_pib.Rxflag == 2)
    {
      if(strstr(gprs_pib.Rxbuf,"+CREG: 0, 1") != 0)
      {
        gprs_pib.Rxflag = 0;
        return TRUE;
      }
      else
        gprs_pib.Rxflag = 0;
    }
  }
}

//打开gprs网络
uint8 SQC_ME3000_Open()
{
  uint8 cmd[20];
  gprs_pib.Rxflag = 0;
  sprintf(cmd,"AT+ZPPPOPEN\r\n");
  LPLD_UART_PutCharArr(UART5,cmd,strlen(cmd));
  while(1)
  {
    delay();delay();
    if(gprs_pib.Rxflag == 2)
    {
      if(strstr(gprs_pib.Rxbuf,"+ZPPPOPEN:CONNECTED") != 0
         || strstr(gprs_pib.Rxbuf,"+ZPPPOPEN:ESTABLISHED") != 0)
        return TRUE;
      else
        return FALSE;
    }
  }
}

//关闭gprs网络
uint8 SQC_ME3000_Close()
{
  uint8 cmd[20];
  gprs_pib.Rxflag = 0;
  sprintf(cmd,"AT+ZPPPCLOSE\r\n");
  LPLD_UART_PutCharArr(UART5,cmd,strlen(cmd));
  while(1)
  {
    delay();
    if(gprs_pib.Rxflag == 2)
    {
      if(strstr(gprs_pib.Rxbuf,"+ZPPPCLOSE:OK") != 0
         || strstr(gprs_pib.Rxbuf,"+ZPPPCLOSE:DISCONNECTED") != 0)
        return TRUE;
      else
        return FALSE;
    }
  }
}

//查询gprs连接状态
uint8 SQC_ME3000_Pppstat()
{
  uint8 cmd[20];
  gprs_pib.Rxflag = 0;
  sprintf(cmd,"AT+ZPPPSTATUS\r\n");
  LPLD_UART_PutCharArr(UART5,cmd,strlen(cmd));
  while(1)
  {
    delay();
    if(gprs_pib.Rxflag == 2)
    {
      if(strstr(gprs_pib.Rxbuf,"+ZPPPSTATUS:ESTABLISHED") != 0)
        return TRUE;
      else
        return FALSE;
    }
  }
}

//使用tcp连接服务器
uint8 SQC_ME3000_Connect(struct _in_addr addr)
{
  uint8 cmd[50];
  gprs_pib.Rxflag = 0;
  sprintf(cmd,"AT+ZIPSETUP=1,%d.%d.%d.%d,%d\r\n",addr.s_addr[0],addr.s_addr[1],addr.s_addr[2],addr.s_addr[3],addr.s_port);
  LPLD_UART_PutCharArr(UART5,cmd,strlen(cmd));
  while(1)
  {
    delay();
    if(gprs_pib.Rxflag == 2)
    {
      if(strstr(gprs_pib.Rxbuf,"+ZIPSETUP:CONNECTED") != 0)
        return TRUE;
      else
        return FALSE;
    }
  }
}

//查询tcp连接状态
uint8 SQC_ME3000_Tcpstat()
{
  uint8 cmd[20];
  gprs_pib.Rxflag = 0;
  sprintf(cmd,"AT+ZIPSTATUS=1\r\n");
  LPLD_UART_PutCharArr(UART5,cmd,strlen(cmd));
  while(1)
  {
    delay();
    if(gprs_pib.Rxflag == 2)
    {
      if(strstr(gprs_pib.Rxbuf,"+ZIPSTATUS:ESTABLISHED") != 0)
        return TRUE;
      else
        return FALSE;
    }
  }
}

//关闭tcp连接
uint8 SQC_ME3000_Disconnect()
{
  uint8 cmd[20];
  gprs_pib.Rxflag = 0;
  sprintf(cmd,"AT+ZIPCLOSE=1\r\n");
  LPLD_UART_PutCharArr(UART5,cmd,strlen(cmd));
  while(1)
  {
    delay();
    if(gprs_pib.Rxflag == 2)
    {
      if(strstr(gprs_pib.Rxbuf,"+ZIPCLOSE:OK") != 0)
        return TRUE;
      else
        return FALSE;
    }
  }
}

//向服务器发送数据
uint8 SQC_ME3000_Send(uint8 * msg,uint16 len)
{
  uint8 cmd[20];
  gprs_pib.Rxflag = 0;
  sprintf(cmd,"AT+ZIPSEND=1,%d\r\n",len);
  LPLD_UART_PutCharArr(UART5,cmd,strlen(cmd));
  while(1)
  {
    delay();
    if(gprs_pib.Rxflag == 3)
    {
      gprs_pib.Rxflag = 0;
      LPLD_UART_PutCharArr(UART5,msg,len);
      LPLD_UART_PutChar(UART5,0x0D);
      LPLD_UART_PutChar(UART5,0x0A);
    }
    if(gprs_pib.Rxflag == 2)
    {
      if(strstr(gprs_pib.Rxbuf,"+ZIPSEND:OK") != 0)
        return TRUE;
      else
        return FALSE;
    }
  }
}

//解析从服务器接收到的数据
uint8 SQC_ME3000_Recive(uint8* cmd,uint16 len)
{
  uint8 rxlen[10];
  uint8 i = 0;
  if(cmd[0] == '+' && cmd[1] == 'Z' &&
     cmd[2] == 'I' && cmd[3] == 'P' &&
     cmd[4] == 'R' && cmd[5] == 'E' &&
     cmd[6] == 'C' && cmd[7] == 'V' )
  {
    if(gprs_pib.msgnum >= 10)
      return FALSE;
    cmd += 11;
    do
    {
      rxlen[i] = *cmd;
      i++;
      cmd++;
    }while(*cmd != ',');
    cmd++;
    rxlen[i] = 0;
    len = atoi(rxlen);
    gprs_pib.Rxmsg[gprs_pib.msgnum] = (uint8 *)malloc(len+1);
    strncpy(gprs_pib.Rxmsg[gprs_pib.msgnum],cmd,len);
    printf("Recv Msg:%s\n",gprs_pib.Rxmsg[gprs_pib.msgnum]);
    gprs_pib.msgnum++;
    return TRUE;
  }
  else
    return FALSE;      
}

