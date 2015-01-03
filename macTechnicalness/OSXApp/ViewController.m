//
//  ViewController.m
//  OSXApp
//
//  Created by Yuji Imamura on 2014/12/01.
//
//

#import "ViewController.h"


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

@end
