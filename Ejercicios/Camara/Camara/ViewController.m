//
//  ViewController.m
//  Camara
//
//  Created by Developer Cymetria on 19/07/14.
//  Copyright (c) 2014 cymetria. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIAlertView * alertaError = [[UIAlertView alloc] initWithTitle:@"Error" message:@"El dispositivo no tiene camara disponible" delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles: nil];
        [alertaError show];
    }
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tomarFoto:(id)sender {
    
    UIImagePickerController * picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [picker setCameraDevice:UIImagePickerControllerCameraDeviceRear];
    
    [self presentViewController:picker animated:YES completion:nil];
}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    UIImage *imagenCapturada = info[UIImagePickerControllerEditedImage];
    _imageView.image = imagenCapturada;
    UIImageWriteToSavedPhotosAlbum(imagenCapturada, nil, nil, nil);
    [picker dismissViewControllerAnimated:YES completion:nil];

}

- (IBAction)seleccionarFoto:(id)sender {
    UIImagePickerController * picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
        picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:nil];
}
@end
