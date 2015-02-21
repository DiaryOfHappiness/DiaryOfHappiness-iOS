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
#import "DHDayModelBuilder.h"
#import "DHDayModel.h"


@interface DHDaysDataProvider ()
@property (nonatomic, strong) DHDayModelBuilder * modelBuilder;
@property (nonatomic, strong) NSArray * daysDataSource;
@end


@implementation DHDaysDataProvider

- (instancetype)init {
    self = [super init];
    if (self) {
        self.modelBuilder = [DHDayModelBuilder new];
        [self createDataSource];
    }
    return self;
}


#pragma mark - Public Methods

- (DHDayViewController *)viewControllerAtIndex:(NSUInteger)index {
    if ( (self.numberOfItems == 0) || (index >= self.numberOfItems) ) {
        return nil;
    }

    DHDayViewController * dayViewController = [DHDayViewController new];
    dayViewController.dayModel = self.daysDataSource[index];
    return dayViewController;
}


- (NSUInteger)indexOfViewController:(DHDayViewController *)viewController {
    return [self.daysDataSource indexOfObject:viewController.dayModel];
}


- (NSUInteger)numberOfItems {
    return self.daysDataSource.count;
}


- (NSUInteger)initialItemIndex {
    return MAX(self.numberOfItems - 2, 0);
}


#pragma mark - Private Methods

- (void)createDataSource {
    NSDate * currentDay = [[NSDate date] dateToday];
    NSDate * tomorrowDay = [currentDay dateTomorrow];

    const NSUInteger historyLength = 7;
    NSMutableArray * dataSource = [NSMutableArray arrayWithCapacity:historyLength + 2];
    for (NSUInteger skipDays = historyLength; skipDays > 0; skipDays--) {
        NSDate * dayDate = [currentDay dateByAddingDays:-skipDays];
        [dataSource addObject:[self.modelBuilder dayModelForDate:dayDate]];
    }
    [dataSource addObject:[self.modelBuilder dayModelForDate:currentDay]];
    [dataSource addObject:[self.modelBuilder dayModelForDate:tomorrowDay]];

    self.daysDataSource = dataSource.copy;
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
