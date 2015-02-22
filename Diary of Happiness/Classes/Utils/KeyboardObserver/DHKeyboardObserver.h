//
//  DHKeyboardObserver
//  Diary of Happiness
//
//  Created by Philip Vasilchenko on 21.02.15.
//  Copyright (c) 2015 Philip Vasilchenko. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ActionBlock)();


@interface DHKeyboardObserver : NSObject

@property (nonatomic, copy) ActionBlock willShowAction;
@property (nonatomic, copy) ActionBlock didShowAction;
@property (nonatomic, copy) ActionBlock willHideAction;
@property (nonatomic, copy) ActionBlock didHideAction;

@property (nonatomic, readonly) BOOL isKeyboardVisible;
@property (nonatomic, readonly) CGFloat keyboardHeight;
@property (nonatomic, readonly) NSTimeInterval animationDuration;
@property (nonatomic, readonly) UIViewAnimationCurve animationCurve;
@property (nonatomic, readonly) UIViewAnimationOptions animationOptions;


- (instancetype)initWithWillShowAction:(ActionBlock)willShow
                         didShowAction:(ActionBlock)didShow
                        willHideAction:(ActionBlock)willHide
                         didHideAction:(ActionBlock)didHide;

+ (instancetype)observerWithWillShowAction:(ActionBlock)willShow
                             didShowAction:(ActionBlock)didShow
                            willHideAction:(ActionBlock)willHide
                             didHideAction:(ActionBlock)didHide;

@end