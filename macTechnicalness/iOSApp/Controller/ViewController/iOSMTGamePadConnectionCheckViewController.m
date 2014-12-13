//
//  iOSMTGameControllerConnectionCheckViewController.m
//  macTechnicalness
//
//  Created by Yuji Imamura on 2014/12/07.
//
//

#import "iOSMTGamePadConnectionCheckViewController.h"
#import <GameController/GameController.h>
#import "CommonHeader.h"

@interface iOSMTGamePadConnectionCheckViewController ()

@end

@implementation iOSMTGamePadConnectionCheckViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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

- (void)viewDidAppear:(BOOL)animated
{
    /*
     @comment   Human Interface Deviceのデリゲートに自身を設定します。
     */
    AppDelegate* app = [AppDelegate appDelegate];
    app.hidController.delegate = self;
}

#pragma mark - HIDeviceDelegate 

- (void) valueChangedButtonA:(GCControllerButtonInput *)button value:(float)value pressed:(BOOL)pressed
{
    debugout(@"buttonAに関するハンドラをViewControllerで。: %f, %d", value, pressed);
}

@end
