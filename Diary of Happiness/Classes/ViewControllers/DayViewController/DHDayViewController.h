//
//  DHDayViewController.h
//  Diary of Happiness
//
//  Created by Philip Vasilchenko on 21.02.15.
//  Copyright (c) 2015 Philip Vasilchenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DHDayModel;


@interface DHDayViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel * dataLabel;
@property (strong, nonatomic) DHDayModel * dayModel;

@end

