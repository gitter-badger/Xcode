//
//  ViewController.h
//  Picker
//
//  Created by Developer Cymetria on 11/07/14.
//  Copyright (c) 2014 Empresa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource, UIAlertViewDelegate>

@property (strong, nonatomic) IBOutlet UIPickerView *pickerPaises;
@property (strong, nonatomic) NSArray * paises;


@end
