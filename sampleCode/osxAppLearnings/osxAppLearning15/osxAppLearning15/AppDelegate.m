//
//  AppDelegate.m
//  osxAppLearning15
//
//  Created by Yuji Imamura on 2014/07/28.
//  Copyright (c) 2014年 Yuji Imamura. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate () {
    
    //Private class level objects. They have no connection to the visual objects.
    NSImage * _baseImage;
    NSString* _baseFileNameString;
    NSString* _baseFolderNameString;

    //
    BOOL _isOutFolderSetFlag;
    BOOL _isBaseImageSetFlag;
    BOOL _isIconFileExistFlag;
    
    //
    float _scaleFactorValue;
    
}

@property (weak) IBOutlet NSWindow *window;

#pragma mark - custom properties

@property (weak) IBOutlet NSTextField *currentImagePathLabel;

@property (weak) IBOutlet NSImageView *currentImageView;

@property (weak) IBOutlet NSTextField *outputFolderPathLabel;
@property (weak) IBOutlet NSTextField *baseFileNameTextField;

@property (weak) IBOutlet NSButton *overideOlderFilesCheck;

//各種チェックボックスへのポインター
@property (weak) IBOutlet NSButton *check16_16x2;
@property (weak) IBOutlet NSButton *check32_32x2;
@property (weak) IBOutlet NSButton *check64_64x2;
@property (weak) IBOutlet NSButton *check128_128x2;
@property (weak) IBOutlet NSButton *check256_256x2;
@property (weak) IBOutlet NSButton *check512_512x2;

#pragma mark - custom method

-(void)resizeImageWithImage:(NSImage*)image newSizeValue:(NSInteger)sizeValue savePathString:(NSString*)pathString;
-(void)processImages;
-(BOOL)isIconFileExistWithPath:(NSString*)iconFilePath;
-(void)setGlobalScaleFactor;

@end

#pragma mark - implementation AppDelegate

@implementation AppDelegate
            
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    //各種フラグの初期化
    _isOutFolderSetFlag = NO;
    _isBaseImageSetFlag = NO;
    _isIconFileExistFlag = NO;
    
    //ベースネームラベルの初期化
    _baseFileNameTextField.stringValue = @"";
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
    debugout(@"osxAL15 - application will terminate....!!");
}

/*!
 @abstract terminate application when the red button selected.
 */
- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender
{
    _methodname_;
    
    return YES;
}

#pragma mark - Private method

/*!
 @abstract   アイコンファイルが存在するかを確認するためのメソッド。
 冗長であるが、学習目的のため、あえて実装するもの。
 makeIconsから実行される。
 */
-(BOOL)checkIconFileExistsWithIconPath:(NSString*)iconFilePath
{
    _methodname_;
    
#warning overideOlderFilesCheckとの関連を確認
    BOOL ret = [[NSFileManager defaultManager] fileExistsAtPath:iconFilePath];
    return ret;
}

/*!
 @abstract  processImageを実行する直前に実行される。
            Retina Displayでも正常に動作するように、scale factorを更新する。
 */
-(void)setGlobalScaleFactor
{
    _methodname_;
    
    NSImage* tmpImage = _currentImageView.image;
    NSArray* repArray = [tmpImage representations];
    NSImageRep* tmpImageRep = [repArray objectAtIndex:0];
    debugout(@"rep Size: %@", NSStringFromSize(tmpImageRep.size));
    debugout(@"rep bitsPerSample: %ld", tmpImageRep.bitsPerSample);
    debugout(@"rep pixelsWide: %ld", tmpImageRep.pixelsWide);
    debugout(@"rep pixelsHigh: %ld", tmpImageRep.pixelsHigh);

    NSSize pixelSize = NSMakeSize(tmpImageRep.pixelsWide, tmpImageRep.pixelsHigh);
    _scaleFactorValue = tmpImage.size.height / pixelSize.height;
    debugout(@"scaleFactorValue: %f", _scaleFactorValue);
    
#warning Retina Displayは0.5するんだけど、上の計算では正常に計算されない。ゆえに、便宜、強制。
    _scaleFactorValue = 0.5;
}

/*!
 @abstract  processImageメソッドの内部で、繰り返し、実行される。
 */
-(void)resizeImageWithImage:(NSImage*)image
               newSizeValue:(NSInteger)sizeValue
             savePathString:(NSString*)pathString
{
    _methodname_;
    NSImage* sourceImage = image;
    
    if(![sourceImage isValid]){
        
        //異常な画像の場合。
        
        NSAlert* alert = [NSAlert new];
        alert.messageText = @"エラー";
        alert.informativeText = @"不正な画像です。";
        [alert addButtonWithTitle:@"OK"];
        
        NSInteger returnCode = [alert runModal];
        debugout(@"returnCode: %ld", returnCode);

    }else{
        
        //正常な画像
        
        //指定されたサイズに、拡大率が反映されたサイズを作成する。
        NSSize scaledSize;
        scaledSize.width = sizeValue * _scaleFactorValue;
        scaledSize.height = sizeValue * _scaleFactorValue;
        
        //受け取った画像に、新しいサイズを反映する。
        [sourceImage setSize:scaledSize];
        
        //空の画像オブジェクトを生成する。
        NSImage* targetImage = [[NSImage alloc] initWithSize:scaledSize];
        
        //描画コマンド待ちにする。
        [targetImage lockFocus];
        {
            //空の画像オブジェクトに、受信した画像を描画する。
            [sourceImage drawAtPoint:NSZeroPoint
                            fromRect:NSZeroRect
                           operation:NSCompositeCopy
                            fraction:1.0];
        }
        //描画コマンド待ち終了。
        [targetImage unlockFocus];
        
        //描画作業を行った画像から、ビットマップデータを作成する
        NSData* bitmapData = [targetImage TIFFRepresentation];
        
        //ビットマップデータから、画像描写オブジェクトを生成する。
        NSBitmapImageRep* imageRep = [NSBitmapImageRep imageRepWithData:bitmapData];
        
        //画像描写オブジェクトから、PNG画像データを生成する。
        NSData* pngData = [imageRep representationUsingType:NSPNGFileType properties:nil];
        
        //PNG画像データを、ファイルに出力する。
        BOOL writeFileResult = [pngData writeToFile:pathString atomically:NO];
        if(writeFileResult){
            debugout(@"PNG画像データの作成に成功しました: %@", pathString);
        }else{
            debugout(@"Error: PNG画像データの作成に失敗しました: %@", pathString);
        }
    }
}

