//
//  osxAppLearning11Tests.m
//  osxAppLearning11Tests
//
//  Created by Yuji Imamura on 2014/06/30.
//  Copyright (c) 2014年 Yuji Imamura. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface osxAppLearning11Tests : XCTestCase

@end

@implementation osxAppLearning11Tests

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
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
