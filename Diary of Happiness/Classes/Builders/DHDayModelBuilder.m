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


@implementation DHDayModelBuilder

- (DHDayModel *)dayModelForDate:(NSDate *)date {
    DHDayModel * dayModel = nil;

    if ( date ) {
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
    DHQuestionModel * questionModel = [DHQuestionModel modelWithQuestion:@"Question One?"];
    questionModel.answers = @[ self.emptyAnswer ];
    return questionModel;
}


- (DHQuestionModel *)questionTwo {
    DHQuestionModel * questionModel = [DHQuestionModel modelWithQuestion:@"Question Two?"];
    questionModel.answers = @[ self.emptyAnswer ];
    return questionModel;
}


- (DHQuestionModel *)questionThree {
    DHQuestionModel * questionModel = [DHQuestionModel modelWithQuestion:@"Question Three?"];
    questionModel.answers = @[ self.emptyAnswer, [DHAnswerModel modelWithAnswer:@"Foo Bar Baz"] ];
    return questionModel;
}


- (DHAnswerModel *)emptyAnswer {
    return [DHAnswerModel modelWithAnswer:@""];
}

@end