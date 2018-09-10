//
//  TestBBView.h
//  ProjectArchitecture
//
//  Created by ZM on 2018/4/17.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestBBView : UIView
@property (weak, nonatomic) IBOutlet UILabel *nameLab;
@property (weak, nonatomic) IBOutlet UIImageView *iconImgView;
@property (weak, nonatomic) IBOutlet UIButton *myBtn;


+ (instancetype)appUpdateAlertView;


@end
