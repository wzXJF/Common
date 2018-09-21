//
// Created by kazuma.ukyo on 12/27/12.
//
// To change the template use AppCode | Preferences | File Templates.
//
// https://github.com/yaakaito/Overline/blob/master/Overline/Over/NSNull/NSNull%2BOVNatural.h
// 
// 说明：采用从json数据中解析时，有时候可能是空，这时判断长度就会崩溃，控制台输出是 -[NSNull length]: unrecognized selector sent to instance
// 那么就需要判断所得数据是不是NSNull才行，然而直接判断会出现如下警告，以下是苹果官方文档的代码 ：
/*id aValue = [arrayWithNull objectAtIndex:0];
if (aValue == nil) {
    NSLog(@"equals nil");
} else if (aValue == [NSNull null]){
    NSLog(@"equals NSNull instance");
    if ([aValue isEqual:nil]) {
        NSLog(@"isEqual:nil");
    }
}*/
//那么我们判断时就可以仿照官方的判断即可。
//
// 这样使用json中的每个值都要这么判断就太麻烦了，再搜了搜，别人提供了这个类，说是可以解决，不知道原理
#import <Foundation/Foundation.h>

// http://stackoverflow.com/questions/2060741/does-objective-c-use-short-circuit-evaluation

@interface NSNull (OVNatural)
- (void)forwardInvocation:(NSInvocation *)anInvocation;
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector;
@end
