//
//  ViewController.m
//  Algorithms
//
//  Created by wangjufan on 17-5-27.
//  Copyright (c) 2017年 dudu. All rights reserved.
//

#import "ViewController.h"


#import "AlgStack.h"
#import "AlgCount.h"

#import "AlgPath.h"

#import "AlgString.h"

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
    
    generatingAllPossiblePopSequences(5);
    
//    [self matchedTest];
//    [self sumOfAllPopSequenceTest];
//    
//    [self countOfOnes];
//    
//    [self callPath];
    
}

-(void) matchedTest{
    
//    NSArray * push = [NSArray arrayWithObjects:@1, @2, @3, @4, @5, @6, @7, @8,  nil];
//    NSArray * pop = [NSArray arrayWithObjects:@3, @2, @1, @6, @7, @5, @8, @4,  nil];
//    
//    NSArray * push = [NSArray arrayWithObjects:@1, @2, @3, @4, @5, @6, @7, @8,  nil];
//    NSArray * pop = [NSArray arrayWithObjects:@3, @1, @2, @6, @7, @5, @8, @4,  nil];
    
    NSArray * push = [NSArray arrayWithObjects:@1, @2, @3, @4, @5, @6, @7, @8,  nil];
    NSArray * pop = [NSArray arrayWithObjects:@3, @2, @1, @5, @4, @8, @6, @7,  nil];
    
    BOOL matched = isReasonablePopSequenceForPushSequence(push, pop);
    NSLog(@"matched = %d", matched);
}

-(void) sumOfAllPopSequenceTest{
    unsigned char unpushed = 0;
    unsigned char pushed = 0;
    unsigned long long possible = 0;
    
    unpushed = 1;
    pushed = 0;
    possible = countOfAllPossiblePopSequences(unpushed, pushed);
    NSLog(@"element unpushed = %hhu, pushed = %hhu, possible = %lu",unpushed,pushed, (unsigned long)possible);
    
    unpushed = 2;
    pushed = 0;
    possible = countOfAllPossiblePopSequences(unpushed, pushed);
    NSLog(@"element unpushed = %hhu, pushed = %hhu, possible = %lu",unpushed,pushed, (unsigned long)possible);
    
    unpushed = 12;
     pushed = 4;
    possible = countOfAllPossiblePopSequences(unpushed, pushed);
    NSLog(@"element unpushed = %hhu, pushed = %hhu, possible = %lu",unpushed,pushed, (unsigned long)possible);
    
    unpushed = 13;
     pushed = 3;
    possible = countOfAllPossiblePopSequences(unpushed, pushed);
    NSLog(@"element unpushed = %hhu, pushed = %hhu, possible = %lu",unpushed,pushed, (unsigned long)possible);

    unpushed = 35;
    pushed = 0;
    possible = countOfAllPossiblePopSequences(unpushed, pushed);
    NSLog(@"element unpushed = %hhu, pushed = %hhu, possible = %lu",unpushed,pushed, (unsigned long)possible);
    
    unpushed = 36;
    pushed = 0;
    possible = countOfAllPossiblePopSequences(unpushed, pushed);
    NSLog(@"element unpushed = %hhu, pushed = %hhu, possible = %lu",unpushed,pushed, (unsigned long)possible);
    
    unpushed = 37;
    pushed = 0;
    possible = countOfAllPossiblePopSequences(unpushed, pushed);
    NSLog(@"element unpushed = %hhu, pushed = %hhu, possible = %lu",unpushed,pushed, (unsigned long)possible);
    
    
//    3116285494907301262
//    11959798385860453492
//    9057316177202639132

}

-(void) countOfOnes{
    unsigned long long from = 0;
    
    from = 10121041143;
    NSLog(@"%llu", countOfOneIn(from));
    
    from = 1;
    NSLog(@"%llu", countOfOneIn(from));
    
    from = 1113;
    NSLog(@"%llu", countOfOneIn(from));
    
    from = 1;
    unsigned long long to = 5;
    NSLog(@"%llu", countOfOneInRange(from, to));
    
    from = 1;
    to = 6;
    NSLog(@"%llu", countOfOneInRange(from, to));
    
    
    to = 101;
    NSLog(@"%llu", countOfOneInRange(from, to));
    

}


-(void)callPath{
    
    long long a[] = {100   ,99,    98, 1,   2  ,3,      4,5,     40, 1,  2  ,3};
    long long b[] = {1,2,    3,4, 5,40, 4,5 ,40,4, 5,40};
    
    
//    exchangingForMinDifferenceInSum(a, b, 12);
    exchangingForMinDifferenceInSumPrintAll(a, b, 12);
    
    
//    NSString * src = @"xcccxcccc4vc75fg4781c xcv  xvccv x22cv xcvxxv374183iul41m875137t41cg9fvgoix37fgj418cfxc748fpxcv1734812734";
//    NSString * des = @"ccvx";
//    
//    harmonyMatch([src UTF8String], [des UTF8String]);
//    
//    harmonyMatchInSourceRepeatable([src UTF8String], [des UTF8String]);
//    
//    
//    des = @"ccvx";
//    harmonyMatchInSourceRepeatable([src UTF8String], [des UTF8String]);

    
    
}



@end


