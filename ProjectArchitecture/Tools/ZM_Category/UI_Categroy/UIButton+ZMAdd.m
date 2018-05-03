//
//  UIButton+ZMAdd.m
//  Architecture
//
//  Created by ZM on 2016/10/25.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "UIButton+ZMAdd.h"
#import "objc/runtime.h"

@implementation UIButton (ZMAdd)
@dynamic BtnBlock;
@dynamic courseStatus;


- (void)testBtn {
    
    UIButton *_testBtn1 = [[UIButton alloc]initWithFrame:CGRectMake(30, 100, 10, 10)];
    [_testBtn1 setBackgroundColor:[UIColor orangeColor]];
    [_testBtn1 addTarget:self action:@selector(testClick:) forControlEvents:UIControlEventTouchUpInside];
    _testBtn1.tag = 111;
    [_testBtn1 hitTest:_testBtn1.center withEvent:nil]; // 响应使用
    
    _testBtn1.courseStatus = status5;
    
}
- (void)testClick:(UIButton *)Btn {
    NSLog(@"---> 测试_响应区域能否变大 = %ld",Btn.tag);
}


// NSInteger -> courseStatus
// 课程状态
static char *StatusKey = "StatusKey";
- (void)setCourseStatus:(CourseStatus)courseStatus {
    
    objc_setAssociatedObject(self, &StatusKey, @(courseStatus), OBJC_ASSOCIATION_ASSIGN);
}
-(CourseStatus)courseStatus{
    return [objc_getAssociatedObject(self, &StatusKey) intValue];
}





// 扩大点击响应的有效范围_系统方法
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    CGRect bounds = [self bounds];
    float responderSize = 44;
    if(bounds.size.width < responderSize && bounds.size.height < responderSize){
        CGFloat widthDelta = responderSize - bounds.size.width;
        CGFloat heightDelta = responderSize - bounds.size.height;
        // 扩大的有效范围是44 x 44 pt
        bounds = CGRectInset(bounds, -0.5 * widthDelta, -0.5 * heightDelta);
    }
    return CGRectContainsPoint(bounds, point);
}


// UIButton：给一段文本，添加下划线、改变颜色
+ (void)changeButton:(UIButton *)myBtn withText:(NSString *)text color:(UIColor *)myColor addUnderline:(BOOL)addline
{
    NSMutableAttributedString *contentStr = [[NSMutableAttributedString alloc] initWithString:myBtn.titleLabel.text];
    NSRange textRang = [[contentStr string] rangeOfString:text];
    NSRange Range = NSMakeRange(textRang.location, textRang.length);
    
    if (addline) {
        //添加下划线
        [contentStr addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:Range];
    }
    //改变颜色
    if (myColor != nil) {
        [contentStr addAttribute:NSForegroundColorAttributeName value:myColor range:Range];
    }
    [myBtn setAttributedTitle:contentStr forState:UIControlStateNormal];
}



#pragma mark 改变UIButton的文本的 两种以上颜色及字体
+ (void)changeTextBtn:(UIButton *)myBtn
          stringArray:(NSArray *)strArray
           colorArray:(NSArray *)colorArray
            fontArray:(NSArray *)fontArray {
    
    NSMutableAttributedString *mutAttStr = [[NSMutableAttributedString alloc] initWithString:myBtn.titleLabel.text];
    
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
    [myBtn setAttributedTitle:mutAttStr forState:UIControlStateNormal];
}


//- (void)setX:(CGFloat)x
//{
//    CGRect frame = self.frame;
//    frame.origin.x = x;
//    self.frame = frame;
//}
//- (CGFloat)x{
//    return self.frame.origin.x;
//}
//-(void)setImage:(UIImage *)image forState:(UIControlState)state {
//
//}
//-(void)setBackgroundImage:(UIImage *)image forState:(UIControlState)state {
//
//}
//- (void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents {
//
//	// self.BtnBlock();
//
//}
//-(void)setTitleEdgeInsets:(UIEdgeInsets)titleEdgeInsets{
//
//}


@end
