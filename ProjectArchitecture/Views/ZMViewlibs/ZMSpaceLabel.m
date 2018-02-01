//
//  ZMSpaceLabel.m
//  TestApp
//
//  Created by ZM on 16/4/7.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "ZMSpaceLabel.h"
#import<CoreText/CoreText.h>

@interface ZMSpaceLabel()
{
 //@private
	NSMutableAttributedString *attributedString;
}
- (void) initAttributedString;
@end


@implementation ZMSpaceLabel

- (id)initWithFrame:(CGRect)frame
{
	//初始化字间距、行间距
	self = [super initWithFrame:frame];
	if (self) {
//		self.characterSpacing = 0.0f;
//		self.linesSpacing	= 0.0f;
//		self.paragraphSpace = 0.0f;
        
//        self.characterSpace = 10.0f;
//        self.linesSpace = 4.4f;
//        self.paragraphSpace = 15.f;

	}
	return self;
}

//外部调用设置字间距
-(void)setCharacterSpacing:(long)characterSpace
{
	_characterSpace = characterSpace;
	[self setNeedsDisplay];
}

//外部调用设置行间距
-(void)setLinesSpacing:(CGFloat)linesSpace
{
	NSLog(@"---> linesSpacing = %f \n ", linesSpace);
	_linesSpace = linesSpace;
	[self setNeedsDisplay];
}

/*
 *	覆写setText方法
 */
- (void) setText:(NSString *)text
{
	[super setText:text];

//	[self initAttributedString];
}

/*
 *初始化AttributedString并进行相应设置
 */
- (void) initAttributedString
{
	if(attributedString==nil){
		//去掉空行
		NSString *labelString = self.text;
		NSString *myString = [labelString stringByReplacingOccurrencesOfString:@"\r\n" withString:@"\n"];

		//创建AttributeString
		attributedString =[[NSMutableAttributedString alloc]initWithString:myString];

		//设置字体及大小
		CTFontRef helveticaBold = CTFontCreateWithName((CFStringRef)self.font.fontName, self.font.pointSize, NULL);
		[attributedString addAttribute:(id)kCTFontAttributeName
								 value:(__bridge id)helveticaBold
								 range:NSMakeRange(0,[attributedString length])];

		//设置字体颜色
		[attributedString addAttribute:(id)kCTForegroundColorAttributeName
								 value:(id)(self.textColor.CGColor)
								 range:NSMakeRange(0,[attributedString length])];

		//1.设置 字间距
		long number = self.characterSpace;
		CFNumberRef num = CFNumberCreate(kCFAllocatorDefault,kCFNumberSInt8Type,&number);
		[attributedString addAttribute:(id)kCTKernAttributeName
								 value:(__bridge id)num
								 range:NSMakeRange(0,[attributedString length])];
		CFRelease(num);


		//2.设置 行间距
		CGFloat lineSpace = self.linesSpace; // 4.0f
		CTParagraphStyleSetting lineSpaceStyle;
		lineSpaceStyle.spec = kCTParagraphStyleSpecifierLineSpacingAdjustment;
		lineSpaceStyle.valueSize = sizeof(lineSpace);
		lineSpaceStyle.value =&lineSpace;


		//3.设置 段间距
		CGFloat paragraphSpacing = self.paragraphSpace; // 15.0f
		CTParagraphStyleSetting paragraphSpaceStyle;
		paragraphSpaceStyle.spec = kCTParagraphStyleSpecifierParagraphSpacing;
		paragraphSpaceStyle.valueSize = sizeof(CGFloat);
		paragraphSpaceStyle.value = &paragraphSpacing;


		//创建文本对齐方式
		CTTextAlignment alignment = kCTTextAlignmentLeft;
		if(self.textAlignment == NSTextAlignmentCenter)
		{
			alignment = kCTTextAlignmentCenter;
		}
		if(self.textAlignment == NSTextAlignmentRight)
		{
			alignment = kCTTextAlignmentRight;
		}
		CTParagraphStyleSetting alignmentStyle;
		alignmentStyle.spec = kCTParagraphStyleSpecifierAlignment;
		alignmentStyle.valueSize = sizeof(alignment);
		alignmentStyle.value = &alignment;


		//创建设置数组
		CTParagraphStyleSetting settings[ ] = { alignmentStyle,
                                                lineSpaceStyle,
                                                paragraphSpaceStyle};
		CTParagraphStyleRef style = CTParagraphStyleCreate(settings ,3);

		//给文本添加设置
		[attributedString addAttribute:(id)kCTParagraphStyleAttributeName value:(__bridge id)style range:NSMakeRange(0 , [attributedString length])];
		CFRelease(helveticaBold);
	}
}


/*
 *开始绘制
 */
-(void) drawTextInRect:(CGRect)requestedRect
{
	// NSLog(@"-----> drawTextInRect \n \n ");

	[self initAttributedString];

	//排版
	CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attributedString);

	CGMutablePathRef leftColumnPath = CGPathCreateMutable();

	CGPathAddRect(leftColumnPath, NULL ,CGRectMake(0 , 0 ,self.bounds.size.width , self.bounds.size.height));

	CTFrameRef leftFrame = CTFramesetterCreateFrame(framesetter,CFRangeMake(0, 0), leftColumnPath , NULL);

	//翻转坐标系统（文本原来是倒的要翻转下）

	CGContextRef context = UIGraphicsGetCurrentContext();

	CGContextSetTextMatrix(context , CGAffineTransformIdentity);

	CGContextTranslateCTM(context , 0 ,self.bounds.size.height);

	CGContextScaleCTM(context, 1.0 ,-1.0);

	//画出文本
	CTFrameDraw(leftFrame,context);

	//释放
	CGPathRelease(leftColumnPath);
	CFRelease(framesetter);

	UIGraphicsPushContext(context);
}

/*
 * 绘制前获取label高度
 */
- (CGFloat)getAttributedStringHeightWidthValue:(CGFloat)width
{
	// NSLog(@"---> getHeight_linesSpace = %f", self.linesSpacing);

	[self initAttributedString];

	int total_height = 0;

	//string 是要计算高度的NSAttributedString
	CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attributedString);

	CGRect drawingRect = CGRectMake(0, 0, width, 100000);  //这里的高要设置足够大
	CGMutablePathRef path = CGPathCreateMutable();
	CGPathAddRect(path, NULL, drawingRect);
	CTFrameRef textFrame = CTFramesetterCreateFrame(framesetter,CFRangeMake(0,0), path, NULL);
	CGPathRelease(path);
	CFRelease(framesetter);

	NSArray *linesArray = (NSArray *) CTFrameGetLines(textFrame);

	CGPoint origins[[linesArray count]];
	CTFrameGetLineOrigins(textFrame, CFRangeMake(0, 0), origins);

	int line_y = (int) origins[[linesArray count] -1].y;  //最后一行line的原点y坐标
	CGFloat ascent;
	CGFloat descent;
	CGFloat leading;

	CTLineRef line = (__bridge CTLineRef) [linesArray objectAtIndex:[linesArray count]-1];
	CTLineGetTypographicBounds(line, &ascent, &descent, &leading);

	total_height = 100000 - line_y + (int) descent +1;//+1为了纠正descent转换成int小数点后舍去的值

	CFRelease(textFrame);

	return (CGFloat)total_height;

}


@end
