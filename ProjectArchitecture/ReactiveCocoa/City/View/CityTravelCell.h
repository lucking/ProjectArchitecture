//
//  CityTravelCell.h
//  ProjectArchitecture
//
//  Created by ZM on 2017/5/24.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CityTravelCell : UITableViewCell

/**
 绑定一个viewmodel给view
 
 @param viewModel Viewmodel
 */
- (void)bindViewModel:(id)viewModel withParams:(NSDictionary *)params;

@end
