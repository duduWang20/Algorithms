//
//  Stack.h
//  Algorithms
//
//  Created by wangjufan on 17-5-27.
//  Copyright (c) 2017年 dudu. All rights reserved.
//

#import <Foundation/Foundation.h>


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


/*
 题目1扩展：
 输入一个整数序列，表示一个栈的push顺序，
 输出所有可能的pop序列。
 为了简化问题，假设输入序列为1到n的整数序列。
 */
void allPossibleMatchedPopSequence(NSUInteger n);




@end




