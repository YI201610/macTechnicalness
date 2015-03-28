//
//  iOSMTCollectionView2ViewController.m
//  macTechnicalness
//
//  Created by Yuji Imamura on 2015/03/28.
//
//

#import "iOSMTCollectionView2ViewController.h"
#import "iOSMTCollectionView2Cell.h"


@interface iOSMTCollectionView2ViewController ()
<UICollectionViewDataSource,
UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout>

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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    return 30; //[_dataArray count];
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

    
    return cell;
}

@end
