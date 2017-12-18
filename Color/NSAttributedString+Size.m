//
//  NSAttributedString+Size.m
//  Color
//
//  Created by licong on 2017/12/17.
//  Copyright © 2017年 Richard. All rights reserved.
//

#import "NSAttributedString+Size.h"
#import "NSString+Size.h"

@implementation NSAttributedString (Size)

+ (NSMutableAttributedString *)attributedStringWithString:(NSString *)string  font:(UIFont *)font color:(UIColor *)color lineSpacing:(CGFloat)spacing {
    if (!font) {
        NSAssert(0, @"请传递一个正常的字体参数");
    }
    
    if (!color) {
        NSAssert(0, @"请传递一个正常的字体参数");
    }
    
    if (![string isNonEmpty]) {
        return [[NSMutableAttributedString alloc] initWithString:@"" attributes:nil];;
    }
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = spacing;
    style.lineBreakMode = NSLineBreakByWordWrapping;
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:string attributes:@{NSFontAttributeName:font, NSForegroundColorAttributeName:color, NSParagraphStyleAttributeName:style}];
    return [attributedString mutableCopy];
}

+ (NSMutableAttributedString *)attributedStringWithString:(NSString *)string  font:(UIFont *)font color:(UIColor *)color maxWidth:(CGFloat) maxWidth lineSpacing:(CGFloat)spacing {
    if (!font) {
        NSAssert(0, @"请传递一个正常的字体参数");
    }
    
    if (!color) {
        NSAssert(0, @"请传递一个正常的字体参数");
    }
    
    if (![string isNonEmpty]) {
        return [[NSMutableAttributedString alloc] initWithString:@"" attributes:nil];;
    }
    NSMutableParagraphStyle *style = [NSAttributedString setupParagraphStyle];
    NSDictionary * attributes = [NSAttributedString attributesWithFont:font color:color];
    CGFloat contentHeight = [NSAttributedString contentHeightWithString:string maxWidth:maxWidth attributes:attributes];
    if (contentHeight > font.lineHeight){
        style.lineSpacing = spacing;
    } else {
        style.lineSpacing = 0;
    }
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:string attributes:attributes];
    return [attributedString mutableCopy];
}

+ (NSMutableParagraphStyle *)setupParagraphStyle {
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineBreakMode = NSLineBreakByWordWrapping;
    return style;
}

+ (NSDictionary *)attributesWithFont:(UIFont *)font color:(UIColor *)color {
    NSMutableParagraphStyle *style = [NSMutableAttributedString setupParagraphStyle];
    NSDictionary * attributes = @{NSFontAttributeName:font, NSForegroundColorAttributeName:color, NSParagraphStyleAttributeName:style};
    return attributes;
}

+ (CGFloat )contentHeightWithString:(NSString *)string maxWidth:(CGFloat) maxWidth attributes: (NSDictionary *)attributes{
    CGFloat contentHeight = [string boundingRectWithSize:CGSizeMake(maxWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingTruncatesLastVisibleLine attributes:attributes context:nil].size.height;
    return contentHeight;
}
@end
