//
//  DHAnswerModel.h
//  Diary of Happiness
//
//  Created by Philip Vasilchenko on 21.02.15.
//  Copyright (c) 2015 Philip Vasilchenko. All rights reserved.
//

#import "DHAnswerModel.h"


@implementation DHAnswerModel

- (instancetype)initWithAnswer:(NSString *)answer {
    self = [super init];
    if ( self ) {
        self.answer = answer;
    }
    return self;
}


+ (instancetype)modelWithAnswer:(NSString *)answer {
    return [[self alloc] initWithAnswer:answer];
}


#pragma mark - Properties

- (BOOL)isEmpty {
    return self.answer.length == 0;
}


@end