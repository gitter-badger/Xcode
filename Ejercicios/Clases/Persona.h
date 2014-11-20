//
//  Persona.h
//  Clases
//
//  Created by Developer Cymetria on 5/07/14.
//  Copyright (c) 2014 Empresa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Persona : NSObject
{
    NSString* nombre;
    int edad;
}

-(NSString *)nombre;
-(void) setNombre: (NSString*) value;

-(int)edad;
-(void) setEdad: (int)value;

-(BOOL) userIsAdult;

@end





