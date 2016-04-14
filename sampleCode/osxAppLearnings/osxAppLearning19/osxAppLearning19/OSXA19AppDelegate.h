//
//  AppDelegate.h
//  osxAppLearning19
//
//  Created by Yuji Imamura on 2014/08/24.
//  Copyright (c) 2014年 Yuji Imamura. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "OSXA19SecondWindowController.h"


@interface OSXA19AppDelegate : NSObject <NSApplicationDelegate, NSPopoverDelegate> {
    OSXA19SecondWindowController *_secondWindowController;
}


@end

