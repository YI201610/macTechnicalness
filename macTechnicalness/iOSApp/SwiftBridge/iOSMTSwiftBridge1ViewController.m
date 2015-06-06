//
//  iOSMTSwiftBridge1ViewController.m
//  macTechnicalness
//
//  Created by Yuji Imamura on 2015/06/06.
//
//

#import "iOSMTSwiftBridge1ViewController.h"
#import "CommonHeader.h"
#import <iOSEmbeddedModelKit/iOSEmbeddedModelKit-Swift.h>

@interface iOSMTSwiftBridge1ViewController ()

@end

@implementation iOSMTSwiftBridge1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    MTMSomeDomainEntity* a = [MTMSomeDomainEntity new];
    a.x = 5555;
    a.y = 10555;
    a.width = 128555;
    a.height = 256555;
    debugout(@"hoge Action: %f", [a hogeOutput]);

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
