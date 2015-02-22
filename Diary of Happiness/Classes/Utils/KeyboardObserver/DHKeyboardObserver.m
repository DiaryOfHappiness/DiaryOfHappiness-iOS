//
//  DHKeyboardObserver
//  Diary of Happiness
//
//  Created by Philip Vasilchenko on 21.02.15.
//  Copyright (c) 2015 Philip Vasilchenko. All rights reserved.
//

#import "DHKeyboardObserver.h"


static inline BOOL isSystemVersionHigherThanOrEqual(NSString *versionString) {
    return [UIDevice.currentDevice.systemVersion compare:versionString options:NSNumericSearch] != NSOrderedAscending;
}


@implementation DHKeyboardObserver

#pragma mark - Init

- (id)init {
    self = [super init];
    if (self) {
        [self addObserverForKeyboard];
    }
    return self;
}


- (id)initWithWillShowAction:(ActionBlock)willShow
               didShowAction:(ActionBlock)didShow
              willHideAction:(ActionBlock)willHide
               didHideAction:(ActionBlock)didHide{

    self = [self init];
    if (self) {
        self.willShowAction = willShow;
        self.didShowAction = didShow;
        self.willHideAction = willHide;
        self.didHideAction = didHide;
    }
    return self;
}


+ (instancetype)observerWithWillShowAction:(ActionBlock)willShow
                             didShowAction:(ActionBlock)didShow
                            willHideAction:(ActionBlock)willHide
                             didHideAction:(ActionBlock)didHide {

    return [[self alloc] initWithWillShowAction:willShow
                                  didShowAction:didShow
                                 willHideAction:willHide
                                  didHideAction:didHide];
}


#pragma mark - Keyboard Observing

- (void)addObserverForKeyboard {
    NSNotificationCenter * center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(keyboardWillAppear:) name:UIKeyboardWillShowNotification object:nil];
    [center addObserver:self selector:@selector(keyboardDidAppear:) name:UIKeyboardDidShowNotification object:nil];
    [center addObserver:self selector:@selector(keyboardWillDisappear:) name:UIKeyboardWillHideNotification object:nil];
    [center addObserver:self selector:@selector(keyboardDidDisappear:) name:UIKeyboardDidHideNotification object:nil];
}


#pragma mark - Notifications

- (void)keyboardWillAppear:(NSNotification *)notification {
    [self updatePropertiesWithNotification:notification appearing:YES];
    if (self.willShowAction) {
        self.willShowAction();
    }
}


- (void)keyboardDidAppear:(NSNotification *)notification {
    [self updatePropertiesWithNotification:notification appearing:YES];
    if (self.didShowAction) {
        self.didShowAction();
    }
}


- (void)keyboardWillDisappear:(NSNotification *)notification{
    [self updatePropertiesWithNotification:notification appearing:NO];
    if (self.willHideAction) {
        self.willHideAction();
    }
}


- (void)keyboardDidDisappear:(NSNotification *)notification{
    [self updatePropertiesWithNotification:notification appearing:NO];
    if (self.didHideAction) {
        self.didHideAction();
    }
}


#pragma mark - Helpers

- (BOOL)isKeyboardVisible {
    return self.keyboardHeight != 0;
}


- (UIViewAnimationOptions)animationOptions {
    // http://stackoverflow.com/questions/18957476/ios-7-keyboard-animation
    return (UIViewAnimationOptions)(_animationCurve << 16);
}


- (CGFloat)keyboardHeightForNotification:(NSNotification *)notification {
    CGRect keyboardRect = [[notification userInfo][UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat keyboardHeight = keyboardRect.size.height;
    BOOL isLandscape = UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation);
    if ( !isSystemVersionHigherThanOrEqual(@"8.0") && isLandscape ) {
        keyboardHeight = keyboardRect.size.width;
    }
    return keyboardHeight;
}


- (NSTimeInterval)timeIntervalForNotification:(NSNotification *)notification {
    return [[notification userInfo][UIKeyboardAnimationDurationUserInfoKey] doubleValue];
}


- (UIViewAnimationCurve)animationCurveForNotification:(NSNotification *)notification {
    return (UIViewAnimationCurve) [[notification userInfo][UIKeyboardAnimationCurveUserInfoKey] integerValue];
}


- (void)updatePropertiesWithNotification:(NSNotification *)notification appearing:(BOOL)isAppearing {
    _keyboardHeight = isAppearing ? [self keyboardHeightForNotification:notification] : 0;
    _animationDuration = [self timeIntervalForNotification:notification];
    _animationCurve = [self animationCurveForNotification:notification];
}

#pragma mark - Dealloc

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end