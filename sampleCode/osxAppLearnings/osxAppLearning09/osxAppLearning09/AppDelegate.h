//
//  AppDelegate.h
//  osxAppLearning09
//
//  Created by Yuji Imamura on 2014/04/16.
//  Copyright (c) 2014年 Yuji Imamura. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate> {

    BOOL _isUseUSUnit;
    
}

@property (assign) IBOutlet NSWindow *window;

//セグメントコントロール
@property (weak) IBOutlet NSSegmentedControl *segmentUnits;


//タイトル
@property (weak) IBOutlet NSTextField *mainTitleLabel;


//スライダー
@property (weak) IBOutlet NSSlider *weightSlider;
@property (weak) IBOutlet NSSlider *heightSlider;

//kg
@property (weak) IBOutlet NSTextField *kgLabel;
@property (weak) IBOutlet NSTextField *weightTextField;

//Cm
@property (weak) IBOutlet NSTextField *cmLabel;
@property (weak) IBOutlet NSTextField *heightTextFiled;

//BMI
@property (weak) IBOutlet NSTextField *bmiTextFiled;



@end
