//
//  ItemScrollView.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/3/9.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "ItemScrollView.h"
#import "Itemlable.h"

@interface ItemScrollView()<UIScrollViewDelegate>
{
    float myWidth, myHeight;
}
@property (strong, nonatomic) UIScrollView *smallScrollView;
@end



@implementation ItemScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        myWidth=	self.frame.size.width;
        myHeight=	self.frame.size.height;
    
        NSLog(@"myWidth= %f",myWidth);
        NSLog(@"myHeight= %f",myHeight);

    }
    return self;
}

- (void)setTitleArray:(NSArray *)titleArray {
    _titleArray = titleArray;
    NSLog(@"titleArray= %@",titleArray);
    if (_titleArray.count > 0) {
        
        for (UIView *subViews in self.subviews) {
            [subViews removeFromSuperview];
        }
        [self addSubview:self.smallScrollView];
        [self addTitleLabel];
        
        //默认标题
        Itemlable *lable = [self.smallScrollView.subviews firstObject];
        lable.scale = 1.0;
        lable.horizontallLine.hidden = NO;
    }
}

//标题栏
- (UIScrollView *)smallScrollView {
    if (!_smallScrollView) {
        _smallScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, myWidth, myHeight)];
        _smallScrollView.showsHorizontalScrollIndicator = NO;
        _smallScrollView.showsVerticalScrollIndicator = NO;
        _smallScrollView.backgroundColor = [UIColor clearColor];
        _smallScrollView.delegate = self;// 不可用
    }
    return _smallScrollView;
}
/** 添加标题栏 */
- (void)addTitleLabel
{
    //CGFloat ww = myWidth/(self.titleArray.count);
    CGFloat ww = 90;
    CGFloat hh = myHeight;
    CGFloat yy = 0;
    for (int i = 0; i < self.titleArray.count; i++) {
        
        CGFloat xx = i * ww;
        Itemlable *ttlab = [[Itemlable alloc] initWithFrame:CGRectMake(xx, yy, ww, hh)];
        
        ttlab.text = self.titleArray[i]; //从视图控制器 获取标题
        [self.smallScrollView addSubview:ttlab];
        
        ttlab.backgroundColor= [UIColor clearColor];
        ttlab.tag = i;
        ttlab.userInteractionEnabled = YES;
        [ttlab addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(labClick:)]];
    }
    self.smallScrollView.contentSize = CGSizeMake(ww * self.titleArray.count, 0);

}
#pragma mark  标题栏label的点击事件（通过此点击事件来控制：bigScrollView的偏移量）
- (void)labClick:(UITapGestureRecognizer *)recognizer
{
    Itemlable *itemLab = (Itemlable *)recognizer.view;
    // 获得索引
    NSInteger index = itemLab.tag;
    [self changeItemOfIndex:index itemLab:itemLab];

    self.itemClickBlock(index);
    
}
- (void)setItemIndex:(NSInteger)itemIndex {
    _itemIndex = itemIndex;
    
    Itemlable *itemLab = (Itemlable *)self.smallScrollView.subviews[_itemIndex];
    [self changeItemOfIndex:_itemIndex itemLab:itemLab];
    
}

- (void)changeItemOfIndex:(NSInteger)itemIndex itemLab:(Itemlable *)itemLab {
    
    itemLab.horizontallLine.hidden = NO;//显示最新的横线
    itemLab.scale = 1.0;//颜色还原为
    // 遍历所有子视图（subviews）
    [self.smallScrollView.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        if (idx != itemIndex) { //如果找到的不是当前点击的标题
            Itemlable *temlabel = self.smallScrollView.subviews[idx];
            temlabel.scale = 0.0;//颜色还原为黑色
            temlabel.horizontallLine.hidden = YES;  //隐藏横线
        }
    }];
    
    CGFloat offsetx = itemLab.center.x - self.smallScrollView.frame.size.width * 0.5;
    CGFloat offsetMax = self.smallScrollView.contentSize.width - self.smallScrollView.frame.size.width;
    if (offsetx < 0) {
        offsetx = 0;
    }else if (offsetx > offsetMax){
        offsetx = offsetMax;
    }
    CGPoint offset = CGPointMake(offsetx, self.smallScrollView.contentOffset.y);
    [self.smallScrollView setContentOffset:offset animated:YES];

}


@end

