//
//  iOSMTHIDeviceController.m
//  macTechnicalness
//
//  Created by Yuji Imamura on 2014/12/08.
//
//

#import "iOSMTHIDeviceController.h"
#import "CommonHeader.h"

@implementation iOSMTHIDeviceController

/*!
 @abstract  notification: NSConcreteNotification
 */
- (void)gameControllerDidConnect:(NSNotification*)notification
{
    _methodname_;
    debugout(@"notification: %@", notification);

    /*!
     @comment
     */
    NSArray *controllers = [GCController controllers];
    for (GCController *controller in controllers) {
        debugout(@"**controller: %@", controller);
    }

    /*!
     @comment
     */
    if([notification.object isKindOfClass:[GCController class]]){
        GCController* gameController = notification.object;

        _gameController = gameController;
        
        /*!
         @comment   拡張ゲームパッドのオブジェクトを取得します。
         */
        if(gameController.extendedGamepad){
            
            _extendedGamePad = gameController.extendedGamepad;
            
            /*!
             @comment
             */
            _isGameControllerConnected = YES;
            
            
            //各種ハンドラ処理の開始
            
            /*
             @comment
             */
            _gameController.controllerPausedHandler = ^(GCController* controller) {
                debugout(@"ポーズキーが押下されました。");
            };
            
            /*
             @comment
             */
            _extendedGamePad.valueChangedHandler = ^(GCExtendedGamepad *gamepad, GCControllerElement *element){
                //        debugout(@"gamepad: %@, element: %@", gamepad, element);
                /*!
                 @comment   このハンドラ内部で、全てのボタン押下をハンドリングすることも可能です。
                 */
            };
            
            /*
             @comment   Aボタン処理
             */
            _extendedGamePad.buttonA.valueChangedHandler = ^(GCControllerButtonInput *button, float value, BOOL pressed) {
                [_delegate valueChangedButtonA:button value:value pressed:pressed];
            };
            
            /*
             @comment   Bボタン処理
             */
            _extendedGamePad.buttonB.valueChangedHandler = ^(GCControllerButtonInput* button, float value, BOOL pressed) {
                debugout(@"buttonBに関するハンドラ: %f, %d", value, pressed);
            };
            
            /*
             @comment   Xボタン処理
             */
            _extendedGamePad.buttonX.valueChangedHandler = ^(GCControllerButtonInput* button, float value, BOOL pressed) {
                debugout(@"buttonXに関するハンドラ: %f, %d", value, pressed);
            };
            
            /*
             @comment   Yボタン処理
             */
            _extendedGamePad.buttonY.valueChangedHandler = ^(GCControllerButtonInput* button, float value, BOOL pressed) {
                debugout(@"buttonYに関するハンドラ: %f, %d", value, pressed);
            };
            
            /*
             @comment   L1ボタン処理
             */
            _extendedGamePad.rightShoulder.valueChangedHandler = ^(GCControllerButtonInput* button, float value, BOOL pressed) {
                debugout(@"L1に関するハンドラ: %f, %d", value, pressed);
            };
            
            /*
             @comment   L2ボタン処理
             */
            _extendedGamePad.rightTrigger.valueChangedHandler = ^(GCControllerButtonInput* button, float value, BOOL pressed) {
                debugout(@"L2に関するハンドラ: %f, %d", value, pressed);
            };
            
            /*
             @comment   R1ボタン処理
             */
            _extendedGamePad.leftShoulder.valueChangedHandler = ^(GCControllerButtonInput* button, float value, BOOL pressed) {
                debugout(@"R1に関するハンドラ: %f, %d", value, pressed);
            };
            
            /*
             @comment   R2ボタン処理
             */
            _extendedGamePad.leftTrigger.valueChangedHandler = ^(GCControllerButtonInput* button, float value, BOOL pressed) {
                debugout(@"R2に関するハンドラ: %f, %d", value, pressed);
            };
            
            /*
             @comment   十字キー処理
             */
            _extendedGamePad.dpad.valueChangedHandler = ^(GCControllerDirectionPad *dpad, float xValue, float yValue) {
                debugout(@"十字キーに関するハンドラ: %f, %f", xValue, yValue);
            };
            
            /*
             @comment   左スティック処理
             */
            _extendedGamePad.leftThumbstick.valueChangedHandler = ^(GCControllerDirectionPad *dpad, float xValue, float yValue) {
                debugout(@"左スティック処理: %f, %f", xValue, yValue);
            };
            
            /*
             @comment   右スティック処理
             */
            _extendedGamePad.rightThumbstick.valueChangedHandler = ^(GCControllerDirectionPad *dpad, float xValue, float yValue) {
                debugout(@"右スティック処理: %f, %f", xValue, yValue);
            };
        }
    }
    

}

- (void)gameControllerDidDisconnect:(id)notification
{
    _methodname_;
    debugout(@"notification: %@", notification);
    
    /*!
     @comment
     */
    _isGameControllerConnected = NO;
    
}

@end
