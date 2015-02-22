//
//  DHQuestionHeaderView.m
//  Diary of Happiness
//
//  Created by Philip Vasilchenko on 21.02.15.
//  Copyright (c) 2015 Philip Vasilchenko. All rights reserved.
//

#import "DHQuestionHeaderView.h"
#import "DHQuestionModel.h"


@implementation DHQuestionHeaderView

#pragma mark - DTModelTransfer Protocol

- (void)updateWithModel:(DHQuestionModel *)model {
    self.questionLabel.text = model.question;
}

@end