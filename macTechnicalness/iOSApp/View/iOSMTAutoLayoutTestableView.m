//
//  iOSMTAutoLayoutTestableView.m
//  macTechnicalness
//
//  Created by Yuji Imamura on 2015/01/02.
//
//

#import "iOSMTAutoLayoutTestableView.h"
#import "CommonHeader.h"

@implementation iOSMTAutoLayoutTestableView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blueColor];
        self.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return self;
}

- (void) testAmbiguity
{
    /*!
     @comment
     */
    if(self.hasAmbiguousLayout){
        debugout(@"[%@(tag:%ld)] Auto Layoutの定義に曖昧さがあります。", [self class], (long)self.tag);
    }else{
        debugout(@"[%@(tag:%ld)] Auto Layoutの定義に曖昧さがありません。", [self class], self.tag);
    }
    
    /*!
     @comment
     */
    for (iOSMTAutoLayoutTestableView* subView in [self subviews]) {
        [subView testAmbiguity];
    }
}

@end
