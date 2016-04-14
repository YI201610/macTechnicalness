//
//  AppDelegate.m
//  osxAppLearning05
//
//  Created by Yuji Imamura on 2014/03/30.
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

#pragma mark - button


- (IBAction)onButton1:(NSButton *)sender {
    _methodname_;
    
    _button2.title = @"hogehgoe effect1";
}

- (IBAction)onButton2:(NSButton *)sender {
    _methodname_;

    _button1.title = @"hogehgoe effect2";

    sender.title = @"Hoge Button2";
}


@end
