#include <stdio.h>
#include <strings.h>
#include <ctype.h>
#include <fcntl.h>
#include <unistd.h>

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

	strcpy(stack_ptr, "\n");
	printf("strlen output: %lu\n", strlen(stack_ptr));
	n = ft_strlen(stack_ptr);
	printf("ft_strlen output: %lu\n", ft_strlen(stack_ptr));

	memset(stack_ptr, 0, sizeof(stack_ptr));
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
	for (int i = -5; i < 140; ++i)
		printf("ft_isalpha (%d): %d --- isalpha (%d): %d\n", i, ft_isalpha(i), i, isalpha(i));

	/* FT_ISALPHA */
	puts("\n>>> FT_ISDIGIT <<<\n");

	puts("Basic usage:");
	for (int i = -5; i < 140; ++i)
		printf("ft_isdigit (%d): %d --- isdigit (%d): %d\n", i, ft_isdigit(i), i, isdigit(i));

	/* FT_ISALNUM */
	puts("\n>>> FT_ISALNUM <<<\n");

	puts("Basic usage:");
	for (int i = -5; i < 140; ++i)
		printf("ft_isalnum (%d): %d --- isalnum (%d): %d\n", i, ft_isalnum(i), i, isalnum(i));

	/* FT_ISPRINT */
	puts("\n>>> FT_ISPRINT <<<\n");

	puts("Basic usage:");
	for (int i = -5; i < 140; ++i)
		printf("ft_isprint (%d): %d --- isprint (%d): %d\n", i, ft_isprint(i), i, isprint(i));

	/* FT_ISASCII */
	puts("\n>>> FT_ISASCII <<<\n");

	puts("Basic usage:");
	for (int i = -5; i < 140; ++i)
		printf("ft_isascii (%d): %d --- isascii (%d): %d\n", i, ft_isascii(i), i, isascii(i));

	/* FT_TOUPPER */
	puts("\n>>> FT_TOUPPER <<<\n");

	puts("Basic usage:");
	for (int i = -5; i < 140; ++i)
		printf("ft_toupper (%c): %c --- toupper (%c): %c\n", i, ft_toupper(i), i, toupper(i));

	/* FT_TOLOWER */
	puts("\n>>> FT_TOLOWER <<<\n");

	puts("Basic usage:");
	for (int i = -5; i < 140; ++i)
		printf("ft_tolower (%c): %c --- tolower (%c): %c\n", i, ft_tolower(i), i, tolower(i));

	/* FT_PUTS */
	strcpy(stack_ptr, "Hello World! I'm a test");
	puts("\n>>> FT_PUTS <<<\n");
	n = puts(stack_ptr);
	printf("ret = %d (puts)\n", n);
	n = ft_puts(stack_ptr);
	printf("ret = %d (ft_puts)\n", n);
	printf("Integrity test: %s\n", stack_ptr);

	ptr = NULL;
	puts("\nNULL test:");
	n = puts(ptr);
	printf("ret = %d (puts)\n", n);
	n = ft_puts(ptr);
	printf("ret = %d (ft_puts)\n", n);
	printf("Integrity test: %s\n", ptr);

	/* FT_PUTSTR */
	strcpy(stack_ptr, "Hello World! I'm a test for ft_putstr");
	puts("\n>>> FT_PUTSTR <<<\n");
	write(1, "[", 1);
	ft_putstr(stack_ptr);
	write(1, "]", 1);
	puts("");
	printf("Integrity test: %s\n", stack_ptr);

	/* FT_PUTENDL */
	strcpy(stack_ptr, "Hello World! I'm a test for ft_putendl");
	puts("\n>>> FT_PUTENDL <<<\n");
	write(1, "[", 1);
	ft_putendl(stack_ptr);
	write(1, "]", 1);
	printf("Integrity test: %s\n", stack_ptr);

	/* FT_MEMSET */
	puts("\n>>> FT_MEMSET tests <<<\n");

	puts("Basic usage:");
	strcpy(stack_ptr, "Hello, ft_memset ASM test!\0");
	puts("=== Before ft_memset ===");
	hexdump(stack_ptr, 27);
	ptr = ft_memset(stack_ptr, 'A', 10); // Setting to 'A' first 10 bytes, checking with hexdump
	puts("\n=== After ft_memset(ptr, 'A', 10) ===");
	hexdump(stack_ptr, 27);
	printf("Integrity test: %s\n", ptr);

	puts("\nWith len 0:");
	strcpy(stack_ptr, "Hello, ft_memset ASM test!\0");
	puts("=== Before ft_memset ===");
	hexdump(stack_ptr, 27);
	ptr = ft_memset(stack_ptr, 'A', 0); // Setting to 'A' 0 byte, should do nothing
	puts("\n=== After ft_memset(ptr, 'A', 0) ===");
	hexdump(stack_ptr, 27);
	printf("Integrity test: %s\n", ptr);

	/* FT_MEMCPY */
	puts("\n>>> FT_MEMCPY tests <<<\n");

	puts("Basic usage:");
	strcpy(stack_ptr, "Hello, ft_memcpy ASM test!\0");
	memset(stack_ptr2, 0, 27);
	puts("=== Before ft_memcpy ===");
	hexdump(stack_ptr2, 27);
	ptr = ft_memcpy(stack_ptr2, stack_ptr, 27); // Copying stack_ptr to stack_ptr2, checking with hexdump
	puts("\n=== After ft_memcpy(dst, src, 27) ===");
	hexdump(stack_ptr2, 27);
	printf("Integrity test: %s\n", ptr);
	
	puts("\nWith len 0:");
	strcpy(stack_ptr, "Hello, ft_memcpy ASM test!\0");
	memset(stack_ptr2, 0, 27);
	puts("=== Before ft_memcpy ===");
	hexdump(stack_ptr2, 27);
	ptr = ft_memcpy(stack_ptr2, stack_ptr, 0); // Copying stack_ptr to stack_ptr2, checking with hexdump
	puts("\n=== After ft_memcpy(dst, src, 0) ===");
	hexdump(stack_ptr2, 27);
	printf("Integrity test: %s\n", ptr);

	/* FT_STRDUP */
	puts("\n>>> FT_STRDUP <<<\n");

	ptr = NULL;
	puts("Basic usage:");
	puts("=== Before ft_strdup ===");
	printf("ptr at %p\n", ptr);
	ptr = ft_strdup("I am a test for ft_strdup");
	puts("=== After ft_strdup ===");
	printf("ptr at %p\n", ptr);
	hexdump(ptr, strlen(ptr) + 1);

	/* FT_CAT */
	puts("\n>>> FT_CAT <<<\n");

	puts("Reading file 'test_file_ft_cat.txt' with different data...");

	system("echo 'Hello, World' > test_file_ft_cat.txt");
	n = open("test_file_ft_cat.txt", O_RDONLY);
	ft_cat(n);
	close(n);

	system("echo 'Hello, World. I m a better testt!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!                        1234567890qwertyuiopasdfghjklzxcvbnm[],./' > test_file_ft_cat.txt");
	n = open("test_file_ft_cat.txt", O_RDONLY);
	ft_cat(n);
	close(n);

	/* FT_MAX */
	puts("\n>>> FT_MAX <<<\n");

	puts("Testing 4 and 97");
	printf("ft_max(4, 97) == %d\n", ft_max(4, 97));

	/* FT_STRCMP */
	puts("\n>>> FT_STRCMP <<<\n");

	int n2 = 0;
	memset(stack_ptr, 0, sizeof(stack_ptr));
	memset(stack_ptr2, 0, sizeof(stack_ptr2));
	strcpy(stack_ptr, "Bonjour, comment vas-tu ?");
	strcpy(stack_ptr2, "Bonjour, comment vas-tu ?");
	puts("Testing two similar strings...");

	n2 = ft_strcmp(stack_ptr, stack_ptr2);
	printf("ft_strcmp : %d\n", n2);
	n2 = strcmp(stack_ptr, stack_ptr2);
	printf("strcmp : %d\n", n2);

	strcpy(stack_ptr, "Bonjour, comment");
	strcpy(stack_ptr2, "Bonjour, comment vas-tu ?");

	puts("Testing two different strings...");
	n2 = ft_strcmp(stack_ptr, stack_ptr2);
	printf("ft_strcmp : %d\n", n2);
	n2 = strcmp(stack_ptr, stack_ptr2);
	printf("strcmp : %d\n", n2);

	strcpy(stack_ptr, "Hello hello!!");
	strcpy(stack_ptr2, "Another test");

	puts("Another test...");
	n2 = ft_strcmp(stack_ptr, stack_ptr2);
	printf("ft_strcmp : %d\n", n2);
	n2 = strcmp(stack_ptr, stack_ptr2);
	printf("strcmp : %d\n", n2);

	/* FT_PUTCHAR */
	puts("\n>>> FT_PUTCHAR <<<\n");
	
	strcpy(stack_ptr, "A test for ft_putchar!\n");
	n = strlen(stack_ptr);
	puts("ft_putchar:");
	for (int i = 0; i < n; i++)
		ft_putchar(stack_ptr[i]);
	puts("putchar:");
	for (int i = 0; i < n; i++)
		putchar(stack_ptr[i]);

	/* FT_ISIN */
	puts("\n>>> FT_ISIN <<<\n");

	printf("ft_isin('4', \"12345\") == %d\n", ft_isin('4', "12345"));
	printf("ft_isin(' ', \"Hello World!\") == %d\n", ft_isin(' ', "Hello World!"));
	printf("ft_isin('p', \"Not found\") == %d\n", ft_isin('p', "Not found"));

	/* FT_SUM */
	puts("\n>>> FT_SUM <<<\n");

	printf("ft_sum(44, 98) == %d\n", ft_sum(44, 98));
	printf("ft_sum(-12, -55) == %d\n", ft_sum(-12, -55));
	printf("ft_sum(12, -55) == %d\n", ft_sum(12, -55));

	/* FT_MEMALLOC */
	puts("\n>>> FT_MEMALLOC <<<\n");

	puts("Asking bzeroed 42 bytes in heap...");
	ptr = ft_memalloc(42);
	printf("ptr = %p\n", ptr);
	hexdump(ptr, 42);
}
