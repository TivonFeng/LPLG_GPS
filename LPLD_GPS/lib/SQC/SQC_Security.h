/**
 * @file SQC_Security.H
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

#ifndef __SQC_SECURITY_H__
#define __SQC_SECURITY_H__

//获取unique id(128bit)
uint8 * SQC_SEC_GetID();
//生成sha256哈希值
//返回成功1,失败0，参数为（数据指针，数据长度，哈希指针）
uint8 SQC_SEC_Sha256(uint8* input,uint16 len,uint8* key);
//加密数据(256bit密钥）
//返回密文的长度（字节），参数为（密钥，密文指针（返回），明文指针，明文长度）
uint16 SQC_SEC_AESenc(uint8* key,uint8** cry,uint8* data,uint16 len);
//解密数据(256bit密钥）
//返回明文的长度（字节），参数为（密钥，明文指针（返回），密文指针，密文长度）
uint16 SQC_SEC_AESdec(uint8* key,uint8** data,uint8* cry,uint16 len);
//编码数据base64
//uint8* SQC_SEC_Base64enc(uint8*);
//解码数据base64
//uint8* SQC_SEC_Base64dec(uint8*);
              

#endif /* __SQC_SECURITY_H__ */