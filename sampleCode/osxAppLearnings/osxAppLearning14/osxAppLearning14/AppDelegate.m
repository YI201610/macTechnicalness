//
//  AppDelegate.m
//  osxAppLearning14
//
//  Created by Yuji Imamura on 2014/07/23.
//  Copyright (c) 2014年 Yuji Imamura. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;

@property (weak) IBOutlet NSTextField *label01;
@end

@implementation AppDelegate
            
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
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

- (IBAction)tb1Action:(NSToolbarItem *)sender {
    _methodname_;
    _label01.stringValue = @"tb1を選択しました";
}

- (IBAction)tb2Action:(id)sender {
    _methodname_;
    _label01.stringValue = @"tb2を選択しました";
}

- (IBAction)tb3Action:(NSToolbarItem *)sender {
    _methodname_;
    _label01.stringValue = [NSString stringWithFormat:@"%@を選択しました。", sender.label];
}



@end
