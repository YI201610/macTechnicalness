//
//  AppDelegate.m
//  osxAppLearning07
//
//  Created by Yuji Imamura on 2014/04/08.
//  Copyright (c) 2014年 Yuji Imamura. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    
    _hogeCommandMenuItem.title = @"quit this App from custom Menu Item.";
    
}

/*!
 @abstract terminate application when the red button selected.
 */
- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender
{
    _methodname_;
    
    return YES;
}


/* Command+Hは、Xcodeのコマンドとバッティングしている？*/
- (IBAction)onHogeMenuCommand:(NSMenuItem *)sender {
    _methodname_;
 
    [NSApp terminate:self];
}

@end
