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

NSUInteger allPossiblePopOrderNumber(NSUInteger elementNum, BOOL recursion){
    if (recursion) {
        return allPossiblePopOrderNumber_Recursion(elementNum,0);
    }
    return allPossiblePopOrderNumber_NonRecursion(elementNum);
}


NSUInteger allPossiblePopOrderNumber_Recursion(NSUInteger unpushed, NSUInteger pushed){
    NSUInteger count = 0;
    
//    if (pushed == 0) {
//        if (unpushed>1) {
//            count += allPossiblePushPopNumber(unpushed-1, 1);
//        }else{
//            count += 1;
//        }
//    }else{
//        for (int i=0; i<= pushed ; i++) {
//            if (unpushed > 1) {
//                count += allPossiblePushPopNumber(unpushed-1, i+1);
//            }else{
//                count+=1;
//            }
//            
//        }
//    }
//    等价于
//    for (int i=0; i<= pushed ; i++) {
//        if (unpushed > 1) {
//            count += allPossiblePushPopNumber(unpushed-1, i+1);
//        }else{
//            count+=1;
//        }
//        
//    }
//    等价于
//    for (int i=0; i<= pushed ; i++) {
//        if (unpushed == 1) {
//            count+=1;
//        }
//    }
//    for (int i=0; i<= pushed ; i++) {
//        if (unpushed > 1) {
//            count += allPossiblePushPopNumber(unpushed-1, i+1);
//        }
//    }
//    等价于
//    if (unpushed == 1) {
//        for (int i=0; i<= pushed ; i++) {
//            count+=1;
//        }
//    }
//    if (unpushed > 1) {
//        for (int i=0; i<= pushed ; i++) {
//            count += allPossiblePushPopNumber(unpushed-1, i+1);
//        }
//    }
//    等价于
//    if (unpushed == 1) {
//        return pushed+1;
//    }
//    if (unpushed > 1) {
//        for (int i=0; i<= pushed ; i++) {
//            count += allPossiblePushPopNumber(unpushed-1, i+1);
//        }
//    }
//    等价于
    if (unpushed == 1) {
        count = pushed+1;
    }
    if (unpushed > 1) {
        for (int i=0; i<= pushed ; i++) {
            count += allPossiblePopOrderNumber_Recursion(unpushed-1, i+1);
        }
    }
    
    return count;
}


 NSString * keyFor(NSUInteger pushed){
    return [NSString stringWithFormat:@"%lu",(unsigned long)pushed];
}

NSUInteger allPossiblePopOrderNumber_NonRecursion(NSUInteger elementNum){
    
    NSMutableDictionary * currentCeos = [NSMutableDictionary dictionaryWithCapacity:0];
    NSMutableArray * currentKeys = [NSMutableArray arrayWithCapacity:0];
    
    NSMutableDictionary * nextCeos = [NSMutableDictionary dictionaryWithCapacity:0];
    NSMutableArray * nextKeys = [NSMutableArray arrayWithCapacity:0];
    
    NSUInteger unpushed = elementNum;
    NSUInteger pushed = 0; //key
    [nextKeys addObject:keyFor(pushed)];
    [nextCeos setObject:[NSNumber numberWithUnsignedInteger:1] forKey:keyFor(pushed)];
   
    
    while (unpushed > 1 || [currentKeys count] > 0) {
        if ([currentKeys count] == 0) {
            currentKeys = nextKeys;
            nextKeys = [NSMutableArray arrayWithCapacity:elementNum];
            currentCeos = nextCeos;
            nextCeos = [NSMutableDictionary dictionaryWithCapacity:elementNum];
            unpushed -= 1;
        }
        
        pushed = [[currentKeys objectAtIndex:0] intValue];
        [currentKeys removeObjectAtIndex:0];
        NSUInteger ceo = [[currentCeos objectForKey:keyFor(pushed)] unsignedIntegerValue];
        [currentCeos removeObjectForKey:keyFor(pushed)];
        
        
        for (int i = 1; i<= pushed+1; i++) {
            
            NSString * key = keyFor(i);
            if ([nextKeys count] < i) {
                [nextKeys insertObject:key atIndex:i-1];
            }
            
            NSUInteger nextCeo = 0;
            if ([nextCeos objectForKey:key]) {
                nextCeo += [[nextCeos objectForKey:key] unsignedIntegerValue];
            }
            nextCeo += ceo;
            [nextCeos setObject:[NSNumber numberWithUnsignedInteger:nextCeo] forKey:key];
        }
        
    }
    
    NSUInteger count = 0;  //sum of (key+1)* coe
    for (NSString * key in nextKeys) {
        NSUInteger value = [[nextCeos objectForKey:key] longLongValue];
        NSUInteger keyValue = [key longLongValue] + 1;
        count += keyValue * value;
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



