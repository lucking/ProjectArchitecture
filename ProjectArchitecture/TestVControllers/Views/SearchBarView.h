//
//  SearchBarView.h
//  ProjectArchitecture
//
//  Created by ZM on 2017/3/8.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>


@class SearchBarView;
typedef void(^SearchBarViewBlock) (UISearchBar *searchBar, NSString *didChangetext ,NSString *responseType);


@interface SearchBarView : UIView
{
    
}
@property (strong, nonatomic) UISearchBar *mySearchBar;

//代理响应回调
@property (strong, nonatomic) SearchBarViewBlock searchBarBlock;


@end

