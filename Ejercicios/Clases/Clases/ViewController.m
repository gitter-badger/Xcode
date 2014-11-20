//
//  ViewController.m
//  Clases
//
//  Created by Developer Cymetria on 5/07/14.
//  Copyright (c) 2014 Empresa. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)validar:(id)sender {
    Persona * persona1 = [[Persona alloc] init];
    [persona1 setNombre:_nameTextField.text];
    [persona1 setEdad:[_ageTextField.text intValue]];
    
    
    if ([persona1 userIsAdult]) {
        _respuestaTextField.text = [NSString stringWithFormat:@"%@ es adulto", persona1.nombre];
    }else{
        _respuestaTextField.text = [NSString stringWithFormat:@"%@ no es adulto", persona1.nombre];
    }

}
@end
