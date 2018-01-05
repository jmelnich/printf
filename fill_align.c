/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   fill_align.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: imelnych <imelnych@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/01/03 17:45:44 by imelnych          #+#    #+#             */
/*   Updated: 2018/01/05 16:07:35 by imelnych         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "printflib.h"

void fill_align(const char *fmt, list_spec *current)
{
	int i;
	
	i = 0;
	while (i < FL)
		current->flag[i++] = 0;
	i = 0;
	while (fmt[i] != '\0' && !check_type(fmt[i]))
	{
		if (fmt[i] == '-')
			current->flag[0] = 1;
		else if (fmt[i] == '0' && i - 1 >= 0 && !ft_isdigit(fmt[i - 1]))
			current->flag[0] = 2;
		if (fmt[i] == '+')
			current->flag[1] = 1;
		else if (fmt[i] == ' ')
			current->flag[1] = 2;
		if (fmt[i] == '#')
			current->flag[2] = 1;
		i++;
	}

	
}