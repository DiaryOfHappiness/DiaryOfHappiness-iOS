//
//  DHAppDelegate.h
//  Diary of Happiness
//
//  Created by Philip Vasilchenko on 21.02.15.
//  Copyright (c) 2015 Philip Vasilchenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DHRootViewController;


@interface DHAppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic, strong) UIWindow * window;
@property (nonatomic, strong) DHRootViewController * rootViewController;

@end

