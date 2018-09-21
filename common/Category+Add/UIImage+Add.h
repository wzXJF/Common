//
//  UIImage+Add.h
//  AmbowSignIn
//
//  Created by ZY on 2016/11/23.
//  Copyright © 2016年 Anbo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Add)

+ (UIImage *)imageWithFileName:(NSString *)fileName;

//通过CIFilter创建CIImage二维码
+ (CIImage *)createQRCodeImage:(NSString *)source;
//通过将CIFilter生成的模糊二维码优化，变成清晰二维码
+ (UIImage *)resizeQRCodeImage:(CIImage *)image withSize:(CGFloat)size;

//生成带颜色的二维码
+ (UIImage *)specialColorImage:(UIImage*)image withRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;

//生成带圆角的Logo；用于合并到二维码上
+ (UIImage *)createRoundedRectImage:(UIImage *)image withSize:(CGSize)size withRadius:(NSInteger)radius;

//将二维码和Logo(createRoundedRectImage生成的Logo)合成
+(UIImage *)addIconToQRCodeImage:(UIImage *)image withIcon:(UIImage *)icon withIconSize:(CGSize)iconSize;
//将二维码和Logo(createRoundedRectImage生成的Logo)合成
+(UIImage *)addIconToQRCodeImage:(UIImage *)image withIcon:(UIImage *)icon withScale:(CGFloat)scale;

- (UIImage *)fixOrientation;

- (UIImage *)crop:(CGRect)rect;

- (UIImage *)clipByCircle;
@end
