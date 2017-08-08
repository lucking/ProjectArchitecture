//
//  PhotoCell.h
//  ZMArchitecture
//
//  Created by ZM on 16/2/25.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Photo.h"

@interface PhotoCell : UITableViewCell
{
	CGFloat myWidth;
	CGFloat myHeight;
}
@property (nonatomic,strong) UILabel* label;

@property (nonatomic, strong) Photo* photoModel;

@end
