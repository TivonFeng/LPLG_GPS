#ifndef _SHA256_H_
#define _SHA256_H_

#define RETURN_SUCC       1   //成功
#define RETURN_FAIL       0   //失败  
#define RETURN_ERR_PARAM  0   //参数错
#define NULL              0

//SHA256所使用的结构体
typedef struct
{
    unsigned int  total[2];      /*!< number of bytes processed  */
    unsigned int  state[8];      /*!< intermediate digest state  */
    unsigned char  buffer[64];   /*!< data block being processed */

    unsigned char  ipad[64];     /*!< HMAC: inner padding        */
    unsigned char  opad[64];     /*!< HMAC: outer padding        */
    unsigned char  is224;        /*!< 0 => SHA-256, else SHA-224 */
} SHA256_CONTEXT;

int PubCrypt_SHA256(const unsigned char *pData,unsigned int pLen,unsigned char *strHash);
int PubCrypt_SHA256Init(SHA256_CONTEXT *hd );
int PubCrypt_SHA256Update(SHA256_CONTEXT *hd, unsigned char *inbuf, unsigned int inlen);
int PubCrypt_SHA256Final(SHA256_CONTEXT *hd,unsigned char *strHash);

#endif