//
//  iOSMTSKBasicsTransition1ViewController.m
//  macTechnicalness
//
//  Created by Yuji Imamura on 2015/05/10.
//
//

#import "iOSMTSKBasicsTransition1ViewController.h"
#import "MTSKBasicsSceneController.h"

@interface iOSMTSKBasicsTransition1ViewController ()

@property (nonatomic, strong) MTSKBasicsSceneController* skSceneController;

@end

@implementation iOSMTSKBasicsTransition1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _skView.showsFPS = YES;
    _skView.showsNodeCount = YES;
    
    _skSceneController = [MTSKBasicsSceneController new];
    _skSceneController.skView = _skView;
    
    /*
     @comment
     */
    [_skSceneController gotoScene1WithCurrentSKScene:nil];
    
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
