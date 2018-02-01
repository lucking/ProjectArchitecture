//
//  ViewStandard.h
//  ZMArchitecture
//
//  Created by ZM on 16/2/17.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>


//一:声明协议
@protocol ViewStandardDelegate;
@protocol ViewStandardDataSource;


@interface ViewStandard : UIView
{
	float myWidth;
	float myHeight;
}
@property (nonatomic, weak) UILabel* titleLab;
@property (nonatomic, weak) UIView* view;

/**
 *  什么情况使用 weak 关键字？
 1）在ARC中,在有可能出现循环引用的时候,往往要通过让其中一端使用weak来解决,比如:delegate代理属性
 */
@property (nonatomic,weak) id <ViewStandardDelegate> delegate;		//二:设置代理
@property (nonatomic,weak) id <ViewStandardDataSource> DataSource;	//二:设置数据源
@end



//三:协议代理方法
#pragma mark ------------"  Delegate、DataSource  "------------
@protocol ViewStandardDelegate <NSObject>
- (void)viewStandard:(UIView *)view;
@end


@protocol ViewStandardDataSource <NSObject>
@required//1.需求方法
@optional//2.可选方法
@end

