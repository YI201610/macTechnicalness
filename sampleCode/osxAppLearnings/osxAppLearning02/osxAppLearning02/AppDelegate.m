//
//  AppDelegate.m
//  osxAppLearning02
//
//  Created by Yuji Imamura on 2014/02/23.
//  Copyright (c) 2014年 Yuji Imamura. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

-(id)init
{
    _methodname_;
    
    self = [super init];
    if(!self){
        return nil;
    }
    return self;
}

/*!
 @abstract  GUIを初期化するのに適したタイミングの１つ
 */
- (void) awakeFromNib
{
    _methodname_;
    
    NSDate* date = [NSDate date];
    self.window.title = [date description];
    
}

#pragma mark - NSApplicationDelegate

- (void)applicationWillFinishLaunching:(NSNotification *)notification
{
    _methodname_;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    _methodname_;
    
    // Insert code here to initialize your application
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



@end
