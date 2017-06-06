//
//  AlgCount.m
//  Algorithms
//
//  Created by wangjufan on 17-6-5.
//  Copyright (c) 2017年 dudu. All rights reserved.
//

#import "AlgCount.h"

@implementation AlgCount

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

@end
