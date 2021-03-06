//
//  DHDayModelBuilder.h
//  Diary of Happiness
//
//  Created by Philip Vasilchenko on 21.02.15.
//  Copyright (c) 2015 Philip Vasilchenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DHDayModel;


@interface DHDayModelBuilder : NSObject

- (DHDayModel *)dayModelForDate:(NSDate *)date;

@end