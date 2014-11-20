//
//  ViewController.m
//  JSON
//
//  Created by Developer Cymetria on 26/07/14.
//  Copyright (c) 2014 cymetria. All rights reserved.
//

#define kJsonLoadURL [NSString stringWithFormat:@"http://api.kivaws.org/v1/loans/search.json?status=fundraising"]
#define kQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
#import "ViewController.h"
@interface ViewController ()
-(NSDictionary*) dictionaryWithContentsOfJSONUrl: (NSString*) urlAddress;
-(NSData*) toJSON;
@end
@implementation ViewController
-(NSDictionary*) dictionaryWithContentsOfJSONUrl: (NSString*) urlAddress{
    NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlAddress]];
    NSError * error = nil;
    id result = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    if (error != nil) {return nil;}
    return result;
}
-(void)fetchData{
    NSDictionary * json = [self dictionaryWithContentsOfJSONUrl:kJsonLoadURL];
    NSArray * ultimoRegistro = [json objectForKey:@"loans"];
    NSDictionary * registro = [ultimoRegistro objectAtIndex:0];
    NSNumber * registro_id = [registro objectForKey:@"id"];
    NSString * registro_nombre = [registro objectForKey:@"name"];
    NSString * registro_actividad = [registro objectForKey:@"activity"];
    NSString * registro_fecha = [registro objectForKey:@"posted_date"];
    
    _userOutput.text = [NSString stringWithFormat:@"El usuarrio %@, asignado al cliente %@ tiene a cargo un %@ y su ultimo acceso fue %@", registro_id, registro_nombre, registro_actividad, registro_fecha];
    
    NSDictionary * info = [NSDictionary dictionaryWithObjectsAndKeys:[registro objectForKey:@"id"], @"id",[registro objectForKey:@"name"],@"nombre",[registro objectForKey:@"activity"], @"actividad",[registro objectForKey:@"posted_date"], @"fecha", nil];
    NSData *jsonData = [self toJSON:info];
    _jsonOutput.text = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}
-(NSData*) toJSON:(id)Objeto{
    NSError * error = nil;
    id result = [NSJSONSerialization dataWithJSONObject:Objeto options:kNilOptions error:&error];
    if (error != nil) {
        return nil;
    }
    return result;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    dispatch_async(kQueue, ^{
        [self performSelectorOnMainThread:@selector(fetchData) withObject:nil waitUntilDone:YES];
    });
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
