//
//  AppDelegate.m
//  osxAppLearning20
//
//  Created by Yuji Imamura on 2014/09/06.
//  Copyright (c) 2014年 Yuji Imamura. All rights reserved.
//

#import "osxL20AppDelegate.h"
#import "CommonHeader.h"

@implementation osxL20AppDelegate

#pragma mark - Application Delegates

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

/*!
 @abstract  アプリケーションが終了する直前
 */
- (void)applicationWillTerminate:(NSNotification *)aNotification {
    _methodname_;
    
    // Insert code here to tear down your application
    [self saveDataFile];
}

/*!
 @abstract  ユーザーが、異なるアプリケーションに、操作を移動した
 */
- (void)applicationDidResignActive:(NSNotification *)notification
{
    _methodname_;
    [self saveDataFile];
}

/*!
 @abstract terminate application when the red button selected.
 */
- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender
{
    _methodname_;
    
    return YES;
}


- (void) awakeFromNib
{
    _methodname_;
    
    if([self checkDataPath] == YES){
        
        /*
         @comment   データが存在する場合、データパスからデータ配列を作成します。
         */
        _contactsArray = [NSMutableArray arrayWithContentsOfFile:_dataFilePathString];
    }else{
        _contactsArray = [NSMutableArray new];
    }
    
    /*
     @comment   このサンプルでは、簡潔のため、このクラスがTableViewDataSourceのデリゲート処理を担います。
     */
    [_appTable setDataSource:self];
    
}


#pragma mark - Button IBActions


/*!
 * @abstract    新データ登録用のpopoverを表示する
 */
- (IBAction)didSelectAddContactButton:(NSButton *)sender {
    _methodname_;

    //
    [_inputPopover showRelativeToRect:sender.bounds
                               ofView:sender
                        preferredEdge:NSMaxYEdge];
}

/*!
 @abstract  連絡先削除ボタン
 */
- (IBAction)didSelectDeleteContactButton:(NSButton *)sender {
    _methodname_;
    
    
    NSAlert* alert = [NSAlert alertWithMessageText:@"連絡先情報を削除しますか？"
                                     defaultButton:@"Cancel"
                                   alternateButton:@"Delete"
                                       otherButton:nil
                         informativeTextWithFormat:@"削除すると、連絡先情報は、永遠に削除されます。"];
    NSInteger returnCode = [alert runModal];
    debugout(@"returnCode: %ld", returnCode);
    
    if(returnCode == NSAlertAlternateReturn){
        
        /*
         @comment   現在、テーブルにて、選択されている行の連絡先情報を削除する。
         */
        [_contactsArray removeObjectAtIndex:_appTable.selectedRow];
        
        /*!
         @comment
         */
        [_appTable reloadData];
    }
    
}

/*!
 @abstract  ポップオーバーの連絡先追加ボタン
 */
- (IBAction)didSelectPopoverAddButton:(NSButton *)sender {
    _methodname_;
    
    [_inputPopover close];
}



#pragma mark - Table View Data Source Delegates

/*!
 @abstract
 */
-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    return _contactsArray.count;
}

/*!
 @abstract  NSTableViewDataSource独自のデリゲート処理。
 */
- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    /*
     @comment   データ配列から、行の要素を抽出。[＜番号＞]で配列から要素を抽出。
     */
    NSDictionary* contact = _contactsArray[row];
 
    /*
     @comment   要素から、データを抽出。
                下記の表現を使用する為に、InterfaceBuilderでオブジェクトのプロパティに然るべき値を設定しておくこと。
     */
    NSString* idString = tableColumn.identifier;
//    debugout(@"-idString: %@", idString);
    id obj = [contact valueForKey: idString];

    /*
     @comment   データを返却
     */
    return obj;
}


/*!
 @abstract  TableViewのCellを直接編集する時、このメソッドが呼ばれる。
 NOTE: This method is not called for the View Based TableView.
 
 -> このサンプルでは、CellベースのTableViewを使用している。よって、呼ばれる。
 */
- (void)tableView:(NSTableView *)tableView
   setObjectValue:(id)object
   forTableColumn:(NSTableColumn *)tableColumn
              row:(NSInteger)row
{
    _methodname_;

    /*
     @comment   データ配列から、行の要素を抽出。[＜番号＞]で配列から要素を抽出。
     */
    NSDictionary* contact = _contactsArray[row];
    
    /*
     @comment   要素から、データを抽出。
     下記の表現を使用する為に、InterfaceBuilderでオブジェクトのプロパティに然るべき値を設定しておくこと。
     */
    NSString* idString = tableColumn.identifier;
    debugout(@"*idString: %@", idString);

    /*
     @comment   object: 変更されたデータ
     */
    [contact setValue:object forKey:idString];

}

/*!
 @abstract
 */
