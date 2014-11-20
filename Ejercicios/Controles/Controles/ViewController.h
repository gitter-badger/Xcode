//
//  ViewController.h
//  Controles
//
//  Created by Developer Cymetria on 5/07/14.
//  Copyright (c) 2014 Empresa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
- (IBAction)enableConfiguration:(id)sender;
- (IBAction)changeSlider:(id)sender;
- (IBAction)changeStepper:(id)sender;

@property (strong, nonatomic) IBOutlet UIView *boxConfig;
@property (strong, nonatomic) IBOutlet UILabel *outputVolume;
@property (strong, nonatomic) IBOutlet UILabel *outputRepeat;

@end
