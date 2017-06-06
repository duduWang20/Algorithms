//
//  AlgString.h
//  Algorithms
//
//  Created by wangjufan on 17-6-1.
//  Copyright (c) 2017年 dudu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AlgString : NSObject


//NSString * src = @"23x4vc75fg4781cxv374183iul41m875137t41cg9fvgoix37fgj418cfxc748fpxcv1734812734";
//NSString * des = @"cvx";

/* 微软面试 100 题：
 
 33.（字符串）
 实现一个挺高级的字符匹配算法：
 给一串很长字符串，要求找到符合要求的字符串，例如目的串：123
 1******3***2 ,12*****3这些都要找出来
 其实就是类似一些和谐系统。。。。。
 */

//output_occurs_in_des.length == des.length
void harmonyMatch(const char *src, const char *des);

//output_occurs_in_des.length >= des.length
void harmonyMatchInSourceRepeatable(const char *src, const char *des);


//output_occurs_in_des.length <= des.length
//void harmonyMatchInDestinationRepeatable(const char *src, const char *des);  


@end


