/**
 * @file SQC_Security.c
 * @version 1.0[By finley]
 * @date 2015-04-16
 * @brief 数据加密相关函数
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
#include "SQC_Security.h"
#include "SHA256.h"
#include "aes256.h"


//获取unique id(128bit)
uint8 * SQC_SEC_GetID()
{
  uint32* uniqueid = (uint32*)malloc(sizeof(uint32)*4);
  uniqueid[0] = SIM->UIDH;
  uniqueid[1] = SIM->UIDMH;
  uniqueid[2] = SIM->UIDML;
  uniqueid[3] = SIM->UIDL;
  return (uint8*)uniqueid;
}

//生成sha256哈希值
uint8 SQC_SEC_Sha256(uint8* input,uint16 len,uint8* key)
{
  return PubCrypt_SHA256(input,len,key);
}

//加密数据(256bit密钥）
//返回密文的长度（字节），参数为（密钥，密文指针（返回），明文指针，明文长度）
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
      
//解密数据(256bit密钥）
//返回明文的长度（字节），参数为（密钥，明文指针（返回），密文指针，密文长度）
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
