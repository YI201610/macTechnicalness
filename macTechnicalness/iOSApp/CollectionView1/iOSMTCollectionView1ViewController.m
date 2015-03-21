//
//  iOSMTCollectionView1ViewController.m
//  macTechnicalness
//
//  Created by Yuji Imamura on 2015/03/21.
//
//

#import "iOSMTCollectionView1ViewController.h"
#import "iOSMTCollectionView1CollectionViewCell.h"

@interface iOSMTCollectionView1ViewController ()

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;


@end

@implementation iOSMTCollectionView1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    
    UINib *xib = [UINib nibWithNibName:@"iOSMTCollectionView1CollectionViewCell" bundle:nil];
    [_collectionView registerNib:xib forCellWithReuseIdentifier:@"collectionViewCell1"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDelegate>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    return 50;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    iOSMTCollectionView1CollectionViewCell *cell = [_collectionView dequeueReusableCellWithReuseIdentifier:@"collectionViewCell1"
                                                                            forIndexPath:indexPath];
    cell.helloLabel.text = @"Hoge";

    return cell;
}

@end
