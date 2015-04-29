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



#ifndef __SQC_UM220_H__
#define __SQC_UM220_H__



 struct UM220_POS    //gga���ݽ���
{
	
	int8 lat[30];//γ��
	int8 lon[30];//����
	int8 height[30];
};
 struct UM220_VTG   //vta���ݽ���
{
	int8 kph[10];//�������ʣ���λ��km/h
	int8 cogm[20];//���溽�򣬣�0.000~359.999��	
};
struct UM220_ZDA   
{
  int8 time[30];
};
struct UM220_BUF    //���ڽ��յ�������
{
       //������
    int8 gps_Rxbuf[1024]; 
    uint16 gps_buf_len;//�ַ�����
    uint8  gps_HeadFlag;
};

//��ʼ��
uint8 SQC_UM220_Init();
//��Ϣͷ����
uint8 SQC_UM220_Recog();
//�洢��Ϣ
void SQC_UM220_save(uint8 a[],int q,int p);
//UTCʱ��ת��
void  SQC_UM220_Time(uint8 time[]);
//оƬ��λ
uint8 SQC_UM220_Reset();
//ʶ��gga��Ϣ��vta��Ϣ
uint8 SQC_UM220_Req();//��Ϣ��ӡ
//��ȡbuf�ṹ��ָ��
struct UM220_BUF* Getpointer_buf();
struct UM220_POS* Getpointer_pos();
struct UM220_VTG* Getpointer_vtg();




#endif