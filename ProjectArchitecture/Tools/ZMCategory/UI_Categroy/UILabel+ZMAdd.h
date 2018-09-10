//
//  UILabel+ZMAdd.h
//  Architecture
//
//  Created by ZM on 2016/10/18.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (ZMAdd)
{
    //ios 新闻详情
    //关于仿网易新闻中详细页图文混排功能的实现
    //http://blog.csdn.net/qcx321/article/details/52194835
    //新版网易新闻客户端应用iOS源码
    //https://my.oschina.net/chnehaimeihang/blog/516165?p={{page}}    
}
@property (nonatomic, copy) NSString *textSize;
@property (nonatomic, copy) NSString *textOfWidthFixed;
@property (nonatomic, copy) NSString *textOfHeightFixed;

// 改变label的文本的 两种以上颜色及字体
+ (void)zm_changeTextLab:(UILabel *)myLabel
          stringArray:(NSArray *)strArray
           colorArray:(NSArray *)colorArray
            fontArray:(NSArray *)fontArray;

// 改变label的文本的 两种以上颜色及字体（大小粗细样式）
+ (void)zm_changeTextLab:(UILabel *)myLabel
              strings:(NSArray *)strArray
               colors:(NSArray *)colorArray
                fonts:(NSArray *)fontArray;

/* 设置行间距
 @param alignment 文本排版位置
 @param lineSpacing 行高
 */
+ (void)zm_setlineSpacingText:(UILabel *)label alignment:(NSTextAlignment)alignment lineSpacing:(CGFloat)lineSpacing;


/**
 设置段落样式
 
 @param lineSpace       行间距
 @param paragraphSpace  段间距
 @param characterSpace  字间距
 @param alignment       文本排版位置
 @param headIndent      所有：行首缩进
 */
- (void)zm_setLineSpace:(CGFloat)lineSpace
      paragraphSpace:(CGFloat)paragraphSpace
      characterSpace:(NSNumber*)characterSpace
           alignment:(NSTextAlignment)alignment
          headIndent:(CGFloat)headIndent;

/** 同上
 * 改变label的文本的 两种以上颜色及字体、设置行距、字间距、段间距：并自行适配高度 （宽度固定）
 *（大小粗细样式）
 */
- (void)zm_changeLabTexts:(NSArray *)strArray
                colors:(NSArray *)colorArray
                 fonts:(NSArray *)fontArray
             alignment:(NSTextAlignment)alignment
             lineSpace:(CGFloat)lineSpace
        paragraphSpace:(CGFloat)paragraphSpace
        characterSpace:(NSNumber*)characterSpace
            headIndent:(CGFloat)headIndent
            tailIndent:(CGFloat)tailIndent autoSize:(BOOL)autoSize;


//提示框
- (void)zm_hudContextInfo:(NSString *)contextInfo afterDelay:(NSTimeInterval)delay;


@end
