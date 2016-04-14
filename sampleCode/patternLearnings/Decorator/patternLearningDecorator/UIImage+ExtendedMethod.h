//
//  UIImage+ExtendedMethod.h
//  patternLearningDecorator
//
//  Created by Yuji Imamura on 2014/05/06.
//  Copyright (c) 2014年 Yuji Imamura. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ExtendedMethod)

-(CGContextRef) beginContext;
-(void) endContext;

-(UIImage*) getImageFromCurrentImageContext;

@end
