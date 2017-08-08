//
//  CityTravelCell.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/5/24.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "CityTravelCell.h"
#import "CityTravelItemModel.h"
#import "CityTravelViewModel.h"
#import "UIImageView+HTRoundImage.h"
#import "Traveller.h"
#import "Masonry.h"
#import "ServerURL.h"

@interface CityTravelCell ()
/**
 *  背景图
 */
@property (strong, nonatomic) UIImageView *backgroundImageView;
/**
 *  游记标题
 */
@property (strong, nonatomic) UILabel *titleLabel;
/**
 *  line
 */
@property (strong, nonatomic) UIImageView *blueLine;
/**
 *  时间
 */
@property (strong, nonatomic) UILabel *timeLabel;
/**
 *  游记地点
 */
@property (strong, nonatomic) UILabel  *placeLabel;
/**
 *  用户头像
 */
@property (strong, nonatomic) UIImageView *avatarView;
/**
 *  用户名
 */
@property (strong, nonatomic) UILabel *avatarLabel;
@end

@implementation CityTravelCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}


- (void)bindViewModel:(id)viewModel withParams:(NSDictionary *)params
{
    CityTravelViewModel *cityViewModel = viewModel;
    CityTravelItemModel *model = cityViewModel.travelData[[params[DataIndex] integerValue]];
    
    [self.backgroundImageView HT_setImageWithCornerRadius:5 imageURL:[NSURL URLWithString:model.cover_image] placeholder:@"tripdisplay_photocell_placeholder" size:CGSizeMake(SSWIDTH-20,170)];
    
    self.titleLabel.text = model.name;
    self.blueLine.image = [UIImage HT_setRadius:1 size:CGSizeMake(3, 23) borderColor:nil borderWidth:0 backgroundColor:UIColorWithRGB(80, 189, 203)];
    self.timeLabel.text = [self subTimeStringWithViewModel:model];
    self.placeLabel.text = model.popular_place_str;
    self.avatarLabel.text = [NSString stringWithFormat:@"by %@",model.user.name];
    
    [self.avatarView HT_setImageWithCornerRadius:15 imageURL:[NSURL URLWithString:model.user.avatar_m] placeholder:@"avatar_placeholder" size:CGSizeMake(30, 30)];
}


- (NSString *)subTimeStringWithViewModel:(CityTravelItemModel *)model
{
    NSString *time = [model.first_day stringByReplacingOccurrencesOfString:@"-" withString:@"."];
    NSString *viewCount = @"";
    if ([model.view_count stringValue].length > 4) {
        NSString *str1 = [[model.view_count stringValue] substringToIndex:1];
        NSRange rang = NSMakeRange(1, 1);
        NSString *str2 = [[model.view_count stringValue] substringWithRange:rang];
        NSString *str3 = [NSString stringWithFormat:@"%@.%@",str1,str2];
        viewCount = [NSString stringWithFormat:@"%@天   %@万 浏览",model.day_count,str3];
    }else{
        viewCount = [NSString stringWithFormat:@"%@天   %@ 浏览",model.day_count,model.view_count];
    }
    NSString *timeStr = [NSString stringWithFormat:@"%@   %@",time,viewCount];
    return timeStr;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.backgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.contentView.mas_top).offset(5);
        make.left.equalTo(self.contentView.mas_left).offset(10);
        make.right.equalTo(self.contentView.mas_right).offset(-10);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-5);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.backgroundImageView.mas_top).offset(15);
        make.left.equalTo(self.backgroundImageView.mas_left).offset(15);
        make.right.equalTo(self.backgroundImageView.mas_right).offset(0);
        make.height.equalTo(@25);
    }];
    [self.blueLine mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.titleLabel.mas_bottom).offset(5);
        make.left.equalTo(self.backgroundImageView.mas_left).offset(15);
        make.height.equalTo(@23);
        make.width.equalTo(@3);
    }];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.titleLabel.mas_bottom).offset(5);
        make.left.equalTo(self.blueLine.mas_right).offset(4);
        make.right.equalTo(self.backgroundImageView.mas_right).offset(0);
        make.height.equalTo(@15);
    }];
    [self.placeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.timeLabel.mas_bottom).offset(0);
        make.left.equalTo(self.blueLine.mas_right).offset(4);
        make.right.equalTo(self.backgroundImageView.mas_right).offset(0);
        make.height.equalTo(@10);
    }];
    [self.avatarView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.backgroundImageView.mas_left).offset(15);
        make.bottom.equalTo(self.backgroundImageView.mas_bottom).offset(-15);
        make.width.height.equalTo(@30);
    }];
    [self.avatarLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.avatarView.mas_right).offset(5);
        make.centerY.equalTo(self.avatarView.mas_centerY);
        make.height.equalTo(@20);
    }];
}
#pragma mark - getter
- (UIImageView *)backgroundImageView
{
    return ZM_LAZY(_backgroundImageView, ({
        
        UIImageView *view = [UIImageView new];
        [self.contentView addSubview:view];
        view;
    }));
}
- (UILabel *)titleLabel
{
    return ZM_LAZY(_titleLabel, ({
        
        UILabel *label = [UILabel new];
        label.font = FFontSetName(@"DamascusBold", 17);
        label.textColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentLeft;
        [self.backgroundImageView addSubview:label];
        label;
    }));
}
- (UIImageView *)blueLine
{
    return ZM_LAZY(_blueLine, ({
        UIImageView *view = [UIImageView new];
        [self.backgroundImageView addSubview:view];
        view;
    }));
}
- (UILabel *)timeLabel
{
    return ZM_LAZY(_timeLabel, ({
        UILabel *label = [UILabel new];
        label.font = FFontSetName(@"Damascus", 10);
        label.textColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentLeft;
        [self.backgroundImageView addSubview:label];
        label;
    }));
}
- (UILabel *)placeLabel
{
    return ZM_LAZY(_placeLabel, ({
        UILabel *label = [UILabel new];
        label.font = FFontSetName(@"DamascusLight", 8);
        label.textColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentLeft;
        [self.backgroundImageView addSubview:label];
        label;
    }));
}
- (UIImageView *)avatarView
{
    return ZM_LAZY(_avatarView, ({
        UIImageView *view = [UIImageView new];
        [self.backgroundImageView addSubview:view];
        view;
    }));
}
- (UILabel *)avatarLabel
{
    return ZM_LAZY(_avatarLabel, ({
        UILabel *label = [UILabel new];
        label.font = FFontSetName(@"DamascusLight", 10);
        label.textColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentLeft;
        [self.backgroundImageView addSubview:label];
        label;
    }));
}


@end
