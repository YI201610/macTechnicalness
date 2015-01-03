//
//  ViewController.m
//  OSXApp
//
//  Created by Yuji Imamura on 2014/12/01.
//
//

#import "ViewController.h"
#import "CommonHeader.h"

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
        if(key == NSCarriageReturnCharacter){
            
            /*!
             @comment   Enter Keyが選択された
             */
            MTMTopMenuEntity* entity = [_dataController itemForRow:_tableView.selectedRow];
            debugout(@"[Enter Key Pressed] entity: %@, %@", entity.sectionNameString, entity.titleString);
            debugout(@"[Enter Key Pressed] selectedRow: %ld, column: %ld", _tableView.selectedRow, _tableView.selectedColumn);
        }
    }
}

@end
