//
//  ViewController.m
//  Algorithms
//
//  Created by wangjufan on 17-5-27.
//  Copyright (c) 2017年 dudu. All rights reserved.
//

#import "ViewController.h"

//#include "AlgTree.h"


@interface ViewController ()

@end

@implementation ViewController

//@synthesize foo;

@synthesize array = _array;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"%@", NSStringFromClass([self class]));
    NSLog(@"%@", NSStringFromClass([super class]));
    
    self.array = [NSMutableArray arrayWithObjects:[NSObject new], [NSObject new], nil ];
    [self.array removeObjectAtIndex:0];
    
//    
//    NSLog(@"The size of an int is: %lu bytes.",sizeof(int));
//    NSLog(@"The size of an int is: %lu bytes.",sizeof(NSInteger));
//    NSLog(@"The size of a short int is: %lu bytes.",sizeof(short int));
//    NSLog(@"The size of a long int is: %lu bytes.",sizeof(long int));
//    NSLog(@"The size of a float is: %lu bytes.",sizeof(float));
//    NSLog(@"The size of a double is: %lu bytes.",sizeof(double));
//    
//    NSLog(@"The size of a char is: %lu bytes.",sizeof(char));
//    NSLog(@"The size of a bool is: %lu bytes.",sizeof(bool));
//    
//    BOOL B =nil;
//    NSLog(@"The size of a bool is: %lu bytes.",sizeof(BOOL));
//    NSLog(@"The size of a bool is: %@.",B);
//
//    Boolean lean = 'a';
//    NSLog(@"The size of a bool is: %lu bytes.",sizeof(Boolean));
//    NSLog(@"The size of a bool is: %c.",lean);
    
//    createAndTraversal(332);
    
}


-(void) setArray:(NSMutableArray *)array{
    _array = [NSMutableArray arrayWithArray:array];
}

-(NSMutableArray *) array{
    return _array;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}


//- (id)copyWithZone:(NSZone *)zone {
//    CYLUser *copy = [[[self class] allocWithZone:zone]
//                     initWithName:_name
//                     age:_age
//                     sex:_sex];
//    copy->_friends = [_friends mutableCopy];
//    return copy;
//}
//
//- (id)deepCopy {
//    CYLUser *copy = [[[self class] alloc]
//                     initWithName:_name
//                     age:_age
//                     sex:_sex];
//    copy->_friends = [[NSMutableSet alloc] initWithSet:_friends
//                                             copyItems:YES];
//    return copy;
//}
//

@end


