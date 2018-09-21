
#import "NSString+Color.h"
@implementation NSString (Color)

- (NSMutableAttributedString *) colorStringWithKey:(NSString *) key andKeyColor:(UIColor *) color
{
    
    NSMutableAttributedString *aStr = [[NSMutableAttributedString alloc] initWithString:self];
    
    //  正则表达
    NSError *error = nil;
    NSRegularExpression *reg = [NSRegularExpression regularExpressionWithPattern:key options:0 error:&error];
    if (error) {
        NSLog(@"创建正则表达式失败:%@",error);
        return aStr;
    }
    
    NSArray *results  = [reg matchesInString:self options:0 range:NSMakeRange(0, self.length)];
    
    for (NSTextCheckingResult *rs in results) {
        //NSForegroundColorAttributeName 文字颜色
        [aStr addAttribute:NSForegroundColorAttributeName value:color range:rs.range];
    }
    
//  返回可变的atrributeString
    return aStr;
}

@end
