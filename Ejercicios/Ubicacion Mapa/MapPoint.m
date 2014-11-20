//
//  MapPoint.m
//  Ubicacion Mapa
//
//  Created by Developer Cymetria on 18/07/14.
//  Copyright (c) 2014 vivelab. All rights reserved.
//

#import "MapPoint.h"

@implementation MapPoint

-(id)initWithCoordinate: (CLLocationCoordinate2D)c title:(NSString*)t{
    self = [super init];
    
    if (self) {
        _coordinate = c;
        [self setTitle:t];
    }
    return self;
}

-(id)init{
    //5.07, -75.52056
    
    return [self initWithCoordinate:CLLocationCoordinate2DMake(5.07, -75.52056) title:@"Manizales"];
    

}




@end
