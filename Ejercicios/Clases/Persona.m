//
//  Persona.m
//  Clases
//
//  Created by Developer Cymetria on 5/07/14.
//  Copyright (c) 2014 Empresa. All rights reserved.
//

#import "Persona.h"

@implementation Persona

-(NSString*)nombre{
    return nombre;
}
-(void)setNombre:(NSString *)value{
    nombre = value;
}

-(int)edad{
    return edad;
}
-(void)setEdad:(int)value{
    edad = value;
}
-(BOOL) userIsAdult{
    if (edad>=18) {
        return YES;
    }
    return NO;
}
@end



