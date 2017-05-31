//
//  Stack.h
//  Algorithms
//
//  Created by wangjufan on 17-5-27.
//  Copyright (c) 2017年 dudu. All rights reserved.
//

#import <Foundation/Foundation.h>

#define StackDeprecated_Num __attribute__((deprecated("use allPossiblePopOrderNumber_Catanat or allPossiblePopSequences")))


@interface Stack : NSObject



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

BOOL possibleMatchedPushPopSequence(NSArray * pushSequence, NSArray * popSequence);



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
// max unpushed + pushed = 35
// max elementNum = 35
unsigned long long allPossiblePopOrderNumber_Recursion_Obsolete3(unsigned char unpushed, unsigned char pushed) StackDeprecated_Num;
unsigned long long allPossiblePopOrderNumber_NonRecursion_Obsolete2(unsigned int elementNum) StackDeprecated_Num;
unsigned long long allPossiblePopOrderNumber_NonRecursion_Obsolete1(unsigned char elementNum)  StackDeprecated_Num;


unsigned long long allPossiblePopOrderNumber_Catanat(unsigned char n);  //使用卡特兰 计算公式  max n = 30

/*
 扩展2.2：
 对于n个入栈序列，一个push顺序，且当前栈中有m个入栈元素
 输出所有可能的n+m个元素的pop序列。
 为了简化问题，假设pop序列为1到n+m的整数序列。
 */
unsigned long long allPossiblePopSequencesNumber(unsigned char unpushed, unsigned char pushed);// max unpushed + pushed = 35


/*
 扩展3：
 输入一个整数序列，表示一个栈的push顺序，
 输出所有可能的pop序列。
 为了简化问题，假设输入序列为1到n的整数序列。
 */
void allPossibleMatchedPopSequence(NSUInteger n);  //未完成


//////////////////////////////////////////////////////
//////////////////////////////////////////////////////
//////////////////////////////////////////////////////
//util
unsigned char biggestUnsignedLongLongForNthPower(unsigned char base);   //base 2  = 63
void printSysTime();


@end




