/**
 * @file SQC_OV7670.H
 * @version 1.0[By finley]
 * @date 2015-04-16
 * @brief ����ͷģ����غ���
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
 * ��Ӧ�����ش�Э��Ļ����ϣ�����Դ���롢���ó��۴��뱾����
 * ��ǨѧԺ����������ʹ�ñ��������������κ��¹ʡ��������λ���ز���Ӱ�졣
 * ��ǨѧԺ��������͡�˵��������ľ���ԭ�������ܡ�ʵ�ַ�����
 * ������ǨѧԺ[SQC]��Ȩ�������߲��ý�������������ҵ��Ʒ��
 */

#ifndef __SQC_OV7670_H__
#define __SQC_OV7670_H__

#define ov7670_wrst  PTA6_O         //���   дָ�븴λ
#define ov7670_wr    PTA25_O         //���   дʹ��
#define ov7670_rrst  PTA7_O         //���    ��ָ�븴λ
#define ov7670_rck   PTA17_O         //���   ��ʱ��  a16
#define ov7670_oe    PTA8_O         //���   ��ʱ��  a24

//ov7670��ʼ��
uint8  SQC_OV7670_Init(void);
//����ov7670�Ĵ�������init���ã�
void   SQC_OV7670_Setreg(void);
//��ʾ����ͷ��ǰ���ݵ�LCD��Ļ��
void SQC_OV7670_Show(void);
//��ȡfifo�ڵ�����
uint16 SQC_OV7670_Readfifo(void);
//ov7670���жϺ���
void SQC_OV7670_Isr();


#endif /* __SQC_OV7670_H__ */