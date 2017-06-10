

#import "AlgPath.h"

#include "AlgTree.h"


@implementation AlgPath


void shortestPathsForCellularStructure(struct CellularStructure * fromCelluar, struct CellularStructure * toCelluar){
    
    
}


/////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////
void exchangingForMinDifferenceInSum(long long serialA[], long long serailB[], unsigned int length){
    
    int size = 2 * length ;
    //[0, lenght-1]  = true means elements in serialA in stack
    //[lenght, size-1]  = true means elements in serailB in stack
    bool flags[size];
    
    long long choosingIndex = 0;
    
    bool bestFlags[size];
    
    memset(flags, false, size);
    memset(bestFlags, false, size);
    
    int preDiff = differenceOnesMinusZero(serialA, serailB, length, flags);
    
    
    int bestCount = 1;
    
    recursionCompute(serialA, serailB, length, flags, choosingIndex, &preDiff, &bestCount, bestFlags);
    printFlags(size, bestFlags, preDiff, bestCount);
    
}

void recursionCompute(long long serialA[],
                      long long serailB[],
                      unsigned int length,
                      bool flags[],
                      long long choosingIndex,
                      int  * preDiff,
                      int  * bestCount,
                      bool bestFlags[]){
    
    int size = 2 * length;
    
    if (choosingIndex < size) {
        
        flags[choosingIndex] = true;
        choosingIndex++;
        
        if (!elementsPushedMoretThanOut(flags, size)  && elementsEvenlyDistributed(flags, size)) {
            
            int currDiff = differenceOnesMinusZero(serialA, serailB, length, flags);
            
            if (currDiff < *preDiff) {
                *preDiff = currDiff;
                *bestCount = 1;
                memcpy(bestFlags, flags, size);
            }else if (*preDiff == currDiff){
                
                if (flagsChanged(flags, bestFlags, size)) {
                    
                    (*bestCount)++;
                }
            }
        }
        
        recursionCompute(serialA, serailB, length, flags, choosingIndex, preDiff, bestCount, bestFlags);
        flags[choosingIndex-1] = 0;
        recursionCompute(serialA, serailB, length, flags, choosingIndex, preDiff, bestCount, bestFlags);
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////


void exchangingForMinDifferenceInSumPrintAll(long long serialA[], long long serailB[], unsigned int length){
    
    int size = 2 * length ;
    //[0, lenght-1]  = true means elements in serialA in stack
    //[lenght, size-1]  = true means elements in serailB in stack
    bool flags[size];
    
    long long choosingIndex = 0;
    
    bool bestFlags[size];
    
    memset(flags, false, size);
    memset(bestFlags, false, size);
    
    int preDiff = differenceOnesMinusZero(serialA, serailB, length, flags);
    
    int bestCount = 1;
    
    recursionComputeNonRecursion(serialA, serailB, length, flags, choosingIndex, &preDiff, &bestCount, bestFlags);
    printFlags(size, bestFlags, preDiff, bestCount);
}

void recursionComputeNonRecursion(long long serialA[],
                                  long long serailB[],
                                  unsigned int length,
                                  bool flags[],
                                  long long choosingIndex,
                                  int  * preDiff,
                                  int  * bestCount,
                                  bool bestFlags[]){
    
    int size = 2 * length;
    
    if (choosingIndex < size) {
        
        flags[choosingIndex] = true;
        if (!elementsPushedMoretThanOut(flags, size)  && elementsEvenlyDistributed(flags, size)) {
            
            int currDiff = differenceOnesMinusZero(serialA, serailB, length, flags);
            
            if (currDiff < *preDiff) {
                *preDiff = currDiff;
                *bestCount = 1;
                memcpy(bestFlags, flags, size);
                
                printFlags(size, flags, *preDiff, *bestCount);
            }else if (*preDiff == currDiff){
                
                if (flagsChanged(flags, bestFlags, size)) {
                    (*bestCount)++;
                    printFlags(size, flags, *preDiff, *bestCount);
                }
            }
        }
        recursionComputeNonRecursion(serialA, serailB, length, flags, choosingIndex+1, preDiff, bestCount, bestFlags);
        flags[choosingIndex] = 0;
        recursionComputeNonRecursion(serialA, serailB, length, flags, choosingIndex+1, preDiff, bestCount, bestFlags);
    }
    
}

///////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////

static inline bool flagsChangedAndNonReverse(bool flags[], bool bestFlag[], long long size){
    bool changed = false;
    for (int i = 0; i < size; i++) {
        if (flags[i] ^ bestFlag[i]) {
            changed = true;
        }
    }
    
    bool reverse = true;
    for (int i = 0; i < size; i++) {
        if (!flags[i] != bestFlag[i]) {
            reverse = false;
            break;
        }
    }
    return changed & !reverse;
}
static inline bool flagsChanged(bool flags[], bool bestFlag[], long long size){
    for (int i = 0; i < size; i++) {
        if (flags[i] ^ bestFlag[i]) {
            return true;
        }
    }
    return false;
}


static inline bool elementsEvenlyDistributed(bool flags[], long long size){
    int sumOfOnes = 0;
    for (int i = 0; i < size; i++) {
        if (flags[i]) {
            sumOfOnes++;
        }
    }
    if (sumOfOnes * 2 == size) {
        return true;
    }
    return false;
}
static inline bool elementsPushedMoretThanOut(bool flags[], long long size){
    int sumOfOnes = 0;
    for (int i = 0; i < size; i++) {
        if (flags[i]) {
            sumOfOnes++;
        }
    }
    if (sumOfOnes * 2 > size) {
        return true;
    }
    return false;
}


static inline int differenceOnesMinusZero(long long serialA[], long long serailB[], unsigned int length, bool flags[]){
    int sumOnes = 0;
    int sumZeros = 0;
    
    for (int i = 0; i < length; i++) {
        if (flags[i]) {
            sumOnes += serialA[i];
        }else{
            sumZeros += serialA[i];
        }
    }
    int size = length * 2;
    for (int i = length; i < size; i++) {
        if (flags[i]) {
            sumOnes += serailB[i-length];
        }else{
            sumZeros += serailB[i-length];
        }
    }
    return abs(sumOnes - sumZeros);
}


void printFlags(unsigned int size, bool flags[], int diff, int count){
    printf("\n");
    
    for (int i= 0; i < size / 2; i++) {
        printf("%d", flags[i]);
    }
    for (int i= size / 2; i < size ; i++) {
        printf("%d", flags[i]);
    }
    printf("---- diff = %d", diff);
    printf("---- count = %d", count);
    
}







@end



