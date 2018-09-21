//
//  UIDevice+deviceString.m
//  TinyBean
//
//  Created by 张扬 on 15/6/9.
//  Copyright (c) 2015年 URSUS. All rights reserved.
//
#import "UIDevice+deviceString.h"
#import "sys/utsname.h"

@implementation UIDevice (deviceString)
///判断型号模式
+(BOOL)judeingIphoneSize{
    CGSize currentSize = [UIScreen mainScreen].currentMode.size;
    
    CGSize size7PBig =CGSizeMake(1125,2001);
    CGSize size7P =CGSizeMake(1242,2208);
    CGSize size7Big =CGSizeMake(640,1136);
    CGSize size7 =CGSizeMake(750,1334);
    CGSize size6PBig =CGSizeMake(1125,2001);
    CGSize size6P =CGSizeMake(1242,2208);
    CGSize size6Big =CGSizeMake(640,1136);
    CGSize size6 =CGSizeMake(750,1334);
    CGSize size5 =CGSizeMake(750,1334);
    CGSize size4 =CGSizeMake(640,960);
    BOOL is7PB =CGSizeEqualToSize(currentSize, size7PBig);
    BOOL is7P  =CGSizeEqualToSize(currentSize, size7P);
    BOOL is7B  =CGSizeEqualToSize(currentSize, size7Big);
    BOOL is7   =CGSizeEqualToSize(currentSize, size7);
    BOOL is6PB =CGSizeEqualToSize(currentSize, size6PBig);
    BOOL is6P  =CGSizeEqualToSize(currentSize, size6P);
    BOOL is6B  =CGSizeEqualToSize(currentSize, size6Big);
    BOOL is6   =CGSizeEqualToSize(currentSize, size6);
    BOOL is5   =CGSizeEqualToSize(currentSize, size5);
    BOOL is4   =CGSizeEqualToSize(currentSize, size4);
    if(is7PB && [[UIDevice deviceName] rangeOfString:@"7"].location != NSNotFound) {
        NSLog(@"7P放大模式");
        return YES;
    }
    else if(is7P && [[UIDevice deviceName] rangeOfString:@"7P"].location != NSNotFound){
        NSLog(@"7P标准模式");
        return NO;
    }
    else if(is7B && [[UIDevice deviceName] rangeOfString:@"7"].location != NSNotFound){
        NSLog(@"7放大模式");
        return YES;
    }
    else if(is7 && [[UIDevice deviceName] rangeOfString:@"7"].location != NSNotFound){
        NSLog(@"7标准模式");
        return NO;
    }
    else if(is6PB && [[UIDevice deviceName] rangeOfString:@"6"].location != NSNotFound) {
        NSLog(@"6p放大模式");
        return YES;
    }
    else if(is6P && [[UIDevice deviceName] rangeOfString:@"6P"].location != NSNotFound){
        NSLog(@"6p标准模式");
        return NO;
    }
    else if(is6B && [[UIDevice deviceName] rangeOfString:@"6"].location != NSNotFound){
        NSLog(@"6放大模式");
        return YES;
    }
    else if(is6 && [[UIDevice deviceName] rangeOfString:@"6"].location != NSNotFound){
        NSLog(@"6标准模式");
        return NO;
    }
    else if(is5 && [[UIDevice deviceName] rangeOfString:@"5"].location != NSNotFound){
        NSLog(@"5标准模式");
        return NO;
    }
    else if(is4 && [[UIDevice deviceName] rangeOfString:@"4"].location != NSNotFound){
        NSLog(@"4标准模式");
        return NO;
    }else{
        NSLog(@"其他模式");
        return NO;
    }
}

+ (NSString*)deviceName
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    if ([deviceString isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";
    if ([deviceString isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([deviceString isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([deviceString isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone3,2"])    return @"iPhone 4-8G";
    if ([deviceString isEqualToString:@"iPhone3,3"])    return @"iPhone 4 CDMA";
    if ([deviceString isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([deviceString isEqualToString:@"iPhone5,1"])    return @"iPhone 5";
    if ([deviceString isEqualToString:@"iPhone5,2"])    return @"iPhone 5";
    if ([deviceString isEqualToString:@"iPhone5,3"])    return @"iPhone 5C";
    if ([deviceString isEqualToString:@"iPhone5,4"])    return @"iPhone 5C";
    if ([deviceString isEqualToString:@"iPhone6,1"])    return @"iPhone 5S";
    if ([deviceString isEqualToString:@"iPhone6,2"])    return @"iPhone 5S";
    if ([deviceString isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    if ([deviceString isEqualToString:@"iPhone7,1"])    return @"iPhone 6Plus";
    if ([deviceString isEqualToString:@"iPhone8,1"])    return @"iPhone 6S";
    if ([deviceString isEqualToString:@"iPhone8,2"])    return @"iPhone 6SPlus";
    if ([deviceString isEqualToString:@"iPhone8,4"])    return @"iPhone SE";
    if ([deviceString isEqualToString:@"iPhone9,1"])    return @"iPhone 7";
    if ([deviceString isEqualToString:@"iPhone9,3"])    return @"iPhone 7";
    if ([deviceString isEqualToString:@"iPhone9,2"])    return @"iPhone 7Plus";
    if ([deviceString isEqualToString:@"iPhone9,4"])    return @"iPhone 7Plus";
    if ([deviceString isEqualToString:@"iPhone10,1"])    return @"iPhone 8";
    if ([deviceString isEqualToString:@"iPhone10,4"])    return @"iPhone 8";
    if ([deviceString isEqualToString:@"iPhone10,2"])    return @"iPhone 8Plus";
    if ([deviceString isEqualToString:@"iPhone10,5"])    return @"iPhone 8Plus";
    if ([deviceString isEqualToString:@"iPhone10,3"])    return @"iPhone X";
    if ([deviceString isEqualToString:@"iPhone10,6"])    return @"iPhone X";
    if ([deviceString isEqualToString:@"iPhone11,8"])    return @"iPhone XR";
    if ([deviceString isEqualToString:@"iPhone11,2"])    return @"iPhone XS";
    if ([deviceString isEqualToString:@"iPhone11,4"])    return @"iPhone XS Max";
    if ([deviceString isEqualToString:@"iPhone11,6"])    return @"iPhone XS Max";
    if ([deviceString isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([deviceString isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([deviceString isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([deviceString isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([deviceString isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([deviceString isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([deviceString isEqualToString:@"iPad2,2"])      return @"iPad 2 (GSM)";
    if ([deviceString isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([deviceString isEqualToString:@"iPad3,1"])      return @"iPad 3 (WiFi)";
    if ([deviceString isEqualToString:@"iPad3,2"])      return @"iPad 3 (CDMA)";
    if ([deviceString isEqualToString:@"iPad3,3"])      return @"iPad 3 (GSM)";
    if ([deviceString isEqualToString:@"iPad3,4"])      return @"iPad 4 (WiFi)";
    if ([deviceString isEqualToString:@"iPad3,5"])      return @"iPad 4 (GSM)";
    if ([deviceString isEqualToString:@"iPad3,6"])      return @"iPad 4 (CDMA)";
    if ([deviceString isEqualToString:@"i386"])         return @"Simulator";
    if ([deviceString isEqualToString:@"x86_64"])       return @"Simulator";
    NSLog(@"NOTE: Unknown device type: %@", deviceString);
    return deviceString;
}
@end
