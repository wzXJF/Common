//
//  NSString+SFString.h
//  ItrigoModules
//
//  Created by Jagie on 1/15/15.
//  Copyright (c) 2015 Jagie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (SFString)
-(NSString *)md5;
-(float)heightForFixedWidth:(float)theWidth font:(UIFont *)font;
-(float)widthForOneLineStrWithFont:(UIFont *)font;

-(CGSize)compressedSizeInTextViewWithWidth:(float)theWidth font:(UIFont *)font;
-(CGSize)compressedSizeInLabelWithWidth:(float)theWidth font:(UIFont *)font;
- (UIImage *)createQRForString:(NSString *)qrString;
-(BOOL)isNumber;
@end
