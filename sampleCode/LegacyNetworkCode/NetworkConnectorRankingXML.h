//
//  NetworkConnector.h
//  tech_phone
//
//  Created by Yuji Imamura on 12/06/29.
//

#import <Foundation/Foundation.h>
#import "SingletonBase.h"

#import "CoodinatorCoreData.h"

#import "ModelSearchResult.h"
#import "ModelIOSApplication.h"
#import "ModelUserXMLDataFetchCond.h"

#define KEY_OBSERVER_NETWORK_STATE      @"networkState"

typedef enum ImsvXmlReadState {
    
    ImsvXmlReadState_waiting, 
    
    ImsvXmlReadState_header_START,
    ImsvXmlReadState_header_cond, 
    ImsvXmlReadState_header_created, 
    ImsvXmlReadState_header_retryInterval, 
    ImsvXmlReadState_header_END,
    
    ImsvXmlReadState_app_START, 
    ImsvXmlReadState_app_displayOrder, 
    ImsvXmlReadState_app_appleId, 
    ImsvXmlReadState_app_bundleId, 
    ImsvXmlReadState_app_name, 
    ImsvXmlReadState_app_hrefURL, 
    ImsvXmlReadState_app_summary, 
    ImsvXmlReadState_app_previewImageURL, 
    ImsvXmlReadState_app_categoryLabel, 
    ImsvXmlReadState_app_categoryTerm, 
    ImsvXmlReadState_app_artistName, 
    ImsvXmlReadState_app_priceAmount, 
    ImsvXmlReadState_app_priceCurrency, 
    ImsvXmlReadState_app_priceLabel, 
    ImsvXmlReadState_app_iconMaxSizeURL, 
    ImsvXmlReadState_app_rights, 
    ImsvXmlReadState_app_releaseDateLabel, 
    ImsvXmlReadState_app_END, 
    
    ImsvXmlReadState_parse_complete, 
    
}ImsvXmlReadState;


//指定された条件に関するiOSアプリ情報をネットワークから取得する。
@interface NetworkConnectorRankingXML : SingletonBase <NSXMLParserDelegate> {

    //ネットワーク接続子格納配列
    NSMutableArray* retrieveTitleParserArray__;

    //
    ImsvXmlReadState xmlReadState__;

    //
    NSMutableString* tmpBuffer__;               //一時的にXMLデータを確保しておく領域

    
    ModelSearchResult* currentSearchResult__;        //検査中のXML
    ModelIOSApplication* currentIOSApplication__;    //検査中のIOSApp
    ModelUserXMLDataFetchCond* currentXMLDataFetchedCond__;     //検索中の検索条件
    
    id delegate__;
}

@property (nonatomic, readonly, getter = isNetworkAccessing) BOOL mNetworking;

@property (nonatomic, assign) id mDelegate;

@property (nonatomic, assign) ModelSearchResult* mCurrentSearchResult;

@property ImsvXmlReadState mXMLReadState;

//
+ (NetworkConnectorRankingXML*) sharedInstance;


//サーバから取得可能なRSSのタイトル一覧をGETする
- (void) startNetworkingWithURLString:(NSString*) url;
- (void) cancelRetrieveTitle;


@end


@interface NSObject (NetworkConnectorRankingXMLDelegate)

- (void)networkConnector:(NetworkConnectorRankingXML*)connector didReceiveResponse:(NSURLResponse*)response;
- (void)networkConnector:(NetworkConnectorRankingXML*)connector didReceiveData:(NSData*)data;
- (void)networkConnectorDidFinishLoading:(NetworkConnectorRankingXML*)connector;
- (void)networkConnector:(NetworkConnectorRankingXML*)connector didFailWithError:(NSError*)error;
- (void)networkConnectorDidCancel:(NetworkConnectorRankingXML*)connector;

- (void)networkConnectorStartParsing:(NetworkConnectorRankingXML*)connector;

@end
