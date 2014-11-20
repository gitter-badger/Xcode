//
//  ViewController.m
//  Reproductor
//
//  Created by Developer Cymetria on 5/07/14.
//  Copyright (c) 2014 Empresa. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    NSTimer *sliderTimer;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSError * error;
    NSString * ruta = [[NSBundle mainBundle] pathForResource:@"demo" ofType:@"mp3"];
    
    NSURL * url = [[NSURL alloc] initFileURLWithPath:ruta];
    
    //NSLog(@"%@", ruta);
    //NSLog(@"%@", url);
    _reproductor = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    _reproductor.volume = 1;
    _reproductor.pan = 0.5;
    _reproductor.rate = 1;
    _reproductor.enableRate = YES;
    _reproductor.numberOfLoops = -1;
    _reproductor.delegate = self;
    
    [_reproductor prepareToPlay];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)play:(id)sender {
    [_reproductor play];
    sliderTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateBarra) userInfo:nil repeats:YES];
}
-(void)updateBarra{
    _progressBar.progress = _reproductor.currentTime/_reproductor.duration;
}

- (IBAction)stop:(id)sender {
    [_reproductor stop];
    _reproductor.currentTime = 0;
    [sliderTimer invalidate];
    _progressBar.progress = 0;
}
- (IBAction)pausa:(id)sender {
    _labelTime.text = [[NSString alloc] initWithFormat:@"Duracion: %f, CurrentTime: %f", _reproductor.duration, _reproductor.currentTime];
    [_reproductor pause];    
}
- (IBAction)changeVolumen:(id)sender {
}

- (IBAction)changeSpeed:(id)sender {
}
@end
