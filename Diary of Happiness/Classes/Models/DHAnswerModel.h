//
//  DHAnswerModel.h
//  Diary of Happiness
//
//  Created by Philip Vasilchenko on 21.02.15.
//  Copyright (c) 2015 Philip Vasilchenko. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DHAnswerModel : NSObject

@property (nonatomic, copy) NSString * answer;
@property (nonatomic, readonly) BOOL isEmpty;

- (instancetype)initWithAnswer:(NSString *)answer;
+ (instancetype)modelWithAnswer:(NSString *)answer;

@end