//
//  NSString+Size.m
//  Color
//
//  Created by licong on 2017/12/17.
//  Copyright © 2017年 Richard. All rights reserved.
//

#import "NSString+Size.h"

@implementation NSString (Size)

- (CGSize)sizeWithFont:(UIFont *)font boundSize:(CGSize)size lineSpacing:(CGFloat)lineSpacing{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineSpacing = lineSpacing;
    //设置换行模式为单词模式
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    NSDictionary *attributes = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle};
    CGSize resultSize = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingTruncatesLastVisibleLine attributes:attributes context:nil].size;
    return CGSizeMake(ceil(resultSize.width), ceil(resultSize.height));
}

- (BOOL)isNonEmpty {
    
    NSMutableCharacterSet *emptyStringSet = [[NSMutableCharacterSet alloc] init];
    [emptyStringSet formUnionWithCharacterSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    [emptyStringSet formUnionWithCharacterSet: [NSCharacterSet characterSetWithCharactersInString: @"　"]];
    if ([self length] == 0) {
        return NO;
    }
    NSString* str = [self stringByTrimmingCharactersInSet:emptyStringSet];
    return [str length] > 0;
}


@end
