//
//  ViewController.h
//  distancia
//
//  Created by Developer Cymetria on 19/07/14.
//  Copyright (c) 2014 vivelab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController <MKMapViewDelegate>

@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic, strong) MKPolyline * routeLine;

@end
