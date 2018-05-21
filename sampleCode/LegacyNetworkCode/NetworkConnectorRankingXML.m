//
//  NetworkConnector.m
//  tech_phone
//
//  Created by Yuji Imamura on 12/06/29.
//

#import "NetworkConnectorRankingXML.h"
#import "NetworkResponseParser.h"
#import "IMSVCore+Vrious.h"

#import "ManagerUserInfo.h"

#import "ManagerSearchResultIOSAppDataArray.h"
#import "ManagerUserXMLDataFetchedCond.h"

@implementation NetworkConnectorRankingXML

@synthesize mDelegate = delegate__;
@synthesize mCurrentSearchResult = currentSearchResult__;
@synthesize mXMLReadState = xmlReadState__;

static NetworkConnectorRankingXML* __sharedNetworkConnector = nil;

+ (NetworkConnectorRankingXML*) sharedInstance {
    _methodname_;
    
    if(__sharedNetworkConnector == nil){
        __sharedNetworkConnector = [NSAllocateObject([self class], 0, NULL) init];
    }
    
    return __sharedNetworkConnector;
}

- (BOOL) isNetworkAccessing {
    _methodname_;
    return ([retrieveTitleParserArray__ count] > 0);
}

-(id) init {
    _methodname_;
    
    if(self = [super init]) {
        retrieveTitleParserArray__ = [[NSMutableArray alloc] init];
        
        //
        xmlReadState__ = ImsvXmlReadState_waiting;
        
        //retain
        tmpBuffer__ = [[NSMutableString string] retain];
    }

    return self;
}

#pragma mark - public function  

//parser仕様上、メインスレッドで実行すること
- (void) startNetworkingWithURLString:(NSString*) url {
    _methodname_;
    debugout(@"retrieving URL: %@", url);

    //
    BOOL netState = [self isNetworkAccessing];
    
    //
    NetworkResponseParser* parser = [[[NetworkResponseParser alloc] init] autorelease];
    parser.mUrlString = url;
    parser.mDelegate = self;
    
    [parser startAsynchronous];     //メインスレッドで、非同期通信開始

    [retrieveTitleParserArray__ addObject: parser];
    
    if(netState != [self isNetworkAccessing]){
        debugout(@"==============KEY Valule Change====================(networState)");
        [self willChangeValueForKey:KEY_OBSERVER_NETWORK_STATE];
        [self didChangeValueForKey:KEY_OBSERVER_NETWORK_STATE];
    }
}


- (void) cancelRetrieveTitle {
    _methodname_;
    
}

//----------------------------------------------------------
#pragma mark - NetworkParser Delegate 
//----------------------------------------------------------

- (void)networkParser:(NetworkResponseParser*)parser didReceiveResponse:(NSURLResponse*)response {
    _methodname_;

    debugout(@"*** URL: %@, MIMEType: %@, expectedContentLength: %lld, textEncodingName: %@, filename: %@", 
             [response URL],
             [response MIMEType],
             [response expectedContentLength],
             [response textEncodingName], 
             [response suggestedFilename]);
    
    if([delegate__ respondsToSelector: @selector(networkConnector:didReceiveResponse:)]){
        [delegate__ networkConnector:self didReceiveResponse:response];
    }

}

- (void)networkParser:(NetworkResponseParser*)parser didReceiveData:(NSData*)data {
    _methodname_;
    
    if([delegate__ respondsToSelector: @selector(networkConnector:didReceiveData:)]){
        [delegate__ networkConnector:self didReceiveData:data];
    }
    
}

