//
//  MTSKBasicTransition1Scene.h
//  macTechnicalness
//
//  Created by Yuji Imamura on 2015/05/10.
//
//

#import <SpriteKit/SpriteKit.h>
#import "MTSKBasicsSceneController.h"

@interface MTSKBasicTransition1Scene : SKScene

@property (nonatomic, weak) MTSKBasicsSceneController* sceneController;

+ (instancetype)unarchiveScene;



@end
