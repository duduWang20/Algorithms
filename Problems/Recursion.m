//
//  Recursion.m
//  Recursion
//
//  Created by wangjufan on 17-5-25.
//  Copyright (c) 2017年 dudu. All rights reserved.
//

#import "Recursion.h"


@implementation Recursion


NSUInteger recursionJumpNum(NSUInteger steps){
    if (steps == 1) {
        return 1;
    }
    if (steps == 2) {
        return 2;
    }
    return recursionJumpNum(steps-1) + recursionJumpNum(steps - 2);
}


//NSUInteger recursionJumpNum(NSUInteger steps){
//    NSUInteger count = 0;
//    if (steps == 1) {
//        count =  1;
//    }else if (steps == 2) {
//        count = 2;
//    }else if (steps > 2) {
//        NSUInteger num1 = nonrecursionJumpNum(steps - 1);
//        NSUInteger num2 = nonrecursionJumpNum(steps - 2);
//        count = num1 + num2;
//    }
//    return count;
//}



NSUInteger nonrecursionJumpNum(const NSUInteger steps){
    NSUInteger index = 1;
    NSUInteger count = 0;
    NSUInteger count_minus_one = 0;
    NSUInteger count_minus_two = 0;
    
    while (index <= steps) {
        if (index > 2) {
            count_minus_two = count_minus_one;
            count_minus_one = count;
            count = count_minus_one + count_minus_two;
        }else if (index == 1) {
            count = 1;
        }else if (index == 2) {
            count_minus_one = count;
            count = 2;
        }
        index++;
    }
    return count;
}

//NSUInteger nonrecursionJumpNum(const NSUInteger steps){
//    NSUInteger index = 1;
//    NSUInteger count = 0;
//    NSUInteger count_minus_one = 0;
//    NSUInteger count_minus_two = 0;
//    
//    while (index <= steps) {
//        if (index == 1) {
//            count =  1;
//        }else if (index == 2) {
//            count_minus_one = count;
//            count = 2;
//        }else if (index > 2) {
//            count_minus_two = count_minus_one;
//            count_minus_one = count;
//            count = count_minus_one + count_minus_two;
//        }
//        index++;
//    }
//    return count;
//}




@end


