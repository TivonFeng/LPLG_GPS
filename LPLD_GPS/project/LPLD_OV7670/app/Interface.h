/**
 * @file Interface.h
 * @version 1.0[By finley]
 * @date 2015-04-16
 * @brief �ӿڳ�ʼ������
 *
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