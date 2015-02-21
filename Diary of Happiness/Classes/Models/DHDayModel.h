//
//  DHDayModel.h
//  Diary of Happiness
//
//  Created by Philip Vasilchenko on 21.02.15.
//  Copyright (c) 2015 Philip Vasilchenko. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DHDayModel : NSObject

@property (nonatomic, strong) NSDate * date;
@property (nonatomic, strong) NSArray * questions;

- (instancetype)initWithDate:(NSDate *)date;
+ (instancetype)modelWithDate:(NSDate *)date;


@end