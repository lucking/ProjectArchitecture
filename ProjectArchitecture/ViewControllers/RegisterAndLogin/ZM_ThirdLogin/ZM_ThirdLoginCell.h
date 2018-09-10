//
//  ZM_ThirdLoginCell.h
//  ProjectArchitecture
//
//  Created by ZM on 2018/7/31.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZM_ThirdLogin.h"

@interface ZM_ThirdLoginCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property(nonatomic,strong) ZM_ThirdLogin *model;

@end
