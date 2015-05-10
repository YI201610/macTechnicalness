//
//  MTSKBasicsSceneController.m
//  macTechnicalness
//
//  Created by Yuji Imamura on 2015/05/10.
//
//

#import "MTSKBasicsSceneController.h"
#import "CommonHeader.h"

#import "MTSKBasicTransition1Scene.h"
#import "MTSKBasicTransition2Scene.h"

@implementation MTSKBasicsSceneController

- (void) gotoScene1WithCurrentSKScene:(SKScene*) nextScene
{
    _methodname_;
    MTSKBasicTransition1Scene* scene1 = [MTSKBasicTransition1Scene unarchiveScene];
    
    SKTransition* transition = [SKTransition doorwayWithDuration:3.0f];
    
    [_skView presentScene:scene1 transition:transition];
}

- (void) gotoScene2WithCurrentSKScene:(SKScene*) nextScene
{
    _methodname_;
 
    MTSKBasicTransition2Scene* scene2 = [MTSKBasicTransition2Scene unarchiveScene];
    
    SKTransition* transition = [SKTransition doorsCloseVerticalWithDuration:2];
    
    [_skView presentScene:scene2 transition:transition];

}


@end
