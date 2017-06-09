//
//  AlgMatrix.m
//  Algorithms
//
//  Created by wangjufan on 17-6-8.
//  Copyright (c) 2017年 dudu. All rights reserved.
//

#import "AlgMatrix.h"

#include "stdlib.h"


static PenaltyNodeType originMatrix[12][7];

static PenaltyNodeType bestMatrix[12][7];
static PenaltyNodeType resultMatrix[12][7];
static PenaltyNodeType sortedNodes[7];


@implementation AlgMatrix


void generateMatrix(int dimRow, int dimColumn){
    
    dimRow= 12;
    dimColumn = 7;

    memset(originMatrix,    0, 12*7 * sizeof(PenaltyNodeType));
    memset(bestMatrix,      0, 12*7 * sizeof(PenaltyNodeType));
    memset(resultMatrix,    0, 12*7 * sizeof(PenaltyNodeType));
    
    memset(sortedNodes,      0, 7 * sizeof(PenaltyNodeType));
    
    
    //init the array
    for (int row = 0; row < dimRow; row++) {
        for (int column = 0; column < dimColumn; column++) {
            PenaltyNodeType * node = &originMatrix[row][column];
            node->column = column;
            node->row = row;
            node->penalty = 0;
            node->value = uniform_int(0, 1000);
        }
    }
    for (int row = 0; row < dimRow; row++) {
        for (int column = 0; column < dimColumn; column++) {
            PenaltyNodeType * node = &originMatrix[row][column];
            printf("(%d,%d,%d,%d) ",
                   node->value,
                   node->row,
                   node->column,
                   node->penalty);
        }
        printf("\n\n");
    }
    
  
    //sortedNodes
    for (int row = 0; row < dimRow; row++) {
        memcpy(sortedNodes, originMatrix[row], 7 * sizeof(PenaltyNodeType));
        qsort(sortedNodes, dimColumn, sizeof(PenaltyNodeType), comp);
        memcpy(bestMatrix[row], sortedNodes ,7 * sizeof(PenaltyNodeType));
    }
    for (int row = 0; row < dimRow; row++) {
        for (int column = 0; column < dimColumn; column++) {
            PenaltyNodeType * node = &bestMatrix[row][column];
            printf("(%d,%d,%d,%d) ",
                   node->value,
                   node->row,
                   node->column,
                   node->penalty);
        }
        printf("\n\n");
    }
    
    //set penalty
    for (int row = 0; row < dimRow; row++) {
        for (int column = 0; column < dimColumn; column++) {
            PenaltyNodeType * best = &bestMatrix[row][column];
            
            
        }
        printf("\n\n");
    }
    
    //resultMatrix
    for (int row = 0; row < dimRow; row++) {
        for (int column = 0; column < dimColumn; column++) {
            PenaltyNodeType * node = &bestMatrix[row][column];
            
            
        }
        printf("\n\n");
    }
    for (int row = 0; row < dimRow; row++) {
        for (int column = 0; column < dimColumn; column++) {
            PenaltyNodeType * node = &resultMatrix[row][column];
            printf("(%d,%d,%d,%d) ",
                   node->value,
                   node->row,
                   node->column,
                   node->penalty);
        }
        printf("\n\n");
    }
    
}

static inline int comp (const void *a, const void *b )
{
    PenaltyNodeType * nodeA = (PenaltyNodeType *)a;
    PenaltyNodeType * nodeB = (PenaltyNodeType *)b;
    return nodeA->value - nodeB->value;
}

void biggestTwoOrderMatrix(PenaltyNodeType ** matrix, int dimRow, int dimColumn){
    
}

static inline int uniform_int(int a, int b) {
    return (int)((double)rand() / ((RAND_MAX + 1.0) / (b - a + 1.0)) + a);
}


@end



