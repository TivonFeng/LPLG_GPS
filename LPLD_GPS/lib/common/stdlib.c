/**
 * @file stdlib.c
 * @version 3.01[By LPLD]
 * @date 2013-11-4
 * @brief C��׼�����
 *
 * ���Ľ���:�������޸�
 *
 * �ɱ�׼C�������ֲ����֧��ASCII
 *
 * ��Ȩ����:�����������µ��Ӽ������޹�˾
 * http://www.lpld.cn
 * mail:support@lpld.cn
 *
 * @par
 * ����������������[LPLD]������ά������������ʹ���߿���Դ���롣
 * �����߿���������ʹ�û��Դ���롣�����μ�����ע��Ӧ���Ա�����
 * ���ø��Ļ�ɾ��ԭ��Ȩ���������������ο����߿��Լ�ע���ΰ�Ȩ�����ߡ�
 * ��Ӧ�����ش�Э��Ļ����ϣ�����Դ���롢���ó��۴��뱾��
 * �������²���������ʹ�ñ��������������κ��¹ʡ��������λ���ز���Ӱ�졣
 * ����������������͡�˵��������ľ���ԭ�����ܡ�ʵ�ַ�����
 * ������������[LPLD]��Ȩ�������߲��ý�������������ҵ��Ʒ��
 */
#include "stdlib.h"


/****************************************************************/
int isspace (int ch)
{
    if ((ch == ' ') || (ch == '\t'))    /* \n ??? */
        return TRUE;
    else
        return FALSE;
}

/****************************************************************/
int isalnum (int ch)
{
    /* ASCII only */
    if (((ch >= '0') && (ch <= '9')) ||
        ((ch >= 'A') && (ch <= 'Z')) ||
        ((ch >= 'a') && (ch <= 'z')))
        return TRUE;
    else
        return FALSE;
}

/****************************************************************/
int isdigit (int ch)
{
    /* ASCII only */
    if ((ch >= '0') && (ch <= '9'))
        return TRUE;
    else
        return FALSE;
}

/****************************************************************/
int isupper (int ch)
{
    /* ASCII only */
    if ((ch >= 'A') && (ch <= 'Z'))
        return TRUE;
    else
        return FALSE;
}

/****************************************************************/
int strcasecmp (const int8 *s1, const int8 *s2)
{
    int8    c1, c2;
    int     result = 0;

    while (result == 0)
    {
        c1 = *s1++;
        c2 = *s2++;
        if ((c1 >= 'a') && (c1 <= 'z'))
            c1 = (int8)(c1 - ' ');
        if ((c2 >= 'a') && (c2 <= 'z'))
            c2 = (int8)(c2 - ' ');
        if ((result = (c1 - c2)) != 0)
            break;
        if ((c1 == 0) || (c2 == 0))
            break;
    }
    return result;
}


/****************************************************************/
int strncasecmp (const int8 *s1, const int8 *s2, int n)
{
    int8    c1, c2;
    int     k1=0;
    int     result = 0;

    while ( k1++<n )
    {
        c1 = *s1++;
        c2 = *s2++;
        if ((c1 >= 'a') && (c1 <= 'z'))
            c1 = (int8)(c1 - ' ');
        if ((c2 >= 'a') && (c2 <= 'z'))
            c2 = (int8)(c2 - ' ');
        if ((result = (c1 - c2)) != 0)
            break;
        if ((c1 == 0) || (c2 == 0))
            break;
    }
    return result;
}

