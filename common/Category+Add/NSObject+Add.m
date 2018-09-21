//
//  NSObject+Add.m
//  AmbowApp
//
//  Created by ZY on 2017/8/11.
//  Copyright © 2017年 xuejianfeng. All rights reserved.
//

#import "NSObject+Add.h"
#import "objc/runtime.h"

@implementation NSObject (Add)
- (NSArray*)propertyKeys{
    unsigned int outCount , i;
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    NSMutableArray *keys = [[NSMutableArray alloc]initWithCapacity:outCount];
    for (i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        NSString *propertyName = [[NSString alloc]initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        [keys addObject:propertyName];
    }
    free(properties);
    
    return keys;
}

- (BOOL)reflectDataFromOtherObject:(NSObject*)dataSource{
    BOOL ret = NO;
    for (NSString *key in [self propertyKeys]) {
        if ([dataSource isKindOfClass:[NSDictionary class]]) {
            ret = ([dataSource valueForKey:key] == nil) ? NO : YES;
        }else{
            ret = [dataSource respondsToSelector:NSSelectorFromString(key)];
        }
        if (ret) {
            id propertyValue = [dataSource valueForKey:key];
            if (![propertyValue isKindOfClass:[NSNull class]] && propertyValue != nil) {
                [self setValue:propertyValue forKey:key];
            }
        }
    }
    return ret;
}
@end
