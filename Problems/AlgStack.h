
//  Stack.h
//  Algorithms
//
//  Created by wangjufan on 17-5-27.
//  Copyright (c) 2017年 dudu. All rights reserved.
//

#import <Foundation/Foundation.h>

#define StackDeprecated_Num __attribute__((deprecated("use allPossiblePopOrderNumber_Catanat or allPossiblePopSequences")))


@interface AlgStack : NSObject


/*
 题目1： 输入两个整数序列。其中一个序列表示栈的push顺序，
 判断另一个序列有没有可能是对应的pop顺序。
 为了简单起见，我们假设push序列的任意两个整数都是不相等的。（这是原题目的限制，下面算法没有这个限制）
 比如输入的push序列是1、2、3、4、5，那么4、5、3、2、1就有可能是一个pop系列。
 因为可以有如下的push和pop序列：
 push 1，push 2，push 3，push 4，pop，push 5，pop，pop，pop，pop，
 这样得到的pop序列就是4、5、3、2、1。
 但序列4、3、5、1、2就不可能是push序列1、2、3、4、5的pop序列。
 */

BOOL isReasonablePopSequenceForPushSequence(NSArray * pushSequence, NSArray * popSequence);


//2017-05-28 10:49:49.773 Algorithms[21789:1171931] count = 1, possible = 1
//2017-05-28 10:49:49.774 Algorithms[21789:1171931] count = 2, possible = 2
//2017-05-28 10:49:49.774 Algorithms[21789:1171931] count = 3, possible = 5
//2017-05-28 10:49:49.774 Algorithms[21789:1171931] count = 4, possible = 14
//2017-05-28 10:49:49.774 Algorithms[21789:1171931] count = 5, possible = 42
//2017-05-28 10:49:49.774 Algorithms[21789:1171931] count = 6, possible = 132
//2017-05-28 10:49:49.774 Algorithms[21789:1171931] count = 7, possible = 429
//2017-05-28 10:49:49.775 Algorithms[21789:1171931] count = 10, possible = 167

//在非递归情况下，elementNum > 37时， 将产生溢出。
//在递归算法下，elementNum > 31时，将爆栈。

/*
 扩展2.1：
 对于n个入栈序列，一个push顺序，且当前栈中有0个入栈元素
 输出所有可能的n个元素的pop序列数量。
 为了简化问题，假设pop序列为1到n+m的整数序列。
 */
// max unpushed + pushed = 36
// max elementNum = 35
unsigned long long allPossiblePopOrderNumber_Recursion_Obsolete3(unsigned int unpushed, unsigned int pushed) StackDeprecated_Num;
unsigned long long allPossiblePopOrderNumber_NonRecursion_Obsolete2(unsigned int elementNum) StackDeprecated_Num;
unsigned long long allPossiblePopOrderNumber_NonRecursion_Obsolete1(unsigned int elementNum)  StackDeprecated_Num;


unsigned long long countOfAllPossiblePopSequencesByCatanat(unsigned int n);  //使用卡特兰 计算公式  max n = 30

/*
 扩展2.2：
 对于n个入栈序列，一个push顺序，且当前栈中有m个入栈元素
 输出所有可能的n+m个元素的pop序列。
 为了简化问题，假设pop序列为1到n+m的整数序列。
 
 It's a good distributed algorithm for computing catalan number
 */
unsigned long long countOfAllPossiblePopSequences(unsigned int unpushed, unsigned int pushed);// max unpushed + pushed = 36

// f(n-1,k+1)<f(n,k)<f(n+1,k-1)


/*
 扩展3：
 输入一个整数序列，表示一个栈的push顺序，
 输出所有可能的pop序列。
 为了简化问题，假设输入序列为1到n的整数序列。
 */
void generatingAllPossiblePopSequences(long long  n);  //未完成  0 1 2 ... n-1

static inline void generateRepresentationNumberSequence(long long n);
// 2 ->  2,  1 1 ;
//3 -> 3,   2 1  , 1 1 1
// 4 -> 4, 3 1 , 2 2 , 2 1 1 , 1 1 1 1

/*  下面做简单的分析，详细的分析 等我拿到《计算机程序设计艺术4A》如需要添加，我会适当的添加一些
 
 1 动态编程法，逐步生成  1 2 3  ... n的生成序列
 2
 
 
 first let's see the following pop sequeces with just five 5 elements:
 
 5   C(5,0)=1
    push(0)pop(0) push(1)pop(1) push(2)pop(2) push(3)pop(3)   push(4)pop(4) 00 11 22 33 44
 
 4 1   C(4,1)=4
    push(0)push(1)pop(1)pop(0)  push(2)pop(2) push(3)pop(3)   push(4)pop(4) 0110 22 33 44
    push(0)pop(0) push(1)push(2)pop(2)pop(1) push(3)pop(3) push(4)pop(4)    00 1221 33 44
    push(0)pop(0) push(1)pop(1)  push(2)push(3)pop(3)pop(2) push(4)pop(4)   00 11 2332 44
    push(0)pop(0) push(1)pop(1) push(2)pop(2) push(3)push(4)pop(4)pop(3)    00 11 22 3443
 
 3 2  C(3,2)=3
    push(0)push(1)pop(1)pop(0) push(2)push(3)pop(3)pop(2)   push(4) pop(4)   0110 2332 44
    push(0)push(1)pop(1)pop(0) push(2) pop(2) push(3)push(4)pop(4)pop(3)     0110 22 3443
    push(0) pop(0) push(1)push(2)pop(2)pop(1) push(3)push(4)pop(3)pop(4)     00 1221 3443
 
 3 1 1 C(3,1)*C(1,1)=3
    push(0)push(1)push(2)pop(2)pop(1)pop(0)   push(3)pop(3)   push(4)pop(4)  012210 33 44
    push(0)pop(0)  push(1)push(2)push(3)pop(3)pop(2)pop(1)   push(4)pop(4)   00 123321 44
    push(0)pop(0) push(1)pop(1)  push(2)push(3)push(4)pop(4)pop(3)pop(2)     00 11 234432
 
 2 2 1 C(2,2)*C(2,1)=2
    push(0)push(1)pop(1)pop(0) push(2)push(3)push(4)pop(4)pop(3)pop(2)       0110 234432
    push(0)push(1)push(2)pop(2)pop(1)pop(0) push(3)push(4)pop(4)pop(3)       012210 3443
 
 2 1 1 1  C(2,1)*C(1,1)*C(1,1)=2
    push(0)push(1)push(2)push(3)pop(3)pop(2)pop(1)pop(0)  push(4)pop(4)     01233210 44
    push(0)pop(0)  push(1)push(2)push(3)push(4)pop(1)pop(2)pop(3)pop(4)     00 12344321
 
 1 1 1 1 1
    push(0)push(1)push(2)push(3)push(4) pop(4)pop(3)pop(2)pop(1)pop(0)      01234 43210
 
 */


//////////////////////////////////////////////////////
//////////////////////////////////////////////////////
//////////////////////////////////////////////////////
//util
unsigned char biggestUnsignedLongLongForNthPower(unsigned char base);   //base 2  = 63
void printSysTime();


@end




