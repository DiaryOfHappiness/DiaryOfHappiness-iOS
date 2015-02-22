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
#import "DHQuestionHeaderView.h"
#import "DHQuestionModel.h"
#import "DHAnswerCell.h"
#import "DHAnswerModel.h"
#import "DHKeyboardObserver.h"
#import "ScrollViewFrameAccessor.h"


@interface DHDayViewController ()
@property (nonatomic, strong) DHKeyboardObserver * keyboardObserver;
@end


@implementation DHDayViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if ( self ) {
        __weak typeof(self) weakSelf = self;
        self.automaticallyAdjustsScrollViewInsets = NO;
        self.keyboardObserver = [DHKeyboardObserver new];
        self.keyboardObserver.willShowAction = self.keyboardObserver.willHideAction = ^{
            UIViewAnimationOptions animationOptions =
             weakSelf.keyboardObserver.animationOptions | weakSelf.keyboardObserver.animationCurve;
            [UIView animateWithDuration:weakSelf.keyboardObserver.animationDuration
                                  delay:0
                                options:animationOptions
                             animations:^{
                                 CGFloat keyboardHeight = weakSelf.keyboardObserver.keyboardHeight;
                                 weakSelf.tableView.contentInsetBottom = keyboardHeight;
                                 weakSelf.tableView.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, keyboardHeight, 0);
                             }
                             completion:nil];
        };
    }
    return self;
}


#pragma mark - Setters

- (void)setDayModel:(DHDayModel *)dayModel {
    if ( ![_dayModel isEqual:dayModel] ) {
        _dayModel = dayModel;
        [self updateTitle];
        [self updateColor];
    }
}


#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateTitle];
    [self updateColor];
    [self prepareTableView];
    [self createDataSource];
    self.tableView.contentInset = UIEdgeInsetsZero;
}


#pragma mark - Private Methods

- (void)prepareTableView {
    [self registerHeaderClass:[DHQuestionHeaderView class] forModelClass:[DHQuestionModel class]];
    [self registerCellClass:[DHAnswerCell class] forModelClass:[DHAnswerModel class]];
}


- (void)createDataSource {
    [self.dayModel.questions enumerateObjectsUsingBlock:^(DHQuestionModel * questionModel, NSUInteger idx, BOOL *stop) {
        [self.memoryStorage setSectionHeaderModel:questionModel forSectionIndex:idx];
        [self.memoryStorage setSectionFooterModel:@"" forSectionIndex:idx];
        for (DHAnswerModel * answerModel in questionModel.answers) {
            [self.memoryStorage addItem:answerModel toSection:idx];
        }
    }];
}


- (void)updateTitle {
    self.title = [NSDateFormatter localizedStringFromDate:self.dayModel.date
                                                dateStyle:NSDateFormatterLongStyle
                                                timeStyle:NSDateFormatterNoStyle];
}


- (void)updateColor {
    NSDate * modelDate = self.dayModel.date;
    NSDate * today = [[NSDate date] dateToday];
    NSTimeInterval timeInterval = [today timeIntervalSinceDate:modelDate];

    CGFloat hue = 153.f;
    CGFloat saturation = 1.f;
    CGFloat brightness = .83f;

    if ( timeInterval > 0 ) {
        NSTimeInterval dayInterval = 86400;
        NSTimeInterval daysFromToday = timeInterval / dayInterval;
        saturation -= 0.15f * daysFromToday;
        saturation = MAX(0, saturation);
    }

    self.view.backgroundColor = [UIColor colorWithHue:hue/360.f saturation:saturation brightness:brightness alpha:1.f];

}


#pragma mark - UITableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

@end
