//
//  UILabel+ZMAdd.m
//  Architecture
//
//  Created by ZM on 2016/10/18.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "UILabel+ZMAdd.h"
#import "NSString+ZMAdd.h"
#import "TestColorHeader.h"

@implementation UILabel (ZMAdd)

@dynamic textSize;
@dynamic textOfWidthFixed;
@dynamic textOfHeightFixed;
//@dynamic mutAttributedString;
//@dynamic paraStyle;
//@dynamic lineSpace;

//@synthesize mutAttributedString = _mutAttributedString;

- (void)test {
    
    
    // NSParagraphStyle  段落样式
    //    typedef NS_ENUM(NSInteger, NSLineBreakMode) {     //对于长内容或多行内容的处理方式
    //        NSLineBreakByWordWrapping = 0,/* Wrap at word boundaries, default */  //按包含单词为界限截断
    //        NSLineBreakByCharWrapping,    /* Wrap at character boundaries */      //按字符为界限截断
    //        NSLineBreakByClipping,        /* Simply clip */   //简单的修剪
    //        NSLineBreakByTruncatingHead,  /* : "...wxyz" */   //截断头部
    //        NSLineBreakByTruncatingTail,  /* : "abcd..." */   //截断尾巴
    //        NSLineBreakByTruncatingMiddle /* : "ab...yz" */   //截断中间
    //    } NS_ENUM_AVAILABLE_IOS(6_0);

    //    NSMutableParagraphStyle*style = [[NSMutableParagraphStyle alloc]init];
    //    style.headIndent = 30; //行头部 缩进 相当于左padding
    //    style.firstLineHeadIndent = 100; //首行缩进
    //    style.lineSpacing = 10;//行距
    


    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, SSHEIGHT-100-49, 200, 60)];
    label.backgroundColor = BgColor;
    label.font = [UIFont systemFontOfSize:16];
    label.text = @"Hello, girl, Boy, money";
    label.textColor = [UIColor redColor];
    label.textAlignment = NSTextAlignmentCenter;
    //[self.view addSubview:label];
 
    
    NSArray *colorArray = @[[UIColor greenColor],[UIColor blueColor],OrangeColor];
    [UILabel changeTextLab:label
               stringArray:@[@"Hello",@"Boy",@"money"]
                colorArray:colorArray
                 fontArray:@[@"18",@"20"]];
    
    
//    CGSize size = CGSizeMake(280, 500000);
//    CGSize labelSize = [self sizeThatFits:size];

    
    
//    //测试
//    NSString *str = @"    上海棠棣信息科技有限公司（股票代码833777，简称“棠棣信息”）是得到了国家信息产业部、上海市各级政府认可的高新技术企业，专业为国际国内各类银行、互联网金融企业等金融机构以及智慧社区、医疗机构等提供行业一流软件产品和系统集成服务。\n    棠棣信息2009年成立，总部位于中国上海“张江高科技园区”，是上海市科技小巨人培育企业、上海市高新技术企业，拥有数十项软件著作权。在北京、福州、广州、合肥等地设有分公司，技术服务站点遍及全国各大城市。\n    棠棣信息的发展始终放眼于全球范围内信息化、智能化发展的前沿进程，紧随全球“工业4.0”的步伐，棠棣信息也投入了大量的研发力量，使产品及服务始终保持行业领先水平。";
//
//    label.text = str;
//
//    [label changeLabTextArray:@[@"上海棠棣信息科技有限公司",@"833777"]
//                        colorArray:@[[UIColor darkTextColor],Blue_2599FA]
//                         fontArray:@[@"16",@"14"]
//                         alignment:NSTextAlignmentLeft
//                         lineSpace:4.4f
//                    paragraphSpace:30.f
//                    characterSpace:@2.0f
//                     autoSize:YES];

    
//    NSMutableAttributedString* attrbString = [[NSMutableAttributedString alloc] initWithString:label.text];
//    
//    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    
    UILabel *_myLab1;
    // 设置段落样式
    [_myLab1 seteLineSpace:0 paragraphSpace:0 characterSpace:[NSNumber numberWithFloat:5] alignment:NSTextAlignmentCenter headIndent:5];
    
    
    
}

