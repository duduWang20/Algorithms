//
//  AlgGraph.h
//  Algorithms
//
//  Created by jufan wang on 15/6/2017.
//  Copyright © 2017 dudu. All rights reserved.
//

#import <Foundation/Foundation.h>


//git remote set-url origin git@github.com:username/repository


struct PlaneNode{
    struct PlaneNode * bestNode;    //init = null
    int positionX;//x坐标排序位置  {0,n-1}
    int positionY;//y坐标排序位置  {0,n-1}
    int vx;         //平面坐标x的值
    int vy;         //平面坐标y的值
};

struct CubeNode{
    struct CubeNode * bestNode;    //init = null
    
    int positionX;//x坐标排序位置  {0,n-1}
    int positionY;//y坐标排序位置  {0,n-1}
    int positionZ;//y坐标排序位置  {0,n-1}
    
    int vx;         //平面坐标x的值
    int vy;         //平面坐标y的值
    int vz;         //平面坐标y的值
};


@interface AlgGraph : NSObject

/***********************************************************
 快手 面试题
 平面上有n个点 求距离最短的两个点
 ***********************************************************/

/*
 2维 空间中情况
 */
struct PlaneNode * shortestDistanceOfTwoNodesInPlane(struct PlaneNode planeNoades[], unsigned int nodeCount);
void planeNodesGenerate(int count);

/*
 3维 空间中情况
 */
struct CubeNode * shortestDistanceOfTwoNodesInCube(struct CubeNode planeNodes[], unsigned int nodeCount);
void cubeNodesGenerate(int count);


/***********************************************************
 Dijkstra
 ***********************************************************/



@end


