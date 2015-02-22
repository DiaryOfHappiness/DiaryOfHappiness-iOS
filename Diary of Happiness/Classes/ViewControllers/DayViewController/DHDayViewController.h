//
//  DHDayViewController.h
//  Diary of Happiness
//
//  Created by Philip Vasilchenko on 21.02.15.
//  Copyright (c) 2015 Philip Vasilchenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <DTTableViewManager/DTTableViewManager.h>

@class DHDayModel;
@class DTTableViewController;


@interface DHDayViewController : DTTableViewController

@property (nonatomic, strong) DHDayModel * dayModel;

@end

