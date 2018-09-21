//
//  NSAttributedString+SFAString.h
//  Doctor
//
//  Created by GuoDongJin on 15/8/17.
//  Copyright (c) 2015年 itrigo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSAttributedString (SFAString)

-(CGSize)compressedSizeInTextViewWithWidth:(CGFloat)theWidth;

-(CGSize)compressedSizeInLabelWithWidth:(CGFloat)theWidth;
@end