- (void)networkParserDidFinishLoading:(NetworkResponseParser*)parser {
    _methodname_;

    //----------------------------
    //デリゲートにXMLパース開始を伝達
    //----------------------------
    if([delegate__ respondsToSelector: @selector(networkConnectorStartParsing:)]){
        [delegate__ networkConnectorStartParsing: self];
    }

    //
    NSData* receiveData = parser.mDownloadData;

    //NSString* checkString = [[NSString alloc] initWithData:receiveData encoding:NSISOLatin2StringEncoding];
    //debugout(@"checkString: %@", checkString);

    //これ大事。複数回利用される時に重要。
    xmlReadState__ = ImsvXmlReadState_waiting;

    dispatch_queue_t mainQueue = dispatch_get_main_queue();
//    dispatch_queue_t defaultPriorityQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0);
    dispatch_async(mainQueue, ^{

        NSXMLParser* xml = [[NSXMLParser alloc] initWithData: receiveData];
        [xml setDelegate: self];
        [xml parse];
        [xml release], xml = nil;
        dispatch_async(mainQueue, ^{
            debugout(@"--------XML Parse Complete !!!!-----------");

            //----------------------------
            //デリゲートにパース完了を伝達
            //----------------------------
            if([delegate__ respondsToSelector: @selector(networkConnectorDidFinishLoading:)]){
                [delegate__ networkConnectorDidFinishLoading: self];
            }

        });
    });

}

- (void)networkParser:(NetworkResponseParser*)parser didFailWithError:(NSError*)error {
    _methodname_;
    
    [IMSVCore alertSimple: NSLocalizedString(@"誠に申し訳ございません。\nネットワーク通信エラーです。\n時間をおいてから\n良好に通信できる環境にて\n改めてお試し下さい。", @"NetworkConnectorRankingXML")];

    //前回の検索結果を表示
    if([delegate__ respondsToSelector: @selector(networkConnector:didFailWithError:)]){
        [delegate__ networkConnector:self didFailWithError:nil];
    }

}

- (void)networkParserDidCancel:(NetworkResponseParser*)parser {
    _methodname_;
    
    if([delegate__ respondsToSelector: @selector(networkConnectorDidCancel:)]){
        [delegate__ networkConnectorDidCancel:self];
    }

}


//----------------------------------------------------------
#pragma mark - XML Parser Delegate Methods 
//----------------------------------------------------------

