//
//  AppDelegate.h
//  osxAppLearning07
//
//  Created by Yuji Imamura on 2014/04/08.
//  Copyright (c) 2014年 Yuji Imamura. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

@property (weak) IBOutlet NSMenuItem *hogeCommandMenuItem;

@end
