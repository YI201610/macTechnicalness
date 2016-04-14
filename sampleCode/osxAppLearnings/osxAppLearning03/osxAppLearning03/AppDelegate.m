//
//  AppDelegate.m
//  osxAppLearning03
//
//  Created by Yuji Imamura on 2014/02/25.
//  Copyright (c) 2014年 Yuji Imamura. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate() {
    __weak NSTextField *_labelTestString;
}

@property (weak) IBOutlet NSTextField *labelTestString;
@property (weak) IBOutlet NSTextField *labelAppStatusString;

@property (weak) IBOutlet NSTextField *labelTest01;
@property (weak) IBOutlet NSTextField *labelTest02;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    _labelTestString.stringValue = @"Hello, osxAppLesson03!";
    
    _labelTest01.stringValue = @"Hello, testLabel1";
    _labelTest02.stringValue = @"Hello, testLabel2";
}

/*!
 @abstract terminate application when the red button selected.
 */
//- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender
//{
//    _methodname_;
//    
//    return YES;
//}


#pragma mark - NSApplicationDelegate

- (void)applicationWillFinishLaunching:(NSNotification *)notification
{
    _methodname_;
    _labelAppStatusString.stringValue = NSStringFromSelector(_cmd);
}

- (void)applicationWillHide:(NSNotification *)notification
{
    _methodname_;
    _labelAppStatusString.stringValue = NSStringFromSelector(_cmd);
}

- (void)applicationDidHide:(NSNotification *)notification
{
    _methodname_;
    _labelAppStatusString.stringValue = NSStringFromSelector(_cmd);
}

- (void)applicationWillUnhide:(NSNotification *)notification
{
    _methodname_;
    _labelAppStatusString.stringValue = NSStringFromSelector(_cmd);
}

- (void)applicationDidUnhide:(NSNotification *)notification
{
    _methodname_;
    _labelAppStatusString.stringValue = NSStringFromSelector(_cmd);
}

- (void)applicationWillBecomeActive:(NSNotification *)notification
{
    _methodname_;
    _labelAppStatusString.stringValue = NSStringFromSelector(_cmd);
}

- (void)applicationDidBecomeActive:(NSNotification *)notification
{
    _methodname_;
    _labelAppStatusString.stringValue = NSStringFromSelector(_cmd);
}

- (void)applicationWillResignActive:(NSNotification *)notification
{
    _methodname_;
    _labelAppStatusString.stringValue = NSStringFromSelector(_cmd);
}

- (void)applicationDidResignActive:(NSNotification *)notification
{
    _methodname_;
}

- (void)applicationWillUpdate:(NSNotification *)notification
{
    _methodname_;
//    _labelAppStatusString.stringValue = NSStringFromSelector(_cmd);
}

- (void)applicationDidUpdate:(NSNotification *)notification
{
    _methodname_;
//    _labelAppStatusString.stringValue = NSStringFromSelector(_cmd);
}

- (void)applicationWillTerminate:(NSNotification *)notification
{
    _methodname_;
    _labelAppStatusString.stringValue = NSStringFromSelector(_cmd);
}

- (void)applicationDidChangeScreenParameters:(NSNotification *)notification
{
    _methodname_;
    _labelAppStatusString.stringValue = NSStringFromSelector(_cmd);
}

#pragma mark - 

/*!
 @return YES if you want the application to perform its normal tasks or NO if you want the application to do nothing.
 */
- (BOOL)applicationShouldHandleReopen:(NSApplication *)sender hasVisibleWindows:(BOOL)flag
{
    _methodname_;
    debugout(@"flag : %d", flag);
    
    [self.window orderFront:self];
    return NO;
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
