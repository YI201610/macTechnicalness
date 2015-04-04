//
//  iOSMTStoryboardCase1Scene1ViewController.m
//  macTechnicalness
//
//  Created by Yuji Imamura on 2015/04/04.
//
//

#import "iOSMTStoryboardCase1Scene1ViewController.h"

@interface iOSMTStoryboardCase1Scene1ViewController ()

@end

@implementation iOSMTStoryboardCase1Scene1ViewController

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

#pragma mark - Unwind Segue

- (BOOL)canPerformUnwindSegueAction:(SEL)action fromViewController:(UIViewController *)fromViewController withSender:(id)sender
{
    return [super canPerformUnwindSegueAction:action fromViewController:fromViewController withSender:sender];
}

- (IBAction) backToRootViewController:(UIStoryboardSegue*) unwindSegue
{
    NSLog(@"unwindSegue: %@", unwindSegue);
}

@end
