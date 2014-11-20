//
//  ViewController.h
//  Clases
//
//  Created by Developer Cymetria on 5/07/14.
//  Copyright (c) 2014 Empresa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Persona.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *ageTextField;
@property (weak, nonatomic) IBOutlet UILabel *respuestaTextField;

- (IBAction)validar:(id)sender;

@end
