#include <stdio.h>
#include <strings.h>
#include <ctype.h>

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
	puts(">>> FT_STRCAT <<<\n");

	puts("Basic usage:");
	strcpy(stack_ptr, "Hello, ft_strcat ASM test! \0");
	strcpy(stack_ptr2, "Me too!\0");
	puts("=== Before ft_strcat ===");
	hexdump(stack_ptr, strlen(stack_ptr));
	ptr = ft_strcat(stack_ptr, stack_ptr2);
	puts(ptr);
	puts("=== After ft_strcat ===");
	hexdump(ptr, strlen(ptr));
	puts("--");
	hexdump(stack_ptr, strlen(stack_ptr));

}
