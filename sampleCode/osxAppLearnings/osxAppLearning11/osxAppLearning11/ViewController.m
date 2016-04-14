//
//  ViewController.m
//  osxAppLearning11
//
//  Created by Yuji Imamura on 2014/06/30.
//  Copyright (c) 2014年 Yuji Imamura. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
                                    
    // Do any additional setup after loading the view.
                                
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
                                    
    // Update the view, if already loaded.
                                
}

#pragma mark - Button

- (IBAction)onButtonOpen:(NSButton *)sender {
    _methodname_
 
    //パネルを作成する
    NSOpenPanel* panel = [NSOpenPanel new];
    panel.message = @"フォルダを選択してください";
    panel.canChooseFiles = NO;
    panel.canChooseDirectories = YES;   //フォルダのみを選択可能にする
    panel.allowsMultipleSelection = NO;
    
    //パネルを表示する
    NSInteger result = [panel runModal];
    
    //パネルの操作に応じて、テキストフィールドに情報を表示する。
    if(result == NSFileHandlingPanelOKButton) {
        //パネルから（選択された）URLを取得
        NSURL* fileURL = panel.URL;
        _filePathTextField.stringValue = fileURL.path;
    }
}

- (IBAction)onButtonChooseImageFile:(NSButton *)sender {
    _methodname_;
    
    NSOpenPanel* panel = [NSOpenPanel new];
    panel.message = @"画像ファイルを選択してください";
    
    NSArray* imageType = [NSImage imageTypes];  //すべての画像型
    panel.allowedFileTypes = imageType;

    //パネルを表示する
    NSInteger result = [panel runModal];
    
    //パネルの操作に応じて、テキストフィールドに情報を表示する。
    if(result == NSFileHandlingPanelOKButton) {
        //パネルから（選択された）URLを取得
        NSURL* fileURL = panel.URL;
        _imagePathTextField.stringValue = fileURL.path;
    }

}

- (IBAction)onSaveButton:(id)sender {
    _methodname_;
    
    NSSavePanel* savePanel = [NSSavePanel new];
    savePanel.message = @"保存先パスを決定してください。";
    savePanel.canCreateDirectories = YES;
    
    if([savePanel runModal] == NSFileHandlingPanelOKButton){
        
        //saveパスを取得する
        NSURL* fileURL = savePanel.URL;
        _savePathTextField.stringValue = [fileURL path];
    }
    
}

- (IBAction)onShowAlertButton:(NSButton *)sender {
    _methodname_;
    
    //OS X 10.10: Alerts should be created with the -init method and setting properties.

    NSInteger selectedRow = _radioButtons.selectedRow;
    NSInteger selectedColumn = _radioButtons.selectedColumn;
    
    debugout(@"row: %ld, column: %ld", (long)selectedRow,selectedColumn);

    NSAlert* alert = [NSAlert new];
    alert.messageText = @"アラートのテストです";
    alert.informativeText = [NSString stringWithFormat:@"有益な情報です: row: %ld, column: %ld", (long)selectedRow,selectedColumn];
    
    [alert addButtonWithTitle:@"Yeah!"];
    [alert addButtonWithTitle:@"Yahoooo!"];
    [alert addButtonWithTitle:@"Goooogle!"];
    [alert addButtonWithTitle:@"こんにちは"];
    [alert addButtonWithTitle:@"はじめまして"];
    [alert addButtonWithTitle:@"こんばんわ"];
    [alert addButtonWithTitle:@"こんばんわんこ"];
    
    NSInteger returnCode = [alert runModal];
    debugout(@"returnCode: %ld", returnCode);
    
}



@end
