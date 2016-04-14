//
//  UIImage+CustomizedShadow.m
//  patternLearningDecorator
//
//  Created by Yuji Imamura on 2014/05/06.
//  Copyright (c) 2014年 Yuji Imamura. All rights reserved.
//

#import "UIImage+CustomizedShadow.h"
#import "UIImage+ExtendedMethod.h"

@implementation UIImage (CustomizedShadow)

- (UIImage*) imageWithShadow {
    _methodname_;
    
    CGContextRef ctx = [self beginContext];
    
    CGContextSetShadow(ctx, CGSizeMake(10, 11), 3);
    
    UIImage* retImg = [self getImageFromCurrentImageContext];
    
    [self endContext];
    
    return retImg;
}

@end
