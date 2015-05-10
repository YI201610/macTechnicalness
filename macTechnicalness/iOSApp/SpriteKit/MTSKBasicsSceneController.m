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

@interface MTSKBasicsSceneController()

@property NSInteger transitionNoValue;

@end

@implementation MTSKBasicsSceneController

/*!
 @abstract
 */
- (SKTransition*) transitionObj
{
    NSInteger duration = 1.0;
    SKTransition* transition = nil;
    
    switch (_transitionNoValue) {
        case 0: transition = [SKTransition crossFadeWithDuration:duration]; break;
        case 1: transition = [SKTransition fadeWithDuration:duration]; break;
        case 2: transition = [SKTransition fadeWithColor:[UIColor purpleColor] duration:duration]; break;
        
        case 3: transition = [SKTransition flipHorizontalWithDuration:duration]; break;
        case 4: transition = [SKTransition flipVerticalWithDuration:duration]; break;

        case 5: transition = [SKTransition revealWithDirection:SKTransitionDirectionUp duration:duration]; break;
        case 6: transition = [SKTransition revealWithDirection:SKTransitionDirectionDown duration:duration]; break;
        case 7: transition = [SKTransition revealWithDirection:SKTransitionDirectionRight duration:duration]; break;
        case 8: transition = [SKTransition revealWithDirection:SKTransitionDirectionLeft duration:duration]; break;

        case 9: transition = [SKTransition moveInWithDirection:SKTransitionDirectionUp duration:duration]; break;
        case 10: transition = [SKTransition moveInWithDirection:SKTransitionDirectionDown duration:duration]; break;
        case 11: transition = [SKTransition moveInWithDirection:SKTransitionDirectionRight duration:duration]; break;
        case 12: transition = [SKTransition moveInWithDirection:SKTransitionDirectionLeft duration:duration]; break;

        case 13: transition = [SKTransition pushWithDirection:SKTransitionDirectionUp duration:duration]; break;
        case 14: transition = [SKTransition pushWithDirection:SKTransitionDirectionDown duration:duration]; break;
        case 15: transition = [SKTransition pushWithDirection:SKTransitionDirectionRight duration:duration]; break;
        case 16: transition = [SKTransition pushWithDirection:SKTransitionDirectionLeft duration:duration]; break;

        case 17: transition = [SKTransition doorsOpenHorizontalWithDuration:duration]; break;
        case 18: transition = [SKTransition doorsOpenVerticalWithDuration:duration]; break;
        case 19: transition = [SKTransition doorsCloseHorizontalWithDuration:duration]; break;
        case 20: transition = [SKTransition doorsCloseVerticalWithDuration:duration]; break;

        case 21: transition = [SKTransition doorwayWithDuration:duration]; break;

        default:
            transition = [SKTransition doorwayWithDuration:duration]; break;
            break;
    }
    
    _transitionNoValue++;
    
    if(_transitionNoValue>21){
        _transitionNoValue = 0;
    }
    
    return transition;
}

- (void) gotoScene1WithCurrentSKScene:(SKScene*) nextScene
{
    _methodname_;
    MTSKBasicTransition1Scene* scene1 = [MTSKBasicTransition1Scene unarchiveScene];
    scene1.sceneController = self;
    
    SKTransition* transition = [self transitionObj];
    debugout(@"transition: %@", transition);
    
    [_skView presentScene:scene1 transition:transition];
}

- (void) gotoScene2WithCurrentSKScene:(SKScene*) nextScene
{
    _methodname_;
 
    MTSKBasicTransition2Scene* scene2 = [MTSKBasicTransition2Scene unarchiveScene];
    scene2.sceneController = self;
    
    SKTransition* transition = [self transitionObj];
    debugout(@"transition: %@", transition);
    
    [_skView presentScene:scene2 transition:transition];

}


@end
