//
//  OSXA19SecondWindowController.m
//  osxAppLearning19
//
//  Created by Yuji Imamura on 2014/08/27.
//  Copyright (c) 2014年 Yuji Imamura. All rights reserved.
//

#import "OSXA19SecondWindowController.h"
#import "CommonHeader.h"


@interface OSXA19SecondWindowController ()

@end

@implementation OSXA19SecondWindowController

- (void)awakeFromNib
{
    _methodname_;
    
}

-(id)initWithWindow:(NSWindow *)window
{
    _methodname_;
    self = [super initWithWindow:window];
    if(self){
    }
    
    return self;
}

- (instancetype)init
{
    _methodname_;
    self = [super init];
    if (self) {
    }
    return self;
}



- (void)windowDidLoad {
    _methodname_;
    
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

/*!
 @abstract terminate application when the red button selected.
 */
- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender
{
    _methodname_;
    
    
    return YES;
}


- (void)dealloc
{
    _methodname_;
}

@end
