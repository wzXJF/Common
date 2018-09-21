//
//  NSObject+Add.h
//  AmbowApp
//
//  Created by ZY on 2017/8/11.
//  Copyright © 2017年 xuejianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Add)
- (NSArray*)propertyKeys;
- (BOOL)reflectDataFromOtherObject:(NSObject*)dataSource;
@end
