//
//  ZM_UITools.m
//  ProjectArchitecture
//
//  Created by ZM on 2018/5/30.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import "ZM_UITools.h"

@implementation ZM_UITools

- (void)zm_test {
    //CGRectZero
    UIButton *testBtn = [ZM_UITools zm_createBtnTitle:@"" titleColor:[UIColor redColor] font:[UIFont systemFontOfSize:16] bgColor:RandomColor frame:CGRectMake(100, 200, 100, 38)];
    LLayerRadiusView(testBtn,5.f);
    [testBtn addTarget:self action:@selector(testClick) forControlEvents:UIControlEventTouchUpInside];  
    [[UIView new] addSubview:testBtn];

    UIButton *back = [ZM_UITools zm_createBtnTitle:nil titleColor:nil font:nil 
                                              image:[UIImage imageNamed:@"leftArrow"]                                               
                                            bgImage:nil bgColor:nil frame:CGRectMake(10, 27, 50, 30) 
                                          addTarget:self action:@selector(backClick)];   
    [[UIView new] addSubview:back];
    
    [ZM_UITools zm_viewFrame:CGRectMake(0, 0.5, SSWIDTH, 0.5) bgColor:Gray_CCCCCC];
    
    [ZM_UITools zm_labText:@"" textColor:White_COLOR font:FFont(16) bgColor:White_COLOR frame:CGRectMake(0, 0, 50, 30)];

}
- (void)testClick {
}
- (void)backClick {
    // [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark ------------------ setter getter UI ------------------

// 添加 UIView
+ (UIView *)zm_viewFrame:(CGRect)frame bgColor:(UIColor *)bgColor {
    UIView *_lineView = [[UIView alloc] initWithFrame:frame];
    if (bgColor){_lineView.backgroundColor = bgColor;}
    return _lineView;
}

// 添加 UIImageView
+ (UIImageView *)zm_imgViewFrame:(CGRect)frame bgColor:(UIColor *)bgColor img:(UIImage *)img {
    UIImageView *_imgView = [[UIImageView alloc] initWithFrame:frame];
    _imgView.backgroundColor = bgColor;
    if (bgColor){_imgView.backgroundColor = bgColor;}
    if (img)    {_imgView.image = img;}
    return _imgView;
}



// 添加 UILabel
+ (UILabel *)zm_labText:(NSString * _Nullable)text 
              textColor:(UIColor * _Nullable)textColor
                   font:(UIFont * _Nonnull)font  
                bgColor:(UIColor *_Nullable)bgColor frame:(CGRect)frame {
    
    UILabel *_label = [[UILabel alloc] initWithFrame:(CGRect)frame];
    _label.font = font;
    _label.text = text;
    if (textColor) {_label.textColor = textColor;}
    if (bgColor)   {_label.backgroundColor = bgColor;}
    return _label;
}

// 添加 UITextField
+ (UITextField *)zm_getTextFieldPlaceHolder:(NSString *_Nullable)placeHolder
                                       font:(UIFont *_Nonnull)font  
                                  textColor:(UIColor *_Nullable)textColor
                                 tfViewMode:(UITextFieldViewMode)tfViewMode
                                      frame:(CGRect)frame {
    
    UITextField *textField = [[UITextField alloc] initWithFrame:frame];
    textField.font = font;
    textField.textColor = Gray_444444;
    textField.clearButtonMode = tfViewMode; 
    if (textColor)      {textField.textColor = textColor;}
    if (placeHolder)    {textField.placeholder = placeHolder;;}
    return textField;
}




// 添加按钮 UIButton
+ (UIButton *)zm_createBtnTitle:(nullable NSString *)title 
                     titleColor:(UIColor *_Nullable)titleColor
                           font:(UIFont *_Nullable)font  
                        bgColor:(UIColor *_Nullable)bgColor frame:(CGRect)frame {
    
    UIButton *_addBtn = [[UIButton alloc] initWithFrame:frame];
    [_addBtn setTitle:title forState:UIControlStateNormal];
    [_addBtn setTitleColor:titleColor forState:UIControlStateNormal];
    if (font)       {[_addBtn.titleLabel setFont:font];}
    if (titleColor) {[_addBtn setTitleColor:titleColor forState:UIControlStateNormal];}
    if (bgColor)    {[_addBtn setBackgroundColor:bgColor];}
    return _addBtn;
}
// UIButton
+ (UIButton *)zm_createBtnTitle:(nullable NSString *)title 
                     titleColor:(UIColor *_Nullable)titleColor
                           font:(UIFont * _Nullable)font  
                          image:(UIImage * _Nullable)image 
                        bgImage:(UIImage * _Nullable)bgImage 
                        bgColor:(UIColor *_Nullable)bgColor frame:(CGRect)frame 
                      addTarget:(nullable id)target action:(SEL)action  {
    
    UIButton *_addBtn = [[UIButton alloc] initWithFrame:frame];
    [_addBtn setTitle:title forState:UIControlStateNormal];
    [_addBtn setTitleColor:titleColor forState:UIControlStateNormal];
    [_addBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    if (image)      {[_addBtn setImage:image forState:UIControlStateNormal];}
    if (bgImage)    {[_addBtn setBackgroundImage:bgImage forState:UIControlStateNormal];}
    if (font)       {[_addBtn.titleLabel setFont:font];}
    if (titleColor) {[_addBtn setTitleColor:titleColor forState:UIControlStateNormal];}
    if (bgColor)    {[_addBtn setBackgroundColor:bgColor];} 
    return _addBtn;
}



/** 表的配置 UITableView
 @param tableView 表
 @param separatorColor 分割线颜色
 @param separatorStyle 分割线类型
 @param headerViewHide 头部多余的分割线
 @param footerViewHide 底部多余的分割线
 @param estimated 是否预估高度
 */
+ (void)setTableView:(UITableView *)tableView bgColor:(UIColor *)bgColor 
      separatorStyle:(ZMCellSeparatorStyle)separatorStyle 
      separatorColor:(UIColor *)separatorColor
     headerViewHide:(BOOL)headerViewHide 
      footerViewHide:(BOOL)footerViewHide 
           estimated:(BOOL)estimated {
    
    tableView.backgroundColor = bgColor;   
    if (estimated) {
        if (@available(iOS 11.0, *)) {
            tableView.estimatedRowHeight = 0;
            tableView.estimatedSectionHeaderHeight = 0;
            tableView.estimatedSectionFooterHeight = 0;
        }
    }
    if (separatorStyle == ZMCellSeparatorNone) {
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    }else if (separatorStyle == ZMCellSeparatorSingleLine) {
        tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        
    }else if (separatorStyle == ZMCellSeparatorSingleLine) {
        tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLineEtched;
        
    }else if (separatorStyle == ZMCellSeparatorAll) { 
        // 分割线 自左向右 全部显示
        tableView.separatorInset = UIEdgeInsetsZero;
        tableView.layoutMargins  = UIEdgeInsetsZero;
    }else{
        // ZMCellSeparatorNormal
    }        
    if (separatorColor!=nil) {
        [tableView setSeparatorColor:separatorColor];
    }
    //清除UITableView多余的分割线
    UIView *View= [UIView new];
    if (headerViewHide) {[tableView setTableHeaderView:View];}
    if (footerViewHide) {[tableView setTableFooterView:View];}
}


//UIAlertView
+ (void)zm_AlertViewTitle:(nullable NSString *)title 
                  message:(nullable NSString *)message 
                 delegate:(nullable id )delegate 
           cancelBtnTitle:(nullable NSString *)cancelBtnTitle 
           otherBtnTitles:(nullable NSString *)otherBtnTitle
                      tag:(NSInteger)tag
{
    UIAlertView * aletrtVIew =[[UIAlertView alloc]initWithTitle:title message:message delegate:delegate cancelButtonTitle:cancelBtnTitle otherButtonTitles:otherBtnTitle, nil];
    aletrtVIew.tag = tag;
    [aletrtVIew show];
}



@end