/****************************************************************/
unsigned long strtoul (int8 *str, int8 **ptr, int base)
{
    unsigned long rvalue;
    int c, err, neg;
    int8 *endp;
    int8 *startp;

    rvalue = 0;  err = 0;  neg = 0;

    /* Check for invalid arguments */
    if ((str == NULL) || (base < 0) || (base == 1) || (base > 36))
    {
        if (ptr != NULL)
        {
            *ptr = str;
        }
        return 0;
    }

    /* Skip leading white spaces */
    for (startp = str; isspace(*startp); ++startp)
        ;

    /* Check for notations */
    switch (startp[0])
    {
        case '0':
            if ((startp[1] == 'x') || (startp[1] == 'X'))
            {
                if ((base == 0) || (base == 16))
                {
                    base = 16;
                    startp = &startp[2];
                }
            }
            break;
        case '-':
            neg = 1;
            startp = &startp[1];
            break;
        default:
            break;
    }

    if (base == 0)
        base = 10;

    /* Check for invalid chars in str */
    for ( endp = startp; (c = *endp) != '\0'; ++endp)
    {
        /* Check for 0..9,Aa-Zz */
        if (!isalnum(c))
        {
            err = 1;
            break;
        }

        /* Convert int8 to num in 0..36 */
        if (isdigit(c))
        {
            c = c - '0';
        }
        else
        {
            if (isupper(c))
            {
                c = c - 'A' + 10;
            }
            else
            {
                c = c - 'a' + 10;
            }
        }

        /* check c against base */
        if (c >= base)
        {
            err = 1;
            break;
        }

        if (neg)
        {
            rvalue = (rvalue * base) - c;
        }
        else
        {
            rvalue = (rvalue * base) + c;
        }
    }

    /* Upon exit, endp points to the character at which valid info */
    /* STOPS.  No chars including and beyond endp are used.        */

    if (ptr != NULL)
        *ptr = endp;

    if (err)
    {
        if (ptr != NULL)
            *ptr = str;
        
        return 0;
    }
    else
    {
        return rvalue;
    }
}

/****************************************************************/
int strlen (const int8 *str)
{
    int8 *s = (int8 *)str;
    int len = 0;

    if (s == NULL)
        return 0;

    while (*s++ != '\0')
        ++len;

    return len;
}

/****************************************************************/
int8 * strcat (int8 *dest, const int8 *src)
{
    int8 *dp;
    int8 *sp = (int8 *)src;

    if ((dest != NULL) && (src != NULL))
    {
        dp = &dest[strlen(dest)];

        while (*sp != '\0')
        {
            *dp++ = *sp++;
        }
        *dp = '\0';
    }
    return dest;
}

/****************************************************************/
int8 * strncat (int8 *dest, const int8 *src, int n)
{
    int8 *dp;
    int8 *sp = (int8 *)src;

    if ((dest != NULL) && (src != NULL) && (n > 0))
    {
        dp = &dest[strlen(dest)];

        while ((*sp != '\0') && (n-- > 0))
        {
            *dp++ = *sp++;
        }
        *dp = '\0';
    }
    return dest;
}

/****************************************************************/
int8 * strcpy (int8 *dest, const int8 *src)
{
    int8 *dp = (int8 *)dest;
    int8 *sp = (int8 *)src;

    if ((dest != NULL) && (src != NULL))
    {
        while (*sp != '\0')
        {
            *dp++ = *sp++;
        }
        *dp = '\0';
    }
    return dest;
}

/****************************************************************/
int8 * strncpy (int8 *dest, const int8 *src, int n)
{
    int8 *dp = (int8 *)dest;
    int8 *sp = (int8 *)src;

    if ((dest != NULL) && (src != NULL) && (n > 0))
    {
        while ((*sp != '\0') && (n-- > 0))
        {
            *dp++ = *sp++;
        }
        *dp = '\0';
    }
    return dest;
}

/****************************************************************/
int strcmp (const int8 *s1, const int8 *s2)
{
    /* No checks for NULL */
    int8 *s1p = (int8 *)s1;
    int8 *s2p = (int8 *)s2;

    while (*s2p != '\0')
    {
        if (*s1p != *s2p)
            break;

        ++s1p;
        ++s2p;
    }
    return (*s1p - *s2p);
}

