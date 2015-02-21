//
//  DHDayModel.m
//  Diary of Happiness
//
//  Created by Philip Vasilchenko on 21.02.15.
//  Copyright (c) 2015 Philip Vasilchenko. All rights reserved.
//

#import "DHDayModel.h"


@implementation DHDayModel

- (instancetype)initWithDate:(NSDate *)date {
    self = [super init];
    if ( self ) {
        self.date = date;
    }
    return self;
}


+ (instancetype)modelWithDate:(NSDate *)date {
    return [[self alloc] initWithDate:date];
}


@end