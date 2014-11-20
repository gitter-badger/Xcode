//
//  ViewController.h
//  Ubicacion Mapa
//
//  Created by Developer Cymetria on 18/07/14.
//  Copyright (c) 2014 vivelab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "MapPoint.h"

@interface ViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate>
{
    CLLocationManager * locationManager;

}

@property (strong, nonatomic) IBOutlet MKMapView *worldView;
@property (strong, nonatomic) IBOutlet UISegmentedControl *MapType;

- (IBAction)changeMapType:(id)sender;


-(void)findLocation;
-(void)findLocation: (CLLocation*)loc;

@end
