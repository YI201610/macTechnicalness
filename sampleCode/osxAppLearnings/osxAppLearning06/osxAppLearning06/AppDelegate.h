//
//  AppDelegate.h
//  osxAppLearning06
//
//  Created by Yuji Imamura on 2014/04/02.
//  Copyright (c) 2014年 Yuji Imamura. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

@property (weak) IBOutlet NSButton *checkbox1;
@property (weak) IBOutlet NSTextField *label1;


@property (weak) IBOutlet NSTextField *subLabel1;
@property (weak) IBOutlet NSTextField *subLabel2;
@property (weak) IBOutlet NSTextField *subLabel3;


- (IBAction)onCheckClicked:(NSButton *)sender;

@end
