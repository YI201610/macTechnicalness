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
            
            /*!
             @comment   ゲームコントローラ接続処理デリゲートに、接続完了を伝達
             */
            if([_connectionDelegate respondsToSelector:@selector(didHIDeviceConnect)]){
                [_connectionDelegate didHIDeviceConnect];
            }
            
            //各種ハンドラ処理の開始
            
            
            /*
             @comment
             */
            _gameController.controllerPausedHandler = ^(GCController* controller) {
                
                if([_valueChangeDelegate respondsToSelector:@selector(didPushPauseButton:)]){
                    [_valueChangeDelegate didPushPauseButton:controller];
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
                if([_valueChangeDelegate respondsToSelector:@selector(didChangeButtonA:value:pressed:)]){
                    [_valueChangeDelegate didChangeButtonA:button value:value pressed:pressed];
                }
            };
            
            /*
             @comment   Bボタン処理
             */
            _extendedGamePad.buttonB.valueChangedHandler = ^(GCControllerButtonInput* button, float value, BOOL pressed) {
                if([_valueChangeDelegate respondsToSelector:@selector(didChangeButtonB:value:pressed:)]){
                    [_valueChangeDelegate didChangeButtonB:button value:value pressed:pressed];
                }
            };
            
            /*
             @comment   Xボタン処理
             */
            _extendedGamePad.buttonX.valueChangedHandler = ^(GCControllerButtonInput* button, float value, BOOL pressed) {
                if([_valueChangeDelegate respondsToSelector:@selector(didChangeButtonX:value:pressed:)]){
                    [_valueChangeDelegate didChangeButtonX:button value:value pressed:pressed];
                }
            };
            
            /*
             @comment   Yボタン処理
             */
            _extendedGamePad.buttonY.valueChangedHandler = ^(GCControllerButtonInput* button, float value, BOOL pressed) {
                if([_valueChangeDelegate respondsToSelector:@selector(didChangeButtonY:value:pressed:)]){
                    [_valueChangeDelegate didChangeButtonY:button value:value pressed:pressed];
                }
            };
            
            /*
             @comment   L1ボタン処理
             */
            _extendedGamePad.rightShoulder.valueChangedHandler = ^(GCControllerButtonInput* button, float value, BOOL pressed) {
                if([_valueChangeDelegate respondsToSelector:@selector(didChangeButtonL1:value:pressed:)]){
                    [_valueChangeDelegate didChangeButtonL1:button value:value pressed:pressed];
                }
            };
            
            /*
             @comment   L2ボタン処理
             */
            _extendedGamePad.rightTrigger.valueChangedHandler = ^(GCControllerButtonInput* button, float value, BOOL pressed) {
                if([_valueChangeDelegate respondsToSelector:@selector(didChangeButtonL2:value:pressed:)]){
                    [_valueChangeDelegate didChangeButtonL2:button value:value pressed:pressed];
                }
            };
            
            /*
             @comment   R1ボタン処理
             */
            _extendedGamePad.leftShoulder.valueChangedHandler = ^(GCControllerButtonInput* button, float value, BOOL pressed) {
                if([_valueChangeDelegate respondsToSelector:@selector(didChangeButtonR1:value:pressed:)]){
                    [_valueChangeDelegate didChangeButtonR1:button value:value pressed:pressed];
                }
            };
            
            /*
             @comment   R2ボタン処理
             */
            _extendedGamePad.leftTrigger.valueChangedHandler = ^(GCControllerButtonInput* button, float value, BOOL pressed) {
                if([_valueChangeDelegate respondsToSelector:@selector(didChangeButtonR2:value:pressed:)]){
                    [_valueChangeDelegate didChangeButtonR2:button value:value pressed:pressed];
                }
            };
            
            /*
             @comment   十字キー処理
             */
            _extendedGamePad.dpad.valueChangedHandler = ^(GCControllerDirectionPad *dpad, float xValue, float yValue) {
                if([_valueChangeDelegate respondsToSelector:@selector(didChangeDirectionPad:xValue:yValue:)]){
                    [_valueChangeDelegate didChangeDirectionPad:dpad xValue:xValue yValue:yValue];
                }
            };
            
            /*
             @comment   左スティック処理
             */
            _extendedGamePad.leftThumbstick.valueChangedHandler = ^(GCControllerDirectionPad *dpad, float xValue, float yValue) {
                if([_valueChangeDelegate respondsToSelector:@selector(didChangeLeftStick:xValue:yValue:)]){
                    [_valueChangeDelegate didChangeLeftStick:dpad xValue:xValue yValue:yValue];
                }
            };
            
            /*
             @comment   右スティック処理
             */
            _extendedGamePad.rightThumbstick.valueChangedHandler = ^(GCControllerDirectionPad *dpad, float xValue, float yValue) {
                if([_valueChangeDelegate respondsToSelector:@selector(didChangeRightStick:xValue:yValue:)]){
                    [_valueChangeDelegate didChangeRightStick:dpad xValue:xValue yValue:yValue];
                }
            };
        }
    }
    

}

- (void)gameControllerDidDisconnect:(id)notification
{
    _methodname_;
    debugout(@"notification: %@", notification);
    
    if([_connectionDelegate respondsToSelector:@selector(didHIDeviceDisconnect)]){
        [_connectionDelegate didHIDeviceDisconnect];
    }
    
    /*!
     @comment
     */
    _isGameControllerConnected = NO;
    
}

@end
