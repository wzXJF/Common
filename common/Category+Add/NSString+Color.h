#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Color)

- (NSMutableAttributedString *) colorStringWithKey:(NSString *) key andKeyColor:(UIColor *) color;

@end
