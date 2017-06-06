//
//  AlgCount.h
//  Algorithms
//
//  Created by wangjufan on 17-6-5.
//  Copyright (c) 2017年 dudu. All rights reserved.
//

#import <Foundation/Foundation.h>



/* 微软面试题 30.在从1到n的正数中1出现的次数（数组）
 
 题目：输入一个整数n，求从1到n这n个整数的十进制表示中1出现的次数。
 例如输入12，从1到12这些整数中包含1 的数字有1，10，11和12，1一共出现了5次。
 分析：这是一道广为流传的google面试题。
 
 */

@interface AlgCount : NSObject

unsigned long long  countOfOneIn(unsigned long long naturalNumber);
unsigned long long  countOfOneInRange(unsigned long long from, unsigned long long to);

@end
