//
//  ZM_TestCollectionVC.m
//  ProjectArchitecture
//
//  Created by ZM on 2018/5/28.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import "ZM_TestCollectionVC.h"
#import "ZM_TestCollectionCell.h"


static NSString *const Identifier1 = @"ZM_TestCollectionCell";
static NSString *const Identifier2 = @"FiveUpDownCell";
static NSString *kHeaderViewId  = @"GaiNianReusableView";
static NSString *kFooterViewId  = @"FooterViewId";
static CGFloat const kSpace = 8.0f; 

@interface ZM_TestCollectionVC ()<UICollectionViewDelegate,UICollectionViewDataSource>
{
    CGFloat ItemWIDTH, ItemHEIGHT;
}
@property (nonatomic, strong) UICollectionView *ccollectionView;
@end

@implementation ZM_TestCollectionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    ItemWIDTH = (SSWIDTH-kSpace*2-kSpace*4)/3.f;
    ItemHEIGHT= ItemWIDTH;
    [self.view addSubview:self.ccollectionView];
    self.ccollectionView.frame = CGRectMake(0, 64, SSWIDTH, SSHEIGHT-64-49);

}

#pragma mark ======================="  UICollectionViewDataSource  "=========================
//section 
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}
//Row
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 12; 
}
//cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ZM_TestCollectionCell *cell = (ZM_TestCollectionCell *)[collectionView dequeueReusableCellWithReuseIdentifier:Identifier1 forIndexPath:indexPath];
    //配置数据
    //[cell setDataWithStockArray:_topStockArray mssageArray:_topArray atIndexPath:indexPath];
    return cell;
}
// didSelect
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}
/** itemSize：定义每个 Cell 的大小
 */
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    return CGSizeMake(ItemWIDTH, ItemHEIGHT);
//}

- (UICollectionView *)ccollectionView{
    if (_ccollectionView==nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        //layout.sectionHeadersPinToVisibleBounds = YES;
        //定义每个cell 的大小：itemSize
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = kSpace;
        layout.sectionInset = UIEdgeInsetsMake(kSpace, kSpace,kSpace, kSpace);
        //CGRect frame = CGRectMake(0, 10, SSWIDTH, self.view.height-10);
        _ccollectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
        _ccollectionView.backgroundColor= [UIColor clearColor];
        _ccollectionView.layer.cornerRadius = 3.0f;
        _ccollectionView.clipsToBounds = YES;
        //注册 Cell（xib）
        [_ccollectionView registerNib:[UINib nibWithNibName:NSStringFromClass([ZM_TestCollectionCell class]) bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:Identifier1];
        //注册 Cell（code）
        // [_ccollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"Identifier1"];
        _ccollectionView.delegate=self;
        _ccollectionView.dataSource=self;
        _ccollectionView.showsVerticalScrollIndicator = NO;
        //注册 HeaderView、FooterView （code）
        [_ccollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:kFooterViewId];
        //注册 HeaderView、FooterView （xib） Nib的view需要继承UICollectionReusableView
        [_ccollectionView registerNib:[UINib nibWithNibName:@"GaiNianReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kHeaderViewId];
    }return _ccollectionView;
}

@end
