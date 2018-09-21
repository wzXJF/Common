//
//  NSString+Base64.h
//  AmbowApp
//
//  Created by 1111 on 2017/9/30.
//  Copyright © 2017年 xuejianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Base64)
/**
 *  转换为Base64编码
 */
- (NSString *)base64EncodedString;
/**
 *  将Base64编码还原
 */
- (NSString *)base64DecodedString;
@end
