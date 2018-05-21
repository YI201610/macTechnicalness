//
//  NetworkResponseParser.h
//  tech_phone
//
//  Created by Yuji Imamura on 12/06/29.
//

#import <Foundation/Foundation.h>

typedef enum {
    
    networkStateNotConnected, 
    networkStateInProgress, 
    networkStateFinished, 
    networkStateError, 
    networkStateCanceled, 
    
} networkState;


@interface NetworkResponseParser : NSObject {
    
    NSString* urlString__;
    NSInteger networkState__;
    
    NSURLConnection* connection__;
    NSMutableData* downloadData__;
    NSError* error__;
    
    //
    id delegate__;
}

@property (nonatomic, retain) NSString* mUrlString;
@property (atomic) NSInteger mNetworkState; //スレッドセーフ。排他的。
@property (nonatomic, readonly) NSMutableData* mDownloadData;
@property (nonatomic, assign) id mDelegate;

- (void) startAsynchronous;
- (void) cancel;

@end


//NSURLConnectionのものと１：１なデリゲートメソッド群
@interface NSObject (NetworkResponseParserDelegate)

- (void)networkParser:(NetworkResponseParser*)parser didReceiveResponse:(NSURLResponse*)response;
- (void)networkParser:(NetworkResponseParser*)parser didReceiveData:(NSData*)data;
- (void)networkParserDidFinishLoading:(NetworkResponseParser*)parser;
- (void)networkParser:(NetworkResponseParser*)parser didFailWithError:(NSError*)error;
- (void)networkParserDidCancel:(NetworkResponseParser*)parser;

@end
