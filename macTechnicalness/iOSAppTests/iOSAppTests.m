//
//  iOSAppTests.m
//  iOSAppTests
//
//  Created by Yuji Imamura on 2014/12/01.
//
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

/*!
 @abstract  以下のテストを網羅する予定
 
 ・ホワイトボックステスト
 ・ブラックボックステスト
 ・同値クラステスト
 ・境界値テスト
 ・デシジョンテーブルテスト
 ・状態遷移テスト
 ・組み合わせテスト
 
 */
@interface iOSAppTests : XCTestCase

@end

@implementation iOSAppTests

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
