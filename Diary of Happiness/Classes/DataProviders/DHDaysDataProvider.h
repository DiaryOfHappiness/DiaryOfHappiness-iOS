//
//  DHDaysDataProvider.h
//  Diary of Happiness
//
//  Created by Philip Vasilchenko on 21.02.15.
//  Copyright (c) 2015 Philip Vasilchenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DHDayViewController;

@interface DHDaysDataProvider : NSObject <UIPageViewControllerDataSource>

- (DHDayViewController *)viewControllerAtIndex:(NSUInteger)index;
- (NSUInteger)indexOfViewController:(DHDayViewController *)viewController;

- (NSUInteger)numberOfItems;
- (NSUInteger)initialItemIndex;

@end

