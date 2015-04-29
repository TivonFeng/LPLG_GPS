/**
 * @file Interface.h
 * @version 1.0[By finley]
 * @date 2015-04-16
 * @brief 接口初始化函数
 *
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

#ifndef __Interface_H_
#define __Interface_H_

void uart0_isr(void);
void uart1_isr(void);
void uart2_isr(void);
void uart3_isr(void);
void uart4_isr(void);
void uart5_isr(void);

void uart_init(void);
void gpio_init();


#endif