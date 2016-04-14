//
//  AppDelegate.h
//  osxAppLearning04
//
//  Created by Yuji Imamura on 2014/03/10.
//  Copyright (c) 2014年 Yuji Imamura. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

@property (weak) IBOutlet NSTextField *sampleLabel;

- (IBAction)sampleAction01:(id)sender;

@end
