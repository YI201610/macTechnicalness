//
//  iOSMTStoryboardCase1Scene3Tab1ViewController.m
//  macTechnicalness
//
//  Created by Yuji Imamura on 2015/04/04.
//
//

#import "iOSMTStoryboardCase1Scene3Tab1ViewController.h"

@interface iOSMTStoryboardCase1Scene3Tab1ViewController ()

@end

@implementation iOSMTStoryboardCase1Scene3Tab1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
- (NSString*) cellIdentifierString
{
    return @"scene3Cell";
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
//    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[self cellIdentifierString]];
    
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:[self cellIdentifierString] forIndexPath:indexPath];
    
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell* cell = [collectionView cellForItemAtIndexPath:indexPath];
    [self performSegueWithIdentifier:@"gotoScene4" sender: cell];
}

#pragma mark - Unwind Segue

- (IBAction) backToTabController:(UIStoryboardSegue*) unwindSegue
{
    NSLog(@"backToTabController, unwindSegue: %@", unwindSegue);
}


@end
