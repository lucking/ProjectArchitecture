//
//  ZMReadProtocolView.h
//  ZM_ReadProtocol
//
//  Created by ZM on 15/10/16.
//  Copyright © 2015年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZMReadButton.h"

#pragma mark ButtonTag
typedef enum {
    ZMReadBtnTag       = 100,
    ZMProtBtnTag       = 200,
}ZMReadProtocolViewButtonTag;

//============================="  代理协议  "==============================
@class ZMReadProtocolView;

@protocol ZMReadProtocolViewDelegate <NSObject>

@optional
- (void)readProtocolView:(ZMReadProtocolView *)RPView BtnClick:(UIButton *)Btn;

@end
//=============================================================================


@interface ZMReadProtocolView : UIButton
{
    
}
/**
 *  是否阅读按钮
 */
@property(nonatomic,strong)ZMReadButton* readBtn;
/**
 *  协议按钮
 */
@property(nonatomic,strong)UIButton* protBtn;



@property(nonatomic,weak) id<ZMReadProtocolViewDelegate> delegate;

- (void)setNormalImg:(NSString*)nameA selectImg:(NSString*)nameB normalTitle:(NSString*)nameAA selectTitle:(NSString*)nameBB proTitle:(NSString*)nameCC;

@end







