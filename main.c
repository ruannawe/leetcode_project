#include "string.h"
#include "uthash.h"
#include <stdio.h>

// void print_value_per_byte(const char* str, size_t n)
// {
//     printf("Variable n: %zu\n", n);
//     printf(" Address  |  Value \n");
//
//     for (size_t i = 0; i < n; i++)
//     {
//         printf("%p | ", (void*)&str[i]);
//         if (str[i] == '\0')
//         {
//             printf("\\0\n");
//         }
//         else
//         {
//             printf("%c\n", str[i]);
//         }
//     }
// }

unsigned short int gcd(unsigned short int a, unsigned short int b)
{
    if (b == 0) return a;

    return gcd(b, a % b);
}


char* strconcat(char* strbase, char* strconcat)
{
    size_t size = strlen(strbase) + strlen(strconcat) + 1;
    char* result = calloc(size, sizeof(char));

    strcpy(result, strbase);
    strcat(result, strconcat);

    return result;
}


unsigned short int strcompare(char* a, char* b)
{
    unsigned short int equal = strcmp(a, b);

    free(a);
    free(b);

    return equal;
}


char* gcd_of_strings(char* str1, char* str2)
{
    char* a = strconcat(str1, str2);
    char* b = strconcat(str2, str1);

    if (strcompare(a, b) != 0)
    {
        char* empty = calloc(1, sizeof(char));
        return calloc(1, sizeof(char));
    }

    unsigned short int largest_index = gcd(strlen(str1), strlen(str2));
    char* result = calloc(largest_index + 1, sizeof(char));
    strncpy(result, str1, largest_index);

    return result;
}


int main()
{
    char* a = "ABCABC";
    char* b = "ABC";

    char* r = gcd_of_strings(a, b);

    printf("%s\n", r);

    free(r);

    return 0;
}
