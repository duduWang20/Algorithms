
//
//  Path.h
//  Algorithms
//
//  Created by wangjufan on 17-5-31.
//  Copyright (c) 2017年 dudu. All rights reserved.
//

#import <Foundation/Foundation.h>


struct CellularStructure{
    bool flag;//true  used and the link between the two node should be set to nil ; false  unused
    struct CellularStructure * first;
    struct CellularStructure * second;
    struct CellularStructure * third;
};


@interface AlgPath : NSObject

/*
 31.华为面试题（搜索）：
 一类似于蜂窝的结构的图，进行搜索最短路径（要求5分钟）
 */
void shortestPathsForCellularStructure(struct CellularStructure * fromCelluar, struct CellularStructure * toCelluar);


/*
 32.（数组、规划）
 有两个序列a,b，大小都为n,序列元素的值任意整数，无序；
 要求：通过交换a,b中的元素，使[序列a元素的和]与[序列b元素的和]之间的差最小。
 例如:
 var a=[100,99,98,1,2, 3];
 var b=[1, 2, 3, 4,5,40];
 */
void exchangingForMinDifferenceInSum(long long serialA[], long long serailB[], unsigned int length);
void exchangingForMinDifferenceInSumPrintAll(long long serialA[], long long serailB[], unsigned int length);

/*
 快手 今天下午面试题
 平面上有n个点 求距离最短的两个点
 
 策略：
 1 vy 排序  nlgn
 2 vx 排序, 设置preX和postX。复杂度为nlgn。 IF positionX == 0 then Head <-- node
 3 BestNodes = {Head,Head->postX} , BestDistance = distance(BestNodes) , HEAD = HEAD->postX  ,NEXT =  HEAD->postX
 
 3 while NEXT != nil
 
    UpYNode = NEXT->postX;
    LowNode = nil;
    while( distanceX(NEXT,UpYNode)<BestDistance)
        UpYNode = UpYNode->postX;
        if( LowNode == nil)
            LowNode = UpYNode
        else{
            if( abs ( distanceY(NEXT,UpYNode) ） > abs( distanceY(NEXT,UpYNode) ) )
            LowNode = UpYNode
        }
 
 //查找最近Y Z
    NEXT =  HEAD->postX  ,
    LengY =  abs(HEAD.vy - NEXT.vy)
        =  abs(HEAD.vx - NEXT.vx)
    if( abs
 
 
   minNode = min( abs(node.vx - preX.vx,node.vx - postX.vx)
   node.vmin = distance(node,minNode)
 
 
 5 compute all distances currNode in { minNode.vy to node.vy} .
   if the new value < vmin then  minNode = newNode
 
 
   (N/2次比较的概率为 1/2)  4和5的复杂度为 n*n/2
 
 
 优化：在4和5中综合考虑集合 { minNode.v to node.v}元素个数最少的 . 
 这样 N/4次比较的概率为 7/16, 比较接近 1/2的概率. 复杂度略小于n*n/4
 
 O = 2*n*Log(n) + n*n/4
 
 */

/*
 在n维空间中情况
 */
struct PlaneNode{
    struct PlaneNode * postX;       //vx在升续排列中的位置  init = null
    
    struct PlaneNode * preY;       //vy在升续排列中的位置  init = null
    struct PlaneNode * postY;
    
    int positionX;//x坐标排序位置  0-n-1
    int positionY;//y坐标排序位置  0-n-1
    
    float vx;         //平面坐标x的值
    float vy;         //平面坐标y的值
};
void shortestPath(unsigned int planeNoades[], unsigned int nodeCount);


@end

