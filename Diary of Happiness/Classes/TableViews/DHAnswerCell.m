//
//  DHAnswerCell.m
//  Diary of Happiness
//
//  Created by Philip Vasilchenko on 21.02.15.
//  Copyright (c) 2015 Philip Vasilchenko. All rights reserved.
//

#import "DHAnswerCell.h"
#import "DHAnswerModel.h"


@interface DHAnswerCell ()
@property (nonatomic, strong) DHAnswerModel * answerModel;
@end


@implementation DHAnswerCell

#pragma mark - DTModelTransfer Protocol

- (void)updateWithModel:(DHAnswerModel *)model {
    self.answerModel = model;
    self.textField.text = model.answer;
}


- (id)model {
    return self.answerModel;
}


#pragma mark - Text Field Events

- (IBAction)textFieldDidChange:(UITextField *)sender {
    self.answerModel.answer = sender.text;
}


- (IBAction)textFieldDidEnd:(UITextField *)sender {
    self.answerModel.answer = sender.text;
}

@end