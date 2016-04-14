//
//  ConcreteStrategy1.m
//  patternLearningStrategy
//
//  Created by Yuji Imamura on 2014/03/30.
//  Copyright (c) 2014年 Yuji Imamura. All rights reserved.
//

#import "ConcreteStrategy1.h"

@implementation ConcreteStrategy1

- (void)executeSomeTransaction
{
    _methodname_;
    
    debugout(@"pageName: hogehoge1. ");
    debugout(@"channel: hogehoge1. ");
    debugout(@"property1: 1234 ");
    debugout(@"connecting HTTP JSON API Server...");

}

- (void)dealloc
{
    _methodname_;
}


@end
