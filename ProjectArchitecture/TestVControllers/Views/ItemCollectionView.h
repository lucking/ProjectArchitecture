//
//  ItemCollectionView.h
//  ProjectArchitecture
//
//  Created by ZM on 2017/5/10.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SelectDayBlock)(UICollectionView *collectionView, NSIndexPath *indexPath, NSString* dateString);

@interface ItemCollectionView : UIView
{
    
}
@property (nonatomic, strong) NSArray *titleArray;
//@property (nonatomic, strong) NSString *month;
//@property (nonatomic, strong) NSString *day;
//@property (nonatomic, assign) BOOL readType;
@property (nonatomic, copy) SelectDayBlock selectDayBlock;

- (void)setTitleArr:(NSArray *)titleArr showIndex:(int)showIndex;


/**
 加载数组

 @param titleArray 标题数组
 @param showIndex 当前显示的数
 */
- (void)reloadTitleArray:(NSArray *)titleArray showIndex:(int)showIndex;



@end
