//
//  ZInputToolbar.h
//  test
//
//  Created by lishu tech on 17/1/11.
//  Copyright © 2017年 manyueyunma. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZInputToolbar;

@protocol ZInputToolbarDelegate <NSObject>
@optional
- (void)inputToolbar:(ZInputToolbar *)inputToolbar sendContent:(NSString *)sendContent;
@end

@interface ZInputToolbar : UIView
/**
 *  初始化chat bar
 */
- (instancetype)initWithFrame:(CGRect)frame;
/**
 *  文本输入框
 */
@property (nonatomic,strong)UITextView *textInput;
/**
 *  设置输入框最大行数
 */
@property (nonatomic,assign)NSInteger textViewMaxLine;
/**
 *  textView占位符
 */
@property (nonatomic,strong)UILabel *placeholderLabel;

@property (nonatomic,weak) id<ZInputToolbarDelegate>delegate;

@property (nonatomic, copy) void (^keyIsVisiableBlock)(BOOL keyboardIsVisiable);

// 发送成功
-(void)sendSuccessEndEditing;

@end
