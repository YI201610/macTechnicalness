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
     @comment
     */
    self.navigationController.navigationBar.translucent = NO;
    
    /*!
     @comment   width, heightをもつViewを生成する
     */
    UIView* someView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [someView setBackgroundColor:[UIColor greenColor]];
    someView.tag = 999;
    [self.view addSubview:someView];
    
    /*!
     @comment   someViewのクラス名称を取得する
     */
    NSString *viewClassName = @"someView";
    
    
    /*!
     @comment   下記のプロパティをNOにすると、auto resizing機構が無効になる
     */
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    
    /*!
     @comment   someViewに関する辞書
     */
    NSDictionary* someViewDictionary = NSDictionaryOfVariableBindings(someView);
    
    /*!
     @comment   Auto Layout制約を、作成する
     */
    NSArray* constraintArray = [NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:@"V:|[%@(==80)]", viewClassName]
                                                                       options:0
                                                                       metrics:nil
                                                                         views:someViewDictionary];
    debugout(@"constraintArray: %@", constraintArray);
    [self.view addConstraints:constraintArray];
    
    /*!
     @comment
     */
    NSArray* constraintArray2 = [NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:@"H:|[%@]", viewClassName]
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
