//
//  DHDayModelBuilder.m
//  Diary of Happiness
//
//  Created by Philip Vasilchenko on 21.02.15.
//  Copyright (c) 2015 Philip Vasilchenko. All rights reserved.
//

#import "DHDayModelBuilder.h"
#import "DHDayModel.h"
#import "DHQuestionModel.h"
#import "DHAnswerModel.h"
#import "NSDate+Compare.h"
#import "NSDate+Day.h"


@implementation DHDayModelBuilder

- (DHDayModel *)dayModelForDate:(NSDate *)date {
    DHDayModel * dayModel = nil;

    if ( date ) {
        if ( [date isEqualToDay:[[NSDate date] dateToday]] ) {
            return [self todayMockQuestion];
        }

        dayModel = [DHDayModel modelWithDate:date];
        dayModel.questions = @[
         self.questionOne,
         self.questionTwo,
         self.questionThree
        ];
    }

    return dayModel;
}


- (DHQuestionModel *)questionOne {
    DHQuestionModel * questionModel = [DHQuestionModel modelWithQuestion:NSLocalizedString(@"Question.One", nil)];
    questionModel.answers = @[ self.emptyAnswer, self.emptyAnswer, self.emptyAnswer ];
    return questionModel;
}


- (DHQuestionModel *)questionTwo {
    DHQuestionModel * questionModel = [DHQuestionModel modelWithQuestion:NSLocalizedString(@"Question.Two", nil)];
    questionModel.answers = @[ self.emptyAnswer, self.emptyAnswer, self.emptyAnswer ];
    return questionModel;
}


- (DHQuestionModel *)questionThree {
    DHQuestionModel * questionModel = [DHQuestionModel modelWithQuestion:NSLocalizedString(@"Question.Three", nil)];
    questionModel.answers = @[ self.emptyAnswer, self.emptyAnswer, self.emptyAnswer ];
    return questionModel;
}


- (DHAnswerModel *)emptyAnswer {
    return [DHAnswerModel new];
}


#pragma mark - Mock

- (DHDayModel *)todayMockQuestion {
    DHDayModel * dayModel = [DHDayModel modelWithDate:[[NSDate date] dateToday]];
    dayModel.questions = @[
     self.questionOne,
     self.questionTwo,
     self.questionThree
    ];

    DHQuestionModel * q1 = dayModel.questions[0];
    q1.answers = @[
     [DHAnswerModel modelWithAnswer:@"Хакатон"],
     [DHAnswerModel modelWithAnswer:@"4х часовой фикс бага в iOS8"],
     [DHAnswerModel new],
    ];
    DHQuestionModel * q2 = dayModel.questions[1];
    q2.answers = @[
     [DHAnswerModel modelWithAnswer:@"DOU.ua"],
     [DHAnswerModel modelWithAnswer:@"GitHub"],
     [DHAnswerModel modelWithAnswer:@"Ребятам по команде"],
    ];
    DHQuestionModel * q3 = dayModel.questions[2];
    q3.answers = @[
     [DHAnswerModel modelWithAnswer:@"Я молодец!"],
     [DHAnswerModel modelWithAnswer:@"Выучил пару новых библиотек"],
     [DHAnswerModel new],
    ];

    return dayModel;
}

@end