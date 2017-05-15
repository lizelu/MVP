//
//  Tools.m
//  MVVMTest
//
//  Created by Mr.LuDashi on 2017/5/15.
//  Copyright © 2017年 李泽鲁. All rights reserved.
//

#import "Tools.h"

@implementation Tools
/**
 计算博文高度
 
 @param text
 @return 高度
 */
+ (CGFloat)countTextHeight:(NSString *)text
                     width:(CGFloat) width
                      font:(CGFloat) fontSize
{
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:text];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = 0;
    UIFont *font = [UIFont systemFontOfSize:fontSize];
    [attributeString addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, text.length)];
    [attributeString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, text.length)];
    NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    CGRect rect = [attributeString boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - width, CGFLOAT_MAX) options:options context:nil];
    return rect.size.height;
}
@end
