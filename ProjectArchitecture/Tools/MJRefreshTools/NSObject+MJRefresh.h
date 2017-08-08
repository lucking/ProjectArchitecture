//
//  NSObject+MJRefresh.h
//  ProjectArchitecture
//
//  Created by ZM on 2017/5/8.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (MJRefresh)

/**
 结束刷新：UITableView
 @param tableView 结束刷新的视图
 @param isHeader 是否是头部：下拉刷新
 */
- (void)endRefreshTableView:(UITableView *)tableView isHeader:(BOOL)isHeader;

/**
 结束刷新：UICollectionView
 @param collectionView 结束刷新的视图
 @param isHeader 是否是头部：下拉刷新
 */
- (void)endRefreshCollectionView:(UICollectionView *)collectionView isHeader:(BOOL)isHeader;

@end