// 要素の開始
- (void)parser:(NSXMLParser*)parser didStartElement:(NSString*)elementName 
  namespaceURI:(NSString*)namespaceURI 
 qualifiedName:(NSString*)qualifiedName 
    attributes:(NSDictionary*)attributeDict
{
    //_methodname_;
    //debugout(@"[---START Parse[%@]-------->]namespaceURI: %@, qualifiedName: %@, attributeDict: %@", elementName, namespaceURI, qualifiedName, attributeDict);

    //
    if([elementName isEqualToString:@"feed"]){
        xmlReadState__ = ImsvXmlReadState_header_START;
        
        //-------------------------------
        //Model Search Resultを生成
        //-------------------------------
        currentSearchResult__ = [ManagerSearchResultIOSAppDataArray insertNewSearchResult];
        currentSearchResult__.searchYYMMDDHHMMSS = [NSDate date];   //検索操作を行った日時
        
        ModelUserInfo* user = [[ManagerUserInfo sharedInstance] read:0];
        
        debugout(@"serverCond: %d", [user.rankingSpec intValue]);
        currentSearchResult__.conditionType = [NSNumber numberWithInt:[user.rankingSpec intValue]];

        return;
    }
    
    
    //appを検出したら、app 編集モードへ遷移
    if([elementName isEqualToString:@"app"]){
        xmlReadState__ = ImsvXmlReadState_app_START;
        
        //-------------------------------
        //ModelIOApplication を生成
        //-------------------------------
        currentIOSApplication__ = [ManagerSearchResultIOSAppDataArray insertNewIOSApp];
        
        //もう追加
        [currentSearchResult__ addAppsObject: currentIOSApplication__];
        debugout(@"count of apps: %d", [currentSearchResult__.apps count]);
        
        return;
    }
    
    

    
    //テンポラリバッファの作成
    [tmpBuffer__ release], tmpBuffer__ = nil;
    tmpBuffer__ = [[NSMutableString string] retain];
    
    //
    if(xmlReadState__ >= ImsvXmlReadState_header_START && 
       xmlReadState__ <= ImsvXmlReadState_header_END && 
       [elementName isEqualToString:@"cond"])
    {
        xmlReadState__ = ImsvXmlReadState_header_cond;
        return;
    }

    //
    if(xmlReadState__ >= ImsvXmlReadState_header_START && 
       xmlReadState__ <= ImsvXmlReadState_header_END && 
       [elementName isEqualToString:@"createdBin"])
    {
        xmlReadState__ = ImsvXmlReadState_header_created;
        return;
    }

    
    //
    if(xmlReadState__ >= ImsvXmlReadState_header_START && 
       xmlReadState__ <= ImsvXmlReadState_header_END && 
       [elementName isEqualToString:@"retryInterval"])
    {
        xmlReadState__ = ImsvXmlReadState_header_retryInterval;
        
        currentXMLDataFetchedCond__ = [ManagerUserXMLDataFetchedCond insertNew];
        currentXMLDataFetchedCond__.condType = currentSearchResult__.conditionType;
        currentXMLDataFetchedCond__.fetchedDatetime = [NSDate date];
        
        return;
    }
    

    //==================================
    
    if(xmlReadState__ >= ImsvXmlReadState_app_START && 
       xmlReadState__ <= ImsvXmlReadState_app_END &&
       [elementName isEqualToString:@"displayOrder"])
    {
        xmlReadState__ = ImsvXmlReadState_app_displayOrder;
        return;
    }

    if(xmlReadState__ >= ImsvXmlReadState_app_START && 
       xmlReadState__ <= ImsvXmlReadState_app_END &&
       [elementName isEqualToString:@"appleId"])
    {
        xmlReadState__ = ImsvXmlReadState_app_appleId;
        return;
    }

    if(xmlReadState__ >= ImsvXmlReadState_app_START && 
       xmlReadState__ <= ImsvXmlReadState_app_END &&
       [elementName isEqualToString:@"bundleId"])
    {
        xmlReadState__ = ImsvXmlReadState_app_bundleId;
        return;
    }
    
    if(xmlReadState__ >= ImsvXmlReadState_app_START && 
       xmlReadState__ <= ImsvXmlReadState_app_END &&
       [elementName isEqualToString:@"name"])
    {
        xmlReadState__ = ImsvXmlReadState_app_name;
        return;
    }
    
    if(xmlReadState__ >= ImsvXmlReadState_app_START && 
       xmlReadState__ <= ImsvXmlReadState_app_END &&
       [elementName isEqualToString:@"hrefURL"])
    {
        xmlReadState__ = ImsvXmlReadState_app_hrefURL;
        return;
    }
    
    if(xmlReadState__ >= ImsvXmlReadState_app_START && 
       xmlReadState__ <= ImsvXmlReadState_app_END &&
       [elementName isEqualToString:@"summary"])
    {
        xmlReadState__ = ImsvXmlReadState_app_summary;
        return;
    }

    if(xmlReadState__ >= ImsvXmlReadState_app_START && 
       xmlReadState__ <= ImsvXmlReadState_app_END &&
       [elementName isEqualToString:@"previewImageURL"])
    {
        xmlReadState__ = ImsvXmlReadState_app_previewImageURL;
        return;
    }

    if(xmlReadState__ >= ImsvXmlReadState_app_START && 
       xmlReadState__ <= ImsvXmlReadState_app_END &&
       [elementName isEqualToString:@"categoryLabel"])
    {
        xmlReadState__ = ImsvXmlReadState_app_categoryLabel;
        return;
    }
    
    if(xmlReadState__ >= ImsvXmlReadState_app_START && 
       xmlReadState__ <= ImsvXmlReadState_app_END &&
       [elementName isEqualToString:@"categoryTerm"])
    {
        xmlReadState__ = ImsvXmlReadState_app_categoryTerm;
        return;
    }

    if(xmlReadState__ >= ImsvXmlReadState_app_START && 
       xmlReadState__ <= ImsvXmlReadState_app_END &&
       [elementName isEqualToString:@"artistName"])
    {
        xmlReadState__ = ImsvXmlReadState_app_artistName;
        return;
    }
    
    if(xmlReadState__ >= ImsvXmlReadState_app_START && 
       xmlReadState__ <= ImsvXmlReadState_app_END &&
       [elementName isEqualToString:@"priceAmount"])
    {
        xmlReadState__ = ImsvXmlReadState_app_priceAmount;
        return;
    }

    if(xmlReadState__ >= ImsvXmlReadState_app_START && 
       xmlReadState__ <= ImsvXmlReadState_app_END &&
       [elementName isEqualToString:@"priceCurrency"])
    {
        xmlReadState__ = ImsvXmlReadState_app_priceCurrency;
        return;
    }
    
    if(xmlReadState__ >= ImsvXmlReadState_app_START && 
       xmlReadState__ <= ImsvXmlReadState_app_END &&
       [elementName isEqualToString:@"priceLabel"])
    {
        xmlReadState__ = ImsvXmlReadState_app_priceLabel;
        return;
    }
    
    if(xmlReadState__ >= ImsvXmlReadState_app_START && 
       xmlReadState__ <= ImsvXmlReadState_app_END &&
       [elementName isEqualToString:@"iconMaxSizeURL"])
    {
        xmlReadState__ = ImsvXmlReadState_app_iconMaxSizeURL;
        return;
    }

    if(xmlReadState__ >= ImsvXmlReadState_app_START && 
       xmlReadState__ <= ImsvXmlReadState_app_END &&
       [elementName isEqualToString:@"rights"])
    {
        xmlReadState__ = ImsvXmlReadState_app_rights;
        return;
    }

    if(xmlReadState__ >= ImsvXmlReadState_app_START && 
       xmlReadState__ <= ImsvXmlReadState_app_END &&
       [elementName isEqualToString:@"releaseDateLabel"])
    {
        xmlReadState__ = ImsvXmlReadState_app_releaseDateLabel;
        return;
    }

}