/****************************************************************/
int strncmp (const int8 *s1, const int8 *s2, int n)
{
    /* No checks for NULL */
    int8 *s1p = (int8 *)s1;
    int8 *s2p = (int8 *)s2;

    if (n <= 0)
        return 0;

    while (*s2p != '\0')
    {
        if (*s1p != *s2p)
            break;

        if (--n == 0)
            break;

        ++s1p;
        ++s2p;
    }
    return (*s1p - *s2p);
}

/****************************************************************/
void * memcpy (void *dest, const void *src, unsigned n)
{
    int longs, bytes;
    uint32 *dpl = (uint32 *)dest;
    uint32 *spl = (uint32 *)src;
    uint8  *dpb, *spb;

    if ((dest != NULL) && (src != NULL) && (n > 0))
    {
        bytes = (n & 0x3);
        longs = (n - bytes) >> 2;
    
        while (longs--)
            *dpl++ = *spl++;
        
        dpb = (uint8 *)dpl;
        spb = (uint8 *)spl;
        
        while (bytes--)
            *dpb++ = *spb++;
    }
    return dest;
}

/****************************************************************/
void * memset (void *s, int c, unsigned n)
{
    /* Not optimized, but very portable */
    uint8 *sp = (uint8 *)s;

    if ((s != NULL) && (n > 0))
    {
        while (n--)
        {
            *sp++ = (uint8)c;
        }
    }
    return s;
}

/****************************************************************/
char * strchr(const char *str, int ch)

{

   while (*str && *str != (char)ch)

        str++;

   if (*str == (char)ch)

        return((char *)str);

   return(NULL);

}

/****************************************************************/
void cparray (int8 *s, const int8 *fmt, uint8 start,uint8 stop)
{
  uint16 sto,i=0;
  fmt+=start;
//  sto=fmt+stop
  
    for(i=0;i<stop;i++)
    {
      *s++ = *fmt++;
    }
    
}



/****************************************************************/
void delay()//��Լ0.4s
{
  uint16 i, n;
  for(i=0;i<30000;i++)
  {
    for(n=0;n<200;n++)
    {
      asm("nop");
    }
  }
}

/****************************************************************/
char *strstr(const char *s1, const char *s2)
{
  int n;
  if(*s2)
  {
    while(*s1)
    {
      for( n=0; *(s1+n) == *(s2+n); n++)
      {
        if( !*(s2 + n +1) )
          return (char *)s1;
      }
      s1++;
    }
    return NULL;
  }
  else
    return (char *)s1;
}

/****************************************************************/
int16 atoi(uint8 * pstr)  
{  
    int16 Ret_Integer = 0;  
    int16 Integer_sign = 1;  
      
    /* 
    * �ж�ָ���Ƿ�Ϊ�� 
    */  
    if(pstr == NULL)  
    {  
        printf("Pointer is NULL\n");  
        return 0;  
    }  
      
    /* 
    * ����ǰ��Ŀո��ַ� 
    */  
    while(isspace(*pstr))  
    {  
        pstr++;  
    }  
      
    /* 
    * �ж������� 
    * ��������ţ�ָ��ָ����һ���ַ� 
    * ����Ƿ��ţ��ѷ��ű��ΪInteger_sign��-1��Ȼ���ٰ�ָ��ָ����һ���ַ� 
    */  
    if(*pstr == '-')  
    {  
        Integer_sign = -1;  
    }  
    if(*pstr == '-' || *pstr == '+')  
    {  
        pstr++;  
    }  
      
    /* 
    * �������ַ������ת�����������������ת���õ���������Ret_Integer 
    */  
    while(*pstr >= '0' && *pstr <= '9')  
    {  
        Ret_Integer = Ret_Integer * 10 + *pstr - '0';  
        pstr++;  
    }  
    Ret_Integer = Integer_sign * Ret_Integer;  
      
    return Ret_Integer;  
}  