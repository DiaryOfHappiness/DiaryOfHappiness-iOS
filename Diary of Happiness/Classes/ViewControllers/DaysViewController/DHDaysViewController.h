//
//  DHDaysViewController.h
//  Diary of Happiness
//
//  Created by Philip Vasilchenko on 21.02.15.
//  Copyright (c) 2015 Philip Vasilchenko. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DHDaysViewController : UIViewController <UIPageViewControllerDelegate>

@property (nonatomic, strong) UIPageViewController * pageViewController;

@end