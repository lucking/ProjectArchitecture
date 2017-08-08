//
//  ItemCollectionView.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/5/10.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "ItemCollectionView.h"
#import "ItemCell.h"
#import "UILabel+ZMAdd.h"
#import "NSString+ZMAdd.h"

// Identifier
static NSString *const Identifier = @"SelectDay_CellID";
static int ShowItemCount = 6;  //显示的个数

@interface ItemCollectionView()<UICollectionViewDataSource,UICollectionViewDelegate,UIScrollViewDelegate >
{
    CGFloat selfWidth;
    CGFloat selfHeight;
    CGFloat ItemWIDTH, ItemHEIGHT;
}
@property (nonatomic, strong) UICollectionView *ccollectView;
@property (nonatomic, strong) NSIndexPath *lastPath;
@property (nonatomic) NSIndexPath *selectIndex;//单选，当前选中的行
@property (nonatomic) NSIndexPath *oldIndex;//
@end


@implementation ItemCollectionView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        selfWidth=	frame.size.width;
        selfHeight=	frame.size.height;
        [self addSubview:self.ccollectView];

    }
    return self;
}


- (void)setTitleArr:(NSArray *)titleArr showIndex:(int)showIndex  {
    _titleArray = titleArr;

    NSLog(@"--> showIndex= %d", showIndex);
    self.selectIndex = [NSIndexPath indexPathForRow:(showIndex-1) inSection:0];
    NSLog(@"--> _selectIndex_00 = %ld", _selectIndex.row);
    [self.ccollectView reloadData];

    //如果日期大于3 设置偏移量
    if (showIndex > 3) {
        self.ccollectView.contentOffset = CGPointMake((showIndex-3)*ItemWIDTH, 0);
    }
}

- (void)reloadTitleArray:(NSArray *)titleArray showIndex:(int)showIndex;
{
    _titleArray = titleArray;
    
    NSLog(@"--> showIndex= %d", showIndex);
    self.selectIndex = [NSIndexPath indexPathForRow:(showIndex-1) inSection:0];
    [self addSubview:self.ccollectView];
    
    NSLog(@"--> _selectIndex_00 = %ld", _selectIndex.row);
    
    //如果日期大于3 设置偏移量
    if (showIndex > 3) {
        self.ccollectView.contentOffset = CGPointMake((showIndex-3)*ItemWIDTH, 0);
    }

}

#pragma mark ======================="  UICollectionViewDataSource  "=========================
//Section
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.titleArray count];
}
//cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ItemCell *cell= [collectionView dequeueReusableCellWithReuseIdentifier:Identifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    self.backgroundColor = Clear_COLOR;
    cell.label.text = _titleArray[indexPath.row];
    //NSLog(@"--> _title = %@", _titleArr[indexPath.row]);

    //适配iPhone5
    if ( (_selectIndex.section==indexPath.section) && (_selectIndex.row==indexPath.row)) {
        //适配iPhone5以上 (和系统无关)
        //if (_selectIndex == indexPath) {
        [cell.label setTextColor:Blue_2599FA];
        [cell.line setBackgroundColor:Blue_2599FA];
        cell.line.hidden = NO;
        //NSLog(@"--> cellForItem_selIndex_已经 = %ld \n ",(long)_selectIndex.row);
    }else {
        [cell.label setTextColor:Gray_555555];
        cell.line.hidden = YES;
        
        //隐藏旧的：滑动的时候有未重用的显示情况
        ItemCell *oldCell = (ItemCell *)[_ccollectView cellForItemAtIndexPath:_oldIndex];
        [oldCell.label setTextColor:Gray_555555 ];
        oldCell.line.hidden = YES;
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"--> row = %ld",indexPath.row);
    if (_selectIndex == indexPath) {
        //NSLog(@"-----> _selectIndex == indexPath ");
    }else{
        //获取旧的
        _oldIndex = _selectIndex;
        //记录当前选中的位置索引
        _selectIndex = indexPath;
        //隐藏旧的
        ItemCell *oldCell = (ItemCell *)[collectionView cellForItemAtIndexPath:_oldIndex];
        [oldCell.label setTextColor:Gray_555555 ];
        oldCell.line.hidden = YES;
        //[collectionView reloadData];
        [collectionView reloadItemsAtIndexPaths:@[_oldIndex]];

    }
