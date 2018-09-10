//
//  UserModel.h
//  ZMArchitecture
//
//  Created by ZM on 16/5/10.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "ZMBaseObject.h"
#import "MJExtension.h"

@interface UserModel : ZMBaseObject

//+ (UserModel *)singleton;
@property (nonatomic, assign) int userId;
@property (nonatomic, copy) NSString *userName; //用户名：昵称
@property (nonatomic, copy) NSString *userPassword;
@property (nonatomic, copy) NSString *userPhone;
@property (nonatomic, copy) NSString *userEmail;

@property (nonatomic, copy) NSString *userHeadportrait;
@property (nonatomic, assign) int userSex;
@property (nonatomic, copy) NSString *custPosition;


@property (nonatomic, copy) NSString *userLasttime;
@property (nonatomic, copy) NSString *userSignature; //签名
@property (nonatomic, copy) NSString *role;
@property (nonatomic, copy) NSString *inviteCode;

@property (nonatomic, copy) NSString *chatroomHost;
@property (nonatomic, copy) NSString *chatroomPort;

@end


