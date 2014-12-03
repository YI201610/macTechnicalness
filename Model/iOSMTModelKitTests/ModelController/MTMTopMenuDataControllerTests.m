//
//  MTMTopMenuDataControllerTests.m
//  Model
//
//  Created by Yuji Imamura on 2014/12/02.
//
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "MTMTopMenuDataController.h"

/*!
 @abstract
 */
@interface MTMTopMenuDataControllerTests : XCTestCase {
    MTMTopMenuDataController* modelController;
}

@end

@implementation MTMTopMenuDataControllerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    /*!
     @comment   テストバンドルからリソース取得したい。
     */
    NSString* plistPath = [[NSBundle mainBundle] pathForResource:@"topMenu" ofType:@"plist"];
    modelController = [[MTMTopMenuDataController alloc] initWithPlistName:plistPath];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

/*!
 @abstract  Controllerは、
 */
- (void)testThatControllerCanLoadMenu
{
//    XCTAssertEqualObjects(<#expression1#>, <#expression2, ...#>)
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
