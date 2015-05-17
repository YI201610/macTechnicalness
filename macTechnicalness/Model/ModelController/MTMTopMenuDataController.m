//
//  MTMTopMenuDataController.m
//  Model
//
//  Created by Yuji Imamura on 2014/12/02.
//
//

#import <iOSEmbeddedModelKit/MTMTopMenuDataController.h>
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
    
    /*!
     @abstract  便宜対応
     */
    NSMutableArray* _allItemArray;
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
        
        /*
         @comment
         */
        _allItemArray = [NSMutableArray new];
        
        /*!
         @comment
         */
        NSError* errorDesc = nil;
        if([plistNameString length] > 0)
        {
            NSData* plistXML = [NSData dataWithContentsOfFile:plistNameString];
            NSPropertyListFormat format;
            NSArray* propertyListArray = [NSPropertyListSerialization propertyListWithData:plistXML
                                                                                   options:NSPropertyListImmutable
                                                                                    format:&format
                                                                                     error:&errorDesc];
            
            
            //
            if (propertyListArray) {
                
                NSArray* topArray = [propertyListArray firstObject];
                
                for (NSDictionary* themeDictionary in topArray) {
                    NSString* themeString = [themeDictionary objectForKey:@"title"];
                    
                    [_sectionKeyStringArray addObject: themeString];
                    [_menuIndexStringArray  addObject: themeString];

                    NSArray* itemArray = [themeDictionary objectForKey:@"items"];
                    [topMenuArray addObject: itemArray];
                    
                    for (NSDictionary* itemDic in itemArray) {
                        
                        if([itemDic isKindOfClass:[NSDictionary class]]){
                            MTMTopMenuEntity* entity = [MTMTopMenuEntity new];

                            entity = [MTMTopMenuEntity new];
                            entity.sectionNameString = themeString;
                            entity.titleString = [itemDic objectForKey:@"title"];
                            entity.viewControllerNameString = [itemDic objectForKey:@"vc"];
                            entity.windowControllerNameString = [itemDic objectForKey:@"vc_osx"];
                            
                            [_allItemArray addObject:entity];
                        }
                    }
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
    
    MTMTopMenuEntity* entity = nil;
    if([itemDictionary isKindOfClass:[NSDictionary class]]){
        entity = [MTMTopMenuEntity new];
        entity.sectionNameString = section;
        entity.titleString = [itemDictionary objectForKey:@"title"];
        entity.viewControllerNameString = [itemDictionary objectForKey:@"vc"];
        entity.windowControllerNameString = [itemDictionary objectForKey:@"vc_osx"];
    }

    return entity;
}

- (MTMTopMenuEntity*) itemForRow:(NSInteger)rowValue
{
    MTMTopMenuEntity* retEntity = nil;
    
    retEntity = [_allItemArray objectAtIndex:rowValue];
    
    return retEntity;
}

- (NSInteger) numberOfItemForSection:(NSString*)sectionNameString
{
    NSArray* itemArray = [_topMenuDictionary objectForKey:sectionNameString];
    return [itemArray count];
}

- (void) dealloc
{
    _methodname_;
}

@end
