/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libfts.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ataguiro <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/04/11 17:49:51 by ataguiro          #+#    #+#             */
/*   Updated: 2018/04/19 15:50:43 by ataguiro         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef LIBFTS_H
# define LIBFTS_H

# include "stdlib.h"

size_t	ft_strlen(const char *s);
void	ft_bzero(void *s, size_t n);
char	*ft_strcat(char *s1, const char *s2);
int		ft_isalpha(int c);
int		ft_isdigit(int c);
int		ft_isalnum(int c);
int		ft_isprint(int c);
int		ft_isascii(int c);
int		ft_toupper(int c);
int		ft_tolower(int c);
int		ft_max(int a, int b);
int		ft_min(int a, int b);
int		ft_puts(const char *s);
void	ft_putstr(const char *s);
void	ft_putchar(char c);
void	ft_putendl(const char *s);
void	*ft_memset(void *s, int c, size_t len);
void	*ft_memcpy(void *dst, void *src, size_t len);
void	*ft_memalloc(size_t size);
char	*ft_strdup(const char *s1);
char	*ft_strchr(const char *s, int c);
void	ft_cat(int fd);
int		ft_strcmp(const char *s1, const char *s2);
int		ft_isin(char c, const char *s);
int		ft_sum(int a, int b);

#endif
