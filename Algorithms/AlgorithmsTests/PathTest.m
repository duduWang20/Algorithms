//
//  PathTest.m
//  Algorithms
//
//  Created by wangjufan on 17-6-10.
//  Copyright (c) 2017年 dudu. All rights reserved.
//

#import "PathTest.h"


#import "AlgPath.h"

@implementation PathTest

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
    
    callPath();
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}


void callPath(){
    
    long long a[] = {100   ,99,    98, 1,   2  ,3,      4,5,     40, 1,  2  ,3};
    long long b[] = {1,2,    3,4, 5,40, 4,5 ,40,4, 5,40};
    exchangingForMinDifferenceInSumPrintAll(a, b, 12);
    
}


@end



