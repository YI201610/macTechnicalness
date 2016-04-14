//
//  osxAL21SingleItem.m
//  osxAppLearning21
//
//  Created by Yuji Imamura on 2014/09/30.
//  Copyright (c) 2014年 Yuji Imamura. All rights reserved.
//

#import "osxAL21SingleItem.h"
#import "CommonHeader.h"


@interface osxAL21SingleItem ()

@end

@implementation osxAL21SingleItem

/*!
 @abstract  このメソッドは、デリゲートメソッドの様に動作する。
            collection viewが、グリッドに、新しいItemを追加する際、
            setRepresentedObjectメソッドが、自動的に呼ばれる。
 
 @param     representedObject
            辞書オブジェクト
 */
- (void) setRepresentedObject:(id)representedObject
{
    _methodname_;
    
    if([representedObject isKindOfClass:[NSDictionary class]]) {
        NSDictionary *tmpDict = representedObject;

        _lblContactInfoLabel.stringValue = [tmpDict objectForKey:@"ContactInfo"];
        _lblNameLabel.stringValue = [tmpDict objectForKey:@"Name"];
    }
}



@end
