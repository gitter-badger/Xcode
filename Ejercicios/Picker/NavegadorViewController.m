//
//  NavegadorViewController.m
//  Picker
//
//  Created by Developer Cymetria on 11/07/14.
//  Copyright (c) 2014 Empresa. All rights reserved.
//

#import "NavegadorViewController.h"

@interface NavegadorViewController ()

@end

@implementation NavegadorViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

- (IBAction)pdfButton:(id)sender {
    NSString * ruta = [[NSBundle mainBundle] pathForResource:@"noticia" ofType:@"pdf"];
    NSData * datosPDF = [[NSData alloc] initWithContentsOfFile:ruta];
    
    [_navegador loadData:datosPDF MIMEType:@"application/pdf" textEncodingName:nil baseURL:nil];
}

- (IBAction)htmlButton:(id)sender {
    NSString * html = @"<style>h1{color:red;}</style><h1>Esto es un H1 de HTML</h1><p>Cuerpo del contenido</p>";
    [_navegador loadHTMLString:html baseURL:nil];
}

- (IBAction)jsButton:(id)sender {
    NSString * script = @"alert('Alerta desde JS')";
    [_navegador stringByEvaluatingJavaScriptFromString:script];
}

- (IBAction)webButton:(id)sender {
    NSURL * url = [[NSURL alloc] initWithString:@"http://apple.com"];
    NSURLRequest * request = [[NSURLRequest alloc] initWithURL:url];
    
    [_navegador loadRequest:request];
}
-(void)webViewDidStartLoad:(UIWebView *)webView{
    [_cargando startAnimating];

}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    
    [_cargando stopAnimating];

}
@end
