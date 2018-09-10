//
//  ZM_ThirdLoginView.m
//  ProjectArchitecture
//
//  Created by ZM on 2018/7/31.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import "ZM_ThirdLoginView.h"

#import "ZM_ThirdLoginCell.h"
#import "UIView+ZMFrame.h"
#import <Masonry.h>

static CGFloat const TopHeight = 40.f; 
static CGFloat const space = 10.f; 
static NSString *const Identifier = @"ZM_ThirdLoginCell";

#define MyWidth     self.bounds.size.width
#define MyHeight    self.bounds.size.height

@interface ZM_ThirdLoginView()<UICollectionViewDelegate,UICollectionViewDataSource>{
    CGFloat ItemWIDTH, ItemHEIGHT;
}
@property (nonatomic, strong) UICollectionView *ccollectionView;
@property (nonatomic, strong) NSMutableArray <ZM_ThirdLogin *> *dataArray;
@property (nonatomic, strong) UIView *lineView1;
@property (nonatomic, strong) UIView *lineView2;
@property (nonatomic, strong) UILabel *titleLab;
@end

@implementation ZM_ThirdLoginView

- (instancetype)init {
    self=[super init];
    if (self) {
        [self configInit];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame {
    self=[super initWithFrame:frame];
    if (self) {
        [self configInit];
    }
    return self;
}
- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    if (self.height>0) {
        [self configFrame];
    }
}
- (void)configInit {
    self.backgroundColor = [UIColor whiteColor];
    self.dataArray = [[NSMutableArray alloc] init];
    [self addSubview:self.titleLab];
    [self addSubview:self.lineView1];
    [self addSubview:self.lineView2];

}
-(void)configFrame {

    CGFloat xx = 44;
    ItemWIDTH = (MyWidth-space*4-xx*2)/3;
    ItemHEIGHT= self.height-TopHeight;
    [self addSubview:self.ccollectionView];
    self.ccollectionView.frame  = CGRectMake(xx, TopHeight, MyWidth-xx*2, ItemHEIGHT);
    
    _lineView1.backgroundColor = Gray_CCCCCC;
    _lineView2.backgroundColor = Gray_CCCCCC;    
    zmWS(weakSf);
    CGFloat lineHH = 0.8f;
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.centerX.equalTo(weakSf);
        make.height.mas_equalTo(TopHeight);
    }];
    [self.lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakSf.titleLab);
        make.left.mas_equalTo(weakSf).offset(20);
        make.right.mas_equalTo(weakSf.titleLab.mas_left).offset(-10);
        make.height.mas_equalTo(lineHH);
    }];
    [self.lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakSf.titleLab);
        make.left.mas_equalTo(weakSf.titleLab.mas_right).offset(10);
        make.right.mas_equalTo(weakSf).offset(-20);
        make.height.mas_equalTo(lineHH);
    }];
}

- (UIView *)lineView1 {
    if (_lineView1==nil) {
        _lineView1 = [[UIView alloc] init];
    }return _lineView1;
}
- (UIView *)lineView2 {
    if (_lineView2==nil) {
        _lineView2 = [[UIView alloc] init];
    }return _lineView2;
}
- (UILabel *)titleLab {
    if (_titleLab==nil) {
        _titleLab = [[UILabel alloc] init];
        _titleLab.font = FFont(14);
        _titleLab.backgroundColor = [UIColor whiteColor];
        _titleLab.textAlignment = NSTextAlignmentCenter;
        _titleLab.textColor = Gray_333333;
    }return _titleLab;
}
- (void)setTitle:(NSString *)title {
    _title = title;
    _titleLab.text = title;
}

//配置数据
- (void)zm_ThirdLoginViewDataArray:(NSArray *)dataArray;
{
    [_dataArray removeAllObjects];
    [_dataArray addObjectsFromArray:dataArray];
    [self.ccollectionView reloadData];
}
#pragma mark ====================="  UICollectionViewDataSource  "=======================

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _dataArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ZM_ThirdLoginCell *cell = (ZM_ThirdLoginCell *)[collectionView dequeueReusableCellWithReuseIdentifier:Identifier forIndexPath:indexPath];
    cell.model= _dataArray[indexPath.row];
//    cell.backgroundColor = Gray_EEEEEE;
    return cell;
}

// didSelect
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //代理响应
    if ([self.delegate respondsToSelector:@selector(myView:didSelectAtIndex:)]) {
        [self.delegate myView:self didSelectAtIndex:indexPath.row];
    }
}
- (UICollectionView *)ccollectionView{
    if (_ccollectionView==nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        //定义每个cell 的大小
        layout.itemSize = CGSizeMake(ItemWIDTH, ItemHEIGHT);
        //layout.minimumLineSpacing = space;
        layout.minimumInteritemSpacing = 0;
        layout.sectionInset = UIEdgeInsetsMake(0, space,0, space);
        
        _ccollectionView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:layout];
        _ccollectionView.backgroundColor= [UIColor clearColor];
        _ccollectionView.delegate=self;
        _ccollectionView.dataSource=self;
        _ccollectionView.showsHorizontalScrollIndicator = NO;
        //注册 UICollectionViewCell
        [_ccollectionView registerNib:[UINib nibWithNibName:NSStringFromClass([ZM_ThirdLoginCell class]) bundle:[NSBundle mainBundle]]
           forCellWithReuseIdentifier:Identifier];
    }return _ccollectionView;
}

@end
