//
//  MTSKBasicsSceneController.h
//  macTechnicalness
//
//  Created by Yuji Imamura on 2015/05/10.
//
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

@interface MTSKBasicsSceneController : NSObject

/*!
 @abstract   UIViewControllerが管理している、SKViewへのポインタ
 */
@property (nonatomic, weak) SKView* skView;

- (void) gotoScene1WithCurrentSKScene:(SKScene*) currentScene;
- (void) gotoScene2WithCurrentSKScene:(SKScene*) currentScene;

@end
