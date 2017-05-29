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

unsigned long long allPossiblePopOrderNumber(unsigned char elementNum, BOOL recursion){
    if (elementNum>=37) {
        NSLog(@"最大可输入36个元素的序列");
        return -1;
    }
    
    if (recursion) {
        return allPossiblePopOrderNumber_Recursion(elementNum,0);
    }
    return allPossiblePopOrderNumber_NonRecursion(elementNum);
}


unsigned long long allPossiblePopOrderNumber_Recursion(unsigned char unpushed, NSUInteger pushed){
    unsigned long long count = 0;
    
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


unsigned char biggestUnsignedLongLongForNthPower(unsigned char base){
    unsigned long long count = 0;
    unsigned long long pre = 0;
    count = base;
    
    unsigned char number = 0;
    
    while (count > pre) {
        pre = count;
        count *= base;
        number++;
    }
    
    return number;
    
}


static inline NSString * keyFor(NSUInteger pushed){
    return [NSString stringWithFormat:@"%lu",(unsigned long)pushed];
}

unsigned long long allPossiblePopOrderNumber_NonRecursion(unsigned char elementNum){
    
    NSMutableDictionary * currentCeos = [NSMutableDictionary dictionaryWithCapacity:0];
    NSMutableArray * currentKeys = [NSMutableArray arrayWithCapacity:0];
    
    NSMutableDictionary * nextCeos = [NSMutableDictionary dictionaryWithCapacity:0];
    NSMutableArray * nextKeys = [NSMutableArray arrayWithCapacity:0];
    
    NSUInteger unpushed = elementNum;
    NSUInteger pushed = 0; //key
    [nextKeys addObject:keyFor(pushed)];
    [nextCeos setObject:[NSNumber numberWithUnsignedLongLong:1] forKey:keyFor(pushed)];
   
    
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
        NSUInteger ceo = [[currentCeos objectForKey:keyFor(pushed)] unsignedLongLongValue];
        [currentCeos removeObjectForKey:keyFor(pushed)];
        
        
        for (int i = 1; i<= pushed+1; i++) {
            
            NSString * key = keyFor(i);
            if ([nextKeys count] < i) {
                [nextKeys insertObject:key atIndex:i-1];
            }
            
            NSUInteger nextCeo = 0;
            if ([nextCeos objectForKey:key]) {
                nextCeo += [[nextCeos objectForKey:key] unsignedLongLongValue];
            }
            nextCeo += ceo;
            [nextCeos setObject:[NSNumber numberWithUnsignedLongLong:nextCeo] forKey:key];
        }
        
    }
    
    unsigned long long count = 0;  //sum of (key+1)* coe
    unsigned long long pre = 0;
    NSLog(@"%@", nextCeos);
    for (NSString * key in nextKeys) {
        unsigned long long value = [[nextCeos objectForKey:key] unsignedLongLongValue];
        NSUInteger keyValue = [key longLongValue] + 1;
        count += keyValue * value;
        if (pre > count) {
            NSLog(@"-overflow--pre : %lld", pre);
            NSLog(@"--overflow-count: %lld", count);
        }
        pre = count;
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



