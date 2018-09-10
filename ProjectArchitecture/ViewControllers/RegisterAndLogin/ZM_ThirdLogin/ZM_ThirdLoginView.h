//
//  ZM_ThirdLoginView.h
//  ProjectArchitecture
//
//  Created by ZM on 2018/7/31.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZM_ThirdLogin.h"

//代理
@class ZM_ThirdLoginView;
@protocol ZM_ThirdLoginViewDelegate<NSObject>
@optional
//选择Item项
- (void)myView:(ZM_ThirdLoginView *)myView didSelectAtIndex:(NSInteger)index;
@end


@interface ZM_ThirdLoginView : UIView

@property (nonatomic, weak) id <ZM_ThirdLoginViewDelegate> delegate;
@property (nonatomic,copy) NSString *title;

- (void)zm_ThirdLoginViewDataArray:(NSArray *)dataArray;

@end


