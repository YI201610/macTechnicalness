//
//  iOSMTStoryboardCase2Scene1ViewController.m
//  macTechnicalness
//
//  Created by Yuji Imamura on 2015/04/04.
//
//

#import "iOSMTStoryboardCase2Scene1ViewController.h"
#import "CommonHeader.h"

@interface iOSMTStoryboardCase2Scene1ViewController ()

@end

@implementation iOSMTStoryboardCase2Scene1ViewController

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

- (IBAction) backToRootViewController:(UIStoryboardSegue*) unwindSegue
{
    _methodname_;
}


@end
