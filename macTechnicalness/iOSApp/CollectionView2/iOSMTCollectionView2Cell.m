//
//  iOSMTCollectionView2Cell.m
//  macTechnicalness
//
//  Created by Yuji Imamura on 2015/03/28.
//
//

#import "iOSMTCollectionView2Cell.h"
#import "CommonHeader.h"

@implementation iOSMTCollectionView2Cell

- (void)awakeFromNib {
    // Initialization code
    [super awakeFromNib];

    /*
     @comment   コードでTapジェスチャーをcellのContentViewに追加
     */
    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapCell:)];
    [self.contentView addGestureRecognizer:tapGesture];
}


- (void)prepareForReuse
{
//    _methodname_;
}

- (void) setSelected:(BOOL)selected
{
    _methodname_;
}

- (void) setHighlighted:(BOOL)highlighted
{
    _methodname_;
}

#pragma mark - Gesture

- (void)didTapCell:(UITapGestureRecognizer *)sender {
    
    if([_delegateObj respondsToSelector:@selector(didTapCell:)]){
        [_delegateObj didTapCell:self];
    }
}


#pragma mark - Public

+ (NSString*)identifierString
{
    return @"iOSMTCollectionView2Cell";
}

+ (CGSize) cellSizeWithTextSize:(CGSize)textSize;
{
    return CGSizeMake(textSize.width + 5, textSize.height + 5);
}

@end
