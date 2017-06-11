//
//  ARed4Blue4.m
//  Red4Blue4
//
//  Created by wangjufan on 17-5-25.
//  Copyright (c) 2017年 dudu. All rights reserved.
//

#import "ARed4Blue4.h"

@implementation ARed4Blue4



+(void) getAllResolution{
    
    NSUInteger c2 = 0;
    NSUInteger b1 = 0;
    NSUInteger a0 = 0;
    
    while (c2 * 9 + b1 * 3 + a0 < 27) {
        
        NSInteger e_a0 = entropy(a0);
        NSInteger e_b1 = entropy(b1);
        NSInteger e_c2 = entropy(c2);
        
        NSUInteger e_a_see = e_b1 + e_c2;
        NSUInteger e_b_see = e_a0 + e_c2;
        NSUInteger e_c_see = e_a0 + e_b1;
        
        
        if (e_a_see > e_b_see && e_a_see > e_c_see
            && red(b1) + red(c2) >= 1 &&  red(c2) + red(a0) >= 1 && red(b1) + red(a0) >= 1
            &&  red(b1) + red(c2) <= 3 &&  red(c2) + red(a0) <= 3 && red(b1) + red(a0) <= 3
            && blue(b1) + blue(c2) >= 1 &&  blue(c2) + blue(a0) >= 1 && blue(b1) + blue(a0) >= 1
            &&  blue(b1) + blue(c2) <= 3 &&  blue(c2) + blue(a0) <= 3 && blue(b1) + blue(a0) <= 3
            ) {
            NSLog(@"=================");

            NSLog(@"c = %@", numberToPair(c2));
            NSLog(@"b = %@", numberToPair(b1));
            NSLog(@"a = %@", numberToPair(a0));
        
            NSLog(@"=================");

        }
        
        if (a0 == 2) {
            a0 = 0;
            if (b1 == 2) {
                b1 = 0;
                c2 += 1;
            }else{
                b1 += 1;
            }
        }else{
            a0 += 1;
        }
    }
}
//(r,b)   (1,1)-->0    (0,2)-->1  (2,0)-->2
NSUInteger entropy(NSUInteger s){
    switch (s) {
        case 0:{
            return 2;
            break;
        }
        case 1:{
            return 4;
            break;
        }
        case 2:{
            return 4;
            break;
        }
        default:
            break;
    }
    return -1;
}

//(r,b)   (1,1)-->0    (0,2)-->1  (2,0)-->2
NSUInteger blue(NSUInteger s){
    switch (s) {
        case 0:{
            return 1;
            break;
        }
        case 1:{
            return 2;
            break;
        }
        case 2:{
            return 0;
            break;
        }
        default:
            break;
    }
    return -1;
}

//(r,b)   (1,1)-->0    (0,2)-->1  (2,0)-->2
NSUInteger red(NSUInteger s){
    switch (s) {
        case 0:{
            return 1;
            break;
        }
        case 1:{
            return 0;
            break;
        }
        case 2:{
            return 2;
            break;
        }
        default:
            break;
    }
    return -1;
}

//(r,b)   (1,1)-->0    (0,2)-->1  (2,0)-->2
NSString* numberToPair(NSUInteger s){
    switch (s) {
        case 0:{
            return @"(1,1)";
            break;
        }
        case 1:{
            return @"(0,2)";
            break;
        }
        case 2:{
            return @"(2,0)";
            break;
        }
        default:
            break;
    }
    return nil;
}



@end
