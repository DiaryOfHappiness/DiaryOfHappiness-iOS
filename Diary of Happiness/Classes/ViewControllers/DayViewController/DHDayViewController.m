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


@interface DHDayViewController ()
@end


@implementation DHDayViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if ( self ) {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    return self;
}


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

    if ( [modelDate isEqualToDate:today] ) {
        self.view.backgroundColor = [UIColor yellowColor];
    } else if ( [modelDate isGreaterDate:today] ) {
        self.view.backgroundColor = [UIColor redColor];
    } else if ( [modelDate isLessDate:today] ) {
        self.view.backgroundColor = [UIColor greenColor];
    }
}


#pragma mark - UITableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Tap Tap!");
}

@end
