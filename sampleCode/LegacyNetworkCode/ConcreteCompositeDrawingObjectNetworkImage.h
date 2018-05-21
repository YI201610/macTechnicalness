//
//  ConcreteCompositeDrawingObjectNetworkImage.h
//  product009
//
//  Created by Yuji Imamura on 12/07/05.
//

#import <Foundation/Foundation.h>
#import "CompositeDrawingObject.h"
#import "VCommonCell.h"
#import "NetworkResponseParser.h"

typedef enum typeOfNetworkImage {
    
    typeOfNetworkImageFirst, 
    typeOfNetworkImageSecond, 
    
}typeOfNetworkImage;


@interface ConcreteCompositeDrawingObjectNetworkImage : NSObject <CompositeDrawingObject> {
 
    typeOfNetworkImage tag__;
    
    NSInteger retryCount__;
    
    CGRect area__;

    BOOL isPerformFetchImage__;
    UIImage* image__;
    
    VCommonCell* parentCell__;
    
    NSString* imageURL__;
    
    
    //ネットワーク接続子格納配列
    NSMutableArray* networkParserArray__;
    
    id delegate__;
    NSData* downloadData__;
    
    
    BOOL flagShadow__;
    
    
    id saveTargetModel__;
}

@property typeOfNetworkImage tag;
@property BOOL mFlagShadow;

@property (nonatomic, assign) CGRect mArea;

@property BOOL mIsPerformFetchImage;
@property (nonatomic, retain) UIImage* mImage;

@property (nonatomic, assign) VCommonCell* mParentCell;
@property (nonatomic, retain) NSString* mImageURL;

@property (nonatomic, assign) id mDelegate;
@property (nonatomic, retain) NSData* mDownloadData;

@property (nonatomic, assign) NSMutableArray* mNetworkParserArray;

@property (nonatomic, assign) id mSaveTargetModel;

// 
- (void) addCompositeDrawingObject:(id<CompositeDrawingObject>) obj;
- (void) removeCompositeDrawingObject:(id<CompositeDrawingObject>) obj;
- (id<CompositeDrawingObject>) drawingCompositeObjectAtIndex:(NSUInteger) index;

// for the Visitor pattern
- (void) acceptVisitor:(id <VisitorDrawingObject>) visitor;

@end


@interface NSObject (ConcreteCompositeDrawingObjectNetworkImage) 

- (void) didFinishDownloadNSData:(ConcreteCompositeDrawingObjectNetworkImage*) obj;
- (void) didFinishDownloadNSDataSecond:(ConcreteCompositeDrawingObjectNetworkImage*) obj;

@end
