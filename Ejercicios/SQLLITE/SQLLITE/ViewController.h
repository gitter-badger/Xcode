//
//  ViewController.h
//  SQLLITE
//
//  Created by Developer Cymetria on 26/07/14.
//  Copyright (c) 2014 cymetria. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>

@interface ViewController : UIViewController <UITextFieldDelegate>
{
    sqlite3 * contactDB;

}

@property (strong, nonatomic) IBOutlet UITextField *empNoTxt;
@property (strong, nonatomic) IBOutlet UITextField *empNameTxt;
@property (strong, nonatomic) IBOutlet UITextField *empAgeTxt;
@property (strong, nonatomic) IBOutlet UITextField *empAdressTxt;
@property (strong, nonatomic) IBOutlet UILabel *status;

- (IBAction)saveData:(id)sender;
- (IBAction)readData:(id)sender;
- (IBAction)updateData:(id)sender;
- (IBAction)deleteData:(id)sender;

@end
