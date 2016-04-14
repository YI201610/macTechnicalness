//
//  AppDelegate.h
//  osxAppLearning05
//
//  Created by Yuji Imamura on 2014/03/30.
//  Copyright (c) 2014年 Yuji Imamura. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;


@property (weak) IBOutlet NSButton *button1;
@property (weak) IBOutlet NSButton *button2;

@end
