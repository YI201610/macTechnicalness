//
//  CoodinatorCoreData.m
//  product002
//
//  Created by Yuji Imamura on 12/05/18.
//  Copyright (c) 2012年 iMarketSceneViewer.COM. All rights reserved.
//

#import "CoodinatorCoreData.h"
#import "CommonHeader.h"

@implementation CoodinatorCoreData

@synthesize mMOM = mom__;
@synthesize mMOC = moc__;
@synthesize mPSC = psc__;


#pragma mark -
-(void) save {

	NSError* error = nil;
	if (![moc__ save: &error]) {
		debugout(@"Unresolved error %@, %@", error, [error userInfo]);
		exit(-1);  // Fail
	}
	
}


#pragma mark -

//------------------------------------
// 1
//------------------------------------
- (NSManagedObjectModel*) mMOM {
	
    if (mom__ != nil) {
        return mom__;
    }
    
    mom__ = [NSManagedObjectModel mergedModelFromBundles:nil];
    
    return mom__;
}



//------------------------------------
// 2
//------------------------------------

+ (NSString*) appDocsPath {
    _methodname_;
    
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
    
    return basePath;
}

- (NSPersistentStoreCoordinator *) mPSC {
	
    if (psc__ != nil) {
        return psc__;
    }else {
        
        NSString* resname = @"DraftMemo";
        NSString* ext = @"db";
        
        NSString* storePath = [[CoodinatorCoreData appDocsPath]
                               stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@", resname, ext]];
        debugout(@"storePath: %@", storePath);
        
        //
        NSError *error;
        psc__ = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel: self.mMOM];
        
        //-------------------------------------------------
        //CoreData Merge Option: Lightweight Migration
        //-------------------------------------------------
        NSDictionary* optionDic = [NSDictionary dictionaryWithObjectsAndKeys:
                                   [NSNumber numberWithBool:YES], 
                                   NSMigratePersistentStoresAutomaticallyOption,    //Automatic Migration
                                   [NSNumber numberWithBool:YES], 
                                   NSInferMappingModelAutomaticallyOption,  //Infer Mapping Model 
                                   nil];
        
        //
        if (![psc__ addPersistentStoreWithType:NSSQLiteStoreType    //SQLiteを指定
                                 configuration:nil
                                           URL:[NSURL fileURLWithPath:storePath]
                                       options:optionDic
                                         error:&error])
        {
            debugout(@"Unresolved error %@, %@", error, [error userInfo]);
            exit(-1);  // Fail
        }   
        
        return psc__;
    }
}


//------------------------------------
// 3
//------------------------------------
- (NSManagedObjectContext *) mMOC {
	_methodname_;
	
	if (moc__ != nil) {
        return moc__;
    }
	
	
	NSPersistentStoreCoordinator* _store = [self mPSC];
    
    if (_store != nil) {
        moc__ = [NSManagedObjectContext new];
        [moc__ setPersistentStoreCoordinator: _store];
    }
	
    return moc__;
}


@end