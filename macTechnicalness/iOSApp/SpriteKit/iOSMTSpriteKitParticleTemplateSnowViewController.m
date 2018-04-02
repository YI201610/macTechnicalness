//
//  iOSMTSpriteKitParticleTemplateSnowViewController.m
//  macTechnicalness
//
//  Created by Yuji Imamura on 2015/04/20.
//
//

#import "iOSMTSpriteKitParticleTemplateSnowViewController.h"
#import <SpriteKit/SpriteKit.h>
#import "SpriteKitTemplateScene.h"

@interface iOSMTSpriteKitParticleTemplateSnowViewController ()

@end

@implementation iOSMTSpriteKitParticleTemplateSnowViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    SKView* skView = [SKView new];
    self.view = skView;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    skView.ignoresSiblingOrder = YES;

    SpriteKitTemplateScene *scene = [SpriteKitTemplateScene unarchiveWithParticleName:@"Snow"];
    scene.positionTypeValue = 1;
    scene.scaleMode = SKSceneScaleModeAspectFill;
    [skView presentScene:scene];
}

@end
