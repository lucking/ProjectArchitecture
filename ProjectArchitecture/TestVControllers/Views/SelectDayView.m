//
//  SelectDayView.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/3/13.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "SelectDayView.h"
#import "SelectDayCell.h"
#import "UILabel+ZMAdd.h"
#import "NSString+ZMAdd.h"

// Identifier
static NSString *const Identifier = @"SelectDay_CellID";
static int ShowItemCount = 6;  //显示的个数

@interface SelectDayView()<UICollectionViewDataSource,UICollectionViewDelegate >
{
    CGFloat selfWidth;
    CGFloat selfHeight;
    CGFloat ItemWIDTH, ItemHEIGHT;
    NSString *_myMonth;
    NSString *_myTime;

}
@property (nonatomic, strong) UICollectionView *ccollectView;
@property (nonatomic, strong) NSIndexPath *lastPath;
@property (nonatomic) NSIndexPath *selectIndex;//单选，当前选中的行
@property (nonatomic) NSIndexPath *oldIndex;//
@end


@implementation SelectDayView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        selfWidth=	frame.size.width;
        selfHeight=	frame.size.height;
        
        self.titleArr = [[NSMutableArray alloc] init];
        self.detailTimeArray = [[NSMutableArray alloc] init];

        NSLog(@"--> selfWidth= %f", selfWidth);
        NSLog(@"--> selfHeight= %f", selfHeight);
        [self addSubview:self.ccollectView];

    }
    return self;
}

- (void)setTimeArray:(NSMutableArray *)timeArray detailTimeArray:(NSMutableArray *)detailTimeArray
        currentMonth:(NSString *)month
          currentDay:(NSString *)day {

//    _titleArr = timeArray;
//    _detailTimeArray = detailTimeArray;
    
    [_titleArr addObjectsFromArray:timeArray];
    [_detailTimeArray addObjectsFromArray:detailTimeArray];

    NSLog(@"--> day= %@", day);
    self.selectIndex = [NSIndexPath indexPathForRow:([day intValue]-1+7) inSection:0];
//    [self addSubview:self.ccollectView];

    [_ccollectView reloadData];

    //如果日期大于3 设置偏移量
    int offsetNum = 3;
    if ([day intValue] > offsetNum) {
        self.ccollectView.contentOffset = CGPointMake(([day intValue]-offsetNum+7)*ItemWIDTH, 0);
    }
    
}
//皮肤模式：夜间、白天
- (void)setReadType:(BOOL)readType {
    _readType = readType;
    [_ccollectView reloadData];
}

- (UICollectionView *)ccollectView
{
    if (_ccollectView == nil) {
        
        ItemWIDTH = (selfWidth/ShowItemCount);
        ItemHEIGHT= selfHeight;
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal; // 水平
        //定义每个cell 的大小
        layout.itemSize = CGSizeMake(ItemWIDTH, ItemHEIGHT);
        layout.minimumLineSpacing = 0;      //定义每个cell 横向的间距
        layout.minimumInteritemSpacing = 0; //定义每个cell 纵向的间距
        
        _ccollectView = [[UICollectionView alloc]initWithFrame: CGRectMake(0, 0, selfWidth, ItemHEIGHT) collectionViewLayout:layout];
        [_ccollectView registerClass:[SelectDayCell class] forCellWithReuseIdentifier: Identifier];
        _ccollectView.delegate = self;
        _ccollectView.dataSource = self;
        _ccollectView.backgroundColor = BgColor; ;
        //设置滚动效果
        _ccollectView.showsHorizontalScrollIndicator = NO;// 取消滚动条
        _ccollectView.bounces = YES;
    }
    return _ccollectView;
}

#pragma mark ======================="  UICollectionViewDataSource  "=========================
//Section
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSLog(@"--> self.titleArr_count= %ld", [self.titleArr count]);
    return [self.titleArr count];
}
//cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    SelectDayCell *cell= [collectionView dequeueReusableCellWithReuseIdentifier:Identifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
//    cell.label.text = [NSString stringWithFormat:@"%@%@",
//                       _titleArr[indexPath.row],
//                       _month];
    
    //NSLog(@"--> _title = %@", _titleArr[indexPath.row]);
     cell.label.text = _titleArr[indexPath.row];
    
//    _myTime = _titleArr[indexPath.row];
//    cell.label.text = [NSString stringWithFormat:@"%@月",_myTime];
//    
//    if (_myTime.length >3) {
//        _myMonth = [_myTime cutStringByEndWidthNum:2];
//    }else{
//        _myMonth = [_myTime cutStringByEndWidthNum:1];
//    }
    
