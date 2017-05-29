//
//  ViewController.m
//  Algorithms
//
//  Created by wangjufan on 17-5-27.
//  Copyright (c) 2017年 dudu. All rights reserved.
//

#import "ViewController.h"
#import "Stack.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /////////////////////////////////////////
//    NSArray * push = [NSArray arrayWithObjects:@1, @2, @3, @4, @5, @6, @7, @8,  nil];
//    NSArray * pop = [NSArray arrayWithObjects:@3, @2, @1, @6, @7, @5, @8, @4,  nil];
    
//    NSArray * push = [NSArray arrayWithObjects:@1, @2, @3, @4, @5, @6, @7, @8,  nil];
//    NSArray * pop = [NSArray arrayWithObjects:@3, @1, @2, @6, @7, @5, @8, @4,  nil];
    
    NSArray * push = [NSArray arrayWithObjects:@1, @2, @3, @4, @5, @6, @7, @8,  nil];
    NSArray * pop = [NSArray arrayWithObjects:@3, @2, @1, @5, @4, @8, @6, @7,  nil];

//    BOOL matched = possibleMatchedPushPopSequence(push, pop);
//    NSLog(@"matched = %d", matched);
    
    
    
    unsigned char count = 1;
    unsigned long long possible = allPossiblePopOrderNumber(count, YES);
    NSLog(@"count = %hhu, possible = %lu",count, (unsigned long)possible);
    
    count = 2;
    possible = allPossiblePopOrderNumber(count, YES);
    NSLog(@"count = %hhu, possible = %lu",count, (unsigned long)possible);
    count = 3;
    possible = allPossiblePopOrderNumber(count, YES);
    NSLog(@"count = %hhu, possible = %lu",count, (unsigned long)possible);
    count = 4;
    possible = allPossiblePopOrderNumber(count, YES);
    NSLog(@"count = %hhu, possible = %lu",count, (unsigned long)possible);


    count = 5;
    possible = allPossiblePopOrderNumber(count, YES);
    NSLog(@"count = %hhu, possible = %lu",count, (unsigned long)possible);
    count = 6;
    possible = allPossiblePopOrderNumber(count, YES);
    NSLog(@"count = %hhu, possible = %lu",count, (unsigned long)possible);
    count = 7;
    possible = allPossiblePopOrderNumber(count, YES);
    NSLog(@"count = %hhu, possible = %lu",count, (unsigned long)possible);
    
    
    count = 1;
    possible = allPossiblePopOrderNumber(count, NO);
    NSLog(@"count = %hhu, possible = %lu",count, (unsigned long)possible);
    count = 2;
    possible = allPossiblePopOrderNumber(count, NO);
    NSLog(@"count = %hhu, possible = %lu",count, (unsigned long)possible);
    count = 3;
    possible = allPossiblePopOrderNumber(count, NO);
    NSLog(@"count = %hhu, possible = %lu",count, (unsigned long)possible);
    count = 4;
    possible = allPossiblePopOrderNumber(count, NO);
    NSLog(@"count = %hhu, possible = %lu",count, (unsigned long)possible);
    
//    311 6285 4949 0730 1262
//     81 2944 0421 4973 0764
//     81 2944 0421 4973 0764
//
//    922 3372 0368 5477 5807
//    long long的最大值：9223372036854775807
//    long long的最小值：-9223372036854775808
    
//    840 8510 7643 2482 7156
//   1195 9798 3858 6045 3492

//    1844 6744 0737 0955 1615
//    1844 6744 0737 0955 1615
    
    count = 37;
    possible = allPossiblePopOrderNumber(count, NO);
    NSLog(@"count = %hhu, possible = %lu",count, (unsigned long)possible);
    
//    count = 51;
//    possible = allPossiblePopOrderNumber(count, NO);
//    NSLog(@"count = %hhu, possible = %lu",count, (unsigned long)possible);
//    count = 52;
//    possible = allPossiblePopOrderNumber(count, NO);
//    NSLog(@"count = %hhu, possible = %lu",count, (unsigned long)possible);
//    
//    count = 54;
//    possible = allPossiblePopOrderNumber(count, NO);
//    NSLog(@"count = %hhu, possible = %lu",count, (unsigned long)possible);
    
  

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
