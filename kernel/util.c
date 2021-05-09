#include "util.h"

void memory_copy(char *source, char *dest, int nbytes)
{
    for (int i = 0; i < nbytes; i++)
    {
        *(dest +i ) = *(source + i);
    }
}

void itoa(int num, char str[])
{
    int i;
    int sign;
    if((sign = num) < 0)
    {
        num = -num;
    }
    i = 0;
    do
    {
        str[i++] = num % 10 + '0';
    } while((num /= 10) > 0);

    if(sign < 0)
    {
        str[i++] = '-';
    }
    str[i] = '\0';
}
