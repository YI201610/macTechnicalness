//
//  Context.h
//  patternLearningStrategy
//
//  Created by Yuji Imamura on 2014/03/30.
//  Copyright (c) 2014年 Yuji Imamura. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AbstractStrategy.h"

@interface Context : NSObject

@property (nonatomic, strong) AbstractStrategy* strategy;

- (void) sendLog;

@end
