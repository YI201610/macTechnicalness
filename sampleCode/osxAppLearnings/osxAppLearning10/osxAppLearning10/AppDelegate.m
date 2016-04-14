//
//  AppDelegate.m
//  osxAppLearning10
//
//  Created by Yuji Imamura on 2014/05/25.
//  Copyright (c) 2014年 Yuji Imamura. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate()

//Outlet
@property (weak) IBOutlet NSStepper *firstStepper;
@property (weak) IBOutlet NSLevelIndicator *indicator1;
@property (weak) IBOutlet NSProgressIndicator *progressBar;
@property (weak) IBOutlet NSProgressIndicator *progressSpinner;

@property (weak) IBOutlet NSTextField *totalGigabytesLabel;
@property (weak) IBOutlet NSTextField *freeGigaBytesLabel;
@property (weak) IBOutlet NSLevelIndicator *usedRateLabel;


//
@property (strong) NSTimer *timer1;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    _firstStepper.integerValue = 0;
    
    //
    //
    NSFileManager* fm = [NSFileManager defaultManager];
    
    NSError* error = nil;
    
    NSDictionary* dict = [fm attributesOfFileSystemForPath:@"/" error:&error];
    if(error){
        debugout(@"error: %@", [error localizedDescription]);
    }
    
    double systemGigabytes = ([[dict valueForKey:@"NSFileSystemSize"] doubleValue]) / (1024*1000000);
    double freeSpaceGigabytes = ([[dict valueForKey:@"NSFileSystemFreeSize"] doubleValue]) / (1024*1000000);
//    double systemGigabytes = ([[dict valueForKey:@"NSFileSystemSize"] doubleValue]);
//    double freeSpaceGigabytes = ([[dict valueForKey:@"NSFileSystemFreeSize"] doubleValue]);
    debugout(@"systemGB: %f, freeGB: %f", systemGigabytes, freeSpaceGigabytes);
    
    double usedSpaceGigabytes = systemGigabytes - freeSpaceGigabytes;
    debugout(@"usedGB: %f", usedSpaceGigabytes);
    
    double usedRate = usedSpaceGigabytes / systemGigabytes * 100;
    debugout(@"usedRate: %f", usedRate);
    
    double indicatorUsedValue = usedRate / 2;
    debugout(@"systemGB: %f, freeGB: %f", systemGigabytes, freeSpaceGigabytes);
    
    _totalGigabytesLabel.integerValue = systemGigabytes;
    _freeGigaBytesLabel.integerValue = freeSpaceGigabytes;
    
    _usedRateLabel.doubleValue = indicatorUsedValue;

}

/*!
 @abstract terminate application when the red button selected.
 */
- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender
{
    _methodname_;
    
    
    return YES;
}

- (IBAction)stepperChanged:(NSStepper *)sender {
    _methodname_;
    
    //インジケーターのメーターを増加させる
    _indicator1.integerValue = sender.integerValue;
}

- (IBAction)onStartButton:(NSButton *)sender
{
    _methodname_;
    
    _indicator1.integerValue = 0;
    
    _timer1 = [NSTimer scheduledTimerWithTimeInterval:1
                                               target:self
                                             selector:@selector(updateLevels:)
                                             userInfo:nil repeats:YES];
    
    [_progressSpinner startAnimation:nil];
    [_progressBar startAnimation:nil];
}

/*!
 @abstract
 */
-(void)updateLevels:(NSTimer*)timer
{
    _methodname_;
    
    if(_indicator1.integerValue < 20){
        _indicator1.integerValue++;
        
        _firstStepper.integerValue = _indicator1.integerValue;
        
    }else{
        debugout(@"タイマーを破棄");
        
        //タイマーを破棄
        [_timer1 invalidate];

        //
        [_progressBar stopAnimation:nil];
        [_progressSpinner stopAnimation:nil];
    }
}

@end
