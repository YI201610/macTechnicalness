//
//  iOSMTAutoLayoutCase1ElementView.h
//  macTechnicalness
//
//  Created by Yuji Imamura on 2015/02/17.
//
//

#import <UIKit/UIKit.h>

@interface iOSMTAutoLayoutCase1ElementView : UIView

/*!
 @abstract
 */
@property (weak, nonatomic) IBOutlet UILabel *someLabel;

/*!
 @abstract
 */
@property (weak, nonatomic) IBOutlet UIButton *someButton;

/*!
 @abstract
 */
+ (instancetype)viewObj;

@end
