//
//  GuideCollectionCell.h
//  ZMGuidepage
//
//  Created by ZM on 15/11/6.
//  Copyright © 2015年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

static NSString * const reuseIdentifier = @"Cell";
static UICollectionView *_collectionView = nil;

@interface GuideCollectionCell : UICollectionViewCell
{
    
}
@property (nonatomic, copy) NSString *imageName;
@property (nonatomic, weak) UIImageView *imageView;
@property (nonatomic, weak) UIButton *startBtn;

+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath;
- (void)setIndexPath:(NSIndexPath *)indexPath pagecount:(NSInteger)pagecount;


@end