//    NSLog(@"--> _oldIndex_22 = %ld ",_oldIndex.row);
    //选择新的
    ItemCell *newCell = (ItemCell *)[_ccollectView cellForItemAtIndexPath:indexPath];
    [newCell.label setTextColor:Blue_2599FA];
    [newCell.line setBackgroundColor:Blue_2599FA];
    newCell.line.hidden = NO;
    
    
#pragma mark 控制item 在中心位置
    // Item在 collectionView中的位置
    CGRect newRect2 = [collectionView convertRect:newCell.label.frame fromView:newCell];
    // Item在 collectionView中的位置 中心坐标点
    CGPoint itemInCollView_PiontCenter = CGPointMake(newRect2.origin.x+ ItemWIDTH/2,
                                                     newRect2.origin.y/2);
    //self的一半
    CGFloat halfSelfWidth = selfWidth* 0.5;
    CGFloat itemRight = newRect2.origin.x+ ItemWIDTH;
    //1. item的x中心 大于 self的一半  &&
    //2. 点击的item 的右边超过 self的一半
    //if (itemInCollView_PiontCenter.x > halfSelfWidth  && ItemWIDTH*(indexPath.row+1) > halfSelfWidth) {
    //同上
    if (itemInCollView_PiontCenter.x> halfSelfWidth  && itemRight> halfSelfWidth) {
        //居中
        if (ItemWIDTH*(_titleArray.count - indexPath.row) > halfSelfWidth) {
            //左边
            NSLog(@"左边");
            CGPoint offset = CGPointMake(indexPath.row*ItemWIDTH- halfSelfWidth+ ItemWIDTH*0.5,
                                         self.ccollectView.contentOffset.y);
            [self.ccollectView setContentOffset:offset animated:YES];
        }else{
            //右边
            NSLog(@"右边");
            CGPoint offset = CGPointMake( (_titleArray.count-ShowItemCount) *ItemWIDTH,
                                         self.ccollectView.contentOffset.y);
            [self.ccollectView setContentOffset:offset animated:YES];
        }
    }else{
        NSLog(@"正常位置");
        CGPoint offset = CGPointMake(0, self.ccollectView.contentOffset.y);
        [self.ccollectView setContentOffset:offset animated:YES];
    }
    
    //选项回调
    if (self.selectDayBlock) {
        self.selectDayBlock(collectionView, indexPath, _titleArray[indexPath.row]);
    }
}

#pragma mark -------"  setUI "-------
#pragma
- (UICollectionView *)ccollectView {
    if (_ccollectView == nil) {

        ItemWIDTH = (selfWidth/ShowItemCount);
        ItemHEIGHT= selfHeight;
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal; //水平
        //定义每个cell 的大小
        layout.itemSize = CGSizeMake(ItemWIDTH, ItemHEIGHT);
        layout.minimumLineSpacing = 0;      //定义每个Cell 横向的间距
        layout.minimumInteritemSpacing = 0; //定义每个Cell 纵向的间距
        
        _ccollectView = [[UICollectionView alloc]initWithFrame: CGRectMake(0, 0, selfWidth, ItemHEIGHT) collectionViewLayout:layout];
        [_ccollectView registerClass:[ItemCell class] forCellWithReuseIdentifier: Identifier];
        _ccollectView.delegate = self;
        _ccollectView.dataSource = self;
        _ccollectView.backgroundColor = BgColor; ;
        //设置滚动效果
        _ccollectView.showsHorizontalScrollIndicator = NO;// 取消滚动条
        _ccollectView.bounces = YES;
    }
    return _ccollectView;
}

@end