//- (void)testZMSpaceLabel {
//    
//    NSString *labelText = CompanyTopText; //CGRectZero
//    //自定义的Label视图
//    ZMSpaceLabel *readNewsLable =[[ZMSpaceLabel alloc] initWithFrame:CGRectZero];
//    readNewsLable.textColor = MAIN_BASE_GRAY_COLOR;
//    readNewsLable.lineBreakMode = NSLineBreakByWordWrapping;
//    readNewsLable.backgroundColor = [UIColor yellowColor];
//    readNewsLable.font = [UIFont fontWithName:contentFontName size:14];
//    readNewsLable.text = labelText;
//    readNewsLable.numberOfLines = 0;
//    [self.view addSubview:readNewsLable];
//    
//    //	int height = [readNewsLable getAttributedStringHeightWidthValue:SSWIDTH];
//    //    NSLog(@"---> Label高度_11 %i", height);
//    /*设置label的frame值*/
//    readNewsLable.characterSpace = 5.0f;
//    readNewsLable.linesSpace = 4.4f;
//    readNewsLable.paragraphSpace = 10.f;
//    int height = [readNewsLable getAttributedStringHeightWidthValue:SSWIDTH];
//    NSLog(@"---> Label高度_22 %i", height);
//    
//    readNewsLable.frame = CGRectMake(10, 80, SSWIDTH-20, height);
//    
//}




//static const void *tagKey = &tagKey;
//- (NSString *)tag {
//    return objc_getAssociatedObject(self, tagKey);
//}
//
//- (void)setTag:(NSString *)tag {
//    objc_setAssociatedObject(self, tagKey, tag, OBJC_ASSOCIATION_COPY_NONATOMIC);
//}


////字符串属性化
//- (void)setMutAttributedString:(NSMutableAttributedString *)mutAttributedString
//{
////    self.mutAttributedString = [[NSMutableAttributedString alloc] initWithString:self.text];
//}
////段落样式
//- (void)setParaStyle:(NSMutableParagraphStyle *)paraStyle {
//   
////   self.paraStyle = [[NSMutableParagraphStyle alloc] init];
//}
//
//
//- (NSMutableAttributedString *)mutAttributedString {
//    
//    if (!self.mutAttributedString) {
//        self.mutAttributedString = [[NSMutableAttributedString alloc] initWithString:self.text];
//    }
//    return self.mutAttributedString;
//}
////设置行间距
//- (void)setLineSpace:(CGFloat)lineSpace {
//    
//    self.paraStyle.lineSpacing = lineSpace;
//    
//    [self.mutAttributedString addAttribute:NSParagraphStyleAttributeName value:self.paraStyle range:NSMakeRange(0, [self.text length])];
//}


/*
 *  使用以下 要先设置字体大小)
 */
// 自适应 宽、高
- (void)setTextSize:(NSString *)textSize {
    
    self.text = textSize;

    CGSize size = [NSString getTextSize:textSize Font:self.font];
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, size.width, size.height);
}

// 宽固定 自适应高
- (void)setTextOfWidthFixed:(NSString *)textOfWidthFixed {
    
    self.text = textOfWidthFixed;
    
    float height = [NSString getTextSizeHeight:textOfWidthFixed Font:self.font Width:self.frame.size.width];
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, height);
}

// 高固定 自适应宽
- (void)setTextOfHeightFixed:(NSString *)textOfHeightFixed {
    
    self.text = textOfHeightFixed;
    
    float width = [NSString getTextSizeWidth:textOfHeightFixed Font:self.font Height:self.frame.size.height];
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, width, self.frame.size.height);
}


//==========================="   尺寸   "================================
/**
 *  计算字符串的尺寸高度_height：宽度固定
 *  @return 高度
 */
+ (float)getTextSizeHeight:(NSString*)string Font:(UIFont*)myfont Width:(float)width
{
    //获取文本
    NSMutableParagraphStyle *paragraph= [[NSMutableParagraphStyle alloc]init];
    paragraph.alignment = NSLineBreakByWordWrapping;
    NSDictionary *attributeDic = @{NSFontAttributeName: myfont, NSParagraphStyleAttributeName: paragraph};
    //string
    CGSize mySize =[string boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributeDic context:nil].size;
    
    //NSLog(@"-----> fontSize.height: %f \n ",mySize.height);
    float height= mySize.height + 1;// ＋1 防止四舍五入
    return height;
    
}
/**
 *  计算字符串的尺寸宽度_width：高度固定
 *  @return 宽度
 */
+ (CGFloat)getTextSizeWidth:(NSString*)string Height:(float)height font:(UIFont*)myfont
{
    //获取文本
    NSMutableParagraphStyle *paragraph= [[NSMutableParagraphStyle alloc]init];
    paragraph.alignment = NSLineBreakByWordWrapping;
    NSDictionary *attributeDic = @{NSFontAttributeName: myfont, NSParagraphStyleAttributeName: paragraph};
    //string
    CGSize mySize =[string boundingRectWithSize:CGSizeMake(MAXFLOAT, height) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributeDic context:nil].size;
    //    NSLog(@"-----> fontSize.width: %f \n ",mySize.width);
    CGFloat width= mySize.width + 1;
    return width;
}
//同上
+ (CGFloat)getTextSizeWidth:(NSString*)string Font:(UIFont*)myfont Height:(float)height
{
    NSDictionary *attributeDic = @{NSFontAttributeName:myfont};
    CGSize size = [string sizeWithAttributes:attributeDic];
    CGSize getSize = CGSizeMake(ceilf(size.width), ceilf(height));
    
    return getSize.width;
}

