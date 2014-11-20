//
//  DisplayMap.h
//  distancia
//
//  Created by Developer Cymetria on 19/07/14.
//  Copyright (c) 2014 vivelab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface DisplayMap : NSObject <MKAnnotation>

@property (nonatomic) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString * title;
@property (nonatomic, copy) NSString * subtitle;

@end
