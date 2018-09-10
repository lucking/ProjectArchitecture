//
//  ZMPageVController.h
//  ZM_UIPageViewController
//
//  Created by ZM on 2017/12/27.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "ZMBaseViewController.h"
//#import "ZM_QuotedPriceVC.h"

@interface ZMPageVController : ZMBaseViewController

@property (nonatomic, copy) NSString *pageId;
@property (nonatomic, strong) UIViewController *superVC;
//@property (nonatomic, strong) ZM_QuotedPriceVC *fatherQuotedVC;

@end
