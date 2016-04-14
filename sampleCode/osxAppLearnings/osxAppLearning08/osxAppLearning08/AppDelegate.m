//
//  AppDelegate.m
//  osxAppLearning08
//
//  Created by Yuji Imamura on 2014/04/12.
//  Copyright (c) 2014年 Yuji Imamura. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate(){
    
    NSString* _opString;
    double _calcResultValue;
    BOOL _isPressedNumberPad;
    
}

@end


@implementation AppDelegate

- (void)initPrivateValues
{
    _methodname_;
    _textDisplayLabel.stringValue = @"0";
    _calcResultValue = 0;
    _opString = @"";
    _isPressedNumberPad = NO;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    [self initPrivateValues];
}

/*!
 @abstract terminate application when the red button selected.
 */
- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender
{
    _methodname_;
    
    return YES;
}


#pragma mark - ボタン処理

- (IBAction)onNumberButton:(NSButton *)sender {
    _methodname_;
    
    NSString* textFieldString = _textDisplayLabel.stringValue;
    if([textFieldString isEqualToString:@"0"]){
        //リセット後、初回
        _textDisplayLabel.stringValue = sender.title;
    }else if(_isPressedNumberPad){
        
        NSString* newString = [_textDisplayLabel.stringValue stringByAppendingString:sender.title];
        _textDisplayLabel.stringValue = newString;
        
    }else{
        
        _textDisplayLabel.stringValue = sender.title;
        
    }
    
    _isPressedNumberPad = YES;
    
}

//計算core
- (void)calcCore
{
    _methodname_;
    
}

- (IBAction)onOperationButton:(NSButton *)sender {
    _methodname_;

    //
    if([sender.title isEqualToString:@"="]){

        _textDisplayLabel.doubleValue = _calcResultValue;
        _calcResultValue = _textDisplayLabel.doubleValue;
        
        //
        _isPressedNumberPad = NO;

        return;
    }

    //
    if([sender.title isEqualToString:@"+"]){
        
        _calcResultValue += _textDisplayLabel.doubleValue;
    
    }else if ([sender.title isEqualToString:@"-"]){

        _calcResultValue -= _textDisplayLabel.doubleValue;

    }else if ([sender.title isEqualToString:@"%"]){

        if(_textDisplayLabel.doubleValue == 0){
            _textDisplayLabel.stringValue = @"Error - Press-C";
        }else{
            _calcResultValue /= _textDisplayLabel.doubleValue;
        }

    }else if ([sender.title isEqualToString:@"*"]){
        
        _calcResultValue *= _textDisplayLabel.doubleValue;

    }

    _textDisplayLabel.doubleValue = _calcResultValue;
    _calcResultValue = _textDisplayLabel.doubleValue;
    
    _opString = sender.title;
    
    
    //
    _isPressedNumberPad = NO;

}

- (IBAction)onClearButton:(NSButton *)sender {
    _methodname_;

    [self initPrivateValues];
}


@end
