//
//  GuideCollectionCell.m
//  ZMGuidepage
//
//  Created by ZM on 15/11/6.
//  Copyright © 2015年 ZM. All rights reserved.
//

#import "GuideCollectionCell.h"

@implementation GuideCollectionCell


- (UIImageView *)imageView
{
    if (_imageView == nil) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self addSubview:imageView];
        _imageView = imageView;
    }
    return _imageView;
}
- (void)setImageName:(NSString *)imageName
{
    _imageName = imageName;
    
    NSString *path=[[NSBundle mainBundle]pathForResource:_imageName ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    self.imageView.image = image;
}
+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath
{
    // 注册UICollectionViewCell
    if (_collectionView == nil) {
        _collectionView = collectionView;
        [collectionView registerClass:[GuideCollectionCell class] forCellWithReuseIdentifier:reuseIdentifier];
    }
//	[collectionView registerClass:[GuideCollectionCell class] forCellWithReuseIdentifier:reuseIdentifier];
	return [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
}

- (void)setIndexPath:(NSIndexPath *)indexPath pagecount:(NSInteger)pagecount
{
    if (indexPath.row == pagecount - 1) { // 最后一页
        // 添加开始
        [self startBtn];
    }
}
- (UIButton *)startBtn
{
	if (_startBtn == nil) {
		UIButton *startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
		startBtn.frame=CGRectMake(0, 0, 200, 100);
		startBtn.center = CGPointMake(self.frame.size.width* 0.5, self.frame.size.height * 0.85);
		[startBtn setTitle:@"GO" forState:UIControlStateNormal];
		[startBtn addTarget:self action:@selector(startBtnClick) forControlEvents:UIControlEventTouchUpInside];
		[self addSubview:startBtn];

		_startBtn = startBtn;
	}
	return _startBtn;
}
- (void)startBtnClick
{
    // 进入首页
	[[AppDelegate singleton] gotoMainPage];
}


@end
