//
//  AbstractStrategy.m
//  patternLearningStrategy
//
//  Created by Yuji Imamura on 2014/03/30.
//  Copyright (c) 2014年 Yuji Imamura. All rights reserved.
//

#import "AbstractStrategy.h"

@implementation AbstractStrategy

- (void)executeSomeTransaction
{
    _methodname_;
    
    [NSException raise:NSInternalInconsistencyException
                format:@"Error: You must override %@ in a subclass", NSStringFromSelector(_cmd)];

}

@end
