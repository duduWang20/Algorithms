//
//  AlgMatrix.h
//  Algorithms
//
//  Created by wangjufan on 17-6-8.
//  Copyright (c) 2017年 dudu. All rights reserved.
//

#import <Foundation/Foundation.h>


struct PenaltyNode {  //
    int value;
    int row;
    int column;
    int penalty;
};

typedef struct PenaltyNode PenaltyNodeType;


@interface AlgMatrix : NSObject

/*
 35.
 求一个矩阵中最大的二维矩阵(元素和最大).如:
 1 2 0 3 4
 2 3 4 5 1
 1 1 5 3 0
 中最大的是:
 4 5
 5 3
 要求:(1)写出算法;(2)分析时间复杂度;(3)用C 写出关键代码
 */

/*
 情看下面过程
 1  2  0  3  4
 2  3  4  5  1
 1  1  5  3  0
 
 ////////////////////////////////////////////////////
 line changings :
 -->
 0  1  2  3  4
 4  2  3  5  1
 5  1  1  3  0
 
 -->
 4   1  2  0  3   lineRelation(4) = 4
 1   2  3  4  5
 0   1  1  5  3
 
 -->  a(i,0) abnormal value discard
 you can sort the first column in value first  and linediff second
 4   1  2  3  0
 1   2  3  5  4   lineRelation(5) = 1
 0   1  1  3  5
 
 we see that column 2 and 3
 1  2
 2  3
 1  1
 can be removed without affect the result ，and wo got 
 ===>
 4   3  0
 1   5  4   lineRelation(5) = 1
 0   3  5
 
 ////////////////////////////////////////////////////
 column changings :
 -->
 
 策略 ： 分块

 */

void biggestTwoOrderMatrix(PenaltyNodeType ** maxtrix, int dimRow, int dimColumn);  //undone
void generateMatrix(int dimRow, int dimColumn);  //undone


@end




