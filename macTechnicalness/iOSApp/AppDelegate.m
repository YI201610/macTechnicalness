//
//  AppDelegate.m
//  iOSApp
//
//  Created by Yuji Imamura on 2014/12/01.
//
//

#import "AppDelegate.h"
#import "iOSMTTopViewController.h"
#import <GameController/GameController.h>
#import "CommonHeader.h"
#import "iOSMTHIDeviceController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate

#pragma mark - UIApplication Delegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    /*
     @comment   自動ロックしない
     */
    [application setIdleTimerDisabled:YES];

    /*!
     @comment
     */
    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    /*!
     @comment
     */
    iOSMTTopViewController* topViewController = [iOSMTTopViewController new];
    
    /*
     @comment   Top画面と共に、ナビゲーションコントローラーを作成します。
     */
    _myNavigationController = [[UINavigationController alloc] initWithRootViewController:topViewController];
    _window.rootViewController = _myNavigationController;
    
    /*!
     @comment
     */
    [_window makeKeyAndVisible];
 

    /*!
     @comment   Game Controllerハンドラーオブジェクトを作成します。
     */
    _hidController = [iOSMTHIDeviceController new];
    
    /*!
     @comment   ゲームコントローラーとの接続監視を開始します。
                このタイミングで行う理由は、なぜか、
                アプリ内部のViewControllerの初期処理のタイミングでは、アプリ起動前からの接続を検知できなかったためです。
     */
    NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];

    [nc addObserver:_hidController
           selector:@selector(gameControllerDidConnect:)
               name:GCControllerDidConnectNotification
             object:nil];   //iOS8.1.1 - ここ、nilでないと正常動作しなかった
    
    [nc addObserver:_hidController
           selector:@selector(gameControllerDidDisconnect:)
               name:GCControllerDidDisconnectNotification
             object:nil];   //iOS8.1.1 - ここ、nilでないと正常動作しなかった
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - WatchKit Extension

- (void)application:(UIApplication *)application handleWatchKitExtensionRequest:(NSDictionary *)userInfo reply:(void (^)(NSDictionary *))reply
{
    _methodname_;

    /*
     @comment
     */
    __block UIBackgroundTaskIdentifier identifier = UIBackgroundTaskInvalid;

    dispatch_block_t endBlock = ^{
        if (identifier != UIBackgroundTaskInvalid) {
            [application endBackgroundTask:identifier];
        }
        identifier = UIBackgroundTaskInvalid;
    };

    identifier = [application beginBackgroundTaskWithExpirationHandler:endBlock];

    
    /*
     @comment
     */
    reply = ^(NSDictionary *replyInfo) {
        reply(replyInfo);
        endBlock();
    };

    NSString* returnBuffer = [NSString stringWithFormat:@"[Background Task]data(%@)", userInfo];
    reply(@{@"Confirmation" : returnBuffer});
    
    
}

#pragma mark - Public

+ (AppDelegate*) appDelegate
{
    return (AppDelegate*)[[UIApplication sharedApplication] delegate];
}


@end
