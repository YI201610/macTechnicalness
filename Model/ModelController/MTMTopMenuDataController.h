//
//  MTMTopMenuDataController.h
//  Model
//
//  Created by Yuji Imamura on 2014/12/02.
//
//

#import <Foundation/Foundation.h>

/*!
 @abstract  TopMenuの読み込みを管理するクラス
 */
@interface MTMTopMenuDataController : NSObject

/*!
 @abstract  topメニューのplistを読み込む
 */
- (instancetype) initWithPlistName:(NSString*) plistNameString;

/*!
 @abstract
 */
- (NSString*) sectionNameStringWithIndex:(NSInteger)indexNo;

/*!
 @abstract
 */
- (NSInteger) numberOfSection;

/*!
 @abstract
 */
- (NSString*) itemForSection:(NSString*)section index:(NSInteger)indexValue;

/*!
 @abstract
 */
- (NSInteger) numberOfItemForSection:(NSString*)sectionNameString;

@end
