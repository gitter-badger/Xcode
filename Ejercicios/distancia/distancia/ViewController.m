//
//  ViewController.m
//  distancia
//
//  Created by Developer Cymetria on 19/07/14.
//  Copyright (c) 2014 vivelab. All rights reserved.
//

#import "ViewController.h"
#import "DisplayMap.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [_mapView setMapType:MKMapTypeHybrid];
    [_mapView setZoomEnabled:YES];
    [_mapView setScrollEnabled:YES];
    
    MKCoordinateRegion region;
    
    //BOGOTA
    region.center.latitude = 4.60971;
    region.center.longitude = -74.08175;
    
    region.span.latitudeDelta = 5;
    region.span.longitudeDelta = 5;
    
    [_mapView setRegion:region animated:YES];
    
    DisplayMap * pin = [[DisplayMap alloc] init];
    pin.title = @"Bogota";
    pin.subtitle = @"Capital Colombia";
    pin.coordinate = region.center;
    
    [_mapView addAnnotation:pin];
    
      //Manizales
    
    DisplayMap * pin2 = [[DisplayMap alloc] init];
    pin2.title = @"Manizales";
    pin2.subtitle = @"Capital Caldas";
    pin2.coordinate = CLLocationCoordinate2DMake(5.07, -75.52056);
    
    [_mapView addAnnotation:pin2];
    
    
    CLLocation * loc1 = [[CLLocation alloc] initWithLatitude:4.60971 longitude:-74.08175];
    CLLocation * loc2 = [[CLLocation alloc] initWithLatitude:5.07 longitude:-75.52056];
    //Calcular distancia
    // 1 Metro = 0.000621371192 Millas
    CLLocationDistance distance = [loc1 distanceFromLocation:loc2];
    
    NSLog(@"Distancia en metros: %f , y en millas: %f", distance, distance*0.000621371192);
    
    _mapView.delegate = self;
    //LINEA
    MKMapPoint * pointsArray = malloc(sizeof(CLLocationCoordinate2D)*2);
    pointsArray[0] = MKMapPointForCoordinate(region.center);
    pointsArray[1] = MKMapPointForCoordinate(CLLocationCoordinate2DMake(5.07, -75.52056));
    _routeLine =[MKPolyline polylineWithPoints:pointsArray count:2];
    [_mapView addOverlay:_routeLine];
    
}
-(MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id<MKOverlay>)overlay{
 
    MKOverlayView * overlayView = nil;
    MKPolylineView * routelineView = [[MKPolylineView alloc] initWithPolyline:_routeLine];
    routelineView.strokeColor = [UIColor redColor];
    routelineView.lineWidth = 5;
    overlayView = routelineView;
    return overlayView;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
