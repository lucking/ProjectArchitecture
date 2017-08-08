//
//  TransferViewController.h
//  ZMArchitecture
//
//  Created by ZM on 16/1/6.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "BBaseViewController.h"
#import "ZMTitleLable.h"

#import "ProductVCAA.h"
#import "ProductVCBB.h"
#import "ProductVCCC.h"
#import "NewsTableVC.h"



#pragma mark  -----------------------"    "---------------------------------

//#define TopHeight 60
#define TopHeight 0
#define smallWidth  SSWIDTH
// 头部标题栏高度
#define  TitleHeight	40
// 主屏高度
#define  VCHeight	(SSHEIGHT - TopHeight - TitleHeight)


@interface TransferViewController : BBaseViewController< UIScrollViewDelegate >
{
    
}
@property (strong, nonatomic) UIView *topView;
@property (strong, nonatomic) UIScrollView *smallScrollView;
@property (strong, nonatomic) UIScrollView *bigScrollView;

@property (strong, nonatomic) NSArray *titleArray;

@end
