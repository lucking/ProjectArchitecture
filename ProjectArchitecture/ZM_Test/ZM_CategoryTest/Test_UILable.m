//
//  Test_UILable.m
//  ProjectArchitecture
//
//  Created by ZM on 2018/7/3.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import "Test_UILable.h"
#import "UILabel+ZMAdd.h"

@implementation Test_UILable

- (void)test_UILable {
    
    // NSParagraphStyle  段落样式
    // typedef NS_ENUM(NSInteger, NSLineBreakMode) {     //对于长内容或多行内容的处理方式
    //  NSLineBreakByWordWrapping = 0,/* Wrap at word boundaries, default */ //按包含单词为界限截断
    //  NSLineBreakByCharWrapping,    /* Wrap at character boundaries */     //按字符为界限截断
    //  NSLineBreakByClipping,        /* Simply clip */   //简单的修剪
    //  NSLineBreakByTruncatingHead,  /* : "...wxyz" */   //截断头部
    //  NSLineBreakByTruncatingTail,  /* : "abcd..." */   //截断尾巴
    //  NSLineBreakByTruncatingMiddle /* : "ab...yz" */   //截断中间
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
    
    NSArray *colorArray = @[[UIColor greenColor],[UIColor blueColor],[UIColor orangeColor]];
    [UILabel zm_changeTextLab:label
               stringArray:@[@"Hello",@"Boy",@"money"]
                colorArray:colorArray
                 fontArray:@[@"18",@"20"]];
    
    
    //测试
    NSString *str = @"    上海XX信息科技有限公司（股票代码xxxxxx，简称“XX信息”）是得到了国家信息产业部、上海市各级政府认可的高新技术企业，专业为国际国内各类银行、互联网金融企业等金融机构以及智慧社区、医疗机构等提供行业一流软件产品和系统集成服务。\n    XX信息2009年成立，总部位于中国上海“张江高科技园区”，是上海市科技小巨人培育企业、上海市高新技术企业，拥有数十项软件著作权。在北京、福州、广州、合肥等地设有分公司，技术服务站点遍及全国各大城市。\n    XX信息的发展始终放眼于全球范围内信息化、智能化发展的前沿进程，紧随全球“工业4.0”的步伐，XX信息也投入了大量的研发力量，使产品及服务始终保持行业领先水平。";
    label.text = str;
    NSArray *Texts = @[@"上海XX信息科技有限公司",@"xxxxxx"];
    NSArray *colors= @[[UIColor darkTextColor],Blue_2599FA];
    NSArray *fonts = @[[UIFont boldSystemFontOfSize:16],
                       [UIFont systemFontOfSize:14]];
    [label zm_changeLabTexts:Texts
                   colors:colors
                    fonts:fonts
                alignment:NSTextAlignmentLeft
                lineSpace:4.4f
           paragraphSpace:30.f
           characterSpace:@2.0f
               headIndent:0.0f tailIndent:0.0f autoSize:NO];
    
    UILabel *_myLab1;
    // 设置段落样式
    [_myLab1 zm_setLineSpace:0 paragraphSpace:0 characterSpace:[NSNumber numberWithFloat:5] 
                alignment:NSTextAlignmentCenter headIndent:5];
    
    [_myLab1 zm_setLineSpace:4.4f paragraphSpace:2.f characterSpace:@0.6f 
                alignment:NSTextAlignmentLeft headIndent:0.0f];
}


@end
