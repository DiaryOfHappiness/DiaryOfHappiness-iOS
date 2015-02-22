//
//  DHQuestionHeaderView.h
//  Diary of Happiness
//
//  Created by Philip Vasilchenko on 21.02.15.
//  Copyright (c) 2015 Philip Vasilchenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DTTableViewCell.h"


@interface DHQuestionHeaderView : UIView <DTModelTransfer>

@property (nonatomic, weak) IBOutlet UILabel * questionLabel;

@end