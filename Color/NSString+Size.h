//
//  NSString+Size.h
//  Color
//
//  Created by licong on 2017/12/17.
//  Copyright © 2017年 Richard. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface NSString (Size)
- (BOOL)isNonEmpty;

- (CGSize)sizeWithFont:(UIFont *)font boundSize:(CGSize)size lineSpacing:(CGFloat)lineSpacing;
@end
