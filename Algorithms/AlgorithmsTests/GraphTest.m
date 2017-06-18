//
//  GraphTest.m
//  Algorithms
//
//  Created by jufan wang on 15/6/2017.
//  Copyright © 2017 dudu. All rights reserved.
//

#import "GraphTest.h"


#import "AlgGraph.h"

@implementation GraphTest

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
    
    testShortestInPlane();
    
    testShortestInCube();
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

////////////////////////////////////////////////////////////////////////

void testShortestInPlane(){
//    planeNodesGenerate(100);
    planeNodesGenerate(1000);
    planeNodesGenerate(2000);
}


void testShortestInCube(){
    cubeNodesGenerate(2000);
//    cubeNodesGenerate(1000);
    cubeNodesGenerate(2000);
    cubeNodesGenerate(5000);
}

@end
