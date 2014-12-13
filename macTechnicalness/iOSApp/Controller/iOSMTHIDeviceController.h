//
//  iOSMTHIDeviceController.h
//  macTechnicalness
//
//  Created by Yuji Imamura on 2014/12/08.
//
//

#import <Foundation/Foundation.h>
#import <GameController/GameController.h>

@protocol iOSMTHIDeviceDelegate

@optional

/*!
 @abstract  ボタンA押下時処理
 */
- (void) valueChangedButtonA:(GCControllerButtonInput*)button
                       value:(float)value
                     pressed:(BOOL)pressed;

@end

@interface iOSMTHIDeviceController : NSObject

/*!
 @abstract
 */
@property id<iOSMTHIDeviceDelegate> delegate;

/*!
 @abstract  Game Controllerと接続しているか
 */
@property BOOL isGameControllerConnected;

/*!
 @abstract  ゲームパッドを表現するコンポジットクラス
 */
@property (nonatomic, weak) GCExtendedGamepad* extendedGamePad;

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


