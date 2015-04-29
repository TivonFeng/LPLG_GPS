#include "SHA256.h"
#include "stdlib.h"

/**************************************************
���ܣ���4�ֽ�HEXת��Ϊ32λ�޷�������
����˵����
	HexBuf (in)    --  ���뻺������in hex�����ȱ���Ϊ4�ֽ�����
����ֵ��
	����ת�������ֵ�����������0��
**************************************************/
static unsigned int HexToInt(const unsigned char *HexBuf)
{
	return ((HexBuf[0] << 24) + (HexBuf[1] << 16) + (HexBuf[2] << 8) + HexBuf[3]);
}

/**************************************************
���ܣ���32λ�޷�������ת��Ϊ4�ֽ�Hex����
����˵����
	int_num  (in) --  �����޷���������
	HexBuf   (out) --  ���Hex������(�����С����Ϊ4�ֽ�����)
����ֵ��
	RETURN_SUCC �ɹ�
	RETURN_ERR_PARAM ��������
**************************************************/
static int IntToHex( unsigned int int_num, unsigned char *HexBuf)
{
	HexBuf[0] = int_num >> 24;
	HexBuf[1] = int_num >> 16;
	HexBuf[2] = int_num >> 8;
	HexBuf[3] = int_num;

	return RETURN_SUCC;
}

/***************************************************************************
* Subroutine:	SHA256_Init
* Function:		Init SHA256 struct.
* Input:		ctx-struct for SHA256
                is224- if is 1 ,then the Hash is SHA224,or is SHA256
* Output:		ctx-struct for SHA256;
* Description:
* Date:			2010.09.02
* ModifyRecord:
* *************************************************************************/
static void SHA256_Init( SHA256_CONTEXT *ctx, unsigned char  is224 )
{
    ctx->total[0] = 0;
    ctx->total[1] = 0;

    if( is224 == 0 )
    {
        /* SHA-256 */
        ctx->state[0] = 0x6A09E667;
        ctx->state[1] = 0xBB67AE85;
        ctx->state[2] = 0x3C6EF372;
        ctx->state[3] = 0xA54FF53A;
        ctx->state[4] = 0x510E527F;
        ctx->state[5] = 0x9B05688C;
        ctx->state[6] = 0x1F83D9AB;
        ctx->state[7] = 0x5BE0CD19;
    }
    else
    {
        /* SHA-224 */
        ctx->state[0] = 0xC1059ED8;
        ctx->state[1] = 0x367CD507;
        ctx->state[2] = 0x3070DD17;
        ctx->state[3] = 0xF70E5939;
        ctx->state[4] = 0xFFC00B31;
        ctx->state[5] = 0x68581511;
        ctx->state[6] = 0x64F98FA7;
        ctx->state[7] = 0xBEFA4FA4;
    }

    ctx->is224 = is224;
}

#define  SHR(x,n) ((x & 0xFFFFFFFF) >> n)
#define ROTR(x,n) (SHR(x,n) | (x << (32 - n)))

static unsigned int S(unsigned int x,char n)
{
    switch(n)
    {
    case 0:
        return (ROTR(x, 7) ^ ROTR(x,18) ^  SHR(x, 3));
    case 1:
        return (ROTR(x,17) ^ ROTR(x,19) ^  SHR(x,10));
    case 2:
        return (ROTR(x, 2) ^ ROTR(x,13) ^ ROTR(x,22));
    default:
        return (ROTR(x, 6) ^ ROTR(x,11) ^ ROTR(x,25));
    }
}

#define F0(x,y,z) ((x & y) | (z & (x | y)))
#define F1(x,y,z) (z ^ (x & (y ^ z)))

static void P(unsigned int a,unsigned int b,unsigned int c,unsigned int* d,unsigned int e,unsigned int f,unsigned int g,unsigned int* h,unsigned int x,unsigned int K)
{
    unsigned int  temp1;
    temp1 = *h + S(e,3) + F1(e,f,g) + K + x;
    *d += temp1;
    *h = temp1 + S(a,2) + F0(a,b,c);
}

