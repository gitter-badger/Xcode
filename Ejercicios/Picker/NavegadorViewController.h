//
//  NavegadorViewController.h
//  Picker
//
//  Created by Developer Cymetria on 11/07/14.
//  Copyright (c) 2014 Empresa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavegadorViewController : UIViewController <UIWebViewDelegate>
- (IBAction)pdfButton:(id)sender;

- (IBAction)htmlButton:(id)sender;
- (IBAction)jsButton:(id)sender;
- (IBAction)webButton:(id)sender;

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *cargando;
@property (strong, nonatomic) IBOutlet UIWebView *navegador;
@end
