//
//  MTMTopMenuDataController.m
//  Model
//
//  Created by Yuji Imamura on 2014/12/02.
//
//

#import "MTMTopMenuDataController.h"
#import "CommonHeader.h"
#import "MTMTopMenuEntity.h"

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
                NSArray* propertyListKeyArray = [propertyListDic allKeys];
                for(NSString* key in propertyListKeyArray) {
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
    NSString *sectionName = [_sectionKeyStringArray objectAtIndex:indexNo];
    return sectionName;
}

- (NSInteger) numberOfSection
{
    NSInteger count = [_sectionKeyStringArray count];
    return count;
}

- (MTMTopMenuEntity*) itemForSection:(NSString*)section index:(NSInteger)indexValue
{
    NSArray* itemArray = [_topMenuDictionary objectForKey:section];
    NSDictionary* itemDictionary = [itemArray objectAtIndex:indexValue];
    MTMTopMenuEntity* entity = [MTMTopMenuEntity new];
    entity.titleString =
    return itemString;
}

- (NSInteger) numberOfItemForSection:(NSString*)sectionNameString
{
    NSArray* itemArray = [_topMenuDictionary objectForKey:sectionNameString];
    return [itemArray count];
}

@end