static const unsigned int KnumA[16]=
{
    0x428A2F98,0x71374491,0xB5C0FBCF,0xE9B5DBA5,0x3956C25B,0x59F111F1,0x923F82A4,0xAB1C5ED5,
    0xD807AA98,0x12835B01,0x243185BE,0x550C7DC3,0x72BE5D74,0x80DEB1FE,0x9BDC06A7,0xC19BF174
};
static const unsigned int KnumB[48]=
{
    0xE49B69C1,0xEFBE4786,0x0FC19DC6,0x240CA1CC,0x2DE92C6F,0x4A7484AA,0x5CB0A9DC,0x76F988DA,
    0x983E5152,0xA831C66D,0xB00327C8,0xBF597FC7,0xC6E00BF3,0xD5A79147,0x06CA6351,0x14292967,
    0x27B70A85,0x2E1B2138,0x4D2C6DFC,0x53380D13,0x650A7354,0x766A0ABB,0x81C2C92E,0x92722C85,
    0xA2BFE8A1,0xA81A664B,0xC24B8B70,0xC76C51A3,0xD192E819,0xD6990624,0xF40E3585,0x106AA070,
    0x19A4C116,0x1E376C08,0x2748774C,0x34B0BCB5,0x391C0CB3,0x4ED8AA4A,0x5B9CCA4F,0x682E6FF3,
    0x748F82EE,0x78A5636F,0x84C87814,0x8CC70208,0x90BEFFFA,0xA4506CEB,0xBEF9A3F7,0xC67178F2
};
/***************************************************************************
* Subroutine:	SHA256_Process
* Function:		Process SHA256
* Input:		None
* Output:		None;
* Description:
* Date:			2010.09.02
* ModifyRecord:
* *************************************************************************/
static void SHA256_Process( SHA256_CONTEXT *ctx, unsigned char  data[64] )
{
    unsigned int  temp1, temp2, W[64];
    unsigned int stateN[8];
    unsigned int indexA,indexB,indexC;

    for(temp1=0; temp1<16; temp1++)
    {
        W[temp1] = HexToInt(data+temp1*4);
    }

#define R(t) (W[t] = S(W[t -  2],1) + W[t -  7] + S(W[t - 15],0) + W[t - 16])

    memcpy(stateN,ctx->state,8*sizeof(unsigned int));
    
    for(indexA=0;indexA<2;indexA++)
    {
        for(indexB=0;indexB<8;indexB++)
        {
            P( stateN[(8-indexB)%8], stateN[(9-indexB)%8], stateN[(10-indexB)%8], &stateN[(11-indexB)%8], stateN[(12-indexB)%8], stateN[(13-indexB)%8], stateN[(14-indexB)%8], &stateN[(15-indexB)%8], W[indexA*8+indexB], KnumA[indexA*8+indexB]);
        }
    }
    
    for(indexA=0;indexA<6;indexA++)
    {
        for(indexB=0;indexB<8;indexB++)
        {
            P( stateN[(8-indexB)%8], stateN[(9-indexB)%8], stateN[(10-indexB)%8], &stateN[(11-indexB)%8], stateN[(12-indexB)%8], stateN[(13-indexB)%8], stateN[(14-indexB)%8], &stateN[(15-indexB)%8], R(indexA*8+indexB+16), KnumB[indexA*8+indexB]);
        }
    }
    
    for(indexA=0;indexA<8;indexA++)
    {
        ctx->state[indexA] += stateN[indexA];
    }
}

/*********************************************************
�������壺PubCrypt_SHA256Update
�������ܣ� SHA-256 HASH�㷨
����
	hd(in/out)	sha256�ṹ��
	inbuf(in)	д�������
	inlen(in)	д�����ݵĳ���
����ֵ
	RETURN_SUCC �ɹ�
	RETURN_FAIL ʧ��
	RETURN_ERR_PARAM ������
*********************************************************/
int PubCrypt_SHA256Update( SHA256_CONTEXT *hd, unsigned char *inbuf, unsigned int inlen)
{
    int  fill;
    unsigned int  left;
    //ȥ���жϣ����ٴ���ռ�
    //if(hd==NULL || inbuf==NULL || inlen <= 0)
    //{
    //    return RETURN_ERR_PARAM;
    //}

    left = hd->total[0] & 0x3F;
    fill = 64 - left;

    hd->total[0] += inlen;
    hd->total[0] &= 0xFFFFFFFF;

    if(hd->total[0] < (unsigned long) inlen )
    {
        hd->total[1]++;
    }

    if(left && inlen >= fill )
    {
        memcpy((void *) (hd->buffer + left),(void *) inbuf, fill );
        SHA256_Process(hd, hd->buffer );
        inbuf += fill;
        inlen  -= fill;
        left = 0;
    }

    while(inlen >= 64 )
    {
        SHA256_Process(hd, inbuf );
        inbuf += 64;
        inlen  -= 64;
    }

    if(inlen > 0 )
    {
        memcpy((void *) (hd->buffer + left),(void *) inbuf, inlen );
    }
    return RETURN_SUCC;
}

