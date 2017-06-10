//
//  StackTest.m
//  Algorithms
//
//  Created by wangjufan on 17-6-10.
//  Copyright (c) 2017年 dudu. All rights reserved.
//

#import "StackTest.h"
#import "AlgStack.h"

@implementation StackTest



- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    matchedTest();
    sumOfAllPopSequenceTest();
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}


void matchedTest(){
    
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

void sumOfAllPopSequenceTest(){
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
    
    
}





@end
