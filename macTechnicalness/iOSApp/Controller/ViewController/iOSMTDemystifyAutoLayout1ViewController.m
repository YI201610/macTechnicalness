//
//  iOSMTDemystifyAutoLayout1ViewController.m
//  macTechnicalness
//
//  Created by Yuji Imamura on 2014/12/14.
//
//

#import "iOSMTDemystifyAutoLayout1ViewController.h"
#import "CommonHeader.h"
@interface iOSMTDemystifyAutoLayout1ViewController ()

@end

@implementation iOSMTDemystifyAutoLayout1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    /*!
     @comment   navigationBarの半透明をOffにする（＝座標の原点をナビゲーションバーの直下に配置する）
     */
    self.navigationController.navigationBar.translucent = NO;
    
    /*!
     @comment   width, heightをもつViewを生成する
     */
    UIView* someView = [[UIView alloc] initWithFrame:CGRectMake(5, 5, 30.0f, 30.0f)];
    [someView setBackgroundColor:[UIColor greenColor]];
    someView.tag = 999;
    [self.view addSubview:someView];
    
    /*!
     @comment   someViewの、auto resizing機構を無効にする(x, y, width, heightが無効になる. )
     */
    someView.translatesAutoresizingMaskIntoConstraints = NO;
    
    /*!
     @comment   someViewに関する辞書
     */
    NSDictionary* someViewDictionary = NSDictionaryOfVariableBindings(someView);
    
    /*!
     @comment   対象のviewの高さを80にする制約を追加
                ビューは角括弧[]で囲む
     */
    NSArray* constraintArray = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[someView(==80)]"
                                                                       options:0
                                                                       metrics:nil
                                                                         views:someViewDictionary];
    debugout(@"constraintArray: %@", constraintArray);
    [self.view addConstraints:constraintArray];
    
    /*!
     @comment   対象Viewの幅を1にする制約を追加
     */
    NSArray* constraintArray2 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[someView(==50)]"
                                                                        options:0
                                                                        metrics:nil
                                                                          views:someViewDictionary];
    
    [self.view addConstraints:constraintArray2];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewDidAppear:(BOOL)animated
{
    _methodname_;
    
    /*!
     @comment   Viewの状態をデバッグ出力する
     */
    UIView* someView = [self.view viewWithTag:999];
    debugout(@"someView: %@", someView);
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
