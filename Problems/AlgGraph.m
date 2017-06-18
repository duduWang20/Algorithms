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


struct PlaneNode * shortestDistanceOfTwoNodesInPlane(struct PlaneNode *planeNoades, unsigned int nodeCount){
    
    
    struct SortNode * sortedX = malloc(nodeCount * sizeof(struct SortNode));
    sortAccordingX(planeNoades, sortedX, nodeCount);
    
    struct SortNode * sortedY = malloc(nodeCount * sizeof(struct SortNode));
    sortAccordingY(planeNoades, sortedY, nodeCount);
    
    
    struct PlaneNode * xHead = (struct PlaneNode *) (sortedX[0].node);
    struct PlaneNode * xNext = (struct PlaneNode *) (sortedX[1].node);
    float distacneBest = bestDistance(xHead, xNext);
    xHead->bestNode = xNext;
    
    int xHeadIndex = 0;
    while (xNext && xHead) {
        
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
            
            if (ldistance < distacneBest ) {
                distacneBest = ldistance;
                xHead->bestNode = xNext;
            }
            if (ldistance == 0) {
                NSLog(@"distance search = 0");
            }
        }
        assert(xHead->vx != xNext->vx || xNextIndex+1 == nodeCount);
        int xUpIndex = xNextIndex + 1;
        if (xUpIndex+1 >= nodeCount) {
            goto RESET;
        }
        
        /////////////////////////////////////////////////////////////////////
        /////////////////////////////////////////////////////////////////////
        //compute the best for every node
        int indexBest = xNextIndex+1;
        float distanceX = ABS(xHead->vx - xNext->vx);
        
        while ( distanceX < distacneBest && indexBest < nodeCount) {
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
            xHead->bestNode = xNext;
        }
    }
    
    
    struct PlaneNode * result = & planeNoades[0];
    float bestDis = bestDistance(result, result->bestNode);
    
    int i = 1;
    for (; i < nodeCount; i++) {
        struct PlaneNode * node = & planeNoades[i];
        if (node->bestNode == NULL) {
            continue;
        }
        float distance = bestDistance(node, node->bestNode);
        if (distance < bestDis) {
            bestDis = distance;
            result = node;
        }
    }
    
    
    return result;
    
    
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
    
    
    struct PlaneNode * result = shortestDistanceOfTwoNodesInPlane(node, count);
    printf("\n============ Nearest distance for plane Nodes =========== \n\n");
    printf("(%d,%d) (%d,%d), distance = %f\n",
           result->vx,result->vy,
           result->bestNode->vx,result->bestNode->vy,
           bestDistance(result,result->bestNode));
    printf("\n------------------------------------------------\n");
    

    
    free(node);
    
}

/////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////

static inline int compare4CubeNodeOnZ(const void * node1, const void *node2){
    struct SortNode * sort1 = (struct SortNode *)node1;
    struct SortNode * sort2 = (struct SortNode *)node2;
    
    struct CubeNode * plane1 = sort1->node;
    struct CubeNode * plane2 = sort2->node;
    
    int dlt = plane1->vz - plane2->vz;
    
    return dlt;
}
static inline int compare4CubeNodeOnY(const void * node1, const void *node2){
    struct SortNode * sort1 = (struct SortNode *)node1;
    struct SortNode * sort2 = (struct SortNode *)node2;
    
    struct CubeNode * plane1 = sort1->node;
    struct CubeNode * plane2 = sort2->node;
    
    int dlt = plane1->vy - plane2->vy;
    
    return dlt;
}
static inline int compare4CubeNodeOnX(const void * node1, const void *node2){
    struct SortNode * sort1 = (struct SortNode *)node1;
    struct SortNode * sort2 = (struct SortNode *)node2;
    
    struct CubeNode * plane1 = sort1->node;
    struct CubeNode * plane2 = sort2->node;
    
    int dlt = plane1->vx - plane2->vx;
    
    return dlt;
}

static inline void sortAccordingY4Cube(struct CubeNode *cubeNodes, struct SortNode *sortedY, unsigned int nodeCount){
    struct CubeNode * cubeNode = NULL;
    int i = 0;
    
    memset(sortedY, 0, sizeof(struct SortNode) * nodeCount);
    i = 0;
    for (; i < nodeCount; i++) {
        sortedY[i].node = &cubeNodes[i];
    }
    qsort(sortedY, nodeCount, sizeof(struct SortNode), compare4CubeNodeOnY);
    i = 0;
    for (; i < nodeCount-1; i++) {
        sortedY[i].position = i;
        
        cubeNode = sortedY[i].node;
        cubeNode->positionY = i;
    };
    cubeNode = sortedY[i].node;
    sortedY[i].position = i;
    cubeNode->positionY = i;
}
static inline void sortAccordingX4Cube(struct CubeNode *cubeNodes, struct SortNode *sortedX, unsigned int nodeCount){
    struct CubeNode * cubeNode = NULL;
    
    memset(sortedX, 0, sizeof(struct SortNode) * nodeCount);
    int i = 0;
    for (;i < nodeCount; i++) {
        sortedX[i].node = &cubeNodes[i];
    }
    qsort(sortedX, nodeCount, sizeof(struct SortNode), compare4CubeNodeOnX);
    
    i = 0;
    for (; i < nodeCount-1; i++) {
        sortedX[i].position = i;
        cubeNode = sortedX[i].node;
        cubeNode->positionX = i;
    };
    cubeNode = sortedX[i].node;
    sortedX[i].position = i;
    cubeNode->positionX = i;
}
static inline void sortAccordingZ4Cube(struct CubeNode *cubeNodes, struct SortNode *sortedX, unsigned int nodeCount){
    struct CubeNode * cubeNode = NULL;
    int i = 0;
    
    memset(sortedX, 0, sizeof(struct SortNode) * nodeCount);
    for (;i < nodeCount; i++) {
        sortedX[i].node = &cubeNodes[i];
    }
    qsort(sortedX, nodeCount, sizeof(struct SortNode), compare4CubeNodeOnZ);
    i = 0;
    for (; i < nodeCount-1; i++) {
        
        sortedX[i].position = i;
        
        cubeNode = sortedX[i].node;
        cubeNode->positionZ = i;
    };
    cubeNode = sortedX[i].node;
    sortedX[i].position = i;
    cubeNode->positionZ = i;
}

