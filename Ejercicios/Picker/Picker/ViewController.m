//
//  ViewController.m
//  Picker
//
//  Created by Developer Cymetria on 11/07/14.
//  Copyright (c) 2014 Empresa. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSBundle * paquete = [NSBundle mainBundle];
    
    NSString * ruta = [paquete pathForResource:@"paises" ofType:@"plist"];
    
    _paises = [[NSArray alloc] initWithContentsOfFile:ruta];
    
	// Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"%@", _paises);
    
    
    
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;

}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [_paises count];
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [_paises objectAtIndex:row];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    UIAlertView * alertaSimple = [[UIAlertView alloc] initWithTitle:@"Alerta Simple"
                                                            message:[_paises objectAtIndex:row]
                                                           delegate:self
                                                  cancelButtonTitle:@"Cancelar"
                                                  otherButtonTitles: @"Aceptar", nil];
    
    alertaSimple.alertViewStyle = UIAlertViewStylePlainTextInput;
    
    [alertaSimple show];
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex== 1) {
        NSLog(@"El texto ingresado es %@", [alertView textFieldAtIndex:0].text);
    }
    //NSLog(@"%ld", (long)buttonIndex);
}

@end
