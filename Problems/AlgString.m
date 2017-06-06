//
//  AlgString.m
//  Algorithms
//
//  Created by wangjufan on 17-6-1.
//  Copyright (c) 2017年 dudu. All rights reserved.
//

#import "AlgString.h"

@implementation AlgString

////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////

void harmonyMatch(const char *source, const char *destination){
    
    const int tableSize = 256;
    
    int desHashTable[tableSize];
    for(int i = 0; i < tableSize; i++){
        desHashTable[i] = 0;
    }
    size_t desLen = strlen(destination);
    for(int i = 0; i < desLen; i++){
        desHashTable[destination[i]] += 1;
    }
    
    //only one char in des
    size_t srcLen = strlen(source);
    if (srcLen == 1){
        for(int i = 0; i < srcLen; i++)
        {
            if(desHashTable[source[i]] != 0){
                printf("postion = %d, value = %c", i,source[i]);
            }
        }
        return;
    }
    
    //more than one char in des
    int srcHashTable[tableSize];
    for(int i = 0; i < tableSize; i++){
        srcHashTable[i] = 0;
    }
    
    int sumOfOccurence = 0;
    int startPostion = -1;
    for(int i = 0; i < srcLen; i++)
    {
        char current = source[i];
        
        if(desHashTable[current] != 0){
            
            srcHashTable[current] += 1;
            sumOfOccurence++;
            if (startPostion == -1) {
                startPostion = i;
            }
            
            if (sumOfOccurence == desLen) {
                //mathed or not
                
                if ( matched(source, srcHashTable, desHashTable, startPostion, i) ) {
                    
                    //print from startPostion to i;
                    
                    printf("\nfrom postion = %d, to postion %d ,", startPostion ,i);
                    printf("value = ");
                    for (int index = startPostion; index <= i; index++) {
                        printf("%c", source[index]);
                    }
                    
                    //set startPostion to -1
                    //set sumOfOccurence to 0
                    for (int index = startPostion; index <= i; index++) {
                        char ch = source[index];
                        srcHashTable[ch] = 0;
                    }
                    startPostion = -1;
                    sumOfOccurence = 0;
                    
                }else{
                    
                    //move the startPostion to next char occurent in destination
                    //set sumOfOccurence = sumOfOccurence - 1
                    
                    srcHashTable[source[startPostion]] -= 1;
                    
                    for (int index = startPostion+1; index <= i; index++) {
                        
                        char ch = source[index];
                        int srcCount = srcHashTable[ch];

                        if (srcCount > 0) {
                            startPostion = index;
                            sumOfOccurence--;
                            break;
                        }
                    }
                }
            }
        }
    }
}
static inline bool matched(const char *source,
             int srcHashTable[],
             int destHashTable[],
             int startPostion,
             int endPosition){
    for (int index = startPostion; index <= endPosition; index++) {
        char ch = source[index];
        int srcCount = srcHashTable[ch];
        int desCount = destHashTable[ch];
        if (srcCount > 0 && srcCount != desCount) {
            return false;
        }
    }
    return true;
}

////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////

void harmonyMatchInSourceRepeatable(const char *source, const char *destination){
    
    const int tableSize = 256;
    
    int desHashTable[tableSize];
    for(int i = 0; i < tableSize; i++){
        desHashTable[i] = 0;
    }
    size_t desLen = strlen(destination);
    for(int i = 0; i < desLen; i++){
        desHashTable[destination[i]] += 1;
    }
    
    //only one char in des
    size_t srcLen = strlen(source);
    if (srcLen == 1){
        for(int i = 0; i < srcLen; i++)
        {
            if(desHashTable[source[i]] != 0){
                printf("postion = %d, value = %c", i,source[i]);
            }
        }
        return;
    }
    
    
    //more than one char in des
    int srcHashTable[tableSize];
    for(int i = 0; i < tableSize; i++){
        srcHashTable[i] = 0;
    }
    
    int sumOfOccurence = 0;
    int startPostion = -1;
    for(int i = 0; i < srcLen; i++)
    {
        char current = source[i];
        
        if(desHashTable[current] != 0){
            
            srcHashTable[current] += 1;
            sumOfOccurence++;
            if (startPostion == -1) {
                startPostion = i;
            }
            
            if (sumOfOccurence >= desLen) {
                //mathed or not
                
                if ( matchedSourceRepeatable(destination, srcHashTable, desHashTable, startPostion, i) ) {
                    
                    //print from startPostion to i;
                    printf("\nfrom postion = %d, to postion %d ,", startPostion ,i);
                    printf("value = ");
                    for (int index = startPostion; index <= i; index++) {
                        printf("%c", source[index]);
                    }
                    
                    //set startPostion to -1
                    //set sumOfOccurence to 0
                    
                    for (int index = startPostion; index <= i; index++) {
                        char ch = source[index];
                        srcHashTable[ch] = 0;
                    }
                    
                    startPostion = -1;
                    sumOfOccurence = 0;
                }
            }
            
        }
    }
}
static inline bool matchedSourceRepeatable(const char *destination,
                                    int srcHashTable[],
                                    int destHashTable[],
                                    int startPostion,
                                    int endPosition){
    for (int index = 0; index < strlen(destination); index++) {
        char ch = destination[index];
        int srcCount = srcHashTable[ch];
        int desCount = destHashTable[ch];
        if (srcCount < desCount) {
            return false;
        }
    }
    return true;
}


@end





