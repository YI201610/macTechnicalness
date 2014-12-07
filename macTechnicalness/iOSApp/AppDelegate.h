//
//  AppDelegate.h
//  iOSApp
//
//  Created by Yuji Imamura on 2014/12/01.
//
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

/*!
 @abstract  Top画面のナビゲーションコントローラー
 */
@property (strong, nonatomic) UINavigationController* myNavigationController;

@end

