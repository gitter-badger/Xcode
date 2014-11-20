//
//  ViewController.h
//  Video
//
//  Created by Developer Cymetria on 12/07/14.
//  Copyright (c) 2014 Empresa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *userText;
@property (strong,nonatomic) MPMoviePlayerController * reproductor;

@end
