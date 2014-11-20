//
//  ViewController.m
//  SQLLITE
//
//  Created by Developer Cymetria on 26/07/14.
//  Copyright (c) 2014 cymetria. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    NSString * databasePath;
    NSString * empID;
    NSInteger e_id;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString * docsDir;
    NSArray * dirPaths;
    
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    docsDir = [dirPaths objectAtIndex:0];
    
    NSLog(@"%@", docsDir);
    
    databasePath = [[NSString alloc] initWithString:[docsDir stringByAppendingPathComponent:@"contacts.db"]];
    
    NSFileManager * filemgr = [NSFileManager defaultManager];
    
    if ([filemgr fileExistsAtPath:databasePath]== NO) {
        
        const char *dbpath = [databasePath UTF8String];
        
        if (sqlite3_open(dbpath, &contactDB)== SQLITE_OK) {
            
            char * errMsg;
            const char * sql_stmt = "CREATE TABLE IF NOT EXISTS CONTACTS (ID INTEGER PRIMARY KEY AUTOINCREMENT, EMP_NO TEXT, EMP_NAME TEXT, EMP_AGE TEXT, EMP_ADRESS TEXT)";
            if (sqlite3_exec(contactDB, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK) {

                //_status.text = @"Error en crear tabla";
                
                _status.text = [NSString stringWithUTF8String:errMsg];
            }
            
            sqlite3_close(contactDB);
        }else{
            _status.text = @"Error en crear base de datos";
        }
    }
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    for (UIView * view in self.view.subviews) {
        [view resignFirstResponder];
    }
}
- (IBAction)saveData:(id)sender {
    if (_empNoTxt.text.length>0 && _empNameTxt.text.length>0 && _empAgeTxt.text.length>0 && _empAdressTxt.text.length>0) {
        sqlite3_stmt * statement;
        const char* dbpath = [databasePath UTF8String];
        if (sqlite3_open(dbpath, &contactDB)==SQLITE_OK) {
            NSString * insertSQL = [NSString stringWithFormat:@"INSERT INTO CONTACTS (EMP_NO, EMP_NAME, EMP_AGE, EMP_ADRESS) VALUES (\"%@\", \"%@\", \"%@\", \"%@\" )", self.empNoTxt.text, self.empNameTxt.text, self.empAgeTxt.text, self.empAdressTxt.text];
            const char * insert_sql = [insertSQL UTF8String];
            sqlite3_prepare_v2(contactDB, insert_sql, -1, &statement, NULL);
            if (sqlite3_step(statement)==SQLITE_DONE) {
                _status.text = @"Registro Almacenado";
                _empNoTxt.text = @"";
                _empNameTxt.text = @"";
                _empAgeTxt.text = @"";
                _empAdressTxt.text = @"";
            }
            else{
                _status.text = @"Fallo al Registrar Usuario";
            }
            sqlite3_finalize(statement);
            sqlite3_close(contactDB);
        }
    }else{
        _status.text=@"Por favor llenar todos los campos";
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)readData:(id)sender {
    sqlite3_stmt * statement;
    const char* dbpath = [databasePath UTF8String];
    if (sqlite3_open(dbpath, &contactDB)==SQLITE_OK) {
        NSString * selectQuery =[NSString stringWithFormat:@"SELECT EMP_NO, EMP_NAME, EMP_AGE, EMP_ADRESS FROM CONTACTS WHERE EMP_NO =\"%@\"", self.empNoTxt.text];
        const char * select_sql = [selectQuery UTF8String];
        if(sqlite3_prepare_v2(contactDB, select_sql, -1, &statement, NULL)==SQLITE_OK){
            if (sqlite3_step(statement)==SQLITE_ROW) {
                NSLog(@"%s", sqlite3_column_text(statement, 1));
                NSString * nameField = [[NSString alloc]initWithFormat:@"%s", sqlite3_column_text(statement, 1)];
                _empNameTxt.text = nameField;
                NSString * ageField = [[NSString alloc]initWithFormat:@"%s", sqlite3_column_text(statement, 2)];
                _empAgeTxt.text = ageField;
                NSString * addressField = [[NSString alloc]initWithFormat:@"%s", sqlite3_column_text(statement, 3)];
                _empAdressTxt.text = addressField;
                _status.text = @"Registro encontrado";
            }else{ _status.text = @"Registro No encontrado"; }
            sqlite3_finalize(statement);
        }else{ _status.text = @"Error QUERY"; }
        sqlite3_close(contactDB);
    }else{ _status.text = @"Error abirendo DB"; }
}

- (IBAction)updateData:(id)sender {
}

- (IBAction)deleteData:(id)sender {
}
@end
