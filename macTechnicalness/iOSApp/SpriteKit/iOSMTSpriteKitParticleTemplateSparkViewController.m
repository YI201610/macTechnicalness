//
//  iOSMTSpriteKitParticleTemplateSparkViewController.m
//  macTechnicalness
//
//  Created by Yuji Imamura on 2015/04/20.
//
//

#import "iOSMTSpriteKitParticleTemplateSparkViewController.h"
#import <SpriteKit/SpriteKit.h>
#import "SpriteKitTemplateScene.h"

@interface iOSMTSpriteKitParticleTemplateSparkViewController ()

@end

@implementation iOSMTSpriteKitParticleTemplateSparkViewController



#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /*
     @comment   ルートSKViewの設定
     */
    SKView* skView = [SKView new];
    self.view = skView;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    
    /* Sprite Kit applies additional optimizations to improve rendering performance */
    /*
     @comment   このフラグをYESにすると、パフォーマンスが少し向上する。
     */
    skView.ignoresSiblingOrder = YES;
    
    // Create and configure the scene.
    /*
     @comment   SKViewにはっつける、シーンを作成する。
     */
    SpriteKitTemplateScene *scene = [SpriteKitTemplateScene unarchiveWithParticleName:@"Spark"];
    /*
     @comment   シーンのはっつけ方を設定する。
     */
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    // Present the scene.
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
