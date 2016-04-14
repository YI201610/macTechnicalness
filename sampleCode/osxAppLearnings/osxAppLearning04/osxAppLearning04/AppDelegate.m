//
//  AppDelegate.m
//  osxAppLearning04
//
//  Created by Yuji Imamura on 2014/03/10.
//  Copyright (c) 2014年 Yuji Imamura. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

#pragma mark - NSApplicationDelegate

- (void)applicationWillFinishLaunching:(NSNotification *)notification
{
    _methodname_;
}

- (void)applicationWillHide:(NSNotification *)notification
{
    _methodname_;
    
}

- (void)applicationDidHide:(NSNotification *)notification
{
    _methodname_;
}

- (void)applicationWillUnhide:(NSNotification *)notification
{
    _methodname_;
}

- (void)applicationDidUnhide:(NSNotification *)notification
{
    _methodname_;
}

- (void)applicationWillBecomeActive:(NSNotification *)notification
{
    _methodname_;
}

- (void)applicationDidBecomeActive:(NSNotification *)notification
{
    _methodname_;
}

- (void)applicationWillResignActive:(NSNotification *)notification
{
    _methodname_;
}

- (void)applicationDidResignActive:(NSNotification *)notification
{
    _methodname_;
}

- (void)applicationWillUpdate:(NSNotification *)notification
{
    _methodname_;
}

- (void)applicationDidUpdate:(NSNotification *)notification
{
    _methodname_;
}

- (void)applicationWillTerminate:(NSNotification *)notification
{
    _methodname_;
}

- (void)applicationDidChangeScreenParameters:(NSNotification *)notification
{
    _methodname_;
}


/*!
 @abstract terminate application when the red button selected.
 */
- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender
{
    _methodname_;
    
    return YES;
}

- (BOOL)applicationShouldHandleReopen:(NSApplication *)sender hasVisibleWindows:(BOOL)flag
{
    _methodname_;
    debugout(@"flag : %d", flag);
    
    [self.window orderFront:self];
    return YES;
}

#pragma mark - Button Action

- (IBAction)onSampleButton:(id)sender {
    _methodname_;
    
}


- (IBAction)sampleAction01:(id)sender {
    _methodname_;
    
    _sampleLabel.stringValue = @"hello, world!";
}

- (IBAction)onSampleButton2:(NSButton *)sender {
    _methodname_;
    
    _sampleLabel.stringValue = @"sample Button2!";
}


- (IBAction)onButtonGeneric:(id)sender {
    _methodname_;
    
    NSString* tmpTitle = @"test";
    if([_window.title isEqualToString:tmpTitle]){
        _window.title = @"generic button method did called.";
    }else{
        _window.title = tmpTitle;
    }
}

@end
