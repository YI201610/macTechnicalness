//
//  iOSMTSpriteKitParticleTemplateBokehViewController.m
//  macTechnicalness
//
//  Created by Yuji Imamura on 2015/04/20.
//
//

#import "iOSMTSpriteKitParticleTemplateBokehViewController.h"
#import <SpriteKit/SpriteKit.h>
#import "SpriteKitTemplateScene.h"

@interface iOSMTSpriteKitParticleTemplateBokehViewController ()

@end

@implementation iOSMTSpriteKitParticleTemplateBokehViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    SKView * skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    skView.ignoresSiblingOrder = YES;
    
    SpriteKitTemplateScene *scene = [SpriteKitTemplateScene unarchiveWithParticleName:@"Bokeh"];
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
