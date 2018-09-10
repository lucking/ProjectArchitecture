//
//  APPUpdateAlertView.h
//  weike-cpa
//
//  Created by JET on 16/5/4.
//  Copyright © 2016年 lixd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface APPUpdateAlertView : UIView

//@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
//@property (strong, nonatomic) IBOutlet UILabel *subTitleLabel;
//@property (strong, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet UIButton *updateButton;

@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UIButton *aaaBtn;
+ (instancetype)appUpdateAlertView;
+ (instancetype)appForceUpdateAlertView;


@end
