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
    
    [self performSelector:@selector(test) withObject:nil afterDelay:1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)test{
    
    [self matchedTest];
    [self sumOfAllPopSequenceTest];
    
}

-(void) matchedTest{
    
//    NSArray * push = [NSArray arrayWithObjects:@1, @2, @3, @4, @5, @6, @7, @8,  nil];
//    NSArray * pop = [NSArray arrayWithObjects:@3, @2, @1, @6, @7, @5, @8, @4,  nil];
//    
//    NSArray * push = [NSArray arrayWithObjects:@1, @2, @3, @4, @5, @6, @7, @8,  nil];
//    NSArray * pop = [NSArray arrayWithObjects:@3, @1, @2, @6, @7, @5, @8, @4,  nil];
    
    NSArray * push = [NSArray arrayWithObjects:@1, @2, @3, @4, @5, @6, @7, @8,  nil];
    NSArray * pop = [NSArray arrayWithObjects:@3, @2, @1, @5, @4, @8, @6, @7,  nil];
    
    BOOL matched = possibleMatchedPushPopSequence(push, pop);
    NSLog(@"matched = %d", matched);
}

-(void) sumOfAllPopSequenceTest{
    unsigned char count = 0;
    unsigned long long possible = 0;
    
    NSLog(@"===================");
    //    30 =  5 5534 0648 7704 8198   17
    //    35 =  311 6285 4949 0730 1262  19
    //    36  = 1195 9798 3858 6045 3492  20
    count = 30;//36溢出
//    possible = allPossiblePopOrderNumber_Obsolete(count, NO);
//    NSLog(@"element num = %hhu, possible = %lu",count, (unsigned long)possible);

    
}

@end


