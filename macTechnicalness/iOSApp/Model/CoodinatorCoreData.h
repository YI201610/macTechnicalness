//
//  CoodinatorCoreData.h
//  product002
//
//  Created by Yuji Imamura on 12/05/18.
//  Copyright (c) 2012年 iMarketSceneViewer.COM. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface CoodinatorCoreData : NSObject {
    
    NSManagedObjectModel* mom__;
    NSManagedObjectContext* moc__;
    NSPersistentStoreCoordinator* psc__;
    
}

@property (nonatomic, retain) NSManagedObjectModel* mMOM;
@property (nonatomic, retain) NSManagedObjectContext* mMOC;
@property (nonatomic, retain) NSPersistentStoreCoordinator* mPSC;

- (void) save;

@end

