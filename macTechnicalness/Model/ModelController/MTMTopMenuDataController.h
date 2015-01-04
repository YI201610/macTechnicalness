//
//  MTMTopMenuDataController.h
//  Model
//
//  Created by Yuji Imamura on 2014/12/02.
//
//

#import <Foundation/Foundation.h>
#import "MTMTopMenuEntity.h"


/*!
 @abstract  TopMenuの読み込みを管理するクラス
 */
@interface MTMTopMenuDataController : NSObject

/*!
 @abstract  topメニューのplistを読み込む
 */
- (instancetype) initWithPlistName:(NSString*) plistNameString;

/*!
 @abstract  指定した番号に対応するセクションの名称を返す
 */
- (NSString*) sectionNameStringWithIndex:(NSInteger)indexNo;

/*!
 @abstract  セクションの総数を返す
 */
- (NSInteger) numberOfSection;

/*!
 @abstract  指定したセクション、指定した番号に対応する「OSX/iOS検証項目名」を返す
 */
- (MTMTopMenuEntity*) itemForSection:(NSString*)section index:(NSInteger)indexValue;

/*!
 @abstract  行に相当する項目を返す
 */
- (MTMTopMenuEntity*) itemForRow:(NSInteger)rowValue;

/*!
 @abstract  指定したセクションに含まれる検証項目名の総数を返す
 */
- (NSInteger) numberOfItemForSection:(NSString*)sectionNameString;

@end
