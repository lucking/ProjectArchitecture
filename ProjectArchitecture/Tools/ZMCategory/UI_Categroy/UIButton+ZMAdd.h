//
//  UIButton+ZMAdd.h
//  Architecture
//
//  Created by ZM on 2016/10/25.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ButtonBlock) (void);
typedef void (^IntBlock) (int);
typedef NSString* (^StrBlock) (NSString *);
typedef void (^ClickActionBlock) (id obj);

// 枚举三
typedef NS_ENUM(NSInteger,CourseStatus) {
    status1 =   101,
    status2 =   102,
    status3 =   103,
    status4 =   104,
    status5 =   105,
};

@interface UIButton (ZMAdd)

/**
 * 课程状态
 */
@property(nonatomic, assign)CourseStatus courseStatus;
/**
 *  点击按钮回调
 */
@property(nonatomic, strong)ButtonBlock BtnBlock;

- (void)addEventHandler:(ClickActionBlock)clickBlock forControlEvents:(UIControlEvents)event;

// UIButton：给一段文本，添加下划线、改变颜色
+ (void)zm_changeButton:(UIButton *)myBtn withText:(NSString *)text color:(UIColor *)myColor addUnderline:(BOOL)addline;

// 改变UIButton的文本的 两种以上颜色及字体
+ (void)zm_changeTextBtn:(UIButton *)myBtn
          stringArray:(NSArray *)strArray
           colorArray:(NSArray *)colorArray
            fontArray:(NSArray *)fontArray;



@end
