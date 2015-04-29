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



#ifndef __SQC_UM220_H__
#define __SQC_UM220_H__



 struct UM220_POS    //gga数据接收
{
	
	int8 lat[30];//纬度
	int8 lon[30];//经度
	int8 height[30];
};
 struct UM220_VTG   //vta数据接收
{
	int8 kph[10];//地面速率，单位：km/h
	int8 cogm[20];//地面航向，（0.000~359.999）	
};
struct UM220_ZDA   
{
  int8 time[30];
};
struct UM220_BUF    //串口接收的数据流
{
       //缓冲区
    int8 gps_Rxbuf[1024]; 
    uint16 gps_buf_len;//字符长度
    uint8  gps_HeadFlag;
};

//初始化
uint8 SQC_UM220_Init();
//信息头解析
uint8 SQC_UM220_Recog();
//存储信息
void SQC_UM220_save(uint8 a[],int q,int p);
//UTC时间转化
void  SQC_UM220_Time(uint8 time[]);
//芯片复位
uint8 SQC_UM220_Reset();
//识别gga信息或vta信息
uint8 SQC_UM220_Req();//信息打印
//获取buf结构体指针
struct UM220_BUF* Getpointer_buf();
struct UM220_POS* Getpointer_pos();
struct UM220_VTG* Getpointer_vtg();




#endif