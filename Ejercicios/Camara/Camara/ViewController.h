//
//  ViewController.h
//  Camara
//
//  Created by Developer Cymetria on 19/07/14.
//  Copyright (c) 2014 cymetria. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)tomarFoto:(id)sender;
- (IBAction)seleccionarFoto:(id)sender;
@end

