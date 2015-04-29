/**
 * @file SQC_Security.c
 * @version 1.0[By finley]
 * @date 2015-04-16
 * @brief ���ݼ�����غ���
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
#include "SQC_Security.h"
#include "SHA256.h"
#include "aes256.h"


//��ȡunique id(128bit)
uint8 * SQC_SEC_GetID()
{
  uint32* uniqueid = (uint32*)malloc(sizeof(uint32)*4);
  uniqueid[0] = SIM->UIDH;
  uniqueid[1] = SIM->UIDMH;
  uniqueid[2] = SIM->UIDML;
  uniqueid[3] = SIM->UIDL;
  return (uint8*)uniqueid;
}

//����sha256��ϣֵ
uint8 SQC_SEC_Sha256(uint8* input,uint16 len,uint8* key)
{
  return PubCrypt_SHA256(input,len,key);
}

//��������(256bit��Կ��
//�������ĵĳ��ȣ��ֽڣ�������Ϊ����Կ������ָ�루���أ�������ָ�룬���ĳ��ȣ�
uint16 SQC_SEC_AESenc(uint8* key,uint8** cry,uint8* data,uint16 len)
{
  uint16 relen;
  uint8  fill,t1,t2,t3;
  aes256_context ctx;
  
  t1 = len%16;
  if(t1 == 0)
  {
    fill = 16;
    relen = len + 16;
  }
  else
  {
    fill = 16 - t1;
    relen = len + fill;
  }
  *cry = (uint8*)malloc(sizeof(uint8)*relen);
  for(t2=0;t2<relen;t2++)
  {
    if(t2<len)
      (*cry)[t2] = data[t2];
    else
      (*cry)[t2] = fill;
  }
  
  aes256_init(&ctx, key);
  for(t3 = 0;t3 < relen/16;t3++)
  {
    aes256_encrypt_ecb(&ctx, ((*cry)+t3*16));
  }
  return relen;
}
      
//��������(256bit��Կ��
//�������ĵĳ��ȣ��ֽڣ�������Ϊ����Կ������ָ�루���أ�������ָ�룬���ĳ��ȣ�
uint16 SQC_SEC_AESdec(uint8* key,uint8** data,uint8* cry,uint16 len)
{
  uint16 relen;
  uint8  fill,t3;
  aes256_context ctx;
  
  aes256_init(&ctx, key);
  
  for(t3 = 0;t3 < len/16;t3++)
  {
    aes256_decrypt_ecb(&ctx,(cry+t3*16));
  }
  fill = cry[len-1];
  relen = len - fill;
  (*data) = (uint8*)malloc(sizeof(uint8)*relen);
  strncpy((*data),cry,relen);
  return relen;
}
