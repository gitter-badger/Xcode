//
//  AnimacionesViewController.h
//  Video
//
//  Created by Developer Cymetria on 12/07/14.
//  Copyright (c) 2014 Empresa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface AnimacionesViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *userLabel;

@property (strong, nonatomic) IBOutlet UIView *viewContainer;
- (IBAction)animarSimple:(id)sender;
- (IBAction)animarDoble:(id)sender;
- (IBAction)animarCompuesto:(id)sender;
- (IBAction)stopAnimation:(id)sender;

-(void)getUserAndChangeLabel: (NSString*)label;

@end
