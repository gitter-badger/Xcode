//
//  ModelController.h
//  PowerApp
//
//  Created by Daniel Fuentes on 1/4/15.
//  Copyright (c) 2015 Daniel Fuentes. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DataViewController;

@interface ModelController : NSObject <UIPageViewControllerDataSource>

- (DataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
- (NSUInteger)indexOfViewController:(DataViewController *)viewController;

@end

