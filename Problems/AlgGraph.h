//
//  AlgGraph.h
//  Algorithms
//
//  Created by jufan wang on 15/6/2017.
//  Copyright © 2017 dudu. All rights reserved.
//

#import <Foundation/Foundation.h>

struct PlaneNode{
//    struct PlaneNode * postX;       //vx在升续排列中的位置  init = null
//    struct PlaneNode * postY;       //vy在升续排列中的位置  init = null
    struct PlaneNode * bestNode;    //init = null
    
    int positionX;//x坐标排序位置  {0,n-1}
    int positionY;//y坐标排序位置  {0,n-1}
    
    int vx;         //平面坐标x的值
    int vy;         //平面坐标y的值
};



@interface AlgGraph : NSObject

/*
 快手 面试题
 平面上有n个点 求距离最短的两个点
 
 策略：
 1 vy 排序  nlgn
 2 vx 排序  nlgn。
 IF PlaneNode->positionX == 0
 THEN Head  =  node
 
 NEXT    =       HEAD->postX
 BestNodes       =       {Head, Next}
 BestDistance    =       distance(BestNodes)
 
 
 3 while NEXT != nil
 
 //查找小于BestDistance  可以扩展到n维空间
 DistanceY = abs( NEXT->vy, HEAD->vy )
 DistanceY = abs( NEXT->vx, HEAD->vx )
 UpYNode = NEXT;
 while( DistanceX < BestDistance)
 UpYNode = UpYNode->postX;
 DistanceY =  MIN( abs( NEXT->vy, UnYNode->vy ), DistanceY)
 BestDistance = sqrt(DistanceY*DistanceY, DistanceX*DistanceX）
 //n维空间扩展
 
 while( BestDistance <
 minNode = min( abs(node.vx - preX.vx,node.vx - postX.vx)
 node.vmin = distance(node,minNode)
 
 
 HEAD->bestNode = BestNodes[1];
 
 //ready for next
 HEAD = NEXT;
 NEXT = HEAD->postX
 BestNodes       =       {Head, Next}
 BestDistance    =       distance(BestNodes)
 
 
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

void shortestDistanceOfTwoNodesInPlane(struct PlaneNode planeNoades[], unsigned int nodeCount);

void planeNodesGenerate(int count);


@end


