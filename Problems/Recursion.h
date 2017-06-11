//
//  Recursion.h
//  Recursion
//
//  Created by wangjufan on 17-5-25.
//  Copyright (c) 2017年 dudu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Recursion : NSObject


/*
 
微软面试题 1：
 一个台阶总共有n级，如果一次可以跳1级，也可以跳2级。
 求总共有多少总跳法，并分析算法的时间复杂度。
 这道题最近经常出现，包括MicroStrategy等比较重视算法的公司
 都曾先后选用过个这道题作为面试题或者笔试题。
 
 */

NSUInteger recursionJumpNum(NSUInteger steps);


NSUInteger nonrecursionJumpNum(const NSUInteger steps);

@end
