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

        /*!
         @comment   拡張ゲームパッドのオブジェクトを取得します。
         */
        if(gameController.extendedGamepad){
            
            _extendedGamePad = gameController.extendedGamepad;
            
            /*!
             @comment
             */
            _isGameControllerConnected = YES;
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
