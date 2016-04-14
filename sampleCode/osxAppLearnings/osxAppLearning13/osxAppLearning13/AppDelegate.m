//
//  AppDelegate.m
//  osxAppLearning13
//
//  Created by Yuji Imamura on 2014/07/16.
//  Copyright (c) 2014年 Yuji Imamura. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSImageView *imageView;

@end

@implementation AppDelegate
            
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

/*!
 @abstract terminate application when the red button selected.
 */
- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender
{
    _methodname_;
    
    return YES;
}

- (IBAction)onLoadImageButton:(NSButton *)sender {
    _methodname_;
    
//    NSString* imagePath = @"/Users/yujiimamura/Desktop/image20140718.png";
//    NSImage* tmpImage = [[NSImage alloc] initByReferencingFile:imagePath];
//    
//    _imageView.image = tmpImage;
    
    NSOpenPanel* openPanel = [NSOpenPanel new];
    openPanel.canChooseDirectories = NO;
    openPanel.canChooseFiles = YES;
    openPanel.allowedFileTypes = [NSImage imageTypes];
    NSInteger ret = [openPanel runModal];
    if(ret == NSFileHandlingPanelOKButton){
        NSURL* url = openPanel.URL;
        debugout(@"url path: %@", url.path);
        NSImage* tmpImage = [[NSImage alloc] initByReferencingFile:url.path];
        self.imageView.image = tmpImage;
    }
}



@end
