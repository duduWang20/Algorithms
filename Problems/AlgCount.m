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
void shortestPathsForColorNumber(unsigned int path[],
                                 unsigned int pathLength,
                                 unsigned int colors[],
                                 unsigned int colorCount,
                                 unsigned int * outPath,
                                 unsigned int * outPathLength){
    
    int hashBest[pathLength];
    int hashCurrent[pathLength];
    int hashDestination[pathLength];
    memset(hashBest, 0, pathLength * sizeof(int));
    memset(hashCurrent, 0, pathLength * sizeof(int));
    memset(hashDestination, 0, pathLength * sizeof(int));
    
    int lowPos = 0;
    int highPos = 0;  //* outPathLength = (highPos + pathLength - lowPos) mod pathLength
    int bestLow = 0;
    int bestHigh = 0;
    
    for (; highPos < colorCount; highPos++) {
        hashDestination[colors[highPos]]++;
        hashCurrent[path[highPos]]++;
    }
    
    
    while (true) {
        
        //optimization
        BOOL best = true;
        for (int i = 0; i < colorCount; i++) {
            unsigned int color = colors[i];
            if (hashDestination[color] != hashCurrent[color]) {
                best = false;
                break;
            }
        }
        
        if (!best) {
            hashCurrent[path[highPos]]++;
            highPos = (highPos + 1) % pathLength;
        }else{
            if (lowPos == highPos) {
                bestLow = lowPos;
                bestHigh = highPos;
                memcpy(hashBest, hashCurrent, pathLength * sizeof(int));
            }else{
                
            }
        }
        
    }
    
}



@end




