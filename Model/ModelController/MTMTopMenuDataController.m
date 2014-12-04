//
//  MTMTopMenuDataController.m
//  Model
//
//  Created by Yuji Imamura on 2014/12/02.
//
//

#import "MTMTopMenuDataController.h"
#import "CommonHeader.h"

@interface MTMTopMenuDataController() {
    
    /*!
     @abstract
     */
    NSMutableArray* _sectionKeyStringArray;
    
    /*!
     @abstract
     */
    NSMutableArray* _menuIndexStringArray;
    
    /*!
     @abstract
     */
    NSDictionary* _topMenuDictionary;
}

@end

@implementation MTMTopMenuDataController

- (instancetype)initWithPlistName:(NSString*) plistNameString
{
    self = [super init];
    if (self) {
        
        /*!
         @comment   topMenu plist
         */
        _sectionKeyStringArray = [[NSMutableArray alloc] init];
        _menuIndexStringArray = [[NSMutableArray alloc] init];
        
        /*!
         @comment
         */
        NSMutableArray* topMenuArray = [[NSMutableArray alloc] init];
        
        /*!
         @comment
         */
        NSError* errorDesc = nil;
        if([plistNameString length] > 0)
        {
            NSData* plistXML = [NSData dataWithContentsOfFile:plistNameString];
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
                    
                    [_sectionKeyStringArray addObject: key];
                    [_menuIndexStringArray  addObject: key];
                    
                    NSArray* itemDataArray = [propertyListDic objectForKey:key];
                    [topMenuArray addObject: itemDataArray];
                }
            }else{
                debugout(@"Error reading plist: %@, format: %lu", errorDesc, format);
            }
        }
        
        /*!
         @comment
         */
        _topMenuDictionary = [[NSDictionary alloc] initWithObjects:topMenuArray forKeys:_sectionKeyStringArray];
    }
    
    return self;
}

- (NSString*) sectionNameStringWithIndex:(NSInteger)indexNo
{
    return nil;
}

- (NSInteger) numberOfSection
{
    return 0;
}

- (NSString*) itemForSection:(NSString*)section index:(NSInteger)indexValue
{
    return nil;
}

- (NSInteger) numberOfItemForSection:(NSString*)sectionNameString
{
    return 0;
}

@end
