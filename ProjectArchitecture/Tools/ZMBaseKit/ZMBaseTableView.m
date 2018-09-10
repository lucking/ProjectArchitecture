//
//  BaseTableView.m
//  ZMArchitecture
//
//  Created by ZM on 16/3/1.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "ZMBaseTableView.h"

@implementation ZMBaseTableView

- (instancetype)initWithFrame:(CGRect)frame {

	self = [super initWithFrame:frame];
	if (self){
		//[self NOwifieview];// 公共初始化方法
		[self setBackgroundView:self.BgView];
		[self.BgView addSubview:self.bgWifiBtn];
		[self.BgView addSubview:self.bgImageV];
		self.BgView.hidden = YES;
	}
	return self;
}

#pragma mark UITableViewBGDelegate：没有网络/网络不给力，再试试吧
-(void)wifiBtnClick:(UIButton *)Btn
{
	if ([self.Bgdelegate respondsToSelector:@selector(backgroundView:wifiBtnClick:)]) {
		[self.Bgdelegate backgroundView:self wifiBtnClick:Btn];
	}
}


- (UIView *)BgView {
	if (_BgView==nil) {
		_BgView = [[UIView alloc]initWithFrame:CGRectMake(0,0,selfWIDTH,selfHEIGHT)];
		_BgView.backgroundColor = [UIColor clearColor];
	}
	return _BgView;
}
- (UIImageView *)bgImageV {
	if (_bgImageV==nil) {
		_bgImageV= [[UIImageView alloc]initWithFrame:CGRectMake(0,0,selfWIDTH,100)];
		_bgImageV.center = CGPointMake(selfWIDTH/2, selfHEIGHT/3);
		_bgImageV.backgroundColor = [UIColor clearColor];
		_bgImageV.image= [UIImage imageNamed:@"nowifi"];//网络不给力，再试试吧
	}
	return _bgImageV;
}
//
- (UIButton *)bgWifiBtn{
	if (_bgWifiBtn==nil) {
		_bgWifiBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, selfWIDTH, selfHEIGHT)];
		_bgWifiBtn.titleLabel.font = FFont(14);
		[_bgWifiBtn setTitleColor:NavBg_COLOR forState:UIControlStateNormal];
		[_bgWifiBtn addTarget:self action:@selector(wifiBtnClick:) forControlEvents:UIControlEventTouchUpInside];
	}
	return _bgWifiBtn;
}




@end


