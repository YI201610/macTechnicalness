//
//  iOSMTCollectionView2ViewController.h
//  macTechnicalness
//
//  Created by Yuji Imamura on 2015/03/28.
//
//

#import <UIKit/UIKit.h>
#import "iOSMTCollectionView2Cell.h"

/*!
 @abstract  次の内容を検証する
        * Cellのコンテンツサイズはコンテンツ内容に応じて変化すること
        * Cellは選択するとハイライトされること
        * CellはprepareForReuseメソッドを実装すること
 */
@interface iOSMTCollectionView2ViewController : UIViewController
<UICollectionViewDataSource,
UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout,
iOSMTCollectionView2CellDelegate>

@end
