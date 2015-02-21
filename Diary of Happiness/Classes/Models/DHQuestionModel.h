//
//  DHQuestionModel.h
//  Diary of Happiness
//
//  Created by Philip Vasilchenko on 21.02.15.
//  Copyright (c) 2015 Philip Vasilchenko. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DHQuestionModel : NSObject

@property (nonatomic, copy) NSString * question;
@property (nonatomic, strong) NSArray * answers;

- (instancetype)initWithQuestion:(NSString *)question;
+ (instancetype)modelWithQuestion:(NSString *)question;

@end