//获取文本的尺寸
+ (CGSize)getTextSize:(NSString*)string Font:(UIFont*)myfont
{
    NSDictionary *attributeDic = @{NSFontAttributeName:myfont,
                                   NSStrokeColorAttributeName: [UIColor greenColor],
                                   NSForegroundColorAttributeName:[UIColor greenColor]};
    
    CGSize size = [string sizeWithAttributes:attributeDic];
    CGSize getSize = CGSizeMake(ceilf(size.width), ceilf(size.height));
    NSLog(@"getSize= %@",NSStringFromCGSize(getSize));
    NSLog(@"width = %f",getSize.width);
    NSLog(@"height= %f",getSize.height);
    
    return getSize;
}


//==========================="   设置文本属性，改变文本样式   "================================

// 改变label的文本的 两种以上颜色及字体
+ (void)changeTextLab:(UILabel *)myLabel
          stringArray:(NSArray *)strArray
           colorArray:(NSArray *)colorArray
            fontArray:(NSArray *)fontArray {
    
    NSMutableAttributedString *mutAttStr = [[NSMutableAttributedString alloc] initWithString:myLabel.text];
    
    NSString* _str = nil;
    UIFont*  _font = nil;
    NSRange _range = NSMakeRange(0, 0);
    
    for (int i=0; i<strArray.count; i++) {
        //NSLog(@"---> strArray.count = %ld",strArray.count);
        _str = strArray[i];
        NSUInteger location = [[mutAttStr string] rangeOfString:_str].location;
        NSUInteger length   = [[mutAttStr string] rangeOfString:_str].length;
        _range = NSMakeRange(location, length);
        // 改变颜色
        if (colorArray.count >= (i+1)) {
            [mutAttStr addAttribute:NSForegroundColorAttributeName value:colorArray[i] range:_range];
        }
        // 改变字体大小
        if (fontArray.count >= (i+1)) {
            _font = [UIFont systemFontOfSize:[fontArray[i] floatValue]];
            [mutAttStr addAttribute:NSFontAttributeName value:_font range:_range];
        }
    }
    [myLabel setAttributedText:mutAttStr];
}


// 设置行间距
+ (void)setlineSpacingText:(UILabel *)label alignment:(NSTextAlignment)alignment lineSpacing:(CGFloat)lineSpacing {
    
    NSMutableParagraphStyle* PghStyle= [[NSMutableParagraphStyle alloc] init];
    PghStyle.alignment = alignment;
    PghStyle.lineSpacing= lineSpacing;//调整行间距 12
    
    NSString* _content= label.text;
    // 字符串属性化
    NSMutableAttributedString* AtbStr= [[NSMutableAttributedString alloc] initWithString:_content];
    [AtbStr addAttribute:NSParagraphStyleAttributeName value:PghStyle range:NSMakeRange(0, [_content length])];
    // 文本属性化
    label.attributedText = AtbStr;
    
    
}


/**
 设置段落样式
 
 @param lineSpace 行间距
 @param paragraphSpace 段间距
 @param characterSpace 字间距
 @param alignment 文本排版位置
 @param headIndent 所有：行首缩进
 */
- (void)seteLineSpace:(CGFloat)lineSpace
       paragraphSpace:(CGFloat)paragraphSpace
       characterSpace:(NSNumber*)characterSpace
            alignment:(NSTextAlignment)alignment
           headIndent:(CGFloat)headIndent {
    
    NSMutableAttributedString *mutAttStr = [[NSMutableAttributedString alloc] initWithString:self.text];
    //设置段落样式
    NSMutableParagraphStyle* paraStyle= [[NSMutableParagraphStyle alloc] init];
    paraStyle.alignment         = alignment;        // 文本排版位置
    paraStyle.lineSpacing       = lineSpace;        // 行间距
    paraStyle.paragraphSpacing  = paragraphSpace;   // 段间距
    paraStyle.headIndent        = headIndent;       // 所有：行首缩进
    paraStyle.firstLineHeadIndent =headIndent;      // 段行首缩进
    
    [mutAttStr addAttribute:NSParagraphStyleAttributeName value:paraStyle range:NSMakeRange(0, self.text.length)];
    //设置 字间距
    [mutAttStr addAttribute:NSKernAttributeName value:characterSpace range:NSMakeRange(0, self.text.length)];
    // 文本属性化
    [self setAttributedText:mutAttStr];
}


