//
//  ICarouselView.m
//  TDiPad
//
//  Created by ZM on 16/3/31.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "ICarouselView.h"
#import "UIImage+ZMAdd.h"

#define RollWidth		[UIScreen mainScreen].bounds.size.width
#define AdImgHeight		300

@interface ICarouselView () <iCarouselDataSource, iCarouselDelegate>
{

}
@property (nonatomic, strong) NSTimer *timer;

@end



@implementation ICarouselView


- (instancetype)initWithFrame:(CGRect )frame{

	if (self = [super initWithFrame:frame]) {

		CGRect rect = CGRectMake(60, 0, SSWIDTH-160, AdImgHeight);
		self.carousel = [[iCarousel alloc] initWithFrame:rect];
		self.carousel.delegate = self;
		self.carousel.dataSource = self;
		self.carousel.scrollSpeed = 6;
		self.carousel.pagingEnabled = YES;

        //切换item图片的类型这个是自定义类型
		// self.type = iCarouselTypeRotary;
		self.carousel.type = iCarouselTypeCoverFlow2;
		[self addSubview:self.carousel];
        
//        //第几张图片显示在当前位置
//        [self.carousel scrollToItemAtIndex:4 animated:NO];
//        self.carousel.clipsToBounds = YES;
//        //一开始中心图偏移量
//        self.carousel.contentOffset = CGSizeMake(0, 0);
//        //类似contentoffset
//        self.carousel.viewpointOffset = CGSizeMake(0, 0);
//        //控制滑动切换图片减速的快慢  默认0.95
//        self.carousel.decelerationRate = 0.95;
        
        
		self.pageControl = [[UIPageControl alloc] init];
		self.pageControl.numberOfPages = _dataArray.count;
		self.pageControl.center = CGPointMake(self.center.x, self.frame.size.height - 10);
		[self addSubview:self.pageControl];


		// self.imageViewType = UIViewContentModeScaleAspectFit;
		self.imageViewSize = CGSizeMake(450, 200);
		//self.imageViewSize = CGSizeMake(self.carousel.width-400, AdImgHeight-60);

		self.index = 0;
		// 一开始就显示第二张
		//[self.carousel scrollToItemAtIndex:1 animated:YES];

	}
	return self;
}

- (void)setDataArray:(NSArray *)dataArray{

	_dataArray = dataArray;

	self.pageControl.numberOfPages = dataArray.count;
	[self.carousel reloadData];

	[self addTimer];
}

- (void)setType:(iCarouselType)type{
	_type = type;

	self.carousel.type = type;

}

#pragma mark -- 私有
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
	return _dataArray.count;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
	//创建新的视图如果没有视图可回收
	if (view == nil)
	{
		UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.imageViewSize.width, self.imageViewSize.height)];
		imageView.layer.cornerRadius = 5;
		imageView.layer.masksToBounds= YES;
		imageView.contentMode = self.imageViewType;
		NSString *str = _dataArray[index];

		if ([str hasPrefix:@"http"]) {
			[imageView sd_setImageWithURL:[NSURL URLWithString:str] placeholderImage:[UIImage imageNamed:@"load.jpg"]];
		}else{
			//imageView.image = [UIImage imageNamed:str];
			imageView.image = [UIImage compressImageName:str JPEGCompression:1.0];
		}
		view = imageView;
	}

	return view;
}

#pragma mark - /************************  2016.4.6 添加  **************************/

- (CGFloat)carousel:(__unused iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
	//自定义显示旋转木马
	switch (option)
	{
		case iCarouselOptionWrap:{
			return YES;				//通常你会硬编码是或否
		}
		case iCarouselOptionSpacing:{
			return value * 1.05f;	//增加一些项目视图之间的间距
		}
		case iCarouselOptionFadeMax:{
			if (self.carousel.type == iCarouselTypeCustom){
				return 0.0f;		//基于距离相机设置不透明度
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
	return value;
}
#pragma mark -
#pragma mark iCarousel taps

- (void)carousel:(__unused iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index
{
//	NSNumber *item = (self.items)[(NSUInteger)index];
//	NSLog(@"Tapped view number: %@", item);
	if (self.clickAction) {
		self.clickAction(index,self.dataArray);
	}
}
- (void)carouselCurrentItemIndexDidChange:(__unused iCarousel *)carousel
{
	// NSLog(@"Index: %@", @(self.carousel.currentItemIndex));
}
#pragma mark - /************************  2016.4.6 添加  **************************/
-(void)addTimer {
	self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self
												selector:@selector(nextImage)
												userInfo:nil repeats:YES];
	//添加到runloop中
	[[NSRunLoop mainRunLoop]addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)removeTimer
{
	[self.timer invalidate];
}

- (void)nextImage
{
	NSInteger index = self.carousel.currentItemIndex + 1;
	if (index == _dataArray.count ) {
		index = 0;
	}
	[self.carousel scrollToItemAtIndex:index animated:YES];
}

- (void)carouselDidScroll:(iCarousel *)carousel;
{
	self.pageControl.currentPage = carousel.currentItemIndex;
    
//    NSInteger index = carousel.currentItemIndex;
//    // 支持循环的 可用（最后一个的下一个是第0个）
//    if (index == [self.dataArray count] - 1) {
//        [carousel scrollToItemAtIndex:0 animated:YES];
//    } else {
//        [carousel scrollToItemAtIndex:index+1 animated:YES];
//    }
}
- (void)carouselWillBeginDragging:(iCarousel *)carousel{
	[self removeTimer];
}

- (void)carouselDidEndDragging:(iCarousel *)carousel
				willDecelerate:(BOOL)decelerate{
	//    开启定时器
	[self addTimer];
}

@end
