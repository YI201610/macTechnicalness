//
//  iOSMTGameControllerVerification1ViewController.m
//  macTechnicalness
//
//  Created by Yuji Imamura on 2014/12/06.
//
//

#import "iOSMTGameControllerVerificationTopViewController.h"
#import "CommonHeader.h"
#import "iOSMTGamePadConnectionCheckViewController.h"
#import "AppDelegate.h"

@interface iOSMTGameControllerVerificationTopViewController ()

@end

@implementation iOSMTGameControllerVerificationTopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    AppDelegate* app = [AppDelegate appDelegate];
    app.hidController.connectionDelegate = self;
    
    [self pushHIDCheckViewIfNeeded];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) dealloc
{
    _methodname_;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - push HID Control Check View

- (void) pushHIDCheckViewIfNeeded
{
    /*!
     @comment
     */
    AppDelegate* appDelegate = [AppDelegate appDelegate];
    
    /*!
     @comment   ゲームコントローラーと接続されている場合、
     動作確認画面に遷移します。
     */
    if(appDelegate.hidController.isGameControllerConnected){
        iOSMTGamePadConnectionCheckViewController* viewController = [iOSMTGamePadConnectionCheckViewController new];
        [self.navigationController pushViewController:viewController animated:YES];
    }
}

#pragma mark - iOSMTHIDDeviceConnectionDelegate

- (void) didHIDeviceConnect
{
    _methodname_;
    [self pushHIDCheckViewIfNeeded];
}


- (void) didHIDeviceDisconnect
{
    _methodname_;
    [self.navigationController popToRootViewControllerAnimated:YES];
}


@end
