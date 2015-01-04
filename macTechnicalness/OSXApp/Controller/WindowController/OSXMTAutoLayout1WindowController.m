//
//  OSXMTAutoLayout1WindowController.m
//  macTechnicalness
//
//  Created by Yuji Imamura on 2015/01/03.
//
//

#import "OSXMTAutoLayout1WindowController.h"
#import "CommonHeader.h"

@interface OSXMTAutoLayout1WindowController ()

@end

@implementation OSXMTAutoLayout1WindowController

- (void)awakeFromNib
{
    _methodname_;
    
}

-(id)initWithWindow:(NSWindow *)window
{
    _methodname_;
    self = [super initWithWindow:window];
    if(self){
    }
    
    return self;
}

- (instancetype)init
{
    _methodname_;
    self = [super init];
    if (self) {
    }
    return self;
}


- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    
    /*!
     @comment   width, heightをもつViewを生成する
     */
    //NSView* someView = [[NSView alloc] initWithFrame:CGRectMake(5, 5, 30.0f, 30.0f)];
//    [someView setBackgroundColor:[UIColor greenColor]];
//    someView.tag = 999;
//    [someView addSubview:someView];
    

    
    
}

/*!
 @abstract terminate application when the red button selected.
 */
- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender
{
    _methodname_;
    
    return YES;
}

- (void)dealloc
{
    _methodname_;
}


@end
