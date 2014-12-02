//
//  MTMTopMenuDataController.m
//  Model
//
//  Created by Yuji Imamura on 2014/12/02.
//
//

#import "MTMTopMenuDataController.h"

@implementation MTMTopMenuDataController

- (void) initWithPlistName:(NSString*) plistNameString
{
    
    //
    NSString* errorDesc = nil;
    NSString* rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString* plistPath = [rootPath stringByAppendingPathComponent:@"rootMenuStructure.plist"];
    debugout(@"plistPath: %@", plistPath);
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:plistPath]) {
        plistPath = [[NSBundle mainBundle] pathForResource:@"rootMenuStructure" ofType:@"plist"];
        debugout(@"new plistPath: %@", plistPath);
    }
    
    NSMutableArray* layerArray = [[[NSMutableArray alloc] init] autorelease];
    
    if(plistPath) {
        NSData* plistXML = [[NSFileManager defaultManager] contentsAtPath:plistPath];
        NSPropertyListFormat format;
        NSDictionary* propertyListDic = (NSDictionary *)[NSPropertyListSerialization propertyListFromData: plistXML
                                                                                         mutabilityOption: NSPropertyListImmutable
                                                                                                   format: &format
                                                                                         errorDescription: &errorDesc];
        //
        if (propertyListDic) {
            debugout(@"propertyListDic: %@", propertyListDic);
            
            NSArray* propertyListKeyArray = [propertyListDic allKeys];
            for(NSString* key in propertyListKeyArray) {
                debugout(@"key: %@, value: %@", key, [propertyListDic objectForKey:key]);
                
                [menuIndexArray__  addObject: key];
                [sectionKeyArray__ addObject: key];
                
                NSArray* itemDataArray = [propertyListDic objectForKey:key];
                [layerArray addObject: itemDataArray];
            }
        }else{
            debugout(@"Error reading plist: %@, format: %d", errorDesc, format);
        }
    }
    
    //
    menuDictionary__ = [[NSDictionary alloc] initWithObjects: layerArray forKeys: sectionKeyArray__];

}

@end
