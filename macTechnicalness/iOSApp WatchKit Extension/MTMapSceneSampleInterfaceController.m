//
//  MTScene2InterfaceController.m
//  macTechnicalness
//
//  Created by Yuji Imamura on 2015/05/06.
//
//

#import "MTMapSceneSampleInterfaceController.h"
#import "CommonHeader.h"

@interface MTMapSceneSampleInterfaceController ()

/*!
 @abstract  マップオブジェクト
 */
@property (weak, nonatomic) IBOutlet WKInterfaceMap* mapObject;

/*!
 @abstract  緯度ラベル
 */
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *latitudeLabel;

/*!
 @abstract  経度ラベル
 */
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *longitudeLabel;

/*!
 @abstract  現在位置座標
 */
@property CLLocationCoordinate2D currentLocationCoordinate;

/*!
 @abstract  CLLocationマネージャ
 */
@property (strong, nonatomic) CLLocationManager* locationManager;

@end

@implementation MTMapSceneSampleInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // Configure interface objects here.
    
    MKCoordinateSpan span = MKCoordinateSpanMake(1.0f, 1.0f);
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(35.4f, 139.4f);
    MKCoordinateRegion region = MKCoordinateRegionMake(coordinate, span);

    MKMapPoint centerPoint = MKMapPointForCoordinate(coordinate);
    [_mapObject setVisibleMapRect:MKMapRectMake(centerPoint.x, centerPoint.y,
                                              span.latitudeDelta, span.longitudeDelta)];
    [_mapObject setRegion:region];
    
    _locationManager = [CLLocationManager new];
    _locationManager.delegate = self;

    [self updateLocationCommand];
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

#pragma mark - CLLocationManagerDelegate

- (void)updateLocationCommand
{
    BOOL locationUseFlag = [CLLocationManager locationServicesEnabled];
    debugout(@"location use flag: %d", locationUseFlag);
    
    if(locationUseFlag){
        [_locationManager startUpdatingLocation];
    }

}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    _methodname_;
    CLLocation* location = [locations firstObject];
    CLLocationCoordinate2D coordinate = location.coordinate;
    debugout(@"location: %f, %f", coordinate.latitude, coordinate.longitude);
    
    _currentLocationCoordinate = coordinate;
    
    MKCoordinateSpan span = MKCoordinateSpanMake(0.003, 0.003);
    MKCoordinateRegion region = MKCoordinateRegionMake(coordinate, span);
    MKMapPoint centerPoint = MKMapPointForCoordinate(coordinate);
    [_mapObject setVisibleMapRect:MKMapRectMake(centerPoint.x, centerPoint.y,
                                                span.latitudeDelta, span.longitudeDelta)];
    [_mapObject setRegion:region];

    [_mapObject removeAllAnnotations];
    [_mapObject addAnnotation:region.center withPinColor:WKInterfaceMapPinColorGreen];

    [_locationManager stopUpdatingLocation];
    
    /*
     @comment   緯度・経度をラベルに反映する
     */
#if 0
    [_latitudeLabel setText:[NSString stringWithFormat:@"緯度:%f", coordinate.latitude]];
    [_longitudeLabel setText:[NSString stringWithFormat:@"経度:%f", coordinate.longitude]];
#else
    
    /*
     @comment
     */
    [self reverseGeocordeWithLatitude:_currentLocationCoordinate.latitude longitude:_currentLocationCoordinate.longitude];

    
#endif
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    _methodname_;
    debugout(@"status: %d", status);
    
    if (status == kCLAuthorizationStatusNotDetermined) {
        // ユーザが位置情報の使用を許可していない
    }
}

#pragma mark - ボタン

- (IBAction)didSelectUpdateButton {
    _methodname_;
 
    [self updateLocationCommand];
}


- (void)reverseGeocordeWithLatitude:(double)latitude longitude:(double)longitude {
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    CLLocation *location = [[CLLocation alloc] initWithLatitude:latitude
                                                       longitude:longitude];
    
    [geocoder reverseGeocodeLocation:location
                   completionHandler:^(NSArray* placemarks, NSError* error) {

                       for (CLPlacemark *placemark in placemarks) {
                           NSDictionary* addressDic = placemark.addressDictionary;
                           debugout(@"addressdic: %@", addressDic);
                           
                           [_latitudeLabel setText:[NSString stringWithFormat:@"〒%@", [addressDic objectForKey:@"ZIP"]]];
                           [_longitudeLabel setText:[NSString stringWithFormat:@"%@%@%@%@",
                                                    [addressDic objectForKey:@"State"],
                                                    [addressDic objectForKey:@"City"],
                                                    [addressDic objectForKey:@"SubLocality"],
                                                    [addressDic objectForKey:@"Street"]
                                                    ]];
                       }
                   }];
}

- (IBAction)didSelectCmdButton {
    _methodname_;
    
    /*
     @comment
     */
    [self reverseGeocordeWithLatitude:_currentLocationCoordinate.latitude longitude:_currentLocationCoordinate.longitude];
    
    
    // Sends a non-nil result to the parent iOS application.
    /*
     @comment   本体にメッセージを送信する
     */
    NSString* dataString = [NSString stringWithFormat:@"%f,%f", _currentLocationCoordinate.latitude, _currentLocationCoordinate.longitude];
    BOOL didOpenParent = [WKInterfaceController openParentApplication:@{@"TextInput" : dataString}
                                                                reply:^(NSDictionary *replyInfo, NSError *error)
                          {
                              NSLog(@"Reply Info: %@", replyInfo);
                              NSLog(@"Error: %@", [error localizedDescription]);
                          }];
    
    NSLog(didOpenParent == YES ? @"{Success}" : @"{Error}");
}

@end



