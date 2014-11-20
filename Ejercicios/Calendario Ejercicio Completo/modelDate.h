//
//  modelDate.h
//  Calendario
//
//  Created by Juan Felipe Montoya Gómez on 7/12/14.
//  Copyright (c) 2014 mobilemontoya. All rights reserved.
//

#import <Foundation/Foundation.h>

@class currentDateViewController;

@interface modelDate : NSObject <UIPageViewControllerDataSource>

- (currentDateViewController*) viewControllerAtIndex: (NSInteger) index year: (NSInteger) year storyboard: (UIStoryboard*) storyboard;
@end
