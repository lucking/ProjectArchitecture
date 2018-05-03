//
//  KVOManager.h
//  ZM_BaseViewController
//
//  Created by ZM on 15/11/13.
//  Copyright © 2015年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KVOManager : NSObject
{

}

/*
 * 需要监测的属性
 */
@property(nonatomic,strong) UIColor *color;
@property(nonatomic,strong) UIImage *image;
@property(nonatomic,strong) UIImageView *imageView;
@property(nonatomic,copy)   NSString *title;

/**
 *  VC1
 */

@end
