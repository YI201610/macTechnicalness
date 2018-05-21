//
//  NetworkResponseParser.m
//  tech_phone
//
//  Created by Yuji Imamura on 12/06/29.
//

#import "NetworkResponseParser.h"
#import "AppDelegate.h"

@implementation NetworkResponseParser

@synthesize mUrlString = urlString__;
@synthesize mNetworkState = networkState__;
@synthesize mDownloadData = downloadData__;
@synthesize mDelegate = delegate__;

- (void) startAsynchronous {
    _methodname_;
    
    NSURLRequest* request = nil;
    if(urlString__){
        NSURL* url = [NSURL URLWithString: urlString__];
        if(url){
            //
            request = [NSURLRequest requestWithURL: url 
                                       cachePolicy: NSURLRequestReloadIgnoringLocalCacheData 
                                   timeoutInterval: PRODUCT009_NETWORK_TIMEOUT];
        }
    }

    if(!request){
        debugout(@"Error: request is nill");
        return;
    }
    
    //データバッファインスタンスの生成
    [downloadData__ release], downloadData__ = nil;
    downloadData__ = [[NSMutableData data] retain];
 
    //非同期通信。create and return。
    connection__ = [[NSURLConnection connectionWithRequest:request delegate: self] retain];
    
    networkState__ = networkStateInProgress;

    //
    [AppDelegate getApp].networkActivityIndicatorVisible = YES;

}

#pragma mark - NSURLConnectionDelegate Methods


- (void)connection:(NSURLConnection*)connection didReceiveResponse:(NSURLResponse*)response {
    _methodname_;
    
    //単純にデリゲートに通知
    if([delegate__ respondsToSelector:@selector(networkParser:didReceiveResponse:)]){
        [delegate__ networkParser:self didReceiveResponse:response];
    }
    
}

- (void)connection:(NSURLConnection*)connection didReceiveData:(NSData*)data {
    _methodname_;
    
    //ダウンロードデータ追加
    [downloadData__ appendData: data];

    //デリゲートに通知
    if([delegate__ respondsToSelector:@selector(networkParser:didReceiveData:)]){
        [delegate__ networkParser:self didReceiveData:data];
    }
    
    //
    [AppDelegate getApp].networkActivityIndicatorVisible = YES;

}

- (void)connectionDidFinishLoading:(NSURLConnection*)connection {
    _methodname_;
    
    //
    networkState__ = networkStateFinished;
    
    //デリゲートに通知
    if([delegate__ respondsToSelector:@selector(networkParserDidFinishLoading:)]){
        [delegate__ networkParserDidFinishLoading: self];
    }

    //
    [connection__ release], connection__ = nil;
    
    //
    [AppDelegate getApp].networkActivityIndicatorVisible = NO;

}

- (void)connection:(NSURLConnection*)connection didFailWithError:(NSError*)error {
    _methodname_;
    
    [error__ release], error__ = nil;
    error__ = [error retain];
    
    //
    networkState__ = networkStateError;
    
    //デリゲートに通知
    if([delegate__ respondsToSelector:@selector(networkParser:didFailWithError:)]){
        [delegate__ networkParser:self didFailWithError:error];
    }
    
    //
    [connection__ release], connection__ = nil;
    
    //
    [AppDelegate getApp].networkActivityIndicatorVisible = NO;

}


#pragma mark - cancel

- (void) cancel {
    _methodname_;
    
    //
    [connection__ cancel];
    
    //
    networkState__ = networkStateCanceled;
    
    //デリゲートに通知
    if([delegate__ respondsToSelector:@selector(networkParserDidCancel:)]){
        [delegate__ networkParserDidCancel:self];
    }

    //
    [connection__ release], connection__ = nil;

    //
    [AppDelegate getApp].networkActivityIndicatorVisible = NO;

}

#pragma mark - dealloc

- (void) dealloc {
    _methodname_;
    
    //
    [AppDelegate getApp].networkActivityIndicatorVisible = NO;

    [urlString__ release], urlString__ = nil;
    
    [downloadData__ release], downloadData__ = nil;
    [connection__ release], connection__ = nil;
    
    
    [super dealloc];
}

@end