//    [UILabel changeTextLab:cell.label
//               stringArray:@[[NSString stringWithFormat:@"%@月",_myMonth]]
//                colorArray:@[[SkinManager shareManager].skin_TextColor]
//                 fontArray:@[@"12"]];
    
    _ccollectView.backgroundColor = BgColor; ;
    cell.backgroundColor = Clear_COLOR;
    self.backgroundColor = Clear_COLOR;
    
    //适配iPhone5
    if ( (_selectIndex.section==indexPath.section) && (_selectIndex.row==indexPath.row)) {
        //适配iPhone5以上 (和系统无关)
        //    if (_selectIndex == indexPath) {
        [cell.label setTextColor:Blue_2599FA];
        [cell.line setBackgroundColor:Blue_2599FA];
        cell.line.hidden = NO;
        NSLog(@"--> cellForItem_selIndex_已经 = %ld \n ",(long)_selectIndex.row);
    }else {
        [cell.label setTextColor:Gray_555555];
        cell.line.hidden = YES;
        
        //隐藏旧的：滑动的时候有未重用的显示情况
        SelectDayCell *oldCell = (SelectDayCell *)[_ccollectView cellForItemAtIndexPath:_oldIndex];
        [oldCell.label setTextColor:Gray_555555 ];
        oldCell.line.hidden = YES;
    }
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"--> row = %ld",indexPath.row);
    //    NSLog(@"--> _oldIndex_11 = %ld ",_oldIndex.row);
    //    NSLog(@"--> _selectIndex = %ld ",_selectIndex.row);
    
    if (_selectIndex == indexPath) {
        NSLog(@"---> _selectIndex == indexPath ");
    }else{
        //获取旧的
        _oldIndex = _selectIndex;
        //记录当前选中的位置索引
        _selectIndex = indexPath;
        //隐藏旧的
        SelectDayCell *oldCell = (SelectDayCell *)[collectionView cellForItemAtIndexPath:_oldIndex];
        [oldCell.label setTextColor:Gray_555555 ];
        oldCell.line.hidden = YES;
        [collectionView reloadItemsAtIndexPaths:@[_oldIndex]];
        //[collectionView reloadData];
    }
    //选择新的
    SelectDayCell *newCell = (SelectDayCell *)[_ccollectView cellForItemAtIndexPath:indexPath];
    [newCell.label setTextColor:Blue_2599FA];
    [newCell.line setBackgroundColor:Blue_2599FA];
    newCell.line.hidden = NO;
    
    
    // Item在 self中的位置
    CGRect newRect1 = [self convertRect:newCell.label.frame fromView:newCell];
    // Item在 collectionView中的位置
    CGRect newRect2 = [collectionView convertRect:newCell.label.frame fromView:newCell];
    NSLog(@"--> x_1 = %f",newRect1.origin.x);
    NSLog(@"--> x_2 = %f ",newRect2.origin.x);
    
    // Item在 self中的位置 中心坐标点
    CGPoint itemInSelf_PiontCenter = CGPointMake(newRect1.origin.x+ ItemWIDTH/2,
                                                 newRect1.origin.y/2);
    // Item在 CollView中的位置 中心坐标点
    CGPoint itemInCollView_PiontCenter = CGPointMake(newRect2.origin.x+ ItemWIDTH/2,
                                                     newRect2.origin.y/2);
    //self的一半
    CGFloat halfSelfWidth = selfWidth* 0.5;
    CGFloat itemRight = newRect2.origin.x+ ItemWIDTH;
    NSLog(@"--> ItemWIDTH = %f", ItemWIDTH);
    NSLog(@"--> itemPiontCenter_1.x = %.3f",itemInSelf_PiontCenter.x);
    NSLog(@"--> itemPiontCenter_2.x = %.3f",itemInCollView_PiontCenter.x);
    NSLog(@"--> halfSelfWidth = %.3f",halfSelfWidth);
    NSLog(@"--> 剩余_Count = %ld", _titleArr.count - indexPath.row);
    //CGFloat itemWidth = newCell.label.frame.size.width;  itemWidth = ItemWIDTH(相等)
    //NSLog(@"--> halfSelfWidth = %f",halfSelfWidth);
    
    
    //1. item的x中心 大于 self的一半  &&
    //2. 点击的item 的右边超过 self的一半
    //if (itemInCollView_PiontCenter.x > halfSelfWidth  && ItemWIDTH*(indexPath.row+1) > halfSelfWidth) {
    //同上
    if (itemInCollView_PiontCenter.x> halfSelfWidth  && itemRight> halfSelfWidth) {
        //居中
        if (ItemWIDTH*(_titleArr.count - indexPath.row) > halfSelfWidth) {
            //左边
            NSLog(@"左边");
            CGPoint offset = CGPointMake(indexPath.row*ItemWIDTH- halfSelfWidth+ ItemWIDTH*0.5,
                                         self.ccollectView.contentOffset.y);
            [self.ccollectView setContentOffset:offset animated:YES];
        }else{
            //右边
            NSLog(@"右边");
            CGPoint offset = CGPointMake( (_titleArr.count-ShowItemCount) *ItemWIDTH,
                                         self.ccollectView.contentOffset.y);
            [self.ccollectView setContentOffset:offset animated:YES];
        }
    }else{
        NSLog(@"正常位置");
        CGPoint offset = CGPointMake(0, self.ccollectView.contentOffset.y);
        [self.ccollectView setContentOffset:offset animated:YES];
    }

    
    
    //    NSString *dateStr = [NSString stringWithFormat:@"%@%@",_month,_titleArr[indexPath.row]];
    //    NSLog(@"--> dateStr= %@", dateStr);
    //选项回调
    if (self.selectDayBlock) {
        self.selectDayBlock(collectionView, indexPath, _detailTimeArray[indexPath.row]);
    }
}

@end
