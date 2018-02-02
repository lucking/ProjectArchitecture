//
//  BaseTableView.h
//  ZMArchitecture
//
//  Created by ZM on 16/3/1.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>

//宽度
#define  selfWIDTH   self.frame.size.width
//高度
#define  selfHEIGHT  self.frame.size.height
//一:声明协议
@protocol UITableViewBGDelegate;
//@protocol BaseTableViewDataSource;


@interface ZMBaseTableView : UITableView
{

}
@property (nonatomic,retain) UIView      *BgView;
@property (nonatomic,retain) UIButton    *bgWifiBtn;
@property (nonatomic,retain) UIImageView *bgImageV;

@property(nonatomic,weak) id<UITableViewBGDelegate> Bgdelegate;

@end


//============================="  代理协议  "==============================
@class UITableView;

@protocol UITableViewBGDelegate <NSObject>

@optional
- (void)backgroundView:(UITableView *)bgView wifiBtnClick:(UIButton *)Btn;
@end


//#pragma mark ---" DataSource "---
//@protocol BaseTableViewDataSource <NSObject>
//
//@required//1.需求方法
//@optional//2.可选方法
//@end
