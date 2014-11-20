//
//  currentDateViewController.h
//  Calendario
//
//  Created by Juan Felipe Montoya Gómez on 7/12/14.
//  Copyright (c) 2014 mobilemontoya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface currentDateViewController : UIViewController

@property (strong, nonatomic) id  month;

@property (strong, nonatomic) IBOutlet UILabel *dataLabel;

@property (nonatomic, assign) NSInteger yearId;
@property (nonatomic, assign) NSInteger monthId;

@end
