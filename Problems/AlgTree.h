//
//  AlgTree.h
//  Algorithms
//
//  Created by wangjufan on 17-6-10.
//  Copyright (c) 2017年 dudu. All rights reserved.
//


#ifndef Algorithms_AlgTree_h
#define Algorithms_AlgTree_h


struct TreeNode{
    struct TreeNode * left;
    struct TreeNode * right;
    int value;
};
typedef struct TreeNode TreeNodeType;


/*
 43.递归和非递归  俩种方法实现  二叉树的 前序遍历。
 */

void preorderTraversal(struct TreeNode * node);

void preorderTraversalNonRecursion(struct TreeNode * node);


void createAndTraversal(unsigned int nodeCount);



#endif
