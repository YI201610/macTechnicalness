//
//  ConcreteCompositeDrawingObjectNetworkImage.m
//  product009
//
//  Created by Yuji Imamura on 12/07/05.
//

#import "ConcreteCompositeDrawingObjectNetworkImage.h"

@implementation ConcreteCompositeDrawingObjectNetworkImage

@synthesize tag = tag__;
@synthesize mFlagShadow = flagShadow__;

@synthesize mArea = area__;
@synthesize mImage = image__;
@synthesize mIsPerformFetchImage = isPerformFetchImage__;
@synthesize mParentCell = parentCell__;
@synthesize mImageURL = imageURL__;
@synthesize mDelegate = delegate__;
@synthesize mDownloadData = downloadData__;
@synthesize mNetworkParserArray = networkParserArray__;

@synthesize mSaveTargetModel = saveTargetModel__;

- (id) init {
    //_methodname_;
    
    if(self = [super init]){
        networkParserArray__ = [[NSMutableArray alloc] init];
        
        tag__ = typeOfNetworkImageFirst;
        
        flagShadow__ = YES;
        
        saveTargetModel__ = nil;
    }
    
    return self;
}


- (void) addCompositeDrawingObject:(id<CompositeDrawingObject>) obj {
    //_methodname_;
}

- (void) removeCompositeDrawingObject:(id<CompositeDrawingObject>) obj {
    //_methodname_;
}

- (id<CompositeDrawingObject>) drawingCompositeObjectAtIndex:(NSUInteger) index {
    //_methodname_;
    
    return nil;
}

- (void) acceptVisitor:(id <VisitorDrawingObject>) visitor {
    //_methodname_;
    
	if(image__){
        
        [visitor visitNetworkImage: self];
        
    }else if(downloadData__){

        [NSLocalizedString(@"Loading...", @"ConcreteCompositeDrawingObjectNetworkImage") drawAtPoint:CGPointMake(PRODUCT002_LEFT_MARGIN, PRODUCT002_TOP_MARGIN) 
                                                                                            withFont:[UIFont systemFontOfSize:myappdef_cell_font_size]];

        //
        dispatch_queue_t mainQueue = dispatch_get_main_queue();
        dispatch_queue_t defaultPriorityQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        
        dispatch_async(defaultPriorityQueue, ^{
            
            //
            image__ = [[UIImage imageWithData: downloadData__] retain];
            
            dispatch_async(mainQueue, ^{
                [parentCell__ setNeedsDisplay];
                isPerformFetchImage__ = YES;
            });
        });

	}else {
        
        if(!isPerformFetchImage__){
            
            [NSLocalizedString(@"DL...", @"ConcreteCompositeDrawingObjectNetworkImage") drawAtPoint:CGPointMake(PRODUCT002_LEFT_MARGIN, PRODUCT002_TOP_MARGIN) 
                                                                                                withFont:[UIFont systemFontOfSize:myappdef_cell_font_size]];
            

            //ネットワーク処理はAPI仕様の都合上、メインスレッドで実行する
                if(imageURL__){

                    //
                    debugout(@"== going to connect to network: %@", imageURL__);
                    NetworkResponseParser* parser = [[[NetworkResponseParser alloc] init] autorelease];
                    parser.mUrlString = imageURL__;
                    parser.mDelegate = self;
                    
                    [parser startAsynchronous];     //メインスレッドで、非同期通信開始
                    
                    [networkParserArray__ addObject: parser];
                    
                }
            
        }else{
            [NSLocalizedString(@"画像なし", @"ConcreteCompositeDrawingObjectNetworkImage") drawAtPoint:CGPointMake(PRODUCT002_LEFT_MARGIN, PRODUCT002_TOP_MARGIN) 
                                                                                            withFont:[UIFont systemFontOfSize: myappdef_cell_font_size]];
        }
        
	}
    
}

//----------------------------------------------------------
#pragma mark - NetworkParser Delegate 
//----------------------------------------------------------

- (void)networkParser:(NetworkResponseParser*)parser didReceiveResponse:(NSURLResponse*)response {
    //_methodname_;
    
}

- (void)networkParser:(NetworkResponseParser*)parser didReceiveData:(NSData*)data {
    //_methodname_;
    
}

- (void)networkParserDidFinishLoading:(NetworkResponseParser*)parser {
    //_methodname_;

    //画像データが入ってるはず
    NSData* receiveData = parser.mDownloadData;

    //
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    dispatch_queue_t defaultPriorityQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);

    //別スレッドで画像を生成
    dispatch_async(defaultPriorityQueue, ^{

        //
        image__ = [[UIImage imageWithData: receiveData] retain];

        //
        self.mDownloadData = receiveData;   //プロパティ経由で保存してretainカウントを上げること
        
        dispatch_async(mainQueue, ^{
            debugout(@"-------- Network Image Download Complete -----------");

            //メインスレッドで実行しないと落ちる。
            //このタイミングでコールするメソッドを複数選択可能にしたい
            switch (tag__) {

                case typeOfNetworkImageSecond:
                {
                    if ([delegate__ respondsToSelector:@selector(didFinishDownloadNSDataSecond:)]) {
                        [delegate__ didFinishDownloadNSDataSecond: self];
                    }
                }
                    break;
                    
                default:
                    
                    if ([delegate__ respondsToSelector:@selector(didFinishDownloadNSData:)]) {
                        [delegate__ didFinishDownloadNSData: self];
                    }
                    
                    break;
            }

            [parentCell__ setNeedsDisplay];
            isPerformFetchImage__ = YES;

        });
    });
    
}

- (void)networkParser:(NetworkResponseParser*)parser didFailWithError:(NSError*)error {
    //_methodname_;
    debugout(@"-----------network parser Error...............------------------------");

    if(retryCount__ < PRODUCT009_NETWORK_RETRYCOUNT){

        retryCount__++;
        /*
         //
         [NSLocalizedString(@"読み取り失敗", @"ConcreteCompositeDrawingObjectNetworkImage") drawAtPoint:CGPointMake(PRODUCT002_LEFT_MARGIN, PRODUCT002_TOP_MARGIN) 
         withFont:[UIFont systemFontOfSize:myappdef_cell_font_size]];
         */

        [parentCell__ setNeedsDisplay];

    }else {
        image__ = [[IMSVCore iconImagePlaceHolderAppIcon:CGSizeMake(100, 100)] retain];
        flagShadow__ = NO;
        [parentCell__ setNeedsDisplay];
    }
    
    
}

- (void)networkParserDidCancel:(NetworkResponseParser*)parser {
    //_methodname_;
}



#pragma mark - dealloc 

- (void) dealloc {
    //_methodname_;
    isPerformFetchImage__ = YES;
    
    [image__ release], image__ = nil;
    [imageURL__ release], imageURL__ = nil;
    
    for(NetworkResponseParser* parser in networkParserArray__){
        [parser cancel];
        parser.mDelegate = nil;
    }
    
    parentCell__ = nil;     //
    
    [networkParserArray__ release], networkParserArray__ = nil;
    
    [downloadData__ release], downloadData__ = nil;
    
    [super dealloc];
}


@end
