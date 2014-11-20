//
//  ViewController.m
//  Video
//
//  Created by Developer Cymetria on 12/07/14.
//  Copyright (c) 2014 Empresa. All rights reserved.
//

#import "ViewController.h"
#import "AnimacionesViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSString * ruta = [[NSBundle mainBundle] pathForResource:@"BigBuckBunny" ofType:@"mp4"];
    NSURL * url = [[NSURL alloc] initFileURLWithPath:ruta];
    
    _reproductor = [[MPMoviePlayerController alloc] initWithContentURL:url];
    
    _reproductor.view.frame = CGRectMake(10, 10, 300, 180);
    
    
    [self.view addSubview:_reproductor.view];
    
    [_reproductor play];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    AnimacionesViewController * segundaVista = [segue destinationViewController];
    
    NSLog(@"Texto en la vista 1: %@", _userText.text);
    
    [segundaVista getUserAndChangeLabel:_userText.text];

}


@end
