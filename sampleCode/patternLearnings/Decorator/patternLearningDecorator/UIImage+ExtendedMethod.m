//
//  UIImage+ExtendedMethod.m
//  patternLearningDecorator
//
//  Created by Yuji Imamura on 2014/05/06.
//  Copyright (c) 2014年 Yuji Imamura. All rights reserved.
//

#import "UIImage+ExtendedMethod.h"

@implementation UIImage (ExtendedMethod)

/*!
 Bitmapベースのイメージコンテキストを生成する
 */
-(CGContextRef) beginContext {
    _methodname_;
    
    CGFloat sizeFactor = 2.5;
    CGSize size = CGSizeMake(self.size.width*sizeFactor, self.size.height*sizeFactor);
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    
    return UIGraphicsGetCurrentContext();
}


-(void) endContext {
    _methodname_;
    
    UIGraphicsEndImageContext();
}


-(UIImage*) getImageFromCurrentImageContext {
    _methodname_;
    
    [self drawAtPoint:CGPointZero];
    
    return UIGraphicsGetImageFromCurrentImageContext();
}


@end
