//
//  iOSMTiOS8TextView1ViewController.m
//  macTechnicalness
//
//  Created by Yuji Imamura on 2015/01/08.
//
//

#import "iOSMTiOS8TextView1ViewController.h"

@interface iOSMTiOS8TextView1ViewController ()

@end

@implementation iOSMTiOS8TextView1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGRect appFrame = [[UIScreen mainScreen] applicationFrame];
    UIView* baseView = [[UIView alloc] initWithFrame:appFrame];
    [baseView setBackgroundColor:[UIColor blueColor]];
    self.view = baseView;
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

@end
