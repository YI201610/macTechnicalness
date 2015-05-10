//
//  iOSMTSpriteKitBasicsScale1ViewController.m
//  macTechnicalness
//
//  Created by Yuji Imamura on 2015/05/10.
//
//

#import "iOSMTSpriteKitBasicsScale1ViewController.h"
#import "MTSKBasicsScale1Scene.h"

@interface iOSMTSpriteKitBasicsScale1ViewController ()

@end

@implementation iOSMTSpriteKitBasicsScale1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _spriteKitView.showsFPS = YES;
    _spriteKitView.showsNodeCount = YES;

    /*
     @comment   アーカイブからSKシーンを作成
     */
    MTSKBasicsScale1Scene* spriteKitScene = [MTSKBasicsScale1Scene unarchiveScene];
    
    /*
     @comment   シーンを表示
     */
    [_spriteKitView presentScene:spriteKitScene];
    
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
