//
//  NSString+SFString.m
//  ItrigoModules
//
//  Created by Jagie on 1/15/15.
//  Copyright (c) 2015 Jagie. All rights reserved.
//

#import "NSString+SFString.h"
#import <CommonCrypto/CommonDigest.h>
#import "TBGlobalMacro.h"

@implementation NSString (SFString)

- (NSString *)md5 {
    const char *cstr = [self UTF8String];
    unsigned char result[16];
    CC_MD5(cstr, (unsigned int)strlen(cstr), result);
    
    return [NSString stringWithFormat:
            @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}
-(float)heightForFixedWidth:(float)theWidth font:(UIFont *)font{
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"6.0")) {
        NSAttributedString *attributedText =[[NSAttributedString alloc]
                                             initWithString:self
                                             attributes:@{ NSFontAttributeName: font}] ;
        
        CGRect paragraphRect =
        [attributedText boundingRectWithSize:CGSizeMake(theWidth, CGFLOAT_MAX)
                                     options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)
                                     context:nil];
        
        return ceilf(paragraphRect.size.height) ;
    }else{
        //CGSize size =  [self sizeWithFont:font constrainedToSize:CGSizeMake(theWidth, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
        
        CGSize size = [self boundingRectWithSize:CGSizeMake(theWidth, MAXFLOAT) options:0 attributes:@{NSFontAttributeName : font} context:nil].size;
        
        return ceilf(size.height);
    }
}

-(float)widthForOneLineStrWithFont:(UIFont *)font{
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"6.0")) {
        NSAttributedString *attributedText =[[NSAttributedString alloc]
                                             initWithString:self
                                             attributes:@{ NSFontAttributeName: font}] ;
        
        CGRect paragraphRect =
        [attributedText boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)
                                     options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)
                                     context:nil];
        
        return ceilf(paragraphRect.size.width) ;
    }else{
        CGSize size =  [self sizeWithFont:font constrainedToSize:CGSizeMake(MAXFLOAT, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
        
        return ceilf(size.width);
        
    }
}


-(CGSize)compressedSizeInTextViewWithWidth:(float)theWidth font:(UIFont *)font{
    static UITextView *sizingTextView;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sizingTextView = [[UITextView alloc] init];
        
    });
    sizingTextView.font = font;
    sizingTextView.text = self;
    CGSize textViewSize = [sizingTextView sizeThatFits:CGSizeMake(theWidth, FLT_MAX)];
    return textViewSize;
}

-(CGSize)compressedSizeInLabelWithWidth:(float)theWidth font:(UIFont *)font
{
    static UILabel *sizingLabel;
    static dispatch_once_t onceTokenForSizingLabel;
    dispatch_once(&onceTokenForSizingLabel, ^{
        sizingLabel = [[UILabel alloc] init];
        [sizingLabel setLineBreakMode:NSLineBreakByWordWrapping];
        [sizingLabel setNumberOfLines:0];
        
    });

    sizingLabel.frame = CGRectMake(0, 0, theWidth, 1000);
    sizingLabel.font = font;
    sizingLabel.text = self;
    CGRect frame = [sizingLabel textRectForBounds:sizingLabel.frame limitedToNumberOfLines:0];
    return frame.size;
}

- (UIImage *)createNonInterpolatedUIImageFromCIImage:(CIImage *)image withScale:(CGFloat)scale
{
    // Render the CIImage into a CGImage
    CGImageRef cgImage = [[CIContext contextWithOptions:nil] createCGImage:image fromRect:image.extent];
    
    // Now we'll rescale using CoreGraphics
    UIGraphicsBeginImageContext(CGSizeMake(image.extent.size.width * scale, image.extent.size.width * scale));
    CGContextRef context = UIGraphicsGetCurrentContext();
    // We don't want to interpolate (since we've got a pixel-correct image)
    CGContextSetInterpolationQuality(context, kCGInterpolationNone);
    CGContextDrawImage(context, CGContextGetClipBoundingBox(context), cgImage);
    // Get the image out
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    // Tidy up
    UIGraphicsEndImageContext();
    CGImageRelease(cgImage);
    // Need to set the image orientation correctly
    UIImage *flippedImage = [UIImage imageWithCGImage:[scaledImage CGImage]
                                                scale:scaledImage.scale
                                          orientation:UIImageOrientationDownMirrored];
    
    return flippedImage;
}

- (UIImage *)createQRForString:(NSString *)qrString
{
    // Need to convert the string to a UTF-8 encoded NSData object
    NSData *stringData = [qrString dataUsingEncoding:NSUTF8StringEncoding];
    
    // Create the filter
    CIFilter *qrFilter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    // Set the message content and error-correction level
    [qrFilter setValue:stringData forKey:@"inputMessage"];
    [qrFilter setValue:@"M" forKey:@"inputCorrectionLevel"];
    
    // Send the image back
    CIImage * ciImage =  qrFilter.outputImage;
    return  [self createNonInterpolatedUIImageFromCIImage:ciImage withScale:[UIScreen mainScreen].scale * 3];
}

-(BOOL)isNumber{
    NSNumberFormatter *f = [NSNumberFormatter new];
    return [f numberFromString:self] != nil;
}
@end
