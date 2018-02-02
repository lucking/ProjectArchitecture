//
//  AppDelegate.h
//  ProjectArchitecture
//
//  Created by ZM on 2017/1/22.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "ZMTabBarController.h"
#import "ZMNavController.h"
#import <RealReachability.h>

// cell的 重用标识、高度
static NSString *Test_CellId = @"Cell_Id";
static CGFloat Test_rowHeight = 200;

//锁屏 状态
typedef NS_ENUM(NSUInteger, LockStates) {
    LockStatesLockScreen   =0,     // 锁屏
    LockStatesOpenScreen   =1,     // 开屏
};

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    NSArray *sortArray;
}
@property (strong, nonatomic) UIWindow *window;
@property (readonly, strong) NSPersistentContainer *persistentContainer;
@property (strong, nonatomic) ZMTabBarController* tabBarVC;
// 是否允许屏幕旋转
@property (nonatomic,assign) BOOL allowRotation;
@property (nonatomic,assign) BOOL isStartLaunch;
@property (nonatomic, assign) LockStates lockStates;

+ (AppDelegate *)shareInstance;

- (void)gotoMainPage;

/**
 *  网络状态
 */
@property (assign , nonatomic , readonly) ReachabilityStatus  NetWorkStatus;
@end

/* 我的 Github
 https://github.com/lucking/ProjectArchitecture
*/
