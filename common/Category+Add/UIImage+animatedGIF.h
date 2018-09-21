//
//  UIImage+animatedGIF.h
//  Ambow ERP
//
//  Created by 1111 on 17/5/3.
//  Copyright © 2017年 1111. All rights reserved.
//  播放GIF图片的两种方式

#import <ImageIO/ImageIO.h>
#import <UIKit/UIKit.h>

#if __has_feature(objc_arc)
#define toCF (__bridge CFTypeRef)
#define fromCF (__bridge id)
#else
#define toCF (CFTypeRef)
#define fromCF (id)
#endif

@interface UIImage (animatedGIF)

+ (UIImage * _Nullable)animatedImageWithAnimatedGIFData:(NSData * _Nonnull)theData;
+ (UIImage * _Nullable)animatedImageWithAnimatedGIFURL:(NSURL * _Nonnull)theURL;

@end
