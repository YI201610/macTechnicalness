//
//  AppDelegate.m
//  osxAppLearning06
//
//  Created by Yuji Imamura on 2014/04/02.
//  Copyright (c) 2014年 Yuji Imamura. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

/*!
 @abstract terminate application when the red button selected.
 */
- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender
{
    _methodname_;
    
    return YES;
}


- (IBAction)onButtonCheck:(NSButton *)sender {
    _methodname_;
    
    if(_checkbox1.state){
        _label1.stringValue = @"on";
    }else{
        _label1.stringValue = @"off";
    }
}

- (void)updateLabelStringWithLabel:(NSTextField*)label state:(BOOL)state
{
    if(state){
        label.stringValue = @"on";
    }else{
        label.stringValue = @"off";
    }
}

- (IBAction)onCheckClicked:(NSButton *)sender {
    _methodname_;
    
    switch (sender.tag) {
        case 1:
        {
            [self updateLabelStringWithLabel:_subLabel1 state:sender.state];
        }
            break;
            
        case 2:
        {
            [self updateLabelStringWithLabel:_subLabel2 state:sender.state];
        }
            break;
            
        case 3:
        {
            [self updateLabelStringWithLabel:_subLabel3 state:sender.state];
        }
            break;
            
        default:
            break;
    }
}

@end
