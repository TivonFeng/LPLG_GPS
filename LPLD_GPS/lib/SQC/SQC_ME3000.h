/**
 * @file SQC_ME3000.H
 * @version 1.0[By finley]
 * @date 2015-04-16
 * @brief ZTE-ME3000 3G/GPRS ģ����غ���
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

#ifndef __SQC_ME3000_H__
#define __SQC_ME3000_H__

struct _in_addr
{
  uint8    s_addr[4];    //����һ��IP��ַ
  uint16   s_port;      //����һ���˿ں� 
};

struct _ME3000_PIB
{
  uint8    Rxbuf[1024]; //�������ݻ�����
  uint16   Rxlen;       //�������ݳ���
  uint8    Rxflag;      //�������ݱ�־λ(0�����ݣ�1���ڽ��գ�2������ɣ�3�ȴ��������ݣ�
  uint8    *Rxmsg[10]; //���յ�tcp���ݰ�ָ�룬��󴢴�ʮ�����ݰ������ȿ�����strlen�õ�
  uint8    msgnum;      //���յ���tcp���ݰ�������ʼ0�����10
};

//��ʼ��ģ��
uint8 SQC_ME3000_Init();
//��ѯ�Ƿ�����
uint8 SQC_ME3000_Creg();
//��gprs����
uint8 SQC_ME3000_Open();
//�ر�gprs����
uint8 SQC_ME3000_Close();
//��ѯgprs����״̬
uint8 SQC_ME3000_Pppstat();
//ʹ��tcp���ӷ�����
uint8 SQC_ME3000_Connect(struct _in_addr addr);
//��ѯtcp����״̬
uint8 SQC_ME3000_Tcpstat();
//�ر�tcp����
uint8 SQC_ME3000_Disconnect();
//���������������
uint8 SQC_ME3000_Send(uint8 * msg,uint16 len);
//�����ӷ��������յ�������
uint8 SQC_ME3000_Recive(uint8* cmd,uint16 len);
//��ȡpibָ��
struct _ME3000_PIB* SQC_ME3000_GetPib();


#endif /* __SQC_ME3000_H__ */