/*
 long long a[] = {100,99,98,1,  2,3,4,5,    40,1,2,3};
 long long b[] = {1,2,3,4,      5,40,4,5,   40,4,5,40};
 exchangingForMinDifferenceInSum(a, b, 12);
 
 差别 == 1
 共有 112个解 其中 56个独立解
 
 111111111111000000000000---- diff = 205---- count = 1
 111111111110100000000000---- diff = 201---- count = 1
 111111111100110000000000---- diff = 201---- count = 2
 111111110111100000000000---- diff = 127---- count = 1
 111111110110110000000000---- diff = 125---- count = 1
 111111100111110000000000---- diff = 121---- count = 1
 111111100110111000000000---- diff = 121---- count = 2
 111111000111111000000000---- diff = 119---- count = 1
 110111111111100000000000---- diff = 11---- count = 1
 110111111110110000000000---- diff = 9---- count = 1
 110111110110110001000000---- diff = 9---- count = 2
 110111110110110000001000---- diff = 9---- count = 3
 110111110110110000000001---- diff = 9---- count = 4
 110111101111110000000000---- diff = 5---- count = 1
 110111101110111000000000---- diff = 5---- count = 2
 110111100111110001000000---- diff = 5---- count = 3
 110111100111110000001000---- diff = 5---- count = 4
 110111100111110000000001---- diff = 5---- count = 5
 110111100110111001000000---- diff = 5---- count = 6
 110111100110111000001000---- diff = 5---- count = 7
 110111100110111000000001---- diff = 5---- count = 8
 110111001111111000000000---- diff = 3---- count = 1
 110111000111111001000000---- diff = 3---- count = 2
 110111000111111000001000---- diff = 3---- count = 3
 110111000111111000000001---- diff = 3---- count = 4
 101111101111110000000000---- diff = 3---- count = 5
 101111101110111000000000---- diff = 3---- count = 6
 101111100111110001000000---- diff = 3---- count = 7
 101111100111110000001000---- diff = 3---- count = 8
 101111100111110000000001---- diff = 3---- count = 9
 101111100110111001000000---- diff = 3---- count = 10
 101111100110111000001000---- diff = 3---- count = 11
 101111100110111000000001---- diff = 3---- count = 12
 101111001111111000000000---- diff = 1---- count = 1
 101111000111111001000000---- diff = 1---- count = 2
 101111000111111000001000---- diff = 1---- count = 3
 101111000111111000000001---- diff = 1---- count = 4
 100001111000000111111010---- diff = 1---- count = 5
 100001111000000111110011---- diff = 1---- count = 6
 100001111000000111011110---- diff = 1---- count = 7
 100001111000000111010111---- diff = 1---- count = 8
 100001111000000110111011---- diff = 1---- count = 9
 100001111000000110011111---- diff = 1---- count = 10
 100001111000000011111110---- diff = 1---- count = 11
 100001111000000011110111---- diff = 1---- count = 12
 100001111000000010111111---- diff = 1---- count = 13
 100001110000000111111011---- diff = 1---- count = 14
 100001110000000111011111---- diff = 1---- count = 15
 100001110000000011111111---- diff = 1---- count = 16
 100001011000000111111110---- diff = 1---- count = 17
 100001011000000111110111---- diff = 1---- count = 18
 100001011000000110111111---- diff = 1---- count = 19
 100001010000000111111111---- diff = 1---- count = 20
 100000111001000111111010---- diff = 1---- count = 21
 100000111001000111110011---- diff = 1---- count = 22
 100000111001000111011110---- diff = 1---- count = 23
 100000111001000111010111---- diff = 1---- count = 24
 100000111001000110111011---- diff = 1---- count = 25
 100000111001000110011111---- diff = 1---- count = 26
 100000111001000011111110---- diff = 1---- count = 27
 100000111001000011110111---- diff = 1---- count = 28
 100000111001000010111111---- diff = 1---- count = 29
 100000111000001111111010---- diff = 1---- count = 30
 100000111000001111110011---- diff = 1---- count = 31
 100000111000001111011110---- diff = 1---- count = 32
 100000111000001111010111---- diff = 1---- count = 33
 100000111000001110111011---- diff = 1---- count = 34
 100000111000001110011111---- diff = 1---- count = 35
 100000111000001011111110---- diff = 1---- count = 36
 100000111000001011110111---- diff = 1---- count = 37
 100000111000001010111111---- diff = 1---- count = 38
 100000111000000111111110---- diff = 1---- count = 39
 100000111000000111110111---- diff = 1---- count = 40
 100000111000000110111111---- diff = 1---- count = 41
 100000110001000111111011---- diff = 1---- count = 42
 100000110001000111011111---- diff = 1---- count = 43
 100000110001000011111111---- diff = 1---- count = 44
 100000110000001111111011---- diff = 1---- count = 45
 100000110000001111011111---- diff = 1---- count = 46
 100000110000001011111111---- diff = 1---- count = 47
 100000110000000111111111---- diff = 1---- count = 48
 100000011001000111111110---- diff = 1---- count = 49
 100000011001000111110111---- diff = 1---- count = 50
 100000011001000110111111---- diff = 1---- count = 51
 100000011000001111111110---- diff = 1---- count = 52
 100000011000001111110111---- diff = 1---- count = 53
 100000011000001110111111---- diff = 1---- count = 54
 100000010001000111111111---- diff = 1---- count = 55
 100000010000001111111111---- diff = 1---- count = 56
 011111101111110000000000---- diff = 1---- count = 57
 011111101110111000000000---- diff = 1---- count = 58
 011111100111110001000000---- diff = 1---- count = 59
 011111100111110000001000---- diff = 1---- count = 60
 011111100111110000000001---- diff = 1---- count = 61
 011111100110111001000000---- diff = 1---- count = 62
 011111100110111000001000---- diff = 1---- count = 63
 011111100110111000000001---- diff = 1---- count = 64
 011111001111111000000000---- diff = 1---- count = 65
 011111001111110100000000---- diff = 1---- count = 66
 011111001111110000100000---- diff = 1---- count = 67
 011111001111110000000100---- diff = 1---- count = 68
 011111001110111100000000---- diff = 1---- count = 69
 011111001110111000100000---- diff = 1---- count = 70
 011111001110111000000100---- diff = 1---- count = 71
 011111000111111001000000---- diff = 1---- count = 72
 011111000111111000001000---- diff = 1---- count = 73
 011111000111111000000001---- diff = 1---- count = 74
 011111000111110101000000---- diff = 1---- count = 75
 011111000111110100001000---- diff = 1---- count = 76
 011111000111110100000001---- diff = 1---- count = 77
 011111000111110001100000---- diff = 1---- count = 78
 011111000111110001000100---- diff = 1---- count = 79
 011111000111110000101000---- diff = 1---- count = 80
 011111000111110000100001---- diff = 1---- count = 81
 011111000111110000001100---- diff = 1---- count = 82
 011111000111110000000101---- diff = 1---- count = 83
 011111000110111101000000---- diff = 1---- count = 84
 011111000110111100001000---- diff = 1---- count = 85
 011111000110111100000001---- diff = 1---- count = 86
 011111000110111001100000---- diff = 1---- count = 87
 011111000110111001000100---- diff = 1---- count = 88
 011111000110111000101000---- diff = 1---- count = 89
 011111000110111000100001---- diff = 1---- count = 90
 011111000110111000001100---- diff = 1---- count = 91
 011111000110111000000101---- diff = 1---- count = 92
 011110101111111000000000---- diff = 1---- count = 93
 011110100111111001000000---- diff = 1---- count = 94
 011110100111111000001000---- diff = 1---- count = 95
 011110100111111000000001---- diff = 1---- count = 96
 011110001111111100000000---- diff = 1---- count = 97
 011110001111111000100000---- diff = 1---- count = 98
 011110001111111000000100---- diff = 1---- count = 99
 011110000111111101000000---- diff = 1---- count = 100
 011110000111111100001000---- diff = 1---- count = 101
 011110000111111100000001---- diff = 1---- count = 102
 011110000111111001100000---- diff = 1---- count = 103
 011110000111111001000100---- diff = 1---- count = 104
 011110000111111000101000---- diff = 1---- count = 105
 011110000111111000100001---- diff = 1---- count = 106
 011110000111111000001100---- diff = 1---- count = 107
 011110000111111000000101---- diff = 1---- count = 108
 010000111000000111111110---- diff = 1---- count = 109
 010000111000000111110111---- diff = 1---- count = 110
 010000111000000110111111---- diff = 1---- count = 111
 010000110000000111111111---- diff = 1---- count = 112
 
 */