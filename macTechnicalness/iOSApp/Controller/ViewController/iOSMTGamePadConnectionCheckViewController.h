//
//  iOSMTGameControllerConnectionCheckViewController.h
//  macTechnicalness
//
//  Created by Yuji Imamura on 2014/12/07.
//
//

#import <UIKit/UIKit.h>
#import "iOSMTHIDeviceController.h"
#import "AppDelegate.h"

/*!
 @abstract  Game Controller Frameworkの基本機能を検証する
 --------------
 十字キー,
 左スティック、右スティック

 ボタンは、押下と、押した強さを判定する
 L1, L2,
 R1, R2,
 A, B, X, Y

 ポーズボタンで、検証を終了して戻る
 */
@interface iOSMTGamePadConnectionCheckViewController : UIViewController
<iOSMTHIDeviceDelegate>

@end
