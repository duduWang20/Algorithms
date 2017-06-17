//
//  AlgGraph.m
//  Algorithms
//
//  Created by jufan wang on 15/6/2017.
//  Copyright © 2017 dudu. All rights reserved.
//

#import "AlgGraph.h"

#include "SortCommon.hpp"

@implementation AlgGraph



static inline int compare4PlaneNodeOnX(const void * node1, const void *node2){
    struct SortNode * sort1 = (struct SortNode *)node1;
    struct SortNode * sort2 = (struct SortNode *)node2;
    
    struct PlaneNode * plane1 = sort1->node;
    struct PlaneNode * plane2 = sort2->node;
    
    int dlt = plane1->vx - plane2->vx;

    return dlt;
}
static inline int compare4PlaneNodeOnY(const void * node1, const void *node2){
    struct SortNode * sort1 = (struct SortNode *)node1;
    struct SortNode * sort2 = (struct SortNode *)node2;
    
    struct PlaneNode * plane1 = sort1->node;
    struct PlaneNode * plane2 = sort2->node;
    
    int dlt = plane1->vy - plane2->vy;
    
    return dlt;
}

static inline void sortAccordingY(struct PlaneNode *planeNoades, struct SortNode *sortedY, unsigned int nodeCount){
    struct PlaneNode * planeNode = NULL;
    int i = 0;
    
    memset(sortedY, 0, sizeof(struct SortNode) * nodeCount);
    i = 0;
    for (; i < nodeCount; i++) {
        sortedY[i].node = &planeNoades[i];
    }
    qsort(sortedY, nodeCount, sizeof(struct SortNode), compare4PlaneNodeOnY);
    i = 0;
    for (; i < nodeCount-1; i++) {
        sortedY[i].position = i;
        
        planeNode = sortedY[i].node;
        planeNode->positionY = i;
    };
    planeNode = sortedY[i].node;
    sortedY[i].position = i;
    planeNode->positionY = i;
}
static inline void sortAccordingX(struct PlaneNode *planeNoades, struct SortNode *sortedX, unsigned int nodeCount){
    struct PlaneNode * planeNode = NULL;
    int i = 0;
    
    memset(sortedX, 0, sizeof(struct SortNode) * nodeCount);
    for (;i < nodeCount; i++) {
        sortedX[i].node = &planeNoades[i];
    }
    qsort(sortedX, nodeCount, sizeof(struct SortNode), compare4PlaneNodeOnX);
    i = 0;
    for (; i < nodeCount-1; i++) {
        
        sortedX[i].position = i;
        
        planeNode = sortedX[i].node;
        planeNode->positionX = i;
    };
    planeNode = sortedX[i].node;
    sortedX[i].position = i;
    planeNode->positionX = i;
}

static inline float bestDistance(const struct PlaneNode * node1, const struct PlaneNode * node2 ){
    float dltX = node1->vx - node2->vx;
    float dltY = node1->vy - node2->vy;
    return sqrtf( dltX*dltX + dltY* dltY);
}


