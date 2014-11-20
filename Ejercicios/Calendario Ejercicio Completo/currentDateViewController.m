//
//  currentDateViewController.m
//  Calendario
//
//  Created by Juan Felipe Montoya Gómez on 7/12/14.
//  Copyright (c) 2014 mobilemontoya. All rights reserved.
//

#import "currentDateViewController.h"


@interface currentDateViewController ()

@end

@implementation currentDateViewController

@synthesize dataLabel = _dataLabel;
@synthesize month = _month;
@synthesize yearId = _yearId;
@synthesize monthId = _monthId;

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

- (NSDate *) parseDateFromString:(NSString*) dateString format: (NSString*) format{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    NSDate *dateFromString = [[NSDate alloc] init];
    dateFromString = [dateFormatter dateFromString:dateString];

    return dateFromString;
}
- (NSArray *) weekDays{
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    [calendar setLocale:[NSLocale currentLocale]];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    dateFormatter.dateFormat = @"LL";
    
    NSArray *weekdays = [dateFormatter shortWeekdaySymbols];
    
    // adjust array depending on which weekday should be first
    NSUInteger firstWeekdayIndex = [calendar firstWeekday] - 1;
    if (firstWeekdayIndex > 0) {
        weekdays = [[weekdays subarrayWithRange:NSMakeRange(firstWeekdayIndex, 7 - firstWeekdayIndex)]
                    arrayByAddingObjectsFromArray:[weekdays subarrayWithRange:NSMakeRange(0, firstWeekdayIndex)]];
    }
    
    return weekdays;
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.dataLabel.text = [[NSString alloc] initWithFormat:@"%@ %ld", [self.month description], (long)self.yearId] ;
   
    short contador = 1;
    NSString * dia;
    int rows = 6, columns = 7;
    UIView *buttonView = [[UIView alloc] initWithFrame:CGRectMake(0.f, 60.f, 40*columns, 40*rows)];
    
    // Se crea la fila de los dias de la semana
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    [calendar setLocale:[NSLocale currentLocale]];
    
    NSDate * actualDate = [self parseDateFromString:[[NSString alloc] initWithFormat:@"%ld-%ld-1", (long)self.yearId, (long)self.monthId + 1] format: @"yyyy-M-d"];
    
    [calendar components:(NSDayCalendarUnit | NSMonthCalendarUnit) fromDate:actualDate];
    

    
    int w = 0;
    for (NSString *day in [self weekDays]) {
        UILabel *dayOfWeekLabel = [[UILabel alloc] initWithFrame:CGRectMake(40 * w, 40 * 0, 40, 40)];
        dayOfWeekLabel.textAlignment = NSTextAlignmentCenter;
        dayOfWeekLabel.numberOfLines = 1;
        dayOfWeekLabel.adjustsFontSizeToFitWidth = YES;
        dayOfWeekLabel.backgroundColor = [UIColor clearColor];
        //dayOfWeekLabel.shadowColor = [UIColor whiteColor];
        //dayOfWeekLabel.shadowOffset = CGSizeMake(0, 1);
        dayOfWeekLabel.text = [day uppercaseString];
        [buttonView addSubview: dayOfWeekLabel];
        w++;
    }
    
    
    for (int x = [self calendar:calendar dayOfWeek:actualDate]; x < columns; x++)
    {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame = CGRectMake(40 * x, 40 * 1, 40, 40);
            
        dia = [[NSString alloc] initWithFormat:@"%hd",contador];
            
        [button setTitle: dia forState: UIControlStateNormal];
            
        [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [buttonView addSubview: button];
        contador++;
    }
    
    
    
    int lastDay = [self GetLastDayOfMonth:actualDate];
    for (int y = 2; y < rows; y++)
    {
        for (int x = 0; x < columns; x++)
        {
            if (contador <= lastDay)
            {
                UIButton * button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                button.frame = CGRectMake(40 * x, 40 * y, 40, 40);
            
                dia = [[NSString alloc] initWithFormat:@"%hd",contador];

                [button setTitle: dia forState: UIControlStateNormal];
            
                [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
                [buttonView addSubview: button];
                contador++;
             }
        }
    }
    
    // Center the view which contains your buttons
    CGPoint centerPoint = buttonView.center;
    centerPoint.x = self.view.center.x;
    buttonView.center = centerPoint;
    //buttonView.backgroundColor =
    [self.view addSubview:buttonView];
    
}

-(void)buttonPressed:(UIButton *)button
{
    [self alertStatus: [[NSString alloc] initWithFormat:@"The Selected date are: %ld-%ld-%@", (long)_yearId, (long)_monthId+1, button.titleLabel.text  ] :@"Selected Date!" :0];
}


-(int)GetLastDayOfMonth:(NSDate *)date
{
    int last_day = 27;
    NSCalendar *cal=[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *compsMonth = [cal components:NSWeekdayCalendarUnit | NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:date];
    [compsMonth setDay:last_day];
    int month = [compsMonth month];
    while(TRUE){
        [compsMonth setDay:last_day+1];
        NSDate *dateFuture = [cal dateFromComponents:compsMonth];
        NSDateComponents *futureComps = [cal components:NSWeekdayCalendarUnit | NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:dateFuture];
        if(month != [futureComps month]){
            return last_day;
        }
        last_day+=1;
    }
    return last_day;
}


-(int) calendar:(NSCalendar*) calendar dayOfWeek: (NSDate*)date
{
    NSDateComponents *weekdayComponents =[calendar components:NSWeekdayCalendarUnit fromDate:date];
    NSInteger weekday = [weekdayComponents weekday];
    return weekday - 1;
}


- (void) alertStatus:(NSString *)msg :(NSString *)title :(int) tag
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:msg
                                                       delegate:self
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil, nil];
    alertView.tag = tag;
    [alertView show];
}
@end
