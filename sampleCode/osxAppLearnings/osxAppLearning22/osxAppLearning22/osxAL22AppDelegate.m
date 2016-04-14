//
//  AppDelegate.m
//  osxAppLearning22
//
//  Created by Yuji Imamura on 2014/10/10.
//  Copyright (c) 2014年 Yuji Imamura. All rights reserved.
//

#import "osxAL22AppDelegate.h"
#import "CommonHeader.h"


@interface osxAL22AppDelegate ()

@property (weak) IBOutlet NSWindow *window;

@property (weak) IBOutlet NSTextField *titleTextField;
@property (weak) IBOutlet NSButton *setTitleButton;

@property (weak) IBOutlet NSBox *colorSampleBox;
@property (weak) IBOutlet NSButton *setColorButton;

@end

@implementation osxAL22AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    _methodname_;
    // Insert code here to initialize your application
    
    
    /*
     @comment   windowタイトルと、タイトル・テキストフィールドに、ユーザーデータを設定する。
     */
    NSString* obj = [[NSUserDefaults standardUserDefaults] objectForKey:@"windowTitle"];
    debugout(@"ud-obj: %@", obj);
    
    if(![obj isEqualToString:@""]){
        self.window.title = obj;
        
        _titleTextField.stringValue = obj;
    }
    
    
    /*
     @comment   カラーボックスに、
     */
    NSData* userColorData = [[NSUserDefaults standardUserDefaults] objectForKey:@"boxColor"];
    if(userColorData){
        
        /*
         @comment   NSData形式でアーカイブされているユーザーデータを、NSColor形式にアン・アーカイブする。
         */
        NSColor* userColor = [NSUnarchiver unarchiveObjectWithData:userColorData];
        
        /*
         @comment   ボックスカラーに、ユーザーカラーを登録する。
         */
        _colorSampleBox.fillColor = userColor;
    }
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    _methodname_;
    // Insert code here to tear down your application
    
    /*
     @comment   ユーザーデータをNSUserDefaultsに保存する。
     */
    [self saveUserInformation];
}

/*!
 @abstract terminate application when the red button selected.
 */
- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender
{
    _methodname_;
    
    
    return YES;
}

#pragma mark- Private

/*!
 @abstract  カラーパネルで色を選んでいる最中に呼ばれる
 */
- (void) colorChanged:(NSColorPanel*) panel
{
    _methodname_;
    
    /*
     @comment   カラーパネルから色を選択する。
     */
    NSColor* color = panel.color;
    debugout(@"color: %@", color);
    
    /*
     @comment   色サンプル領域に、色を設定する。
     */
    _colorSampleBox.fillColor = color;
    
    
    /*
     @comment   ユーザーが選んだカラーを、NSData形式に、アーカイブする。
     */
    NSData* colorData = [NSArchiver archivedDataWithRootObject:color];

    /*
     @comment   ユーザーが選んだカラーを、NSUserDefaultsに保存する。
     */
    [[NSUserDefaults standardUserDefaults] setObject:colorData forKey:@"boxColor"];
    
}

- (void) saveUserInformation
{
    _methodname_;
    
    NSUserDefaults* ud = [NSUserDefaults standardUserDefaults];

    if(![_titleTextField.stringValue isEqualToString:@""]){
        [ud setObject:_titleTextField.stringValue forKey:@"windowTitle"];
    }
    
    
}


#pragma mark - Public

/*!
 @abstract  タイトルボタンが選択された
 */
- (IBAction)didSelectSetTitleButton:(NSButton *)sender {
    _methodname_;

    if(![_titleTextField.stringValue isEqualToString:@""]){
        _window.title = _titleTextField.stringValue;
        
        [self saveUserInformation];
    }

}


/*!
 @abstract  色設定ボタンが選択された
 */
- (IBAction)didSelectSetColorButton:(NSButton *)sender {
    _methodname_;
    
    NSColorPanel* colorPanel = [NSColorPanel sharedColorPanel];
    [colorPanel setTarget:self];
    [colorPanel setAction:@selector(colorChanged:)];

    /*
     @comment   カラー選択パネルを、前面に移動する。
     */
    [colorPanel orderFront:nil];
    
}




@end
