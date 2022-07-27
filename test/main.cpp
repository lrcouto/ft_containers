/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.cpp                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: lcouto <lcouto@student.42sp.org.br>        +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/07/27 01:41:21 by lcouto            #+#    #+#             */
/*   Updated: 2022/07/27 02:05:09 by lcouto           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

# define DOCTEST_CONFIG_IMPLEMENT_WITH_MAIN

# include "doctest.h"
# include <iostream>

bool vecTest(void)
{
    std::cout << "\nTesting the tester:\n" << std::endl;
    std::vector<int> intVec;
    intVec.push_back(1);
    intVec.push_back(12);
    intVec.push_back(13);
    intVec.push_back(100);
    if (intVec[intVec.size() - 1] == 100)
        return (true);
    return (false);
}

TEST_CASE("Just testing to see if I can write a test lol")
{
    CHECK(vecTest() == true);
}
