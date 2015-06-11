//
//  ViewController.m
//  OSXApp
//
//  Created by Yuji Imamura on 2014/12/01.
//
//

#import "ViewController.h"
#import "CommonHeader.h"

#import "OSXApp-Swift.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    
    /*
     @comment   Data Controllerを作成します。
     */
    NSBundle* appBundle = [NSBundle bundleForClass:[self class]];
    NSString* plistPath = [appBundle pathForResource:@"topMenu" ofType:@"plist"];
    _dataController = [[MTMTopMenuDataController alloc] initWithPlistName:plistPath];

    /*!
     @comment
     */
    _dataSource = [OSXMTTopTableDataSource new];
    
    /*!
     @comment
     */
    _dataSource.dataController = _dataController;
    
    
    /*!
     @comment
     */
    [_tableView setDataSource:_dataSource];
}

/*!
 @abstract
 */
- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

//- (void) viewDidAppear
//{
//    [_tableView reloadData];
//}

#pragma mark - NSTableView Delegate


- (IBAction)rowSelected:(NSTableView *)sender {
    _methodname_;
    
    debugout(@"selectedRow: %ld, column: %ld", _tableView.selectedRow,
        _tableView.selectedColumn);
}


- (BOOL)tableView:(NSTableView *)tableView shouldSelectTableColumn:(NSTableColumn *)tableColumn
{
    _methodname_;
    return YES;
}

- (void)tableView:(NSTableView *)tableView mouseDownInHeaderOfTableColumn:(NSTableColumn *)tableColumn
{
    _methodname_;
    
}

- (void)tableView:(NSTableView *)tableView didClickTableColumn:(NSTableColumn *)tableColumn
{
    _methodname_;
}


- (void)tableView:(NSTableView *)tableView didDragTableColumn:(NSTableColumn *)tableColumn
{
    _methodname_;
}

/*!
 @abstract
 */
- (void) keyDown:(NSEvent *)theEvent
{
    _methodname_;
    debugout(@"theEvent: %@", theEvent);
    debugout(@"charactersIgnoringMod: %@(%ld)",
             [theEvent charactersIgnoringModifiers],
             [[theEvent charactersIgnoringModifiers] length]);

    NSString* keyString = [theEvent charactersIgnoringModifiers];
    if([keyString length] == 1){
        unichar key = [[theEvent charactersIgnoringModifiers] characterAtIndex:0];
        
        /*
         @comment   Enter Keyの選択があったか判定する
         */
        if(key == NSCarriageReturnCharacter){
            
            MTMTopMenuEntity* entity = [_dataController itemForRow:_tableView.selectedRow];
            debugout(@"[Enter Key Pressed] entity: %@, %@, %@",
                     entity.sectionNameString,
                     entity.titleString,
                     entity.viewControllerNameString);
            
            /*
             @comment
             */
            
            /*
             @comment   選択された検証項目に対応するView Controller名称を求める
             */
            NSString* wcName = entity.windowControllerNameString;
            
            if([wcName length] == 0){
                debugout(@"Error: Target Class wan't set. ");
                return;
            }
            
            if(_windowController != nil){
                _windowController = nil;
            }
            
            /*
             @comment   選択された検証項目に対応するWindowを作成
             */
            NSWindowController* addwc = [[NSClassFromString(wcName) alloc] initWithWindowNibName:wcName];
            if(!addwc){
                debugout(@"Error: %@ was not found.", wcName);
                _windowController = nil;
            }else{
                _windowController = addwc;
                
                /*
                 @comment   検証項目のWindowを表示
                 */
                [_windowController showWindow:nil];

            }

        }
    }
}

@end
