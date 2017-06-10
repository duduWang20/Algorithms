//
//  CountTest.m
//  Algorithms
//
//  Created by wangjufan on 17-6-10.
//  Copyright (c) 2017年 dudu. All rights reserved.
//

#import "CountTest.h"

#import "AlgCount.h"

@implementation CountTest

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
    countOfOnes();
    
    possibleCompareCount();
    shortestPath();
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}



void countOfOnes(){
    unsigned long long from = 2;
    unsigned long long to = 1;
    
    printf("\n");
    printf("====================================");
    printf("\n");
    printf("1出现的次数");
    
    printf("\n");
    to = 123236;
    printf("from = %llu, to = %llu, count = %llu", from, to , countOfOneInRange(from, to));
    
    printf("\n");
    to = 20;
    printf("from = %llu, to = %llu, count = %llu", from, to , countOfOneInRange(from, to));
}

void possibleCompareCount(){
    unsigned int count = 0 ;
    unsigned int * possibilities = nubmerOfUsingBalanceForNumberOfBalls(3, &count);
    printf("\n");
    printf("====================================");
    printf("\n");
    printf("可能的比较次数");    printf("\n");
    for (int i = 0; i < count; i++) {
        printf("%4d", possibilities[i]);
    }
    free(possibilities);
    
    possibilities = nubmerOfUsingBalanceForNumberOfBalls(5745, &count);
    printf("\n");
    printf("可能的比较次数");
    printf("\n");
    for (int i = 0; i < count; i++) {
        printf("%4d", possibilities[i]);
    }
    free(possibilities);
    
    possibilities = nubmerOfUsingBalanceForNumberOfBalls(89564687, &count);
    printf("\n");
    printf("可能的比较次数");
    printf("\n");
    for (int i = 0; i < count; i++) {
        printf("%4d", possibilities[i]);
    }
    free(possibilities);
}


void  shortestPath(){
    unsigned int path[21] ={
        3,19,1,3,
        9,17,8,7,
        6,19,2,3,
        9,8,23,0,
        5,7,15,2,
        9};
    unsigned int pathLength = 21;
    unsigned int color[3] = {19,3,9};
    unsigned int length;
    unsigned int *outPath =shortestPathsForColorNumber(path, pathLength, color, 3, &length);
    printf("\n\n");
    printf("====================================");
    printf("\n");
    printf("最短颜色路径");
    printf("\n");
    for ( int i = 0; i < length; i++) {
        printf(" -%u= ", outPath[i]);
    }
    free(outPath);
    outPath = nil;
    printf("\n\n");
}


@end
