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

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    CGPoint labelPoint = _stickIndicatorLabel.center;
    _stickIndicatorLabel.text = [NSString stringWithFormat:@"(%f, %f)", labelPoint.x, labelPoint.y];

}

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
    NSInteger viewTag = 100;
    UIView* b = [self.view viewWithTag:viewTag];
    if(b == nil){
        CGFloat width = 100;
        CGFloat height = 100;
        iOSMTGamePadConnectionCheckButtonAView* a = [[iOSMTGamePadConnectionCheckButtonAView alloc] initWithFrame:CGRectMake(self.view.center.x-width/2, self.view.center.y-height/2,
                                                                                                                             width, height)];
        a.tag = viewTag;
        [self.view addSubview:a];
        [UIView animateWithDuration:0.35 animations:^(){
            a.alpha = 0;
            a.transform = CGAffineTransformMakeScale(1+value*2, 1+value*2);
        } completion:^(BOOL complete){
            [a removeFromSuperview];
        }];
    }
}

- (void) didPushPauseButton:(GCController *)controller
{
    debugout(@"pauseボタンが押下されました。");
    [self closeView];
}

- (void) didChangeLeftStick:(GCControllerDirectionPad *)leftStick xValue:(float)xValue yValue:(float)yValue
{
    CGPoint labelPoint = _stickIndicatorLabel.center;
    CGPoint nextPoint = CGPointMake(150 + xValue*50.0, 230 - yValue*50.0);
    _stickIndicatorLabel.center = nextPoint;
    _stickIndicatorLabel.text = [NSString stringWithFormat:@"(%f, %f)", xValue, yValue];
}

@end
