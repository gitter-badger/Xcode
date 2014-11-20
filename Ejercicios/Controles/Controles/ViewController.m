//
//  ViewController.m
//  Controles
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

- (IBAction)enableConfiguration:(id)sender {
    UISwitch * encendido = sender;
    if (encendido.on) {
        _boxConfig.hidden = NO;
    }else{
        _boxConfig.hidden = YES;
    
    }
    
    
}

- (IBAction)changeSlider:(id)sender {
    UISlider * volumen = sender;
    _outputVolume.text = [[NSString alloc] initWithFormat:@"%f", volumen.value];
}

- (IBAction)changeStepper:(id)sender {
    _outputRepeat.text = [[NSString alloc] initWithFormat:@"%0.0f", ((UIStepper *) sender).value];
    
}
@end
