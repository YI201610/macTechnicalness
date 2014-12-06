//
//  MTTopViewTableDataSource.h
//  macTechnicalness
//
//  Created by Yuji Imamura on 2014/12/04.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <iOSEmbeddedModelKit/iOSEmbeddedModelKit.h>

@interface MTTopViewTableDataSource : NSObject <UITableViewDataSource>

@property (nonatomic, strong) MTMTopMenuDataController* dataController;

@end
