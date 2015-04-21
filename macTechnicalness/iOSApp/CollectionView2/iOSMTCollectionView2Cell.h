//
//  iOSMTCollectionView2Cell.h
//  macTechnicalness
//
//  Created by Yuji Imamura on 2015/03/28.
//
//

#import <UIKit/UIKit.h>

@protocol iOSMTCollectionView2CellDelegate;

/*!
 @abstract  CollectionViewCell
 */
@interface iOSMTCollectionView2Cell : UICollectionViewCell

/*!
 @abstract  textビュー
 */
@property (weak, nonatomic) IBOutlet UITextView *textView;

/*!
 @abstract  cellの反応処理を実装するデリゲートオブジェクト
 */
@property (nonatomic, weak) id<iOSMTCollectionView2CellDelegate> delegateObj;

/*!
 @abstract  identifier文字列を返す
 */
+ (NSString*)identifierString;

/*!
 @abstract  textのサイズから、cellのサイズを求めて返す
 */
+ (CGSize) cellSizeWithTextSize:(CGSize)textSize;

@end


/*!
 @abstract  Cell操作のデリゲートプロトコル
 */
@protocol iOSMTCollectionView2CellDelegate <NSObject>

@required

/*!
 @abstract  セルがタップされた
 */
- (void) didTapCell:(iOSMTCollectionView2Cell*)cell;

@end