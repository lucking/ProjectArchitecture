//
//  ZMCarouselView.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/5/19.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "ZMCarouselView.h"
#import <iCarousel.h>
#import "BannerModel.h"
#import "UIImageView+HTRoundImage.h"
#import <SDWebImageManager.h>
#import "HTConst.h"
#import "UIView+ZMFrame.h"
#import "ZMWebViewModel.h"
#import "CityBannerWebVController.h"
#import "UIViewController+ZMAdd.h"
#import "Masonry.h"
#import "ServerURL.h"

#define PAGE_OFFSET 100
//图片宽度
#define ItemWIDTH  ((SSWIDTH-20)/3.f)

@interface ZMCarouselView ()<iCarouselDelegate,iCarouselDataSource>
{
    
}
@property (nonatomic,strong) iCarousel *carousel;
/**  urlString 数组 */
@property (nonatomic, strong) NSMutableArray *imageURLStringsGroup;
/**  无数据时背景图  */
@property (strong, nonatomic) UIImageView *placeholderImageView;
@end


@implementation ZMCarouselView

#pragma mark - initview
//有布局加载
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self carousel];
    }
    return self;
}
//无布局加载
- (instancetype)init
{
    if (self = [super init]) {
        [self carousel];
    }
    return self;
}
//文件加载
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self carousel];
    }
    return self;

}
//xib加载
- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self carousel];
}
//循环滚动的速度
- (void)setAutoScrollTimeInterval:(CGFloat)autoScrollTimeInterval
{
    _autoScrollTimeInterval = autoScrollTimeInterval;
    self.carousel.autoscroll = autoScrollTimeInterval;
    
}


- (void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = placeholder;
    
    //    [self bringSubviewToFront:self.placeholderImageView];
    //    UIImage *placeholderImage = [UIImage imageNamed:placeholder];
    //    self.placeholderImageView.image = [placeholderImage HT_setRadius:self.cornerRadius size:CGSizeMake(SCREEN_WIDTH - 2*PAGE_OFFSET, self.height)];
}
- (void)setImageURLSignal:(RACSignal *)imageURLSignal
{
    _imageURLSignal = imageURLSignal;
    @weakify(self);
    [_imageURLSignal subscribeNext:^(id  _Nullable x) {
        
        @strongify(self);
        if ([x count] > 0) {
            [self.placeholderImageView removeFromSuperview];
            
            [x enumerateObjectsUsingBlock:^(BannerModel *model, NSUInteger idx, BOOL * _Nonnull stop) {
                [self.imageURLStringsGroup addObject:model];
            }];
        }
        dispatch_main_async_safe(^{
            [self.carousel reloadData];
        });
    }];
}
#pragma mark - life cycle
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.carousel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.left.top.bottom.equalTo(self);
    }];
}
- (void)dealloc
{
    self.carousel.dataSource = nil;
    self.carousel.delegate = nil;
}
#pragma mark - iCarouselDelegate && iCarouselDataSource
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return self.imageURLStringsGroup.count;
}
-(UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    CGFloat viewWidth = SSWIDTH - 2*PAGE_OFFSET;
    viewWidth = ItemWIDTH;
    if (view == nil) {
        
        view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, viewWidth, self.height)];
        view.backgroundColor = [UIColor clearColor];
    }
    
    BannerModel *model = self.imageURLStringsGroup[index];
    [((UIImageView *)view) HT_setImageWithCornerRadius:self.cornerRadius imageURL:[NSURL URLWithString:model.image_url] placeholder:self.placeholder contentMode:UIViewContentModeScaleToFill size:CGSizeMake(viewWidth, self.height)];
    return view;
}

//返回自定义滚动类型
-(CATransform3D)carousel:(iCarousel *)carousel itemTransformForOffset:(CGFloat)offset baseTransform:(CATransform3D)transform{
    
    static CGFloat max_sacle = 1.0f;
    static CGFloat min_scale = 0.8f;
    if (offset <= 1 && offset >= -1) {
        float tempScale = offset < 0 ? 1+offset : 1-offset;
        float slope = (max_sacle - min_scale) / 1;
        
        CGFloat scale = min_scale + slope*tempScale;
        transform = CATransform3DScale(transform, scale, scale, 1);
    }else{
        transform = CATransform3DScale(transform, min_scale, min_scale, 1);
    }
    
    return CATransform3DTranslate(transform, offset * self.carousel.itemWidth * 1.2, 0.0, 0.0);
}
- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    switch (option)
    {
        case iCarouselOptionWrap:
        {
            return YES;
        }
        case iCarouselOptionSpacing:
        {
            return value * 1.05;
        }
        case iCarouselOptionFadeMax:
        {
            if (self.carousel.type == iCarouselTypeCustom)
            {
                return 1.0;
            }
            return value;
        }
        case iCarouselOptionShowBackfaces:
        case iCarouselOptionRadius:
        case iCarouselOptionAngle:
        case iCarouselOptionArc:
        case iCarouselOptionTilt:
        case iCarouselOptionCount:
        case iCarouselOptionFadeMin:
        case iCarouselOptionFadeMinAlpha:
        case iCarouselOptionFadeRange:
        case iCarouselOptionOffsetMultiplier:
        case iCarouselOptionVisibleItems:
        {
            return value;
        }
    }
}
- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index
{
     BannerModel *model = self.imageURLStringsGroup[index];
     ZMWebViewModel *viewModel = [[ZMWebViewModel alloc] initWithServices:nil
                                                                   params:@{ViewTitlekey:@"",
                                                                            RequestURLkey:model.html_url,
                                                                            NavBarStyleTypekey:@(kNavBarStyleNomal)}];
//    CityBannerWebVController *currentVC = [[CityBannerWebVController alloc] init];
    CityBannerWebVController *currentVC = [[CityBannerWebVController alloc] initWithViewModel:viewModel];;
//    currentVC.viewModel = viewModel;
    
    [[UIViewController getCurrentVC].navigationController pushViewController:currentVC animated:YES];
    if (self.clickItemOperationBlock) {
        self.clickItemOperationBlock(index);
    }
}
- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel
{
    if (self.itemDidScrollOperationBlock) {
        self.itemDidScrollOperationBlock(self.carousel.currentItemIndex);
    }
}

- (void)startAnimation {
    [self.carousel startAnimation];
}
- (void)stopAnimation {
    [self.carousel stopAnimation];
}

#pragma mark - getter
- (iCarousel *)carousel
{
    return ZM_LAZY(_carousel, ({
        iCarousel *carousel = [[iCarousel alloc] init];
        carousel.delegate = self;
        carousel.dataSource = self;
        carousel.pagingEnabled = YES;
//        carousel.autoscroll = 0.2;
        carousel.type = iCarouselTypeCustom;
        [self addSubview:carousel];
        carousel;
    }));
}
- (UIImageView *)placeholderImageView
{
    return ZM_LAZY(_placeholderImageView, ({
        
        CGFloat viewWidth =SSWIDTH - 2*PAGE_OFFSET;
        viewWidth = ItemWIDTH;
        UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(10, 0, viewWidth, self.height)];
        view.contentMode = UIViewContentModeScaleToFill;
        [self addSubview:view];
        view;
    }));
}
- (NSMutableArray *)imageURLStringsGroup
{
    return ZM_LAZY(_imageURLStringsGroup, @[].mutableCopy);
}

@end
