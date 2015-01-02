//
//  iOSMTAutoLayoutInconsistentRuleViewController.m
//  macTechnicalness
//
//  Created by Yuji Imamura on 2015/01/02.
//
//

#import "iOSMTAutoLayoutInconsistentRuleViewController.h"
#import "CommonHeader.h"
#import "iOSMTAutoLayoutTestableView.h"

@interface iOSMTAutoLayoutInconsistentRuleViewController ()

@end

@implementation iOSMTAutoLayoutInconsistentRuleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    /*!
     @comment
     */
    iOSMTAutoLayoutTestableView* someView = [[iOSMTAutoLayoutTestableView alloc] initWithFrame:CGRectMake(10, 110, 80, 80)];
    someView.tag = 999;
    [self.view addSubview:someView];
    
    iOSMTAutoLayoutTestableView* someView2 = [[iOSMTAutoLayoutTestableView alloc] initWithFrame:CGRectMake(120, 220, 65, 65)];
    someView2.tag = 888;
    [self.view addSubview:someView2];
    
    /*!
     @comment
     */
    NSLayoutConstraint* constraint1 = [NSLayoutConstraint constraintWithItem:someView
                                                                   attribute:NSLayoutAttributeWidth
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:someView2
                                                                   attribute:NSLayoutAttributeWidth
                                                                  multiplier:3
                                                                    constant:0];
    [self.view addConstraint:constraint1];

    NSLayoutConstraint* constraint2 = [NSLayoutConstraint constraintWithItem:someView
                                                                   attribute:NSLayoutAttributeWidth
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:someView2
                                                                   attribute:NSLayoutAttributeWidth
                                                                  multiplier:2
                                                                    constant:0];
    [self.view addConstraint:constraint2];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewDidAppear:(BOOL)animated
{
    iOSMTAutoLayoutTestableView* someView = (iOSMTAutoLayoutTestableView*)[self.view viewWithTag:999];
    debugout(@"someView: %@", someView);

    iOSMTAutoLayoutTestableView* someView2 = (iOSMTAutoLayoutTestableView*)[self.view viewWithTag:888];
    debugout(@"someView2: %@", someView2);

    /*!
     @comment
     */
    [someView testAmbiguity];
    
    /*!
     @comment
     */
    [someView2 testAmbiguity];

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
