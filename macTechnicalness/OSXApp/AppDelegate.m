//
//  AppDelegate.m
//  OSXApp
//
//  Created by Yuji Imamura on 2014/12/01.
//
//

#import "AppDelegate.h"
#import "CommonHeader.h"
#import <OSXEmbededdModelKit/MTMTopMenuDataController.h>


@interface AppDelegate () {
    MTMTopMenuDataController* _dataController;
}

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    
    NSBundle* appBundle = [NSBundle bundleForClass:[self class]];
    NSString* plistPath = [appBundle pathForResource:@"topMenu" ofType:@"plist"];
    _dataController = [[MTMTopMenuDataController alloc] initWithPlistName:plistPath];
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
    _dataController = nil;
    
    return YES;
}

@end
