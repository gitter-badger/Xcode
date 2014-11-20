//
//  ViewController.m
//  Ubicacion Mapa
//
//  Created by Developer Cymetria on 18/07/14.
//  Copyright (c) 2014 vivelab. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    locationManager = [[CLLocationManager alloc] init];
    [locationManager setDelegate:self];
    [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    
    [locationManager startUpdatingLocation];
    
    [_worldView setShowsUserLocation:YES];
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    
    CLLocationCoordinate2D loc = [userLocation coordinate];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 500, 500);
    [_worldView setRegion:region animated:YES];

}
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    CLLocation * newLocation = [locations lastObject];
    CLLocation * oldLocation;
    if (locations.count > 1) {
        oldLocation = [locations objectAtIndex:locations.count-2];
    }else{
        oldLocation = nil;
    
    }
    [self findLocation:newLocation];
}
-(void)findLocation{
}

-(void)findLocation: (CLLocation*)loc{
    CLLocationCoordinate2D cood = [loc coordinate];
    MapPoint * mp = [[MapPoint alloc] initWithCoordinate:cood title:@"Nuevo Punto"];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(cood, 15000, 15000);
    [_worldView setRegion:region animated:YES];
    [_worldView addAnnotation:mp];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeMapType:(id)sender {
    int typeIndex = [sender selectedSegmentIndex];
    
    if (typeIndex==0) {
        [_worldView setMapType:MKMapTypeStandard];
    }else if(typeIndex==1){
        [_worldView setMapType:MKMapTypeSatellite];
    }else if (typeIndex ==2){
        [_worldView setMapType:MKMapTypeHybrid];
    }
}





@end
