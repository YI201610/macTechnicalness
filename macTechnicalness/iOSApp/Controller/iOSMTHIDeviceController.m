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
- (void)gameControllerDidConnect:(id)notification
{
    _methodname_;
    debugout(@"notification: %@", notification);
    
    /*!
     @comment
     */
    _isGameControllerConnected = YES;
    
    /*!
     @comment
     */
    NSArray *controllers = [GCController controllers];
    for (GCController *controller in controllers) {
        debugout(@"**controller: %@", controller);
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
