//
//  StringTest.m
//  Algorithms
//
//  Created by wangjufan on 17-6-10.
//  Copyright (c) 2017年 dudu. All rights reserved.
//

#import "StringTest.h"

#import "AlgString.h"

@implementation StringTest

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
    testString();
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}


void testString(){
    
    
    NSString * src = @"xcccxcccc4vc75fg4781c xcv  xvccv x22cv xcvxxv374183iul41m875137t41cg9fvgoix37fgj418cfxc748fpxcv1734812734";
    NSString * des = @"ccvx";
    
    harmonyMatch([src UTF8String], [des UTF8String]);
    
    harmonyMatchInSourceRepeatable([src UTF8String], [des UTF8String]);
    
    
    des = @"ccvx";
    harmonyMatchInSourceRepeatable([src UTF8String], [des UTF8String]);
    
    
}

@end
