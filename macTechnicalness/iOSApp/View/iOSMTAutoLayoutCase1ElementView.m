//
//  iOSMTAutoLayoutCase1ElementView.m
//  macTechnicalness
//
//  Created by Yuji Imamura on 2015/02/17.
//
//

#import "iOSMTAutoLayoutCase1ElementView.h"

@implementation iOSMTAutoLayoutCase1ElementView

+ (instancetype)viewObj
{
    NSString *className = NSStringFromClass([self class]);
    return [[[NSBundle mainBundle] loadNibNamed:className owner:nil options:0] firstObject];
}


- (void) awakeFromNib
{
    self.backgroundColor = [UIColor clearColor];
//    self.translatesAutoresizingMaskIntoConstraints = NO;
}

- (void)drawRect:(CGRect)rect
{
    /*
     @comment
     */
    UIColor* frameColor = [UIColor colorWithRed: 0.8 green: 0.8 blue: 0.8 alpha: 0.8];
    CGRect iconFrameRect = CGRectMake(rect.origin.x+1, rect.origin.y+1, rect.size.width-2, rect.size.height-2);
    UIBezierPath* roundFramePath = [UIBezierPath bezierPathWithRoundedRect: iconFrameRect cornerRadius: 14.5];
    [UIColor.whiteColor setFill];
    [roundFramePath fill];
    [frameColor setStroke];
    roundFramePath.lineWidth = 1;
    [roundFramePath stroke];
    
//    /*
//     @comment   ラベルとボタンの本来の位置を表示する
//     */
//    NSLog(@"someLabelのintrinsicContentSize: %@", NSStringFromCGSize(self.someLabel.intrinsicContentSize));
//    
//    NSLog(@"someButtonのintrinsicContentSize: %@", NSStringFromCGSize(self.someButton.intrinsicContentSize));
    
}

@end
