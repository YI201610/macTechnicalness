//
//  iOSMTSpriteKitParticleTemplateFireViewController.m
//  macTechnicalness
//
//  Created by Yuji Imamura on 2015/04/20.
//
//

#import "iOSMTSpriteKitParticleTemplateFireViewController.h"
#import <SpriteKit/SpriteKit.h>
#import "SpriteKitTemplateScene.h"

@interface iOSMTSpriteKitParticleTemplateFireViewController ()

@end

@implementation iOSMTSpriteKitParticleTemplateFireViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    SKView* skView = [SKView new];
    self.view = skView;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    skView.ignoresSiblingOrder = YES;
    
    SpriteKitTemplateScene *scene = [SpriteKitTemplateScene unarchiveWithParticleName:@"Fire"];
    //    scene.positionTypeValue = 1;
    scene.scaleMode = SKSceneScaleModeAspectFill;
    [skView presentScene:scene];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
