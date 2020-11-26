//
//  LocationManager.m
//  TicketSearch
//
//  Created by Оксана Зверева on 25.11.2020.
//

#import "LocationManager.h"

#import <MapKit/MapKit.h>

@interface LocationManager () <CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *manager;

@end

@implementation LocationManager

-(instancetype) init {
    self = [super init];
    if (self) {
       self.manager = [CLLocationManager new];
        self.manager.delegate = self;
        self.manager.desiredAccuracy = kCLLocationAccuracyKilometer;
        self.manager.distanceFilter = 500;
        [self.manager startUpdatingLocation];
        [self.manager requestWhenInUseAuthorization];
          
    }
    return  self;
}



- (void) dealloc {
    [self.manager startUpdatingLocation];
}

- (void) locationManagerDidChangeAuthorization:(CLLocationManager *)manager {
    switch (self.manager.authorizationStatus) {
        case kCLAuthorizationStatusAuthorizedAlways:
        case kCLAuthorizationStatusAuthorizedWhenInUse:
            [self.manager startUpdatingLocation];
            break;
        case kCLAuthorizationStatusNotDetermined:
            break;
        default: {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Oops!" message:@"Can't get your location" preferredStyle:(UIAlertControllerStyleAlert)];
            [alert addAction:[UIAlertAction actionWithTitle:@"Ok" style:(UIAlertActionStyleDefault) handler:nil]];
            [[[UIApplication sharedApplication].windows firstObject].rootViewController presentViewController:alert animated:YES completion:nil]; 
        }
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    CLLocation *location = [locations firstObject];
    if (location) {
        NSLog(@"%@", location);
        [self addresFromLocation:location];
        _currentLocation = location;
        [[NSNotificationCenter defaultCenter] postNotificationName:kLocationManagerDidUpdateLocation object:location];
    }
}

- (void)addresFromLocation:(CLLocation *)location {
    CLGeocoder *geocoder = [CLGeocoder new];
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if (placemarks.count > 0) {
            for (MKPlacemark *placemark in placemarks) {
                NSLog(@"place name %@", placemark.name);
            }
        }
    }];
}

@end
