//
//  DHAnswerCell.m
//  Diary of Happiness
//
//  Created by Philip Vasilchenko on 21.02.15.
//  Copyright (c) 2015 Philip Vasilchenko. All rights reserved.
//

#import "DHAnswerCell.h"
#import "DHAnswerModel.h"


@implementation DHAnswerCell

#pragma mark - DTModelTransfer Protocol

- (void)updateWithModel:(DHAnswerModel *)model {
    if ( !model.isEmpty ) {
        self.textField.text = model.answer;
    }
}

@end