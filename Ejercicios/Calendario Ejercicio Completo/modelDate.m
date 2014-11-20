//
//  modelDate.m
//  Calendario
//
//  Created by Juan Felipe Montoya Gómez on 7/12/14.
//  Copyright (c) 2014 mobilemontoya. All rights reserved.
//

#import "modelDate.h"
#import "currentDateViewController.h"

@interface modelDate()
@property (readonly, strong, nonatomic) NSArray * pageData;
@property (nonatomic, assign) NSInteger currentYear;
@property (nonatomic, assign) NSInteger currentMonth;
@end

@implementation modelDate
@synthesize pageData = _pageData;
@synthesize currentYear = _currentYear;
@synthesize currentMonth = _currentMonth;

-(id) init  {
    self = [super init];
    if (self){
        NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
        _pageData = [[dateFormatter monthSymbols] copy];
    }
    
    return self;
}

- (currentDateViewController*) viewControllerAtIndex: (NSInteger) index year: (NSInteger) year storyboard: (UIStoryboard*) storyboard{
    if ((index>= [self.pageData count]) || ([_pageData count] == 0))
    {
        return nil;
    }
    else
    {
        currentDateViewController * currentView = [storyboard instantiateViewControllerWithIdentifier:@"currentDate"];
        currentView.month = [self.pageData objectAtIndex:index];
        currentView.yearId = year;
        currentView.monthId = index;
        _currentMonth = index;
        _currentYear = year;
        return currentView;
    }
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
  
    if((_currentMonth == [self.pageData count] -1) || (_currentMonth == NSNotFound))
    {
        _currentMonth = 0 ;
        _currentYear = _currentYear + 1;
        return [self viewControllerAtIndex:_currentMonth year:_currentYear storyboard:viewController.storyboard];
    }
    else
    {
        _currentMonth ++;
        return [self viewControllerAtIndex:_currentMonth year:_currentYear storyboard:viewController.storyboard];
    }
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    
    if((_currentMonth == 0) || (_currentMonth == NSNotFound))
    {
        _currentMonth = 11;
        _currentYear = _currentYear - 1;
        return [self viewControllerAtIndex:_currentMonth year:_currentYear storyboard:viewController.storyboard];
    }
    else
    {
        _currentMonth --;
        return [self viewControllerAtIndex:_currentMonth year:_currentYear storyboard:viewController.storyboard];
    }
}

@end
