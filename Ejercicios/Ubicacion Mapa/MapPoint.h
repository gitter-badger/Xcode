//
//  MapPoint.h
//  Ubicacion Mapa
//
//  Created by Developer Cymetria on 18/07/14.
//  Copyright (c) 2014 vivelab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface MapPoint : NSObject <MKAnnotation>

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

@property (nonatomic, copy) NSString * title;


-(id)initWithCoordinate: (CLLocationCoordinate2D)c title:(NSString*)t;


@end
