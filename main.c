#include <stdio.h>
#include <strings.h>
#include <ctype.h>
#include "libfts.h"

#ifndef HEXDUMP_COLS
#define HEXDUMP_COLS 8
#endif

void hexdump(void *mem, unsigned int len)
{
	unsigned int i, j;

	for(i = 0; i < len + ((len % HEXDUMP_COLS) ? (HEXDUMP_COLS - len % HEXDUMP_COLS) : 0); i++)
	{
		if(i % HEXDUMP_COLS == 0)
			printf("0x%06x: ", i);
		if(i < len)
			printf("%02x ", 0xFF & ((char*)mem)[i]);
		else
			printf("   ");
		if(i % HEXDUMP_COLS == (HEXDUMP_COLS - 1))
		{
			for(j = i - (HEXDUMP_COLS - 1); j <= i; j++)
			{
				if(j >= len)
					putchar(' ');
				else if(isprint(((char*)mem)[j]))
					putchar(0xFF & ((char*)mem)[j]);
				else
					putchar('.');
			}
			putchar('\n');
		}
	}
}

int		main(void)
{
	/* GENERIC INIT */
	char			*ptr;
	char			stack_ptr[256] = {0}, stack_ptr2[256] = {0};
	unsigned int	n;

	/* FT_BZERO */
	puts(">>> FT_BZERO tests <<<\n");

	puts("Basic usage:");
	strcpy(stack_ptr, "Hello, ft_bzero ASM test!\0");
	puts("=== Before ft_bzero ===");
	hexdump(stack_ptr, 26);
	ft_bzero(stack_ptr, 10); // "Zeroing" first 10 bytes, checking with hexdump
	puts("\n=== After ft_bzero(ptr, 10) ===");
	hexdump(stack_ptr, 26);
	
	puts("\nWith len 0:");
	strcpy(stack_ptr, "Hello, ft_bzero ASM test!\0");
	puts("=== Before ft_bzero ===");
	hexdump(stack_ptr, 26);
	ft_bzero(stack_ptr, 0); // "Zeroing" 0 byte, should do nothing
	puts("\n=== After ft_bzero(ptr, 0) ===");
	hexdump(stack_ptr, 26);


	/* FT_STRLEN */
	puts("\n>>> FT_STRLEN test <<<\n");
	strcpy(stack_ptr, "ft_strlen test with 28 bytes\0");
	printf("strlen output: %lu\n", strlen(stack_ptr));
	n = ft_strlen(stack_ptr);
	printf("ft_strlen output: %lu\n", ft_strlen(stack_ptr));

	/* FT_STRCAT */
	puts("\n>>> FT_STRCAT <<<\n");

	puts("Basic usage:");
	strcpy(stack_ptr, "Hello, ft_strcat ASM test! \0");
	strcpy(stack_ptr2, "Me too!\0");
	puts("=== Before ft_strcat ===");
	hexdump(stack_ptr, strlen(stack_ptr));
	ptr = ft_strcat(stack_ptr, stack_ptr2);
	puts("\n=== After ft_strcat ===");
	hexdump(ptr, strlen(ptr));
	puts("--");
	hexdump(stack_ptr, strlen(stack_ptr));

	/* FT_ISALPHA */
	puts("\n>>> FT_ISALPHA <<<\n");

	puts("Basic usage:");
	for (int i = 0; i < 128; ++i)
		printf("ft_isalpha (%d): %d --- isalpha (%d): %d\n", i, ft_isalpha(i), i, isalpha(i));

	/* FT_ISALPHA */
	puts("\n>>> FT_ISDIGIT <<<\n");

	puts("Basic usage:");
	for (int i = 0; i < 128; ++i)
		printf("ft_isdigit (%d): %d --- isdigit (%d): %d\n", i, ft_isdigit(i), i, isdigit(i));

	/* FT_ISALNUM */
	puts("\n>>> FT_ISALNUM <<<\n");

	puts("Basic usage:");
	for (int i = 0; i < 128; ++i)
		printf("ft_isalnum (%d): %d --- isalnum (%d): %d\n", i, ft_isalnum(i), i, isalnum(i));

	/* FT_ISPRINT */
	puts("\n>>> FT_ISPRINT <<<\n");

	puts("Basic usage:");
	for (int i = 0; i < 128; ++i)
		printf("ft_isprint (%d): %d --- isprint (%d): %d\n", i, ft_isprint(i), i, isprint(i));

	/* FT_TOUPPER */
	puts("\n>>> FT_TOUPPER <<<\n");

	puts("Basic usage:");
	for (int i = 32; i < 126; ++i)
		printf("ft_toupper (%c): %c --- toupper (%c): %c\n", i, ft_toupper(i), i, toupper(i));

	/* FT_TOLOWER */
	puts("\n>>> FT_TOLOWER <<<\n");

	puts("Basic usage:");
	for (int i = 32; i < 126; ++i)
		printf("ft_tolower (%c): %c --- tolower (%c): %c\n", i, ft_tolower(i), i, tolower(i));

	/* FT_PUTS */
	puts("\n>>> FT_PUTS <<<\n");
	printf("puts(\"Hello world\"): %d\n", puts("Hello World"));
	printf("ft_puts(\"Hello world\"): %d\n", ft_puts("Hello World"));

}
