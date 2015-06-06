//
//  OSXMTSwiftBridge1WindowController.m
//  macTechnicalness
//
//  Created by Yuji Imamura on 2015/06/06.
//
//

#import "OSXMTSwiftBridge1WindowController.h"
#import "CommonHeader.h"
#import <OSXEmbededdModelKit/OSXEmbededdModelKit.h>

@interface OSXMTSwiftBridge1WindowController ()

@end

@implementation OSXMTSwiftBridge1WindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}


- (IBAction)didSelectActionButton:(id)sender {
    _methodname_;
    
    MTMSomeDomainEntity* a = [MTMSomeDomainEntity new];
    a.x = 5555;
    a.y = 10555;
    a.width = 128555;
    a.height = 256555;
    debugout(@"hoge Action: %f", [a hogeOutput]);

}

@end
