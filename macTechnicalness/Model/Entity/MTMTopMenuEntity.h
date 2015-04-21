//
//  MTMTopMenuEntity.h
//  Model
//
//  Created by Yuji Imamura on 2014/12/05.
//
//

#import <Foundation/Foundation.h>

/*!
 @abstract  Topメニューに表示される各検証項目
 */
@interface MTMTopMenuEntity : NSObject

@property (nonatomic, copy) NSString* sectionNameString;
@property (nonatomic, copy) NSString* titleString;

@property (nonatomic, copy) NSString* viewControllerNameString;
@property (nonatomic, copy) NSString* windowControllerNameString;

@end
