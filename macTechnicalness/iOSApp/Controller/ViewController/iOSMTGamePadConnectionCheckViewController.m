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
    AppDelegate* app = [AppDelegate appDelegate];
    GCController* gameController = app.hidController.gameController;
    GCExtendedGamepad* gamePad = app.hidController.extendedGamePad;
    
    /*
     @comment
     */
    gameController.controllerPausedHandler = ^(GCController* controller) {
        debugout(@"ポーズキーが押下されました。");
    };
    
    gamePad.valueChangedHandler = ^(GCExtendedGamepad *gamepad, GCControllerElement *element){
//        debugout(@"gamepad: %@, element: %@", gamepad, element);
    };
    
    /*
     @comment   Aボタン処理
     */
    gamePad.buttonA.valueChangedHandler = ^(GCControllerButtonInput *button, float value, BOOL pressed) {
        debugout(@"buttonAに関するハンドラ: %f, %d", value, pressed);
    };
    
    /*
     @comment   Bボタン処理
     */
    
    /*
     @comment   Xボタン処理
     */
    
    /*
     @comment   Yボタン処理
     */
    
    /*
     @comment   L1ボタン処理
     */
    
    /*
     @comment   L2ボタン処理
     */
    
    /*
     @comment   R1ボタン処理
     */
    
    /*
     @comment   R2ボタン処理
     */
    
    /*
     @comment   十字キー処理
     */
    
    /*
     @comment   左スティック処理
     */
    
    /*
     @comment   右スティック処理
     */
    gamePad.rightThumbstick.valueChangedHandler = ^(GCControllerDirectionPad *dpad, float xValue, float yValue) {
        debugout(@"右スティック処理: %f, %f", xValue, yValue);
    };
}


@end
