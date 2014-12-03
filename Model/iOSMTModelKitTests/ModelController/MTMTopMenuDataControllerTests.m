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
     @comment   テストバンドルから、テスト用のplistパスを求める
     */
    NSBundle* testBundle = [NSBundle bundleForClass:[self class]];
    NSString* plistPath = [testBundle pathForResource:@"topMenu" ofType:@"plist"];
    
    /*!
     @comment   テスト用plistから、オブジェクトを作成する。
     */
    modelController = [[MTMTopMenuDataController alloc] initWithPlistName:plistPath];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testThatControllerHasMenuSpec {
    XCTAssertTrue([modelController numberOfSection] > 0, @"複数のセクションをもつこと");
}

- (void) testThatControllerCanReturnSectionKeyString
{
    NSInteger countOfSection = [modelController numberOfSection];
    XCTAssertGreaterThan(countOfSection, 0, "必ず１つ以上のセクションをもつこと");

    for(int i = 0; i < countOfSection; i++){
        NSString* sectionNameString = [modelController sectionNameStringWithIndex:i];
        XCTAssertNotNil(sectionNameString, @"全てのセクションは名称をもつこと");
    }
}

/*!
 @abstract セクションが保持するアイテム数を返すこと
 */
- (void) testThatControllerCanReturnCountOfItemsInSection
{
    NSInteger countOfItem = [modelController numberOfItemForSection:]
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
