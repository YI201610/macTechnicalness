//
//  iOSMTGamePadConnectionCheckButtonAView.m
//  macTechnicalness
//
//  Created by Yuji Imamura on 2014/12/14.
//
//

#import "iOSMTGamePadConnectionCheckButtonAView.h"

@implementation iOSMTGamePadConnectionCheckButtonAView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    //// Color Declarations
    UIColor* color = [UIColor colorWithRed: 1 green: 0.705 blue: 0.114 alpha: 1];
    
    //// Star Drawing
    UIBezierPath* starPath = [UIBezierPath bezierPath];
    [starPath moveToPoint: CGPointMake(132.5, 172.5)];
    [starPath addLineToPoint: CGPointMake(132.5, 172.5)];
    [starPath addLineToPoint: CGPointMake(132.5, 172.5)];
    [starPath addLineToPoint: CGPointMake(132.5, 172.5)];
    [starPath addLineToPoint: CGPointMake(132.5, 172.5)];
    [starPath addLineToPoint: CGPointMake(132.5, 172.5)];
    [starPath addLineToPoint: CGPointMake(132.5, 172.5)];
    [starPath addLineToPoint: CGPointMake(132.5, 172.5)];
    [starPath addLineToPoint: CGPointMake(132.5, 172.5)];
    [starPath addLineToPoint: CGPointMake(132.5, 172.5)];
    [starPath closePath];
    [[UIColor whiteColor] setFill];
    [starPath fill];
    [[UIColor blackColor] setStroke];
    starPath.lineWidth = 1;
    [starPath stroke];
    
    
    //// Star 2 Drawing
    UIBezierPath* star2Path = [UIBezierPath bezierPath];
    [star2Path moveToPoint: CGPointMake(50.5, 15)];
    [star2Path addLineToPoint: CGPointMake(63.73, 34.04)];
    [star2Path addLineToPoint: CGPointMake(86.16, 40.57)];
    [star2Path addLineToPoint: CGPointMake(71.9, 58.86)];
    [star2Path addLineToPoint: CGPointMake(72.54, 81.93)];
    [star2Path addLineToPoint: CGPointMake(50.5, 74.2)];
    [star2Path addLineToPoint: CGPointMake(28.46, 81.93)];
    [star2Path addLineToPoint: CGPointMake(29.1, 58.86)];
    [star2Path addLineToPoint: CGPointMake(14.84, 40.57)];
    [star2Path addLineToPoint: CGPointMake(37.27, 34.04)];
    [star2Path closePath];
    [color setFill];
    [star2Path fill];
    
    

}

@end
