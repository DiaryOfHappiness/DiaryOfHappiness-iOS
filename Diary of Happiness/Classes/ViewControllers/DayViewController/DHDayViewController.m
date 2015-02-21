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


@interface DHDayViewController ()

@end


@implementation DHDayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.dataLabel.text = [self.dataObject description];

    NSDate * today = [[NSDate date] dateToday];
    if ( [self.dataObject isEqualToDate:today] ) {
        self.view.backgroundColor = [UIColor yellowColor];
    } else if ( [self.dataObject isGreaterDate:today] ) {
        self.view.backgroundColor = [UIColor redColor];
    } else if ( [self.dataObject isLessDate:today] ) {
        self.view.backgroundColor = [UIColor greenColor];
    }
}

@end
