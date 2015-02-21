//
//  DHQuestionModel.m
//  Diary of Happiness
//
//  Created by Philip Vasilchenko on 21.02.15.
//  Copyright (c) 2015 Philip Vasilchenko. All rights reserved.
//

#import "DHQuestionModel.h"


@implementation DHQuestionModel

- (instancetype)initWithQuestion:(NSString *)question {
    self = [super init];
    if ( self ) {
        self.question = question;
    }
    return self;
}


+ (instancetype)modelWithQuestion:(NSString *)question {
    return [[self alloc] initWithQuestion:question];
}


@end