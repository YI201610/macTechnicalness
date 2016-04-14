//
//  ViewController.h
//  osxAppLearning11
//
//  Created by Yuji Imamura on 2014/06/30.
//  Copyright (c) 2014年 Yuji Imamura. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController

@property (weak) IBOutlet NSTextField *filePathTextField;
@property (weak) IBOutlet NSTextField *imagePathTextField;
@property (weak) IBOutlet NSTextField *savePathTextField;

@property (weak) IBOutlet NSMatrix *radioButtons;

@end

