//
//  DHDayViewController.h
//  Diary of Happiness
//
//  Created by Philip Vasilchenko on 21.02.15.
//  Copyright (c) 2015 Philip Vasilchenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DHDayViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel * dataLabel;
@property (strong, nonatomic) NSDate * dataObject;

@end