void shortestDistanceOfTwoNodesInPlane(struct PlaneNode *planeNoades, unsigned int nodeCount){
    
    
    struct SortNode * sortedX = malloc(nodeCount * sizeof(struct SortNode));
    sortAccordingX(planeNoades, sortedX, nodeCount);
    
    struct SortNode * sortedY = malloc(nodeCount * sizeof(struct SortNode));
    sortAccordingY(planeNoades, sortedY, nodeCount);
    
    
    struct PlaneNode * xHead = (struct PlaneNode *) (sortedX[0].node);
    struct PlaneNode * xNext = (struct PlaneNode *) (sortedX[1].node);
    float distacneBest = bestDistance(xHead, xNext);
    float distanceSearch = distacneBest;
    xHead->bestNode = xNext;
    
    int xHeadIndex = 0;
    while (xNext && xHead) {
        
        float distanceX = 0;
        float distanceY = ABS(xHead->vy - xNext->vy);

        /////////////////////////////////////////////////////////////////////
        /////////////////////////////////////////////////////////////////////
        //move xHEXT that   xHead->vx != xNext->vx
        int xNextIndex = xHeadIndex + 1;
        while (xHead->vx == xNext->vx) {
            if (xNextIndex+1 == nodeCount) {
                break;
            }
            xNextIndex++;
            struct PlaneNode * xzeroNode = (struct PlaneNode *) (sortedX[xNextIndex].node);
            float ldistance = bestDistance(xHead, xzeroNode);
            xNext = xzeroNode;
            distanceY = MIN(ABS(xHead->vy - xNext->vy), distanceY);
            if (ldistance < distacneBest ) {
                distacneBest = ldistance;
                distanceSearch = ldistance;
                xHead->bestNode = xNext;
            }
            if (ldistance == 0) {
                NSLog(@"distance search = 0");
            }
        }
        assert(xHead->vx != xNext->vx || xNextIndex+1 == nodeCount);
        
      
        /////////////////////////////////////////////////////////////////////
        /////////////////////////////////////////////////////////////////////
        //for every dimenstion Y Z ... finding min dlt Y
        int xUpIndex = xNextIndex + 1;
        if (xUpIndex+1 >= nodeCount) {
            goto RESET;
        }
       
        struct PlaneNode * xUp = (struct PlaneNode *) (sortedX[xUpIndex].node);
        distanceX = ABS(xHead->vx - xNext->vx);
        while (distanceX < distacneBest && xUpIndex < nodeCount) {
            xUp = (struct PlaneNode *) (sortedX[xUpIndex].node);
            distanceY = MIN(ABS(xHead->vy - xUp->vy), distanceY);
            distanceX = ABS(xHead->vx - xUp->vx);
            xUpIndex++;
        }
        if (distanceSearch == 0) {
            NSLog(@"distance search = 0");
        }
        //shrink search range
        if (xUp != xNext) {
            float dltX = xHead->vx - xNext->vx;
            float dltY = distanceY;
            distanceSearch = MIN(sqrtf( dltX*dltX + dltY* dltY), distanceSearch);
            if (distanceSearch == 0) {
                NSLog(@"distance search = 0");
            }
        }
        
        if (distanceSearch == 0) {
            NSLog(@"distance search = 0");
        }
        
        /////////////////////////////////////////////////////////////////////
        /////////////////////////////////////////////////////////////////////
        //compute the best for every node
        
        int indexBest = xHeadIndex + 2;
        distanceX = ABS(xHead->vx - xNext->vx);
        
        while ( distanceX < distanceSearch && indexBest < nodeCount) {
            struct PlaneNode * node = (struct PlaneNode *) (sortedX[indexBest].node);
            float distacne = bestDistance(xHead, node);
            if (distacne < distacneBest) {
                xHead->bestNode = node;
                distacneBest = distacne;
            }
            distanceX = ABS(xHead->vx - node->vx);
            indexBest++;
        }
        
    RESET:
        assert(xHead->bestNode != NULL);
        xHeadIndex++;
        xHead = (struct PlaneNode *) (sortedX[xHeadIndex].node);
        if (xHeadIndex + 1 >= nodeCount) {
            xNext = NULL;
        }else
        xNext = (struct PlaneNode *) (sortedX[xHeadIndex+1].node);
        if (xNext) {
            distacneBest = bestDistance(xHead, xNext);
            distanceSearch = distacneBest;
            xHead->bestNode = xNext;
        }
        
    }
    
    int i = 0;
    for (; i < nodeCount-1; i++) {
        printf("\n===========\n");
        struct PlaneNode* node = &planeNoades[i];
        if (node->bestNode != NULL) {
            printf("x1=%d, x2=%d ,y1=%d ,y2=%d ,  distance = %f\n",
                   node->vx,
                   node->bestNode->vx,
                   node->vy,
                   node->bestNode->vy, bestDistance( node,  node->bestNode));
        }else{
            printf("x1=%d, x2=%d  end of \n",  node->vx, node->vy);
        }
        printf("\n===========\n");
    }
    
    
}


//////////////////////////////////////////////////////

void planeNodesGenerate(int count){
    
    struct PlaneNode * node = NULL;
    node = malloc(count * sizeof(struct PlaneNode));
    memset(node, 0, sizeof(struct PlaneNode) * count);
    
    for (int i = 0; i < count; i++) {
        struct PlaneNode *lnode = &node[i];
        
        lnode->vx = uniform_int(1, 1000);
        lnode->vy = uniform_int(1, 1000);
        
        lnode->bestNode = NULL;
        
        lnode->positionX = -1;
        lnode->positionY = -1;
    }
    
    shortestDistanceOfTwoNodesInPlane(node, count);
    free(node);
    
}

/////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////

void shortestDistanceOfTwoNodesInCube(struct PlaneNode planeNoades[], unsigned int nodeCount){
    
}

void cubeNodesGenerate(int count){
    
}


/////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////

static inline int uniform_int(int a, int b) {
    return (int)(rand()%(b - a + 1)) + a ;
}



@end


