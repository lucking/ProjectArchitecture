//
//  ShareView.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/3/24.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "ZMShareView.h"
#import "ShareCell.h"

#import "ZMShareHeader.h"
#import "UIView+ZMShare.h"

@interface ZMShareView()<UICollectionViewDataSource,UICollectionViewDelegate,UIGestureRecognizerDelegate >
{
    CGFloat myWidth;
    CGFloat myHeight;
    CGFloat ItemWIDTH;
}
@property (nonatomic, strong) UIView *bottomView;
@property (nonatomic, strong) UIView *BgView;
@property (nonatomic, strong) UIButton *cancelBtn;
@property (nonatomic, strong) UICollectionView *ccollectView;
@property (nonatomic, strong) NSIndexPath *lastPath;
@property (assign, nonatomic) NSIndexPath *selIndex;//单选，当前选中的行
@property (nonatomic) CGRect topRect, bottomRect;   // 显示_View、隐藏_View
@property (nonatomic) CGRect shareTopRect, shareBottomRect;   // 显示_View、隐藏_View
@end


@implementation ZMShareView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //[self configUI];        
    }
    return self;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        //[self configUI];
    }
    return self;
}


/**
  配置UI
 */
- (void)zm_configUIOfBottomHeight:(CGFloat)bottomHeight {
    
    self.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.4]; //Gray_FAFAFA
    self.topRect    = CGRectMake(0, 0, SSWIDTH, SSHEIGHT);
    self.bottomRect = CGRectMake(0, SSHEIGHT, SSWIDTH, SSHEIGHT);
    self.frame = self.bottomRect;
    myWidth = SSWIDTH;
    myHeight= SSHEIGHT;
    
    UITapGestureRecognizer * gesture =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGestureClick:)];
    gesture.numberOfTapsRequired = 1;
    gesture.delegate = self;
    [self addGestureRecognizer:gesture];
    
    ItemWIDTH = (myWidth-15*5)/4;
    if (IS_IPHONEX) {
        BottomViewH  = (200+ CancelBtnH)+20;    
    }
    
    [self addSubview:self.bottomView];
    [self.bottomView addSubview:self.BgView];
    [self.bottomView addSubview:self.cancelBtn];
    [self.BgView addSubview:self.ccollectView];

    self.shareTopRect    = CGRectMake(0, myHeight-BottomViewH-bottomHeight , myWidth, BottomViewH);
    self.shareBottomRect = CGRectMake(0, myHeight , myWidth, BottomViewH);
        
    self.bottomView.frame = CGRectMake(0, myHeight-BottomViewH-bottomHeight , myWidth, BottomViewH);
    self.BgView.frame     = CGRectMake(0, 0, myWidth, ItemHeight*2+LineSpace*2); 
    self.cancelBtn.frame  = CGRectMake(0, self.BgView.bottom , myWidth, BottomViewH-self.BgView.bottom);
    
    self.bottomView.backgroundColor   = [UIColor groupTableViewBackgroundColor];
    self.BgView.backgroundColor       = sColorRGB(246,246,246);
    self.ccollectView.backgroundColor = sColorRGB(246,246,246);
//    self.ccollectView.backgroundColor = [UIColor cyanColor];
//    self.BgView.backgroundColor = [UIColor purpleColor];
}

//手势绑定的事件
-(void)tapGestureClick:(UITapGestureRecognizer *)sender {
////屏蔽自视图：子视图不能 响应自己的事件
//    if( CGRectContainsPoint(self.frame, [sender locationInView:self.ccollectView])) {
//        NSLog(@"111");
//    } else{
//        NSLog(@"222");
//    }; 
    [self hiddenView];
    NSLog(@"222 \n ");

}
//屏蔽自视图：子视图能 响应自己的事件
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{  
    if ([touch.view isDescendantOfView:self.ccollectView]) { 
        return NO;  
    }else{  
        return YES;  
    }  
}  
//配置数据
- (void)setTitleArray:(NSArray *)titleArray imgArray:(NSArray *)imgArray; {
    _titleArray = titleArray;
    _imgArray = imgArray;
    [_ccollectView reloadData];
}
//展示
- (void)showView {   
    self.frame = _topRect;
    [self flipView:self.bottomView Rect:_shareTopRect forView:self timeInterval:0.2];
}
//隐藏
- (void)hiddenView{   
    self.frame = _bottomRect;
    [self flipView:self.bottomView  Rect:_shareBottomRect forView:self timeInterval:0.2];
}
//取消：隐藏
- (void)BtnClick:(UIButton *)Btn {
    [self hiddenView];
}
//移除
- (void)removeView {
    [[self subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self removeFromSuperview];
}

- (UIButton *)cancelBtn {
    if (_cancelBtn==nil) {
        _cancelBtn = [[UIButton alloc] init];
        _cancelBtn.backgroundColor = [UIColor whiteColor];
        [_cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [_cancelBtn setTitleColor:sBlack_COLOR forState:UIControlStateNormal];
        [_cancelBtn.titleLabel setFont:[UIFont systemFontOfSize:18]];
        [_cancelBtn addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }return _cancelBtn;
}
- (UIView *)bottomView {
    if (_bottomView == nil) {
        _bottomView = [[UIView alloc] init];
    }return _bottomView;
}
- (UIView *)BgView {
    if (_BgView == nil) {
        _BgView = [[UIView alloc] init];
    }return _BgView;
}
- (UICollectionView *)ccollectView {
    if (_ccollectView == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical; // 垂直
        //定义每个cell 的大小
        layout.itemSize = CGSizeMake(ItemWIDTH, ItemHeight);
        layout.minimumLineSpacing      = LineSpace;     //定义每个itemCell 横向的间距
        layout.minimumInteritemSpacing = VerticalSpace; //定义每个itemCell 纵向的间距
        _ccollectView = [[UICollectionView alloc]initWithFrame: CGRectMake(10, 0, myWidth-20, ItemHeight*2+LineSpace*2) collectionViewLayout:layout];
        [_ccollectView registerClass:[ShareCell class] forCellWithReuseIdentifier: Identifier];
        _ccollectView.delegate = self;
        _ccollectView.dataSource = self;
        _ccollectView.backgroundColor = Clear_COLOR;
        _ccollectView.showsHorizontalScrollIndicator = NO;
    }
    return _ccollectView;
}

#pragma mark ======================="  UICollectionViewDataSource  "=========================
//Section
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.titleArray count];
}
//cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ShareCell *cell= [collectionView dequeueReusableCellWithReuseIdentifier:Identifier forIndexPath:indexPath];
    cell.imgView.image = [UIImage imageNamed:_imgArray[indexPath.row]];
    cell.label.text = _titleArray[indexPath.row];
    //cell.backgroundColor = [UIColor yellowColor];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    //选项回调
    if (self.shareBlock) {
        self.shareBlock(collectionView,indexPath);
    }
}

@end
