//
//  MTMTopMenuDataController.m
//  Model
//
//  Created by Yuji Imamura on 2014/12/02.
//
//

#import "MTMTopMenuDataController.h"
#import "CommonHeader.h"

@implementation MTMTopMenuDataController

- (instancetype)initWithPlistName:(NSString*) plistNameString
{
    self = [super init];
    if (self) {
        //
        NSMutableArray* menuIndexArray__ = [[NSMutableArray alloc] init];
        NSMutableArray* sectionKeyArray__ = [[NSMutableArray alloc] init];
        
        /*!
         @comment   topMenu plist
         */
        NSMutableArray* topMenuArray = [[NSMutableArray alloc] init];
        
        //
        NSError* errorDesc = nil;
        if([plistNameString length] > 0)
        {
            NSData* plistXML = [[NSFileManager defaultManager] contentsAtPath:plistNameString];
            NSPropertyListFormat format;
            NSDictionary* propertyListDic = [NSPropertyListSerialization propertyListWithData:plistXML
                                                                                      options:NSPropertyListImmutable
                                                                                       format:&format
                                                                                        error:&errorDesc];
            //
            if (propertyListDic) {
                debugout(@"propertyListDic: %@", propertyListDic);
                
                NSArray* propertyListKeyArray = [propertyListDic allKeys];
                for(NSString* key in propertyListKeyArray) {
                    debugout(@"key: %@, value: %@", key, [propertyListDic objectForKey:key]);
                    
                    [menuIndexArray__  addObject: key];
                    [sectionKeyArray__ addObject: key];
                    
                    NSArray* itemDataArray = [propertyListDic objectForKey:key];
                    [topMenuArray addObject: itemDataArray];
                }
            }else{
                debugout(@"Error reading plist: %@, format: %lu", errorDesc, format);
            }
        }
        
        //
        NSDictionary* menuDictionary__ = [[NSDictionary alloc] initWithObjects:topMenuArray forKeys:sectionKeyArray__];

    }
    return self;
}

@end
