//
//  TestAAView.h
//  ProjectArchitecture
//
//  Created by ZM on 2017/2/21.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestAAView : UIView
{
    
}
@property (nonatomic, strong) UIButton * acceptBtn;
@property (copy) void (^zmTestAAViewBlock)(NSString *msgCount);

@end
