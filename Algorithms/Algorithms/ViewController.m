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
    
//    NSArray * push = [NSArray arrayWithObjects:@1, @2, @3, @4, @5, @6, @7, @8,  nil];
//    NSArray * pop = [NSArray arrayWithObjects:@3, @2, @1, @6, @7, @5, @8, @4,  nil];
    
//    NSArray * push = [NSArray arrayWithObjects:@1, @2, @3, @4, @5, @6, @7, @8,  nil];
//    NSArray * pop = [NSArray arrayWithObjects:@3, @1, @2, @6, @7, @5, @8, @4,  nil];
    
    NSArray * push = [NSArray arrayWithObjects:@1, @2, @3, @4, @5, @6, @7, @8,  nil];
    NSArray * pop = [NSArray arrayWithObjects:@3, @2, @1, @5, @4, @8, @6, @7,  nil];

    
//    BOOL matched = possibleMatchedPushPopSequence(push, pop);
//    NSLog(@"matched = %d", matched);
    
    NSUInteger count = 1;
    NSUInteger possible = allPossiblePushPopNumber(count, 0);
    NSLog(@"count = %lu, possible = %lu",count, (unsigned long)possible);
    
    count = 2;
    possible = allPossiblePushPopNumber(count, 0);
    NSLog(@"count = %lu, possible = %lu",count, (unsigned long)possible);
    
    count = 3;
    possible = allPossiblePushPopNumber(count, 0);
    NSLog(@"count = %lu, possible = %lu",count, (unsigned long)possible);
    
    count = 4;
    possible = allPossiblePushPopNumber(count, 0);
    NSLog(@"count = %lu, possible = %lu",count, (unsigned long)possible);


    count = 5;
    possible = allPossiblePushPopNumber(count, 0);
    NSLog(@"count = %lu, possible = %lu",count, (unsigned long)possible);
    
    count = 6;
    possible = allPossiblePushPopNumber(count, 0);
    NSLog(@"count = %lu, possible = %lu",count, (unsigned long)possible);
    
    count = 7;
    possible = allPossiblePushPopNumber(count, 0);
    NSLog(@"count = %lu, possible = %lu",count, (unsigned long)possible);
    
    count = 10;
    possible = allPossiblePushPopNumber(count, 0);
    NSLog(@"count = %lu, possible = %lu",count, (unsigned long)possible);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