/*!
 @abstract  画像出力パスの作成（文字列データ）。
            各種チェックボックスを確認。
            必要なだけ、resizeImage..を実行。
 */
-(void)processImages
{
    _methodname_;
    NSString* fullPathString = @"";
    
    _baseImage = [_currentImageView.image copy];
    
    NSArray* checkBoxArray = @[_check16_16x2, _check32_32x2, _check64_64x2, _check128_128x2, _check256_256x2, _check512_512x2];
    
    //-----------------------------
    //低解像度のアイコン画像を作成する
    //-----------------------------
    for (NSButton* checkBox in checkBoxArray) {
        
        if(checkBox.state == NSOnState){
          
            //チェックボックスのtag値を取得する
            NSInteger tagValue = (NSInteger)checkBox.tag;
            
            //アイコンを出力するパスを作成する。
            fullPathString = [NSString stringWithFormat:@"%@%@%ld.png",
                              _baseFolderNameString, _baseFileNameString, tagValue];
            
            
            if(checkBox.state == NSOnState &&
               [self checkIconFileExistsWithIconPath:fullPathString] == NO)
            {
                [self resizeImageWithImage:_baseImage
                              newSizeValue:tagValue
                            savePathString:fullPathString];
            }
        }
        
    }//低解像度のアイコン作成ループ
    
    //-----------------------------
    //Retina対応アイコン画像を作成する
    //-----------------------------


    NSAlert* alert = [NSAlert new];
    alert.messageText = @"お知らせ";
    alert.informativeText = [NSString stringWithFormat:@"アイコンの作成に成功しました。: %@", _baseFolderNameString];
    [alert addButtonWithTitle:@"OK"];
    
    NSInteger returnCode = [alert runModal];
    debugout(@"returnCode: %ld", returnCode);

}



#pragma mark - toolBar Button

/*!
 @abstrat   select image, タブボタンまたはメニューから実行される可能性があるため、id型の引数を取る。
 */
- (IBAction)selectBaseImage:(id)sender {
    _methodname_;
    
    NSOpenPanel* panel = [NSOpenPanel openPanel];
    
    panel.canChooseFiles = YES;
    panel.canCreateDirectories = NO;
    panel.allowedFileTypes = [NSImage imageTypes];

    if([panel runModal] == NSFileHandlingPanelOKButton){
        NSURL* fileURL = [panel URL];
        
        
        NSImage* imageFile = [[NSImage alloc] initWithContentsOfURL:fileURL];

        //TODO: Fail Safe
        _currentImageView.image = imageFile;
        _currentImagePathLabel.stringValue = fileURL.path;
        _baseFileNameString = fileURL.path;
        
        //
        _isBaseImageSetFlag = YES;
    }else {
        
        //
        _isBaseImageSetFlag = NO;
    }
    
}

- (IBAction)selectOutputFolder:(id)sender {
    _methodname_;
    
    //パネルを生成する。ディレクトリを作成可能とする。ファイルを選ぶことができない。
    NSOpenPanel* panel = [NSOpenPanel openPanel];
    panel.canCreateDirectories = YES;
    panel.canChooseFiles = NO;
    panel.canChooseDirectories = YES;
    
    //パネルを起動する。
    if([panel runModal] == NSFileHandlingPanelOKButton){
        
        //OKボタンが選択された。
        
        //パネルから、選択されたパスを取得する。
        NSURL* fileURL = panel.URL;
        
        //選択されたパスを、ウィンドウのラベルに設定する。
        _outputFolderPathLabel.stringValue = fileURL.path;

        //選択されたパスを、内部管理の文字列に設定する。
        _baseFolderNameString = fileURL.path;

        //出力フォルダーが設定された旨のフラグを立てる。
        _isOutFolderSetFlag = YES;
    }else{
        _isOutFolderSetFlag = NO;
    }
}

/*!
@abstract   アイコン作成。
            様々な解像度のアイコン画像を作成する。
*/
- (IBAction)makeIcons:(id)sender {
    _methodname_;
    
    if(_isOutFolderSetFlag && _isBaseImageSetFlag){
    
        //
        if([_baseFileNameTextField.stringValue isEqualToString:@""]){
            _baseFileNameString = @"/osxAL15AppIcon";
        }else{
            _baseFileNameString = [NSString stringWithFormat:@"/%@", _baseFileNameTextField.stringValue];
        }
        
        //画像処理の前に、「グローバルスケールファクター」を設定する。
        [self setGlobalScaleFactor];
        
        //画像処理を実行する。
        [self processImages];
        
    }else{
        
        NSAlert* alert = [NSAlert new];
        alert.messageText = @"Error";
        alert.informativeText = @"出力フォルダまたは基本画像が設定されていません。";
        [alert addButtonWithTitle:@"OK"];
        
        NSInteger returnCode = [alert runModal];
        debugout(@"returnCode: %ld", returnCode);

    }
    
}




@end
