//
//  Context.m
//  patternLearningStrategy
//
//  Created by Yuji Imamura on 2014/03/30.
//  Copyright (c) 2014年 Yuji Imamura. All rights reserved.
//

#import "Context.h"

@implementation Context

- (void) sendLog
{
    _methodname_;
    
    [_strategy executeSomeTransaction];
    
    debugout(@"* send log...");
}


- (void)dealloc
{
    _methodname_;
}

@end
