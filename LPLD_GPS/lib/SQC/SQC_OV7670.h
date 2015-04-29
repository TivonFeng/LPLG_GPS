/**
 * @file SQC_OV7670.H
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

#ifndef __SQC_OV7670_H__
#define __SQC_OV7670_H__

#define ov7670_wrst  PTA6_O         //输出   写指针复位
#define ov7670_wr    PTA25_O         //输出   写使能
#define ov7670_rrst  PTA7_O         //输出    读指针复位
#define ov7670_rck   PTA17_O         //输出   读时钟  a16
#define ov7670_oe    PTA8_O         //输出   读时钟  a24

//ov7670初始化
uint8  SQC_OV7670_Init(void);
//配置ov7670寄存器（被init调用）
void   SQC_OV7670_Setreg(void);
//显示摄像头当前内容到LCD屏幕上
void SQC_OV7670_Show(void);
//读取fifo内的数据
uint16 SQC_OV7670_Readfifo(void);
//ov7670的中断函数
void SQC_OV7670_Isr();


#endif /* __SQC_OV7670_H__ */