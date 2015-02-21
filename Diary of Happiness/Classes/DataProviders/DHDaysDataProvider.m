//
//  DHDaysDataProvider.m
//  Diary of Happiness
//
//  Created by Philip Vasilchenko on 21.02.15.
//  Copyright (c) 2015 Philip Vasilchenko. All rights reserved.
//

#import <NSDate+Calendar/NSDate+Calendar.h>
#import "DHDaysDataProvider.h"
#import "DHDayViewController.h"


@interface DHDaysDataProvider ()
@property (nonatomic, strong) NSArray * daysDataSource;
@property (nonatomic, strong) NSDate * todayDay;
@end


@implementation DHDaysDataProvider

- (instancetype)init {
    self = [super init];
    if (self) {
        NSDate * currentDay = [[NSDate date] dateToday];
        NSDate * yesterdayDay = [currentDay dateYesterday];
        NSDate * tomorrowDay = [currentDay dateTomorrow];

        self.todayDay = currentDay;
        self.daysDataSource = @[ yesterdayDay, currentDay, tomorrowDay ];
    }
    return self;
}


#pragma mark - Public Methods

- (DHDayViewController *)viewControllerAtIndex:(NSUInteger)index {
    if ( (self.numberOfItems == 0) || (index >= self.numberOfItems) ) {
        return nil;
    }

    DHDayViewController * dataViewController = [DHDayViewController new];
    dataViewController.dataObject = self.daysDataSource[index];
    return dataViewController;
}


- (NSUInteger)indexOfViewController:(DHDayViewController *)viewController {
    return [self.daysDataSource indexOfObject:viewController.dataObject];
}


- (NSUInteger)numberOfItems {
    return self.daysDataSource.count;
}


- (NSUInteger)initialItemIndex {
    return [self.daysDataSource indexOfObject:self.todayDay];
}


#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController 
      viewControllerBeforeViewController:(UIViewController *)viewController {
    
    NSUInteger index = [self indexOfViewController:(DHDayViewController *)viewController];
    NSUInteger previousIndex = index - 1;
    if ( (index == 0) || (index == NSNotFound) ) {
        return nil;
    }

    return [self viewControllerAtIndex:previousIndex];
}


- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController 
       viewControllerAfterViewController:(UIViewController *)viewController {
    
    NSUInteger index = [self indexOfViewController:(DHDayViewController *)viewController];
    NSUInteger nextIndex = index + 1;
    
    if ( (index == NSNotFound) || (nextIndex == self.numberOfItems) ) {
        return nil;
    }
    
    return [self viewControllerAtIndex:nextIndex];
}

@end
