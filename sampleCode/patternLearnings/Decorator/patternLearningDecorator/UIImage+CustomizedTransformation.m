//
//  UIImage+CustomizedTransformation.m
//  patternLearningDecorator
//
//  Created by Yuji Imamura on 2014/05/06.
//  Copyright (c) 2014年 Yuji Imamura. All rights reserved.
//

#import "UIImage+CustomizedTransformation.h"
#import "UIImage+ExtendedMethod.h"

@implementation UIImage (CustomizedTransformation)

-(UIImage*) imageWithTransform:(CGAffineTransform) transform {
    _methodname_;
    
    CGContextRef ctx = [self beginContext];
    
    CGContextConcatCTM(ctx, transform);
    
    UIImage* retImg = [self getImageFromCurrentImageContext];
    
    [self endContext];
    
    return retImg;
}

@end
