//
//  NSAttributedString+Size.h
//  Color
//
//  Created by licong on 2017/12/17.
//  Copyright © 2017年 Richard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSAttributedString (Size)
+ (NSMutableAttributedString *)attributedStringWithString:(NSString *)string  font:(UIFont *)font color:(UIColor *)color lineSpacing:(CGFloat)spacing;
+ (NSMutableAttributedString *)attributedStringWithString:(NSString *)string  font:(UIFont *)font color:(UIColor *)color maxWidth:(CGFloat) maxWidth lineSpacing:(CGFloat)spacing;
@end