// 文字列の出現
- (void)parser:(NSXMLParser*)parser foundCharacters:(NSString*)string {
    [tmpBuffer__ appendString:string];
}


// 要素の終了 
- (void)parser:(NSXMLParser*)parser  didEndElement:(NSString*)elementName 
  namespaceURI:(NSString*)namespaceURI 
 qualifiedName:(NSString*)qualifiedName
{
//    _methodname_;
    
  //  debugout(@"==[buffer] %@", tmpBuffer__);
  //  debugout(@"[<---END Parse[%@]--------]namespaceURI: %@, qualifiedName: %@\n\n", elementName, namespaceURI, qualifiedName);
    
    //
    switch (xmlReadState__) {
            
        case ImsvXmlReadState_header_cond:
            //上位で設定しているので、いったん、サーバー返却の値は捨てる
            //currentSearchResult__.conditionType = [NSNumber numberWithInt:[tmpBuffer__ intValue]];
            xmlReadState__ = ImsvXmlReadState_header_START;
            break;
            
        case ImsvXmlReadState_header_created:
            currentSearchResult__.resultDateString = tmpBuffer__;
            xmlReadState__ = ImsvXmlReadState_header_START;
            break;

        case ImsvXmlReadState_header_retryInterval:
            currentXMLDataFetchedCond__.fetchedRetryInterval = [NSNumber numberWithInt:[tmpBuffer__ intValue]];
            xmlReadState__ = ImsvXmlReadState_header_START;
            break;

            
            //==========================================
            //
        case ImsvXmlReadState_app_displayOrder:
            currentIOSApplication__.displayOrder = [NSNumber numberWithInt:[tmpBuffer__ intValue]];
            xmlReadState__ = ImsvXmlReadState_app_START;
            break;
            
        case ImsvXmlReadState_app_appleId:
            currentIOSApplication__.appleId = tmpBuffer__;
            xmlReadState__ = ImsvXmlReadState_app_START;
            break;

        case ImsvXmlReadState_app_bundleId:
            currentIOSApplication__.bundleId = tmpBuffer__;
            xmlReadState__ = ImsvXmlReadState_app_START;
            break;

        case ImsvXmlReadState_app_name:
            currentIOSApplication__.name = tmpBuffer__;
            xmlReadState__ = ImsvXmlReadState_app_START;
            break;
            
        case ImsvXmlReadState_app_hrefURL:
            currentIOSApplication__.hrefURL = tmpBuffer__;
            xmlReadState__ = ImsvXmlReadState_app_START;
            break;

        case ImsvXmlReadState_app_summary:
            currentIOSApplication__.summary = tmpBuffer__;
            xmlReadState__ = ImsvXmlReadState_app_START;
            break;

        case ImsvXmlReadState_app_previewImageURL:
            currentIOSApplication__.previewImageURL = tmpBuffer__;
            xmlReadState__ = ImsvXmlReadState_app_START;
            break;
            
        case ImsvXmlReadState_app_categoryLabel:
            currentIOSApplication__.categoryLabel = tmpBuffer__;
            xmlReadState__ = ImsvXmlReadState_app_START;
            break;

        case ImsvXmlReadState_app_categoryTerm:
            currentIOSApplication__.categoryTerm = tmpBuffer__;
            xmlReadState__ = ImsvXmlReadState_app_START;
            break;
            
        case ImsvXmlReadState_app_artistName:
            currentIOSApplication__.artistName = tmpBuffer__;
            xmlReadState__ = ImsvXmlReadState_app_START;
            break;

        case ImsvXmlReadState_app_priceAmount:
            currentIOSApplication__.priceAmount = [NSNumber numberWithDouble: [tmpBuffer__ doubleValue]];
            xmlReadState__ = ImsvXmlReadState_app_START;
            break;

        case ImsvXmlReadState_app_priceCurrency:
            currentIOSApplication__.priceCurrency = tmpBuffer__;
            xmlReadState__ = ImsvXmlReadState_app_START;
            break;
            
        case ImsvXmlReadState_app_priceLabel:
            currentIOSApplication__.priceLabel = tmpBuffer__;
            xmlReadState__ = ImsvXmlReadState_app_START;
            break;

        case ImsvXmlReadState_app_iconMaxSizeURL:
            currentIOSApplication__.iconMaxSizeURL = tmpBuffer__;
            xmlReadState__ = ImsvXmlReadState_app_START;
            break;

        case ImsvXmlReadState_app_rights:
            currentIOSApplication__.rights = tmpBuffer__;
            xmlReadState__ = ImsvXmlReadState_app_START;
            break;
            
        case ImsvXmlReadState_app_releaseDateLabel:
            currentIOSApplication__.releaseDateLabel = tmpBuffer__;
            xmlReadState__ = ImsvXmlReadState_app_START;
            break;


        default:
            break;
    }
    
    //
    [tmpBuffer__ release], tmpBuffer__ = nil;

    //
    if([elementName isEqualToString:@"feed"]){
        
        debugout(@"rankingSpeck: %d {%@} %@", 
                 [currentSearchResult__.conditionType intValue], 
                 currentSearchResult__, 
                 currentSearchResult__.resultDateString); 

        xmlReadState__ = ImsvXmlReadState_parse_complete;
    }
    
    
}


- (void)parserDidEndDocument:(NSXMLParser*)parser
{
    _methodname_;
    
    switch (xmlReadState__) {
        case ImsvXmlReadState_parse_complete:
            debugout(@"[ImsvXmlReadState_parse_complete] count of apps: %d", [currentSearchResult__.apps count]);
        break;
            
        default:
            break;
    }

    //
    [retrieveTitleParserArray__ removeAllObjects];

}


- (void) dealloc {
    _methodname_;
    
    [retrieveTitleParserArray__ release], retrieveTitleParserArray__ = nil;
    [tmpBuffer__ release], tmpBuffer__ = nil;
    
    [super dealloc];
}

@end
