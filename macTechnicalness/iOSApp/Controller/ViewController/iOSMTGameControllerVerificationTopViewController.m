//
//  iOSMTGameControllerVerification1ViewController.m
//  macTechnicalness
//
//  Created by Yuji Imamura on 2014/12/06.
//
//

#import "iOSMTGameControllerVerificationTopViewController.h"
#import "CommonHeader.h"
#import "iOSMTGameControllerConnectionCheckViewController.h"

@interface iOSMTGameControllerVerificationTopViewController ()

@end

@implementation iOSMTGameControllerVerificationTopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

}

- (void)viewWillAppear:(BOOL)animated
{
    /*!
     @comment   ゲームコントローラーとの接続開始を監視し始めます。
     */
    [[NSNotificationCenter defaultCenter] addObserverForName:GCControllerDidConnectNotification
                                                      object:nil
                                                       queue:nil
                                                  usingBlock:^(NSNotification *notification) {
                                                      
                                                      debugout(@"ゲームコントローラーが接続されました.");

                                                      NSArray *controllers = [GCController controllers];
                                                      for (GCController *controller in controllers) {
                                                          debugout(@"**controller: %@", controller);
                                                      }

                                                      iOSMTGameControllerConnectionCheckViewController* viewController = [iOSMTGameControllerConnectionCheckViewController new];
                                                      [self.navigationController pushViewController:viewController animated:YES];
                                                  }
     ];
    
    /*!
     @comment   ゲームコントローラーとの接続切断を監視し始めます。
     */
    [[NSNotificationCenter defaultCenter] addObserverForName:GCControllerDidDisconnectNotification
                                                      object:nil
                                                       queue:nil
                                                  usingBlock:^(NSNotification *notification){
                                                      debugout(@"ゲームコントローラーとの通信が切断されました.");
                                                  }
     ];
    
    /*!
     @comment   ワイヤレスコントローラーとの接続状況を確認し始める。
     */
    [GCController startWirelessControllerDiscoveryWithCompletionHandler:^{
        
        NSArray *controllers = [GCController controllers];
        for (GCController *controller in controllers) {
            debugout(@"controller: %@", controller);
        }
        
    }];
    

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
