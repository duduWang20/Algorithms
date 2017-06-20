//
//  AlgCount.m
//  Algorithms
//
//  Created by wangjufan on 17-6-5.
//  Copyright (c) 2017年 dudu. All rights reserved.
//

#import "AlgCount.h"

#include "stdlib.h"



@implementation AlgCount

///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////

unsigned long long  countOfOneIn(unsigned long long naturalNumber){
    int count = 0;
    while (naturalNumber > 0) {
        double div = 10 * ((naturalNumber - 1) / 10);
        if ( div + 1 == naturalNumber ) {
            count++;
        }
        naturalNumber = naturalNumber / 10;
    }
    return count;
}

unsigned long long  countOfOneInRange(unsigned long long from, unsigned long long to){
    
    unsigned long long  count = 0;
    if (from > to) {
        count = from;
        from = to;
        to = count;
        count = 0;
    }
    while (from <= to) {
        unsigned long long natural = from;
        while (natural > 0) {
            double div = 10 * ((natural - 1) / 10);
            if ( div + 1 == natural ) {
                count++;
            }
            natural = natural / 10;
        }
        from++;
    }
    return count;
    
}

///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////

unsigned int * nubmerOfUsingBalanceForNumberOfBalls(unsigned long long ballsNumber, unsigned int * possibleCount){
    
    assert(ballsNumber>1);

    unsigned long long count = (ballsNumber) / 2;
    unsigned int *possibilities = malloc(count * sizeof(unsigned int));
    memset(possibilities, 0, count * sizeof(unsigned int));
    *possibleCount = 0;
    int numberOfResuts = 0;
    
    while (true) {
        *possibleCount += 1;
        if (ballsNumber > 3) {
            if (ballsNumber & 1) {
                possibilities[numberOfResuts] = *possibleCount;
                numberOfResuts++;
            }
        }else{
            possibilities[numberOfResuts] = *possibleCount;
            numberOfResuts++;
            break;
        }
        ballsNumber /= 2;
    }
    *possibleCount = numberOfResuts;
    return possibilities;
}


///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////
unsigned int * shortestPathsForColorNumber(unsigned int path[],
                                 unsigned int pathLength,
                                 unsigned int colors[],
                                 unsigned int colorCount,
                                 unsigned int * outPathLength){
    
    assert(pathLength > colorCount);
    
    unsigned int hashCurrent[pathLength];
    unsigned int hashDestination[pathLength];
    memset(hashCurrent, 0, pathLength * sizeof(unsigned int));
    memset(hashDestination, 0, pathLength * sizeof(unsigned int));
    
    unsigned int lowPos = 0;
    unsigned int highPos = 0;  //* outPathLength = (highPos + pathLength - lowPos) mod pathLength
    unsigned int bestLow = 0;
    unsigned int bestHigh = 0;
    
    unsigned int fistLow = pathLength+1;
    unsigned int firstHigh = pathLength+1;
    
    for (; highPos < colorCount; highPos++) {
        hashDestination[colors[highPos]]++;
        hashCurrent[path[highPos]]++;
    }
    
    bool loop = true;
    while (loop) {
        if (!isBest(colors, colorCount, hashDestination, hashCurrent)) {
            unsigned int value = path[highPos];
            hashCurrent[value]++;
            highPos = (highPos + 1) % pathLength;
            if (highPos == lowPos) {
                loop = false;
            }
        }else{
            shrinkLowPosition(path, pathLength, hashCurrent, hashDestination, &lowPos);
            if (bestHigh == bestLow) {
                bestLow = lowPos;
                bestHigh = highPos;
                fistLow = bestLow;
                firstHigh = bestHigh;
            }else{
                //cmp with is better
                unsigned int currentLength = (highPos - lowPos + pathLength) % pathLength;
                unsigned int bestLength =  (bestHigh - bestLow + pathLength) % pathLength;
                if (bestLength > currentLength) {
                    bestLow = lowPos;
                    bestHigh = highPos ;
                }
                if (firstHigh == highPos && fistLow == lowPos) {
                    loop = false;
                }
            }
            forwardOneStep(path, pathLength, hashCurrent, hashDestination, &lowPos, &highPos);
        }
    }
    
    *outPathLength = (bestHigh - bestLow + pathLength) % pathLength;
    if (*outPathLength == 0) {
        return nil;
    }else{
        unsigned int * pathOut = malloc( (*outPathLength) * sizeof(unsigned int));
        memset(pathOut, 0,  (*outPathLength)* sizeof(unsigned int));
        //malloc,calloc,realloc类似.但是注意一个重要的区别,_alloca
        for (int i = 0; i < *outPathLength; i++) {
            int index = (bestLow + i) % pathLength;
            pathOut[i] = path[index];
        }
    
        return pathOut;
    }
}

static inline bool isBest( unsigned int colors[],
                           unsigned int colorCount,
                           unsigned int *hashDestination,
                           unsigned int *hashCurrent){
    BOOL best = true;
    for (int i = 0; i < colorCount; i++) {
        unsigned int color = colors[i];
        if (hashDestination[color] > hashCurrent[color]) {
            best = false;
            break;
        }
    }
    return best;
}

static inline void shrinkLowPosition(unsigned int *path,
                                     unsigned int pathLength,
                                     unsigned int *hashCurrent,
                                     unsigned int *hashDestination,
                                     unsigned int *lowPos){
    unsigned int index = *lowPos;
    unsigned int value = path[index];
    
    while (hashCurrent[value] > hashDestination[value]) {
        hashCurrent[value]--;
        
        index = (index + 1) % pathLength;
        value = path[index];
    }
    
    *lowPos = index;
}

static inline void forwardOneStep(unsigned int *path,
                                  unsigned int pathLength,
                                  unsigned int *hashCurrent,
                                  unsigned int *hashDestination,
                                  unsigned int *lowPos,
                                  unsigned int *highPos){
    unsigned int lvalue = path[*lowPos];
    hashCurrent[lvalue]--;
    *lowPos = ((*lowPos) + 1) % pathLength;
}


@end




