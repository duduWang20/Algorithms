//
//  AlgCount.h
//  Algorithms
//
//  Created by wangjufan on 17-6-5.
//  Copyright (c) 2017年 dudu. All rights reserved.
//

#import <Foundation/Foundation.h>




@interface AlgCount : NSObject


////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////


/* 微软面试题 30.在从1到n的正数中1出现的次数（数组）
 
 题目：输入一个整数n，求从1到n这n个整数的十进制表示中1出现的次数。
 例如输入12，从1到12这些整数中包含1 的数字有1，10，11和12，1一共出现了5次。
 分析：这是一道广为流传的google面试题。
 
 */
unsigned long long  countOfOneIn(unsigned long long naturalNumber);
unsigned long long  countOfOneInRange(unsigned long long from, unsigned long long to);

////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////


/*
 38.
 百度面试：
 1.用天平（只能比较，不能称重）从一堆小球中找出其中唯一一个较轻的，使用x 次天平，
 最多可以从y 个小球中找出较轻的那个，求y 与x 的关系式。
 ANSWER:
 x=1, y=3: if a=b, c is the lighter, else the lighter is the lighter...
 do this recursively. so y=3^x;
 
 2.有一个很大很大的输入流，大到没有存储器可以将其存储下来，
 而且只输入一次，如何从这个输入流中随机取得m 个记录。
 ANSWER
 
 
 3.大量的URL 字符串，如何从中去除重复的，优化时间空间复杂度
 ANSWER
 1. Use hash map if there is enough memory.
 2. If there is no enough memory, use hash to put urls to bins, and do it until we can fit the bin into memory.
 
 */

/*
 题目1
 ballsNumber : y 个小球
 out: 可能使用的天平 次数
 
 策略 二分法
 */
unsigned int * nubmerOfUsingBalanceForNumberOfBalls(unsigned long long ballsNumber, unsigned int * possibleCount);


////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////

/*
 40.百度研发笔试题
 
 1)设计一个栈结构，满足一下条件：min，push，pop 操作的时间复杂度为O(1)。
 ANSWER
 Have done this.
 
 2)一串首尾相连的珠子(m 个)，有N 种颜色(N<=10)，
 设计一个算法，取出其中一段，要求包含所有N 中颜色，并使长度最短。
 并分析时间复杂度与空间复杂度。
 
 3)设计一个系统处理词语搭配问题，比如说中国和人民可以搭配，
 则中国人民人民中国都有效。要求：
 *系统每秒的查询数量可能上千次；
 *词语的数量级为10W；
 *每个词至多可以与1W 个词搭配
 当用户输入中国人民的时候，要求返回与这个搭配词组相关的信息。
 */

/* 
 题目2
 path[]  首尾相连的珠子(m 个),在此编码为从0到m-1的自然数 path[i] IN M ={  0 1 2  ... m-1 }
 color[]  N 种颜色(N<=10)  color[i]  IN M
 
 策略  哈希表
 
 可优化:
 1 根据颜色的历史信息,减少对isBest的调用;
 2 根据历史信息及时调整考察的区域，减少对shrinkLowPosition的调用
 */
unsigned int * shortestPathsForColorNumber(unsigned int path[],
                                           unsigned int pathLength,
                                           unsigned int colors[],
                                           unsigned int colorCount,
                                           unsigned int * outPathLength);



@end






