//
//  Stack.m
//  Algorithms
//
//  Created by wangjufan on 17-5-27.
//  Copyright (c) 2017年 dudu. All rights reserved.
//

#import "Stack.h"

@implementation Stack


//////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////
BOOL possibleMatchedPushPopSequence(NSArray * pushSequence, NSArray * popSequence){
    
    BOOL matched = YES;
    int indexPush = 0;
    
    NSUInteger size = [popSequence count];
    
    NSMutableArray * marks = [NSMutableArray arrayWithCapacity:size];
    for (int i= 0; i<size; i++) {
        [marks insertObject:[NSNumber numberWithBool:NO] atIndex:i];
    }
    
    for (int index = 0; (index<size) && matched; index++) {
        NSUInteger popValue = [[popSequence objectAtIndex:index] integerValue];
        
        //move to previous unmarked position
        while (indexPush > 0) {
            if ([[marks objectAtIndex:indexPush] boolValue]) {
                indexPush--;
            }else{
                break;
            }
        }
        
        while (matched) {
            
            //move to the back unmarked position
            while ([[marks objectAtIndex:indexPush] boolValue]) {
                indexPush++;
                if (indexPush==size) {
                    matched = NO;
                    break;
                }
            }
            
            if (matched) {
                NSUInteger pushValue = [[pushSequence objectAtIndex:indexPush] integerValue];
                if (pushValue == popValue) {
                    [marks replaceObjectAtIndex:indexPush withObject:[NSNumber numberWithBool:YES]];
                    break;
                }else{
                    indexPush++;
                    if (indexPush ==size) {
                        matched = NO;
                        break;
                    }
                }
            }
            
        }
    }
    
    return matched;
}


//////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////

NSUInteger allPossiblePushPopNumber(NSUInteger unpushed, NSUInteger pushed){
    NSUInteger count = 0;
    if (pushed == 0) {
        if (unpushed>1) {
            count += allPossiblePushPopNumber(unpushed-1, 1);
        }else{
            count += 1;
        }
    }else{
        for (int i=0; i<= pushed ; i++) {
            if (unpushed > 1) {
                count += allPossiblePushPopNumber(unpushed-1, i+1);
            }else{
                count+=1;
            }
            
        }
    }
    return count;
}


//////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////

void allPossibleMatchedPopSequence(NSUInteger n){
    
    NSMutableArray * sequence = [NSMutableArray arrayWithCapacity:n];
    for (NSUInteger i= 0; i<n; i++) {
        [sequence insertObject:[NSNumber numberWithUnsignedInteger:i] atIndex:i];
    }
    
}


@end



