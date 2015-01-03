//
//  OSXMTTopTableDataSource.h
//  macTechnicalness
//
//  Created by Yuji Imamura on 2015/01/03.
//
//

#import <Cocoa/Cocoa.h>
#import <OSXEmbededdModelKit/MTMTopMenuDataController.h>

@interface OSXMTTopTableDataSource : NSObject <NSTableViewDataSource>

@property (nonatomic, strong) MTMTopMenuDataController* dataController;

@end
