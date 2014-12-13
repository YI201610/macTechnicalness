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
                
                if([_delegate respondsToSelector:@selector(didPushPauseButton:)]){
                    [_delegate didPushPauseButton:controller];
                }
                
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
                if([_delegate respondsToSelector:@selector(didChangeButtonA:value:pressed:)]){
                    [_delegate didChangeButtonA:button value:value pressed:pressed];
                }
            };
            
            /*
             @comment   Bボタン処理
             */
            _extendedGamePad.buttonB.valueChangedHandler = ^(GCControllerButtonInput* button, float value, BOOL pressed) {
                if([_delegate respondsToSelector:@selector(didChangeButtonB:value:pressed:)]){
                    [_delegate didChangeButtonB:button value:value pressed:pressed];
                }
            };
            
            /*
             @comment   Xボタン処理
             */
            _extendedGamePad.buttonX.valueChangedHandler = ^(GCControllerButtonInput* button, float value, BOOL pressed) {
                if([_delegate respondsToSelector:@selector(didChangeButtonX:value:pressed:)]){
                    [_delegate didChangeButtonX:button value:value pressed:pressed];
                }
            };
            
            /*
             @comment   Yボタン処理
             */
            _extendedGamePad.buttonY.valueChangedHandler = ^(GCControllerButtonInput* button, float value, BOOL pressed) {
                if([_delegate respondsToSelector:@selector(didChangeButtonY:value:pressed:)]){
                    [_delegate didChangeButtonY:button value:value pressed:pressed];
                }
            };
            
            /*
             @comment   L1ボタン処理
             */
            _extendedGamePad.rightShoulder.valueChangedHandler = ^(GCControllerButtonInput* button, float value, BOOL pressed) {
                if([_delegate respondsToSelector:@selector(didChangeButtonL1:value:pressed:)]){
                    [_delegate didChangeButtonL1:button value:value pressed:pressed];
                }
            };
            
            /*
             @comment   L2ボタン処理
             */
            _extendedGamePad.rightTrigger.valueChangedHandler = ^(GCControllerButtonInput* button, float value, BOOL pressed) {
                if([_delegate respondsToSelector:@selector(didChangeButtonL2:value:pressed:)]){
                    [_delegate didChangeButtonL2:button value:value pressed:pressed];
                }
            };
            
            /*
             @comment   R1ボタン処理
             */
            _extendedGamePad.leftShoulder.valueChangedHandler = ^(GCControllerButtonInput* button, float value, BOOL pressed) {
                if([_delegate respondsToSelector:@selector(didChangeButtonR1:value:pressed:)]){
                    [_delegate didChangeButtonR1:button value:value pressed:pressed];
                }
            };
            
            /*
             @comment   R2ボタン処理
             */
            _extendedGamePad.leftTrigger.valueChangedHandler = ^(GCControllerButtonInput* button, float value, BOOL pressed) {
                if([_delegate respondsToSelector:@selector(didChangeButtonR2:value:pressed:)]){
                    [_delegate didChangeButtonR2:button value:value pressed:pressed];
                }
            };
            
            /*
             @comment   十字キー処理
             */
            _extendedGamePad.dpad.valueChangedHandler = ^(GCControllerDirectionPad *dpad, float xValue, float yValue) {
                if([_delegate respondsToSelector:@selector(didChangeDirectionPad:xValue:yValue:)]){
                    [_delegate didChangeDirectionPad:dpad xValue:xValue yValue:yValue];
                }
            };
            
            /*
             @comment   左スティック処理
             */
            _extendedGamePad.leftThumbstick.valueChangedHandler = ^(GCControllerDirectionPad *dpad, float xValue, float yValue) {
                if([_delegate respondsToSelector:@selector(didChangeLeftStick:xValue:yValue:)]){
                    [_delegate didChangeLeftStick:dpad xValue:xValue yValue:yValue];
                }
            };
            
            /*
             @comment   右スティック処理
             */
            _extendedGamePad.rightThumbstick.valueChangedHandler = ^(GCControllerDirectionPad *dpad, float xValue, float yValue) {
                if([_delegate respondsToSelector:@selector(didChangeRightStick:xValue:yValue:)]){
                    [_delegate didChangeRightStick:dpad xValue:xValue yValue:yValue];
                }
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
