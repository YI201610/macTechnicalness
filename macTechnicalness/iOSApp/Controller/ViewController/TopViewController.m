//
//  TopViewController.m
//  macTechnicalness
//
//  Created by Yuji Imamura on 2014/12/01.
//
//

#import "TopViewController.h"

@interface TopViewController ()

@end

@implementation TopViewController

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

/*!
 @abstract
 */
- (void) loadView
{
    self.navigationItem.title = NSLocalizedString(@"項目一覧", nil);
    
    CGRect app_frame = [[UIScreen mainScreen] applicationFrame];
    
    UIView* baseview = [[UIView alloc] initWithFrame:app_frame];
    [baseview setBackgroundColor:[UIColor blueColor]];
    self.view = baseview;
    self.view.multipleTouchEnabled = NO;
    self.view.exclusiveTouch = YES;
}


@end
