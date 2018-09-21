//
//  NSAttributedString+SFAString.m
//  Doctor
//
//  Created by GuoDongJin on 15/8/17.
//  Copyright (c) 2015年 itrigo. All rights reserved.
//

#import "NSAttributedString+SFAString.h"

@implementation NSAttributedString (SFAString)
-(CGSize)compressedSizeInTextViewWithWidth:(CGFloat)theWidth
{
    static UITextView *sizingTextView;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sizingTextView = [[UITextView alloc] init];
    });
    sizingTextView.attributedText = self;
    CGSize textViewSize = [sizingTextView sizeThatFits:CGSizeMake(theWidth, FLT_MAX)];
    return textViewSize;
}

-(CGSize)compressedSizeInLabelWithWidth:(CGFloat)theWidth
{
    static UILabel *sizingLabel;
    static dispatch_once_t onceTokenForSizingLabel;
    dispatch_once(&onceTokenForSizingLabel, ^{
        sizingLabel = [[UILabel alloc] init];
        [sizingLabel setLineBreakMode:NSLineBreakByWordWrapping];
        [sizingLabel setNumberOfLines:0];
        
    });
    
    sizingLabel.frame = CGRectMake(0, 0, theWidth, 1000);
    sizingLabel.attributedText = self;
    CGRect frame = [sizingLabel textRectForBounds:sizingLabel.frame limitedToNumberOfLines:0];
    return frame.size;
}
@end