static inline float bestDistance4Cube(const struct CubeNode * node1, const struct CubeNode * node2 ){
    float dltX = node1->vx - node2->vx;
    float dltY = node1->vy - node2->vy;
    float dltZ = node1->vz - node2->vz;
    return sqrtf( dltX*dltX + dltY* dltY + dltZ * dltZ);
}


struct CubeNode * shortestDistanceOfTwoNodesInCube(struct CubeNode cubeNodes[], unsigned int nodeCount){
    
    struct SortNode * sortedY = malloc(nodeCount * sizeof(struct SortNode));
    sortAccordingY4Cube(cubeNodes, sortedY, nodeCount);
    
    struct SortNode * sortedZ = malloc(nodeCount * sizeof(struct SortNode));
    sortAccordingZ4Cube(cubeNodes, sortedZ, nodeCount);
    
    struct SortNode * sortedX = malloc(nodeCount * sizeof(struct SortNode));
    sortAccordingX4Cube(cubeNodes, sortedX, nodeCount);
    
    
    struct CubeNode * xHead = (struct CubeNode *) (sortedX[0].node);
    struct CubeNode * xNext = (struct CubeNode *) (sortedX[1].node);
    float distacneBest = bestDistance4Cube(xHead, xNext);
    xHead->bestNode = xNext;
    
    int xHeadIndex = 0;
    while (xNext && xHead) {
        
        /////////////////////////////////////////////////////////////////////
        /////////////////////////////////////////////////////////////////////
        
        //move xHEXT that   xHead->vx != xNext->vx
        xNext = (struct CubeNode *) (sortedX[xHeadIndex+1].node);
        int xNextIndex = xHeadIndex + 1;
        while (xHead->vx == xNext->vx) {
            if (xNextIndex+1 == nodeCount) {
                break;
            }
            xNextIndex++;
            struct CubeNode * xzeroNode = (struct CubeNode *) (sortedX[xNextIndex].node);
            float ldistance = bestDistance4Cube(xHead, xzeroNode);
            xNext = xzeroNode;
            if (ldistance < distacneBest ) {
                distacneBest = ldistance;
                xHead->bestNode = xNext;
            }
            if (ldistance == 0) {
                NSLog(@"distance search = 0");
            }
        }
        assert(xHead->vx != xNext->vx || xHead->vz != xNext->vz || xNextIndex+1 == nodeCount);
        int xUpIndex = xNextIndex + 1;
        if (xUpIndex+1 >= nodeCount) {
            goto RESET;
        }
        
        /////////////////////////////////////////////////////////////////////
        /////////////////////////////////////////////////////////////////////
        /////////////////////////////////////////////////////////////////////
        //compute the best for every node
        int indexBest = xHeadIndex + 2;
        float distanceX = ABS(xHead->vx - xNext->vx);
        
        
        while ( distanceX < distacneBest && indexBest < nodeCount) {
            struct CubeNode * node = (struct CubeNode *) (sortedX[indexBest].node);
            float distacne = bestDistance4Cube(xHead, node);
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
        xHead = (struct CubeNode *) (sortedX[xHeadIndex].node);
        if (xHeadIndex + 1 >= nodeCount) {
            xNext = NULL;
        }else
            xNext = (struct CubeNode *) (sortedX[xHeadIndex+1].node);
        if (xNext) {
            distacneBest = bestDistance4Cube(xHead, xNext);
            xHead->bestNode = xNext;
        }
    }
    
    struct CubeNode * result = & cubeNodes[0];
    float bestDis = bestDistance4Cube(result, result->bestNode);
    
    int i = 1;
    for (; i < nodeCount; i++) {
        struct CubeNode * node = & cubeNodes[i];
        if (node->bestNode == NULL) {
            continue;
        }
        float distance = bestDistance4Cube(node, node->bestNode);
        if (distance < bestDis) {
            bestDis = distance;
            result = node;
        }
    }
    

    return result;
}

void cubeNodesGenerate(int count){
    struct CubeNode * node = malloc(count * sizeof(struct CubeNode));
    memset(node, 0, sizeof(struct CubeNode) * count);
    
    for (int i = 0; i < count; i++) {
        struct CubeNode *lnode = &node[i];
        
        lnode->vx = uniform_int(1, 1000000);
        lnode->vy = uniform_int(1, 100000);
        lnode->vz = uniform_int(1, 10000000);
        
        lnode->bestNode = NULL;
        
        lnode->positionX = -1;
        lnode->positionY = -1;
        lnode->positionZ = -1;
    }
    
    struct CubeNode * result = shortestDistanceOfTwoNodesInCube(node, count);
    printf("\n============ Nearest distance for cube Nodes =========== \n\n");
    printf("(%d,%d,%d) (%d,%d,%d), distance = %f\n",
           result->vx,result->vy,result->vz,
           result->bestNode->vx,result->bestNode->vy,result->bestNode->vz,
           bestDistance4Cube(result,result->bestNode));
    printf("\n----------------------------------------------\n");

    
    free(node);
}


/////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////

static inline int uniform_int(int a, int b) {
    return (int)(rand()%(b - a + 1)) + a ;
}



@end


