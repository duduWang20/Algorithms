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


using namespace std;
using namespace __gnu_cxx;


void visitNode(struct TreeNode * node){
    printf("node value = %d", node->value);
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





