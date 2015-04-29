/**
 * @file SQC_ME3000.H
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

#ifndef __SQC_ME3000_H__
#define __SQC_ME3000_H__

struct _in_addr
{
  uint8    s_addr[4];    //保存一个IP地址
  uint16   s_port;      //保存一个端口号 
};

struct _ME3000_PIB
{
  uint8    Rxbuf[1024]; //接受数据缓冲区
  uint16   Rxlen;       //接收数据长度
  uint8    Rxflag;      //接收数据标志位(0无数据，1正在接收，2接收完成，3等待发送数据）
  uint8    *Rxmsg[10]; //接收的tcp数据包指针，最大储存十个数据包，长度可以用strlen得到
  uint8    msgnum;      //接收到的tcp数据包数量初始0，最大10
};

//初始化模块
uint8 SQC_ME3000_Init();
//查询是否入网
uint8 SQC_ME3000_Creg();
//打开gprs网络
uint8 SQC_ME3000_Open();
//关闭gprs网络
uint8 SQC_ME3000_Close();
//查询gprs连接状态
uint8 SQC_ME3000_Pppstat();
//使用tcp连接服务器
uint8 SQC_ME3000_Connect(struct _in_addr addr);
//查询tcp连接状态
uint8 SQC_ME3000_Tcpstat();
//关闭tcp连接
uint8 SQC_ME3000_Disconnect();
//向服务器发送数据
uint8 SQC_ME3000_Send(uint8 * msg,uint16 len);
//解析从服务器接收到的数据
uint8 SQC_ME3000_Recive(uint8* cmd,uint16 len);
//获取pib指针
struct _ME3000_PIB* SQC_ME3000_GetPib();


#endif /* __SQC_ME3000_H__ */