/*********************************************************
�������壺PubCrypt_SHA256Final
�������ܣ� SHA-256 HASH�㷨
����
	hd(in)			sha256�ṹ��
	strHash(out)	���յ�hashֵ
����ֵ
	RETURN_SUCC �ɹ�
	RETURN_FAIL ʧ��
	RETURN_ERR_PARAM ������
*********************************************************/
int PubCrypt_SHA256Final(SHA256_CONTEXT *hd,unsigned char *strHash)
{
    unsigned int  last, padn;
    unsigned int  high, low;
    unsigned char  msglen[8];
    unsigned char *sha2_padding;
    //ȥ���жϣ����ٴ���ռ�
    //if(hd==NULL || strHash==NULL)
    //{
    //    return RETURN_ERR_PARAM;
    //}

    high = ( hd->total[0] >> 29 ) | ( hd->total[1] <<  3 );
    low  = ( hd->total[0] <<  3 );

    IntToHex( high, msglen);
    IntToHex( low,  msglen+4);

    last = hd->total[0] & 0x3F;
    padn = ( last < 56 ) ? ( 56 - last ) : ( 120 - last );

    sha2_padding=(unsigned char *)malloc(padn);
    if(sha2_padding==NULL)
    {
        return RETURN_FAIL;
    }
    memset(sha2_padding,0,padn);
    sha2_padding[0]=0x80;
    PubCrypt_SHA256Update( hd, (unsigned char *) sha2_padding, padn );
    free(sha2_padding);
    PubCrypt_SHA256Update( hd, msglen, 8 );

    for(padn=0;padn<7;padn++)
    {
        IntToHex( hd->state[padn], strHash+padn*4);
    }

    if( hd->is224 == 0 )
    {
        IntToHex( hd->state[7], strHash+28 );
    }
    return RETURN_SUCC;
}

/*********************************************************
�������壺PubCrypt_SHA256
�������ܣ� SHA-256 HASH�㷨
����
	pData(in)             --����SHA������
	pLen(in)              --���ݳ���
	strHash(out)          --���ɵ�HASHֵ(32�ֽ�)
����ֵ
	RETURN_SUCC �ɹ�
	RETURN_FAIL ʧ��
	RETURN_ERR_PARAM ��������
*********************************************************/
int PubCrypt_SHA256(const unsigned char *pData,unsigned int pLen,unsigned char *strHash)
{
    SHA256_CONTEXT *ctx;
    //ȥ���жϣ����ٴ���ռ�
    //if(pData==NULL || strHash==NULL)
    //{
    //	return RETURN_ERR_PARAM;
    //}
    ctx=(SHA256_CONTEXT *)malloc(sizeof(SHA256_CONTEXT));
    if(ctx==NULL)
    {
        return RETURN_FAIL;
    }
    SHA256_Init (ctx,0);
    PubCrypt_SHA256Update (ctx, (unsigned char *)pData, pLen);
    PubCrypt_SHA256Final (ctx,strHash);
    free(ctx);
    return RETURN_SUCC;
}

/*********************************************************
�������壺PubCrypt_SHA256Init
�������ܣ� SHA-256 HASH�㷨
����
	hd(in/out)	sha256�ṹ��
����ֵ
	RETURN_SUCC �ɹ�
	RETURN_FAIL ʧ��
	RETURN_ERR_PARAM ��������
*********************************************************/
int PubCrypt_SHA256Init( SHA256_CONTEXT *hd )
{
    //ȥ���жϣ����ٴ���ռ�
    //if(hd==NULL)
    //{
    //    return RETURN_ERR_PARAM;
    //}
    SHA256_Init( hd ,0);
    return RETURN_SUCC;
}

