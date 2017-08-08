//
//  CollectDealView.h
//  ProjectArchitecture
//
//  Created by ZM on 2017/5/10.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CollectDealView;
//
typedef NS_ENUM(NSInteger,ActionType) {
    SelectAction = 111, //全选 按钮响应
    DeleteAction = 222, //删除 按钮响应
};

typedef void(^CollectSelectBlock) (CollectDealView *dealView, ActionType actionType);


@interface CollectDealView : UIView
{
    
}
@property (nonatomic, copy) NSString *selectText;
@property (nonatomic, copy) NSString *deleteText;
@property (nonatomic, assign) BOOL allSelect;
@property (nonatomic, copy) CollectSelectBlock collectSelectBlock;
@property (nonatomic, assign) NSInteger allNum;
@property (nonatomic, assign) NSInteger selectNum;
@end
