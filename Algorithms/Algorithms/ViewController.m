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

    
    BOOL matched = possibleMatchedPushPopSequence(push, pop);
    NSLog(@"matched = %d", matched);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