/**
 *  改变label的文本的 两种以上颜色及字体、设置行距、字间距、段间距：并自行适配高度 （宽度固定）
 
 @param strArray   要改变的字符串 数组
 @param colorArray 对应颜色 数组
 @param fontArray  对应的字体 数组
 @param alignment 文本排版位置
 @param lineSpace 行间距
 @param paragraphSpace 段间距
 @param characterSpace 字间距
 @param headIndent 所有：行首缩进
 @param tailIndent 段：行尾缩进
 @param autoSize 是否自适应
 */
- (void)changeLabTextArray:(NSArray *)strArray
                colorArray:(NSArray *)colorArray
                 fontArray:(NSArray *)fontArray
                 alignment:(NSTextAlignment)alignment
                 lineSpace:(CGFloat)lineSpace
            paragraphSpace:(CGFloat)paragraphSpace
            characterSpace:(NSNumber*)characterSpace
                headIndent:(CGFloat)headIndent
                tailIndent:(CGFloat)tailIndent
                  autoSize:(BOOL)autoSize
{
    /*
     * 设置文本样式
     */
    NSMutableAttributedString *mutAttStr = [[NSMutableAttributedString alloc] initWithString:self.text];
    
    NSString* _str = nil;
    UIFont*  _font = nil;
    NSRange _range = NSMakeRange(0, 0);
    for (int i=0; i<strArray.count; i++) {
        //NSLog(@"---> strArray.count = %ld",strArray.count);
        _str = strArray[i];
        _range = [self.text rangeOfString:_str];
        // 改变颜色
        if (colorArray.count >= (i+1)) {
            [mutAttStr addAttribute:NSForegroundColorAttributeName value:colorArray[i] range:_range];
        }
        // 改变字体大小
        if (fontArray.count >= (i+1)) {
            _font = [UIFont systemFontOfSize:[fontArray[i] floatValue]];
            [mutAttStr addAttribute:NSFontAttributeName value:_font range:_range];
        }
    }
    /*
     * 设置段落样式
     */
    NSMutableParagraphStyle* paraStyle= [[NSMutableParagraphStyle alloc] init];
    paraStyle.alignment = alignment;                //文本排版位置
    paraStyle.lineSpacing= lineSpace;               //设置 行间距 12
    paraStyle.paragraphSpacing = paragraphSpace;    //设置 段间距
    [mutAttStr addAttribute:NSParagraphStyleAttributeName value:paraStyle range:NSMakeRange(0, [self.text length])];
    //设置 字间距
    [mutAttStr addAttribute:NSKernAttributeName value:characterSpace range:NSMakeRange(0, [self.text length])];
    CGFloat emptylen = self.font.pointSize*2;   //设置 段首行缩进 /参数：字体大小17号字乘以2，34.f即首行空出两个字符
    paraStyle.firstLineHeadIndent = emptylen;
    paraStyle.headIndent = headIndent;          //设置 所有：行首缩进 20.0f
    paraStyle.tailIndent = tailIndent;          //设置 行尾缩进 0.0f
    
    // 文本属性化
    [self setAttributedText:mutAttStr];
    
    //自适应
    if (autoSize) {
        //获取文本属性  按原设置字体 计算高度，如果此文本改变字体 较多，会影响计算高度
        NSDictionary *getAttributeDic = @{NSFontAttributeName: self.font,
                                          NSParagraphStyleAttributeName: paraStyle,
                                          NSKernAttributeName:characterSpace,
                                          };
        //string
        CGSize getSize = [self.text boundingRectWithSize:CGSizeMake(self.frame.size.width, MAXFLOAT)
                                                 options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                              attributes: getAttributeDic
                                                 context:nil].size;
        NSLog(@"-----> fontSize.height: %f \n ",getSize.height);
        NSLog(@"-----> fontSize.width: %f \n ",getSize.width);
        float height= getSize.height + 1;// ＋1 防止四舍五入
        self.frame = CGRectMake(self.frame.origin.x,
                                self.frame.origin.y,
                                self.frame.size.width,
                                height);
        //[self sizeThatFits:getSize];
    }
}


//提示框
- (void)hudContextInfo:(NSString *)contextInfo afterDelay:(NSTimeInterval)delay
{
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor colorWithRed:0.1f green:0.1f blue:0.1f alpha:0.80f];
    label.layer.cornerRadius = 5;
    label.clipsToBounds = YES;
    label.bounds = CGRectMake(0, 0, 150, 30);
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont boldSystemFontOfSize:17];
    label.numberOfLines = 0;
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:label];
    [window bringSubviewToFront:label];
    label.center = window.center;
    //label.text = contextInfo;
    label.textOfWidthFixed = contextInfo;
    
    [label performSelector:@selector(removeFromSuperview) withObject:nil afterDelay:delay];
}



@end
