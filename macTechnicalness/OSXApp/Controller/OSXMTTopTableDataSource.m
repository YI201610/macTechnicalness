//
//  OSXMTTopTableDataSource.m
//  macTechnicalness
//
//  Created by Yuji Imamura on 2015/01/03.
//
//

#import "OSXMTTopTableDataSource.h"
#import "CommonHeader.h"

@implementation OSXMTTopTableDataSource


/*!
 @abstract
 */
-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    NSInteger sectionCnt = [_dataController numberOfSection];

    NSInteger totalRowCnt = 0;
    
    for(NSInteger i = 0; i < sectionCnt; i++){
        NSString* sectionName = [_dataController sectionNameStringWithIndex:i];
        NSInteger rowCnt = [_dataController numberOfItemForSection:sectionName];
        
        totalRowCnt += rowCnt;
    }
    
    return totalRowCnt;
}

/*!
 @abstract  NSTableViewDataSource独自のデリゲート処理。
 */
- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn
            row:(NSInteger)row
{
    MTMTopMenuEntity* entity = [_dataController itemForRow:row];
    
    NSString* returnString = nil;
    
    NSString* idString = tableColumn.identifier;
    if([idString isEqualToString:@"someSection"]){

        /*
         @comment   セクション名称を返却する
         */
        returnString = entity.sectionNameString;
        
    }else if([idString isEqualToString:@"someTitle"]){
        
        /*
         @comment   アイテム名称を返却する
         */
        returnString = entity.titleString;
    }
//
//    debugout(@"*row: %ld, tableColumn: %@, returnString: %@", row, tableColumn, returnString);
//
    return returnString;
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
//
//    /*
//     @comment   データ配列から、行の要素を抽出。[＜番号＞]で配列から要素を抽出。
//     */
//    NSDictionary* contact = _contactsArray[row];
//    
//    /*
//     @comment   要素から、データを抽出。
//     下記の表現を使用する為に、InterfaceBuilderでオブジェクトのプロパティに然るべき値を設定しておくこと。
//     */
//    NSString* idString = tableColumn.identifier;
//    debugout(@"*idString: %@", idString);
//    
//    /*
//     @comment   object: 変更されたデータ
//     */
//    [contact setValue:object forKey:idString];
    
    
}

/*!
 @abstract
 */
- (void)tableView:(NSTableView *)tableView sortDescriptorsDidChange:(NSArray *)oldDescriptors
{
    _methodname_;
//
//    debugout(@"oldDescriptors: %@", oldDescriptors);
//    
//    /*
//     @comment
//     */
//    NSArray* sortDiscriptors = [_appTable sortDescriptors];
//    debugout(@"sortDiscriptors: %@", sortDiscriptors);
//    
//    /*
//     @comment   メモリ上の連絡先情報をソートする。
//     */
//    [_contactsArray sortUsingDescriptors:sortDiscriptors];
//    
//    
//    /*
//     @comment
//     */
//    [_appTable reloadData];
    
    
}


@end
