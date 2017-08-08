//
//  ZMBaseViewController.h
//  ProjectArchitecture
//
//  Created by ZM on 2017/5/25.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZMViewModel;


@interface ZMBaseViewController : UIViewController
{
    
}
/**
 *  viewModel
 */
@property (strong, nonatomic, readonly) ZMViewModel *viewModel;
/**
 *  NavBar
 */
@property (strong, nonatomic) UINavigationBar *navBar;

- (instancetype)initWithViewModel:(ZMViewModel *)viewModel;
- (void)bindViewModel;




@end
