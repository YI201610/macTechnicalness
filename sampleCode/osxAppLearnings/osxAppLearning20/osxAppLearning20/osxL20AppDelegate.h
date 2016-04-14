//
//  AppDelegate.h
//  osxAppLearning20
//
//  Created by Yuji Imamura on 2014/09/06.
//  Copyright (c) 2014年 Yuji Imamura. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#pragma mark - Interface and Protocols

@interface osxL20AppDelegate : NSObject
<NSApplicationDelegate, NSPopoverDelegate, NSTableViewDataSource>
{

#pragma mark - Instance Variables

    NSMutableArray* _contactsArray;     //The data source
    
    NSString* _dataFilePathString;
}





#pragma mark - Properties and Outlets

@property (weak) IBOutlet NSWindow *window;

/*!
 @abstract  main window内部のテーブルView
 */
@property (weak) IBOutlet NSTableView *appTable;

/*!
 @abstract  入力のポップオーバー
 */
@property (weak) IBOutlet NSPopover *inputPopover;

/*!
 @abstract  popOver内部のテキストフィールドオブジェクト
 */
@property (weak) IBOutlet NSTextField *popOverNameTextField;
@property (weak) IBOutlet NSTextField *popOverContactInfoTextField;


#pragma mark - Method Declalations

/*!
 * @abstract    データパスをチェックする。また、データパスをセットアップする。
 */
- (BOOL) checkDataPath;

/*!
 * @abstract    データをファイルに保存する。
 */
- (void) saveDataFile;

/*!
 * @abstract    アプリケーションが取り扱う連絡先情報を作成する。
 */
- (NSDictionary*) recordDictionaryWithName:(NSString*) name
                                      info:(NSString*) contactInfoString;


@end

