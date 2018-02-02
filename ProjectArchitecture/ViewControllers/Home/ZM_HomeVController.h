//
//  HomeViewController.h
//  ZMArchitecture
//
//  Created by ZM on 16/1/6.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "ZMBaseViewController.h"

typedef enum {
	HomeBtnTagAA       = 101,
	HomeBtnTagBB       = 102,
	HomeBtnTagCC       = 103,
	HomeBtnTagDD       = 104,
	HomeBtnTagEE       = 105,
	HomeBtnTagFF       = 106,
	HomeBtnTagGG       = 107,
	HomeBtnTagHH       = 108,

}HomeButtonTag;

typedef NS_ENUM(NSInteger, MyUITableViewStyle) {
	MyUITableViewStylePlain,          // regular table view
	MyUITableViewStyleGrouped         // preferences style table view
};


@interface ZM_HomeVController : ZMBaseViewController
{
	NSArray *titleArrayAA;

	UIScrollView* sscrollView;
	float HHeight;
}

@end
