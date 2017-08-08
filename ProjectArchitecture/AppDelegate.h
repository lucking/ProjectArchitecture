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

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    NSArray *sortArray;
}
@property (strong, nonatomic) UIWindow *window;
@property (readonly, strong) NSPersistentContainer *persistentContainer;
@property (strong, nonatomic) ZMTabBarController* tabBarVC;

+ (AppDelegate *)singleton;

- (void)gotoMainPage;

/**
 *  网络状态
 */
@property (assign , nonatomic , readonly) ReachabilityStatus  NetWorkStatus;

@end

