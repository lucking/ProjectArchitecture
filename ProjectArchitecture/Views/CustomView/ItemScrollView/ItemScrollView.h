//
//  ItemScrollView.h
//  ProjectArchitecture
//
//  Created by ZM on 2017/3/9.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ItemClickBlock) (NSInteger itemTag);


@interface ItemScrollView : UIView
{
    
}
@property (strong, nonatomic) NSArray *titleArray;
@property (copy, nonatomic) ItemClickBlock itemClickBlock;

@property (assign, nonatomic) NSInteger itemIndex;

@end
