//
//  DHDayViewController.m
//  Diary of Happiness
//
//  Created by Philip Vasilchenko on 21.02.15.
//  Copyright (c) 2015 Philip Vasilchenko. All rights reserved.
//

#import <NSDate+Calendar/NSDate+Compare.h>
#import "DHDayViewController.h"
#import "NSDate+Day.h"
#import "DHDayModel.h"


@interface DHDayViewController ()
@end


@implementation DHDayViewController

#pragma mark - Setters

- (void)setDayModel:(DHDayModel *)dayModel {
    if ( ![_dayModel isEqual:dayModel] ) {
        _dayModel = dayModel;
        [self updateTitle];
    }
}

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];

    NSDate * modelDate = self.dayModel.date;
    NSDate * today = [[NSDate date] dateToday];

    [self updateTitle];
    self.dataLabel.text = self.title;

    if ( [modelDate isEqualToDate:today] ) {
        self.view.backgroundColor = [UIColor yellowColor];
    } else if ( [modelDate isGreaterDate:today] ) {
        self.view.backgroundColor = [UIColor redColor];
    } else if ( [modelDate isLessDate:today] ) {
        self.view.backgroundColor = [UIColor greenColor];
    }
}


#pragma mark - Private Methods

- (void)updateTitle {
    self.title = [NSDateFormatter localizedStringFromDate:self.dayModel.date
                                                dateStyle:NSDateFormatterLongStyle
                                                timeStyle:NSDateFormatterNoStyle];
}

@end
