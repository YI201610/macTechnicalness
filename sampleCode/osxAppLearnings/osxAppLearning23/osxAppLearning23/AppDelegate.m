//
//  AppDelegate.m
//  osxAppLearning23
//
//  Created by Yuji Imamura on 2014/10/19.
//  Copyright (c) 2014年 Yuji Imamura. All rights reserved.
//

#import "AppDelegate.h"
#import "CommonHeader.h"


@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    _methodname_;
    // Insert code here to initialize your application
    
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    _methodname_;
    // Insert code here to tear down your application
    
}

/*!
 @abstract terminate application when the red button selected.
 */
- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender
{
    _methodname_;
    
    return YES;
}

@end
