//
//  NSObject+ZMAddMJRefresh.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/5/8.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "NSObject+ZMAddMJRefresh.h"
#import "MJRefresh.h"

@implementation NSObject (ZMAddMJRefresh)

- (void)test {
    
    UICollectionView *_ccollectView;
    _ccollectView.mj_header.hidden = NO;
    _ccollectView.mj_footer.hidden = NO;
    // 默认先隐藏footer
    _ccollectView.mj_footer.hidden = YES;
    
    
    UITableView *_ttableView;
    // 立即刷新：默认请求
    [_ttableView.mj_header beginRefreshing];
    
}


#pragma mark ======================"  setter getter  "==============================

/**
 结束刷新：UIScrollView
 @param scrollView 结束刷新的视图
 @param isHeader 是否是头部：下拉刷新
 */
- (void)endRefreshScrollView:(UIScrollView *)scrollView isHeader:(BOOL)isHeader {
    
    if (isHeader) {
        [scrollView.mj_header endRefreshing];
    }else{
        [scrollView.mj_footer endRefreshing];
        if (!scrollView.mj_footer.isRefreshing) {
            scrollView.mj_footer.alpha = 0.;
        }else{
            scrollView.mj_footer.alpha = 1.0;
        }
    }
}

/**
 结束刷新：UITableView
 @param tableView 结束刷新的视图
 @param isHeader 是否是头部：下拉刷新
 */
- (void)endRefreshTableView:(UITableView *)tableView isHeader:(BOOL)isHeader {
    
    if (isHeader) {
        [tableView.mj_header endRefreshing];
    }else{
        [tableView.mj_footer endRefreshing];
        if (!tableView.mj_footer.isRefreshing) {
            tableView.mj_footer.alpha = 0.;
        }else{
            tableView.mj_footer.alpha = 1.0;
        }
    }
}

/**
 结束刷新：UICollectionView
 @param collectionView 结束刷新的视图
 @param isHeader 是否是头部：下拉刷新
 */
- (void)endRefreshCollectionView:(UICollectionView *)collectionView isHeader:(BOOL)isHeader {
    
    if (isHeader) {
        [collectionView.mj_header endRefreshing];
    }else{
        [collectionView.mj_footer endRefreshing];
        if (!collectionView.mj_footer.isRefreshing) {
            collectionView.mj_footer.alpha = 0.;
        }else{
            collectionView.mj_footer.alpha = 1.0;
        }
    }
}



@end
