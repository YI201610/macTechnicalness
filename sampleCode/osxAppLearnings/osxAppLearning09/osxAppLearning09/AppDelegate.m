//
//  AppDelegate.m
//  osxAppLearning09
//
//  Created by Yuji Imamura on 2014/04/16.
//  Copyright (c) 2014年 Yuji Imamura. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    
    //
    _isUseUSUnit = YES;
    
    _segmentUnits.selectedSegment = 0;
    
    //
    [self setupUnits];
}

/*!
 @abstract terminate application when the red button selected.
 */
- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender
{
    _methodname_;
    
    return YES;
}


/*!
 @abstract  セグメントコントロールが選択された際の処理
 */
- (IBAction)onSegmentClick:(NSSegmentedControl *)sender {
    _methodname_;
    
    switch(sender.selectedSegment){
        case 0:
            _isUseUSUnit = YES;
            break;
            
        case 1:
            _isUseUSUnit = NO;
            break;
            
        default:
            _isUseUSUnit = YES;
            break;
    }
    
    [self setupUnits];
}


- (IBAction)onWeightSlider:(NSSlider *)sender {
    _methodname_;
    
    [self updateDisplay];
}


- (IBAction)onHeightSlider:(NSSlider *)sender {
    _methodname_;
    
    
    [self updateDisplay];
}


#pragma mark -

-(void) setupUnits
{
    _methodname_;
    
    if(_isUseUSUnit){
        
        _mainTitleLabel.stringValue = @"BMI Calc (US)";
        
        _weightSlider.minValue = 60;
        _weightSlider.maxValue = 400;
        _weightSlider.intValue = 0;
        
        _kgLabel.stringValue = @"Lbs:";
        _cmLabel.stringValue = @"Inches:";
        
        _heightSlider.minValue = 36;
        _heightSlider.maxValue = 96;
        _heightSlider.intValue = 0;
        
    }else{
        
        _mainTitleLabel.stringValue = @"BMI Calc (Metric)";
        
        
        _weightSlider.minValue = 25;
        _weightSlider.maxValue = 200;
        _weightSlider.intValue = 0;
        
        _kgLabel.stringValue = @"Kg:";
        _cmLabel.stringValue = @"Cm:";
        
        _heightSlider.minValue = 90;
        _heightSlider.maxValue = 250;
        _heightSlider.intValue = 0;

    }
    
    //
    [self updateDisplay];
}

-(void)updateDisplay
{
    _methodname_;
    
    _weightTextField.intValue = _weightSlider.intValue;
    _heightTextFiled.intValue = _heightSlider.intValue;
    
    CGFloat BMI = 0;
    
    //
    if(_isUseUSUnit){
        //US Calc.
        CGFloat weight = _weightSlider.floatValue;
        CGFloat height = _heightSlider.floatValue;
        BMI =  weight/(height*height)*703;
    }else{
        //Metrics calc.
        CGFloat weight = _weightSlider.floatValue;
        CGFloat height = _heightSlider.floatValue;
        BMI = weight / ((height/100)*(height/100));
    }
    
    //
    _bmiTextFiled.stringValue = [NSString stringWithFormat:@"%.1f", BMI];
}

@end
