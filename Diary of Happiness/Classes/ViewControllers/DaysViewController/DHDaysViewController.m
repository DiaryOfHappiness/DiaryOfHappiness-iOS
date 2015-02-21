//
//  DHDaysViewController.m
//  Diary of Happiness
//
//  Created by Philip Vasilchenko on 21.02.15.
//  Copyright (c) 2015 Philip Vasilchenko. All rights reserved.
//

#import "DHDaysViewController.h"
#import "DHDaysDataProvider.h"


@interface DHDaysViewController ()
@property (nonatomic, strong) DHDaysDataProvider * daysDataProvider;
@end


@implementation DHDaysViewController

#pragma mark - Initialization

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if ( self ) {
        self.daysDataProvider = [DHDaysDataProvider new];
    }
    return self;
}


#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createPageViewController];
    [self createNavigationBarButtons];
}


#pragma mark - View Customization

- (void)createNavigationBarButtons {
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Menu"
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:self
                                                                            action:@selector(onMenuAction:)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Today"
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(onTodayAction:)];
}


- (void)createPageViewController {
    self.pageViewController =
     [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl
                                     navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal
                                                   options:nil];
    self.pageViewController.delegate = self;

    [self setInitialViewControllerForPageView:NO];
    self.pageViewController.dataSource = self.daysDataProvider;

    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];

    self.pageViewController.view.frame = self.view.bounds;
    [self.pageViewController didMoveToParentViewController:self];

    self.view.gestureRecognizers = self.pageViewController.gestureRecognizers;
}


- (void)setInitialViewControllerForPageView:(BOOL)animated {
    id currentController = self.pageViewController.viewControllers.firstObject;
    NSUInteger currentIndex = [self.daysDataProvider indexOfViewController:currentController];
    NSUInteger initialIndex = self.daysDataProvider.initialItemIndex;

    if ( currentIndex != initialIndex ) {
        UIPageViewControllerNavigationDirection direction = UIPageViewControllerNavigationDirectionForward;
        if ( currentIndex > initialIndex && currentIndex != NSNotFound ) {
            direction = UIPageViewControllerNavigationDirectionReverse;
        }

        NSArray * viewControllers = @[[self.daysDataProvider viewControllerAtIndex:initialIndex]];
        [self.pageViewController setViewControllers:viewControllers direction:direction animated:animated completion:nil];
    }
}


#pragma mark - Actions

- (IBAction)onMenuAction:(id)sender {
    NSLog(@"Menu");
}


- (IBAction)onTodayAction:(id)sender {
    [self setInitialViewControllerForPageView:YES];
}

@end