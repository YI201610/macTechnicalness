//
//  iOSMTHIDeviceController.h
//  macTechnicalness
//
//  Created by Yuji Imamura on 2014/12/08.
//
//

#import <Foundation/Foundation.h>
#import <GameController/GameController.h>

@protocol iOSMTHIDDeviceConnectionDelegate <NSObject>

@required

- (void) didHIDeviceConnect;
- (void) didHIDeviceDisconnect;

@end

@protocol iOSMTHIDeviceValueChangeDelegate <NSObject>

@optional

/*!
 @abstract  ポーズボタン押下時処理
 */
- (void) didPushPauseButton:(GCController*)controller;

/*!
 @abstract  ボタンA押下時処理
 */
- (void) didChangeButtonA:(GCControllerButtonInput*)button
                    value:(float)value
                  pressed:(BOOL)pressed;

- (void) didChangeButtonB:(GCControllerButtonInput*)button
                    value:(float)value
                  pressed:(BOOL)pressed;

- (void) didChangeButtonX:(GCControllerButtonInput*)button
                    value:(float)value
                  pressed:(BOOL)pressed;

- (void) didChangeButtonY:(GCControllerButtonInput*)button
                    value:(float)value
                  pressed:(BOOL)pressed;

- (void) didChangeButtonL1:(GCControllerButtonInput*)button
                     value:(float)value
                   pressed:(BOOL)pressed;

- (void) didChangeButtonL2:(GCControllerButtonInput*)button
                     value:(float)value
                   pressed:(BOOL)pressed;

- (void) didChangeButtonR1:(GCControllerButtonInput*)button
                     value:(float)value
                   pressed:(BOOL)pressed;

- (void) didChangeButtonR2:(GCControllerButtonInput*)button
                     value:(float)value
                   pressed:(BOOL)pressed;

- (void) didChangeDirectionPad:(GCControllerDirectionPad*)dpad
                        xValue:(float)xValue
                        yValue:(float)yValue;

- (void) didChangeLeftStick:(GCControllerDirectionPad*)leftStick
                     xValue:(float)xValue
                     yValue:(float)yValue;

- (void) didChangeRightStick:(GCControllerDirectionPad*)rightStick
                      xValue:(float)xValue
                      yValue:(float)yValue;

@end

@interface iOSMTHIDeviceController : NSObject

/*!
 @abstract  Human Interface Deviceハンドラのデリゲートオブジェクト
 */
@property (nonatomic, weak) id<iOSMTHIDeviceValueChangeDelegate> valueChangeDelegate;

/*!
 @abstract  HID接続/切断処理のデリゲートオブジェクト
 */
@property (nonatomic, weak) id<iOSMTHIDDeviceConnectionDelegate> connectionDelegate;

/*!
 @abstract  Game Controllerと接続しているか
 */
@property BOOL isGameControllerConnected;

/*!
 @abstract  ゲームパッドを表現するコンポジットクラス
 */
@property (nonatomic, strong) GCExtendedGamepad* extendedGamePad;

/*!
 @abstract
 */
@property (nonatomic, strong) GCController* gameController;

/*!
 @abstract  Game Controllerと接続した際にiOSにコールしてもらいたいメソッド
 */
- (void)gameControllerDidConnect:(id)notification;

/*!
 @abstract  Game Controllerとの接続が切断された際に、iOSからコールしてもらいたいメソッド
 */
- (void)gameControllerDidDisconnect:(id)notification;

@end


