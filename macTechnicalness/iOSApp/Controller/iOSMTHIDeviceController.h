//
//  iOSMTHIDeviceController.h
//  macTechnicalness
//
//  Created by Yuji Imamura on 2014/12/08.
//
//

#import <Foundation/Foundation.h>
#import <GameController/GameController.h>

@interface iOSMTHIDeviceController : NSObject {
    
    /*!
     @abstract  ゲームコントローラーを表現するコンポジットクラス
     */
    GCExtendedGamepad *_extendedGamePad;

}

/*!
 @abstract  Game Controllerと接続しているか
 */
@property BOOL isGameControllerConnected;

/*!
 @abstract  Game Controllerと接続した際にiOSにコールしてもらいたいメソッド
 */
- (void)gameControllerDidConnect:(id)notification;

/*!
 @abstract  Game Controllerとの接続が切断された際に、iOSからコールしてもらいたいメソッド
 */
- (void)gameControllerDidDisconnect:(id)notification;

@end
