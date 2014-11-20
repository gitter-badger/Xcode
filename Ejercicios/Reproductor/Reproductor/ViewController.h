//
//  ViewController.h
//  Reproductor
//
//  Created by Developer Cymetria on 5/07/14.
//  Copyright (c) 2014 Empresa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController <AVAudioPlayerDelegate>

- (IBAction)play:(id)sender;
- (IBAction)stop:(id)sender;
- (IBAction)pausa:(id)sender;
- (IBAction)changeVolumen:(id)sender;
- (IBAction)changeSpeed:(id)sender;

@property (strong, nonatomic) IBOutlet UIProgressView *progressBar;
@property (strong, nonatomic) IBOutlet UILabel *labelTime;

@property (strong, nonatomic) AVAudioPlayer * reproductor;



@end




