//
//  AnimacionesViewController.m
//  Video
//
//  Created by Developer Cymetria on 12/07/14.
//  Copyright (c) 2014 Empresa. All rights reserved.
//

#import "AnimacionesViewController.h"

@interface AnimacionesViewController ()
{
    NSString * valorText;
}
@end

@implementation AnimacionesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [_userLabel setText:valorText];

     
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
- (IBAction)animarSimple:(id)sender {
    
    [UIView animateWithDuration:1 animations:^{
        _viewContainer.frame = CGRectMake(_viewContainer.frame.origin.x, _viewContainer.frame.origin.y, _viewContainer.frame.size.width, 250);
        _viewContainer.alpha = 1;
        _viewContainer.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:1];
    }];
}

- (IBAction)animarDoble:(id)sender {
    [UIView animateWithDuration:2 animations:^{
        _viewContainer.frame = CGRectMake(_viewContainer.frame.origin.x, _viewContainer.frame.origin.y, _viewContainer.frame.size.width, 250);
        _viewContainer.alpha = 1;
    } completion:^(BOOL finished) {
        _viewContainer.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:1];
    }];
}

- (IBAction)animarCompuesto:(id)sender {
    [UIView animateWithDuration:2 delay:2 options:UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse animations:^{
        _viewContainer.frame = CGRectMake(_viewContainer.frame.origin.x, _viewContainer.frame.origin.y, _viewContainer.frame.size.width, 250);
        _viewContainer.alpha = 1;
        
    } completion:^(BOOL finished) {
        
    }];
}

- (IBAction)stopAnimation:(id)sender {
    [_viewContainer.layer removeAllAnimations];
}

-(void)getUserAndChangeLabel: (NSString*)label{
    NSLog(@"%@", label);
    valorText = label;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
