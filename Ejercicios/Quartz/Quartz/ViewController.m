//
//  ViewController.m
//  Quartz
//
//  Created by Developer Cymetria on 25/07/14.
//  Copyright (c) 2014 cymetria. All rights reserved.
//

#import "ViewController.h"
#import "QuartzView.h"
#import "Constants.h"

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

- (IBAction)changeColor:(id)sender {
    UISegmentedControl * control = sender;
    NSInteger index = [control selectedSegmentIndex];
    QuartzView * quartz = (QuartzView *)self.view;
    switch (index) {
        case kRedColorTab:
            quartz.currentColor = [UIColor redColor];
            quartz.useRandomColor = NO;
            break;
        case kBlueColorTab:
            quartz.currentColor = [UIColor blueColor];
            quartz.useRandomColor = NO;
            break;
        case kYellowColorTab:
            quartz.currentColor = [UIColor yellowColor];
            quartz.useRandomColor = NO;
            break;
        case kRandomColorTab:
            quartz.useRandomColor = YES;
            break;
            
        default:
            break;
    }
    
    
}

- (IBAction)changeShape:(id)sender {
    UISegmentedControl * control = sender;
 
    [(QuartzView *)self.view setShapeType: [control selectedSegmentIndex]];

}
@end
