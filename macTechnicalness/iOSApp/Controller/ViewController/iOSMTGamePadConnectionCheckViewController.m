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
#import "iOSMTGamePadConnectionCheckButtonAView.h"

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
    [super viewDidAppear:animated];
    /*
     @comment   Human Interface Deviceのデリゲートに自身を設定します。
     */
    AppDelegate* app = [AppDelegate appDelegate];
    
    app.hidController.valueChangeDelegate = self;
}

- (void) dealloc
{
    _methodname_;
}

#pragma mark - Private

- (void) closeView
{
    /*!
     @comment   画面を閉じ、TopMenuに遷移します。
     */
    [self.navigationController popToRootViewControllerAnimated:YES];    //自滅開始。hidController.delegateもweakなのでdeallocが呼ばれます
}

#pragma mark - HIDeviceDelegate 

- (void) didChangeButtonA:(GCControllerButtonInput *)button value:(float)value pressed:(BOOL)pressed
{
    debugout(@"buttonAイベントハンドラ処理: %f, %d", value, pressed);
    
    iOSMTGamePadConnectionCheckButtonAView* a = [[iOSMTGamePadConnectionCheckButtonAView alloc] initWithFrame:CGRectMake(self.view.center.x-50, self.view.center.y-50,
                                                        100, 100)];
    [self.view addSubview:a];
    [UIView animateWithDuration:1 animations:^(){
        a.alpha = 0;
        a.transform = CGAffineTransformMakeScale(2, 2);
    } completion:^(BOOL complete){
        [a removeFromSuperview];
    }];
}

- (void) didPushPauseButton:(GCController *)controller
{
    debugout(@"pauseボタンが押下されました。");
    [self closeView];
}

- (void) didChangeLeftStick:(GCControllerDirectionPad *)leftStick xValue:(float)xValue yValue:(float)yValue
{
    debugout(@"左スティックイベントハンドラ処理{%f, %f}", xValue, yValue);
}

@end
