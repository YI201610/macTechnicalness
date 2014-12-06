//
//  iOSMTGameControllerVerification1ViewController.m
//  macTechnicalness
//
//  Created by Yuji Imamura on 2014/12/06.
//
//

#import "iOSMTGameControllerVerification1ViewController.h"
#import "CommonHeader.h"

@interface iOSMTGameControllerVerification1ViewController ()

@end

@implementation iOSMTGameControllerVerification1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    /*!
     @comment   ゲームコントローラーが接続されたら、ゲームコントローラーテスター画面を表示する。
     */
    [[NSNotificationCenter defaultCenter] addObserverForName:GCControllerDidConnectNotification
                                                      object:nil
                                                       queue:nil
                                                  usingBlock:^(NSNotification *notification){
                                                      debugout(@"ゲームコントローラーが接続されました...");
                                                  }
     ];
    
    /*!
     @comment   ゲームコントローラーの接続が切れたら、接続画面を表示する。
     */
    [[NSNotificationCenter defaultCenter] addObserverForName:GCControllerDidDisconnectNotification
                                                      object:nil
                                                       queue:nil
                                                  usingBlock:^(NSNotification *notification){
                                                      debugout(@"ゲームコントローラーとの通信が切断されました...");
                                                  }
     ];

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
