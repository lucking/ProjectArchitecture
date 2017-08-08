//
//  ItemCell.h
//  ProjectArchitecture
//
//  Created by ZM on 2017/5/10.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemCell : UICollectionViewCell
{
    
}
@property (nonatomic, assign) CGFloat Width;
@property (nonatomic, assign) CGFloat Height;
//@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIView* line;
@end
