//
//  ViewController.m
//  Algorithms
//
//  Created by wangjufan on 17-5-27.
//  Copyright (c) 2017年 dudu. All rights reserved.
//

#import "ViewController.h"

#include "AlgTree.h"

@interface ViewController ()

@end

@implementation ViewController

//@synthesize foo;

@synthesize array = _array;

+(void) sdfsfsfs{
    
    NSLog(@"%@", NSStringFromClass([self class]));
    NSLog(@"%@", NSStringFromClass([super class]));
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"%@", NSStringFromClass([self class]));
    NSLog(@"%@", NSStringFromClass([super class]));
    
    self.array = [NSMutableArray arrayWithObjects:[NSObject new], [NSObject new], nil ];
    [self.array removeObjectAtIndex:0];
    
    _foo2 = @"sdfsdf";
    
    [self setValue:@"23" forKey:@"_foo2"];
    [self setValue:@"23" forKey:@"foo2"];
    
    
    [ViewController sdfsfsfs];

    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"%@", NSStringFromClass([self class]));

    });
    
    
    createAndTraversal(332);
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


