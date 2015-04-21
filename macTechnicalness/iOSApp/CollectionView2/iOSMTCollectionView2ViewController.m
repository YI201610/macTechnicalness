//
//  iOSMTCollectionView2ViewController.m
//  macTechnicalness
//
//  Created by Yuji Imamura on 2015/03/28.
//
//

#import "iOSMTCollectionView2ViewController.h"
#import "CommonHeader.h"


@interface iOSMTCollectionView2ViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic, strong) NSMutableArray* dataArray;
@property (nonatomic, strong) UIFont* cellStringFont;

@end

@implementation iOSMTCollectionView2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    
    /*
     @comment   xibとReuseIdentifierを指定して、セルを登録する
     */
    UINib *xib = [UINib nibWithNibName:[iOSMTCollectionView2Cell identifierString] bundle:nil];
    [_collectionView registerNib:xib
      forCellWithReuseIdentifier:[iOSMTCollectionView2Cell identifierString]];

    /*
     @comment   プロパティの初期化
     */
    _dataArray = [NSMutableArray new];
    _cellStringFont = [UIFont systemFontOfSize:14.0];

    
    /*
     @comment   Cellに設定するテキストデータを準備
     */
    for(int i = 0; i < 30; i++){
       
        NSString* string = [NSString stringWithFormat:@"HogeHogeCell{%zd/%zd}",  1, i];

        NSInteger randomValue = RANDOM_INT(0, 30);
        for(int k = 0; k < randomValue; k++){
            string = [string stringByAppendingString:@"X"];
        }

        [_dataArray addObject:string];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private

/*!
@abstract  指定された文字列からcellのサイズを求める
*/
- (CGSize)cellSizeWithSourceString:(NSString *)textString
{
    CGFloat maxWidth = 200.0f;
    
    CGFloat minWidth = 50.0f;
    CGFloat minHeight = 50.0f;
    
    /*
     @comment   textがなければ最小サイズを返す
     */
    if (textString == nil || textString.length == 0) {
        return CGSizeMake(minWidth, minHeight);
    }
    
    /*
     @comment   フォントから装飾テキストを作成する
     */
    NSAttributedString *attrText = [[NSAttributedString alloc] initWithString:textString
                                                                   attributes:@{NSFontAttributeName: _cellStringFont}];
    
    /*
     @comment   装飾テキストを描画するのに必要なサイズを求める
     */
    CGRect rect = [attrText boundingRectWithSize:CGSizeMake(maxWidth, CGFLOAT_MAX)
                                         options:NSStringDrawingUsesLineFragmentOrigin
                                         context:nil];
    
    return CGSizeMake(MAX(minWidth, ceilf(rect.size.width)),
                      MAX(minHeight, ceilf(rect.size.height)));
}


#pragma mark - UICollectionViewDataSource

// セクション数を返す
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

// アイテム数を返す
- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    return [_dataArray count];
}

// セルを返す（生成または再利用キューから取得し設定する）
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    /*
     @comment   cellのinitメソッドを使用せず、collectionViewに生成させてセルを取得
     */
    iOSMTCollectionView2Cell* cell =
    [_collectionView dequeueReusableCellWithReuseIdentifier:[iOSMTCollectionView2Cell identifierString]
                                              forIndexPath:indexPath];

    cell.delegateObj = self;
    cell.textView.text = _dataArray[indexPath.row];
    cell.textView.font = _cellStringFont;
    
    return cell;
}

#pragma mark - iOSMTCollectionView2CellDelegate

- (void) didTapCell:(iOSMTCollectionView2Cell *)cell
{
    _methodname_;
}

#pragma mark - UICollectionViewDelegateFlowLayout

// セルサイズを指定する
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize textSize = [self cellSizeWithSourceString:_dataArray[indexPath.row]];
    CGSize cellSize = [iOSMTCollectionView2Cell cellSizeWithTextSize:textSize];
    return cellSize;
}

#pragma mark - UICollectionViewDelegate

- (BOOL) collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    _methodname_;
    return YES;
}


@end
