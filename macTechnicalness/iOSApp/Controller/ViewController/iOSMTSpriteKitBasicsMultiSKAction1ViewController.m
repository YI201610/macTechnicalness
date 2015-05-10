//
//  iOSMTSpriteKitBasicsScale1ViewController.m
//  macTechnicalness
//
//  Created by Yuji Imamura on 2015/05/10.
//
//

#import "iOSMTSpriteKitBasicsMultiSKAction1ViewController.h"
#import "MTSKBasicsMultiActionScene1.h"

@interface iOSMTSpriteKitBasicsMultiSKAction1ViewController ()

@end

@implementation iOSMTSpriteKitBasicsMultiSKAction1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _spriteKitView.showsFPS = YES;
    _spriteKitView.showsNodeCount = YES;

    /*
     @comment   アーカイブからSKシーンを作成
     */
    MTSKBasicsMultiActionScene1* spriteKitScene = [MTSKBasicsMultiActionScene1 unarchiveScene];
    
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
