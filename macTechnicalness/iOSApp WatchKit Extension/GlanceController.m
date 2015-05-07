//
//  GlanceController.m
//  iOSApp WatchKit Extension
//
//  Created by Yuji Imamura on 2015/05/01.
//
//

#import "GlanceController.h"
#import "CommonHeader.h"

@interface GlanceController()
<CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet WKInterfaceLabel *latitudeLabel;
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *longitudeLabel;
@property (weak, nonatomic) IBOutlet WKInterfaceMap *mapObject;

/*!
 @abstract  CLLocationマネージャ
 */
@property (strong, nonatomic) CLLocationManager* locationManager;

/*!
 @abstract  現在位置座標
 */
@property CLLocationCoordinate2D currentLocationCoordinate;

@end


@implementation GlanceController

- (void)awakeWithContext:(id)context {
    _methodname_;
    
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
    _methodname_;
    
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    
    [self updateLocationCommand];
}

- (void)didDeactivate {
    _methodname_;
    
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
    
    MKCoordinateSpan span = MKCoordinateSpanMake(0.002, 0.002);
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
    [_latitudeLabel setText:[NSString stringWithFormat:@"緯度:%f", coordinate.latitude]];
    [_longitudeLabel setText:[NSString stringWithFormat:@"経度:%f", coordinate.longitude]];
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    _methodname_;
    debugout(@"status: %d", status);
    
    if (status == kCLAuthorizationStatusNotDetermined) {
        // ユーザが位置情報の使用を許可していない
    }
}
@end



