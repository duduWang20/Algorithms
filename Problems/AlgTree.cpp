//
//  AlgTree.cpp
//  Algorithms
//
//  Created by wangjufan on 17-6-10.
//  Copyright (c) 2017年 dudu. All rights reserved.
//

#include "AlgTree.h"


#include <stdlib.h>
#include <string>
#include <iostream>
#include <ext/hash_map>
#include <stack>
#include <vector>

#include <queue>
#include <deque>


using namespace std;
using namespace __gnu_cxx;


void visitNode(struct TreeNode * node){
    printf("\n node value = %d", node->value);
}

void preorderTraversal(struct TreeNode * node){
    visitNode(node);
    preorderTraversal(node->left);
    preorderTraversal(node->right);
}

void preorderTraversalNonRecursion(struct TreeNode * node){
    
    if (node == NULL) {
        return;
    }
    
    stack<struct TreeNode *> travelStack;
    travelStack.push(node);
    
    while (!travelStack.empty()) {
        
        struct TreeNode * node = travelStack.top();
        visitNode(node);
        
        travelStack.pop();
        if (node->right) {
            travelStack.push(node->right);
        }
        if (node->left) {
            travelStack.push(node->left);
        }
    }
    
}


void createAndTraversal(unsigned int nodeCount){
    
    struct TreeNode * head = new struct TreeNode();
    struct TreeNode * node = head;
    
    deque<struct TreeNode *>  travelQueue;
    travelQueue.push_front(node);
    
    int count = 0;
    while (!travelQueue.empty() && count < nodeCount) {
        
        struct TreeNode * left = new struct TreeNode();
        struct TreeNode * right = new struct TreeNode();
        
        left->right = NULL;
        left->left = NULL;
        left->value = -1;
        
        right->right = NULL;
        right->left = NULL;
        right->value = -1;
        
        travelQueue.push_front(left);
        travelQueue.push_front(right);
        node = travelQueue.back();
        travelQueue.pop_back();
        
        node->right = right;
        node->left = left;
        node->value = count++;
    }
    
    preorderTraversalNonRecursion(head);
    
}








