//
//  AppDelegate.h
//  iOSApp
//
//  Created by Yuji Imamura on 2014/12/01.
//
//

#import <UIKit/UIKit.h>
#import "iOSMTHIDeviceController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

/*!
 @abstract
 */
@property (strong, nonatomic) UIWindow *window;

/*!
 @abstract  Top画面のナビゲーションコントローラー
 */
@property (strong, nonatomic) UINavigationController* myNavigationController;


/*!
 @abstract  Game Controller Support
 */
@property (strong, nonatomic) iOSMTHIDeviceController* hidController;


/*!
 @abstract  外部公開メソッド
 */
+ (AppDelegate*) appDelegate;

@end

