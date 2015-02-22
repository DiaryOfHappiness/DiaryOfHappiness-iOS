//
//  DHAppDelegate.m
//  Diary of Happiness
//
//  Created by Philip Vasilchenko on 21.02.15.
//  Copyright (c) 2015 Philip Vasilchenko. All rights reserved.
//

#import "DHAppDelegate.h"
#import "DHRootViewController.h"
#import "DHDaysViewController.h"


@implementation DHAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    DHDaysViewController * daysViewController = [DHDaysViewController new];
    self.rootViewController = [[DHRootViewController alloc] initWithRootViewController:daysViewController];

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.tintColor = [UIColor colorWithRed:0.f green:170.f/255.f blue:100.f/255.f alpha:1.f];
    self.window.rootViewController = self.rootViewController;
    [self.window makeKeyAndVisible];

    return YES;
}

@end
