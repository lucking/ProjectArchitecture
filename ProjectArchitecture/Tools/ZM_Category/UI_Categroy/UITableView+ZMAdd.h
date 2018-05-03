//
//  UITableView+ZMAdd.h
//  ProjectArchitecture
//
//  Created by ZM on 2017/4/27.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NSInteger (^sectionBlock)(UITableView *tableView,NSInteger section);
typedef UITableViewCell * (^tableViewCellBlock)(UITableView *tableView,NSIndexPath * indexPath);
typedef CGFloat (^heightForRowBlock)(UITableView *tableView,NSIndexPath * indexPath);
typedef void (^DidSelectRowBlock)(UITableView *tableView,NSIndexPath * indexPath);


@interface UITableView (ZMAdd)<UITableViewDataSource,UITableViewDelegate>
{
    
}
//设置每行显示多少个
-(void)SetUpSectionBlock:(sectionBlock)block;

//行高
-(void)SetUpHeightForRowBlock:(heightForRowBlock)block;

//设置Cell
-(void)SetUpTableViewCellBlock:(tableViewCellBlock)block;

//点击事件
-(void)SetUpTableViewDidSelectRowBlock:(DidSelectRowBlock)block;

@end
