//
//  MTSKBasicTransition2Scene.h
//  macTechnicalness
//
//  Created by Yuji Imamura on 2015/05/10.
//
//

#import <SpriteKit/SpriteKit.h>
#import "MTSKBasicsSceneController.h"

@interface MTSKBasicTransition2Scene : SKScene

/*!
 @abstract
 */
@property (nonatomic, weak) MTSKBasicsSceneController* sceneController;

/*!
 @abstract
 */
+ (instancetype)unarchiveScene;

@end
