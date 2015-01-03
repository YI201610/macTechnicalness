//
//  ViewController.h
//  OSXApp
//
//  Created by Yuji Imamura on 2014/12/01.
//
//

#import <Cocoa/Cocoa.h>
#import <OSXEmbededdModelKit/MTMTopMenuDataController.h>
#import <OSXEmbededdModelKit/MTMTopMenuEntity.h>
#import "OSXMTTopTableDataSource.h"

@interface ViewController : NSViewController
<NSApplicationDelegate, NSPopoverDelegate, NSTableViewDelegate>
{
    MTMTopMenuDataController* _dataController;
    OSXMTTopTableDataSource* _dataSource;
    
    NSWindowController* _windowController;
}

@property (weak) IBOutlet NSTableView *tableView;

@end