- (void)tableView:(NSTableView *)tableView sortDescriptorsDidChange:(NSArray *)oldDescriptors
{
    _methodname_;
    
    debugout(@"oldDescriptors: %@", oldDescriptors);
    
    /*
     @comment
     */
    NSArray* sortDiscriptors = [_appTable sortDescriptors];
    debugout(@"sortDiscriptors: %@", sortDiscriptors);
 
    /*
     @comment   メモリ上の連絡先情報をソートする。
     */
    [_contactsArray sortUsingDescriptors:sortDiscriptors];
    
    
    /*
     @comment
     */
    [_appTable reloadData];
}

#pragma mark - Popover Delegate Methods

- (BOOL)popoverShouldClose:(NSPopover *)popover
{
    _methodname_;
    return YES;
}

- (void)popoverWillShow:(NSNotification *)notification
{
    _methodname_;
    
    /*!
     @comment ポップオーバーの入力欄を初期化する。
     */
    _popOverNameTextField.stringValue = @"";
    _popOverContactInfoTextField.stringValue = @"";
}

/*!
 @abstract
 */
- (void)popoverDidShow:(NSNotification *)notification
{
    _methodname_;
}

/*!
 @abstract  サンプルでは、このタイミングで、連絡先情報を登録する。
 */
- (void)popoverWillClose:(NSNotification *)notification
{
    _methodname_;
    
    if(![_popOverNameTextField.stringValue isEqualToString:@""] &&
       ![_popOverContactInfoTextField.stringValue isEqualToString:@""])
    {
        /*
         @comment
         */
        NSDictionary* addRecord = [self recordDictionaryWithName:_popOverNameTextField.stringValue
                                                            info:_popOverContactInfoTextField.stringValue];
        
        /*
         @comment
         */
        [_contactsArray addObject:addRecord];
        
        /*
         @comment
         */
        [_appTable reloadData];
    }
}

/*!
 @abstract
 */
- (void)popoverDidClose:(NSNotification *)notification
{
    _methodname_;
}

#pragma mark - Class Methods


/*!
 * @abstract    データパスをチェックする。また、データパスをセットアップする。
 */
- (BOOL) checkDataPath
{
    _methodname_;
    
    BOOL dataFileExistanceFlag = NO;
    NSError* error;
    
    /*
     @comment   ディレクトリ・サーチパスのリストを作成する
                NSDocumentDirectory: ユーザーのDocumentディレクトリ
                NSUserDomainMask: user's home directory --- place to install user's personal items (~)
     */
    NSArray* pathList = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    debugout(@"pathList: %@", pathList);
    
    /*
     @comment   ドキュメント・ディレクトリのパスを求める
     */
    NSString* documentDirectoryPathString = [pathList objectAtIndex:0];
    
    /*!
     * @abstract    データ格納フォルダのパスを決定する。
     */
    NSString* dataFolderPathString = [documentDirectoryPathString stringByAppendingString:@"/osxAL20DataFolder"];
    
    /*
     @comment   アプリケーションのデータフォルダが存在するかを調べる。
                存在しなかった場合、フォルダを作成する。
     */
    if(![[NSFileManager defaultManager] fileExistsAtPath:dataFolderPathString]){
    
        /*
         @comment   WARNING: ディレクトリを作成する。
         
         */
        [[NSFileManager defaultManager] createDirectoryAtPath:dataFolderPathString
                                  withIntermediateDirectories:NO
                                                   attributes:nil   //nilをセットするとデフォルト属性で作る
                                                        error:&error];
        
        //dataFileExistanceFlag = NO;   明らかにNOなので、省略
    }
    
    
    /*
     @comment   データファイルの名称を決定する
     */
    NSString* dataFileNameString = @"contactDB.xml";
    _dataFilePathString = [NSString stringWithFormat:@"%@/%@", dataFolderPathString, dataFileNameString];
    
    
    /*
     @comment
     */
    if([[NSFileManager defaultManager] fileExistsAtPath:_dataFilePathString]){
        dataFileExistanceFlag = YES;
    }
    
    return dataFileExistanceFlag;
}

/*!
 * @abstract    データをファイルに保存する。
 */
- (void) saveDataFile
{
    _methodname_;
    BOOL result = [_contactsArray writeToFile:_dataFilePathString atomically:NO];
    if(!result){
        NSAlert* alert = [NSAlert new];
        alert.messageText = @"Error: データファイルの更新に失敗しました。";
        [alert addButtonWithTitle:@"OK"];
        
        NSInteger returnCode = [alert runModal];
        debugout(@"returnCode: %ld", returnCode);
    }
}

/*!
 * @abstract    アプリケーションが取り扱う連絡先情報を作成する。
 */
- (NSDictionary*) recordDictionaryWithName:(NSString*) name
                                      info:(NSString*) contactInfoString
{
    _methodname_;
    
    /*
     @comment   Keyは、Interface Builderで設定したIdentifier値と同値であること
     */
    NSDictionary* dic = [NSDictionary dictionaryWithObjectsAndKeys:
                         name, @"Name",
                         contactInfoString, @"ContactInfo",
                         nil];
    
    return dic;
}


@end
