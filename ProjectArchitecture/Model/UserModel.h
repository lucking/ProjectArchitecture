//
//  UserModel.h
//  ZMArchitecture
//
//  Created by ZM on 16/5/10.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "ZMBaseObject.h"

@interface UserModel : ZMBaseObject
{

}
PProperty_String(custId);		// 用户id
PProperty_String(custName);	// 用户名
PProperty_String(custPwd);		// 密码
PProperty_String(custPhone);	// 手机号
PProperty_String(custMail);	// 邮箱

PProperty_String(custPortriat);// 头像
PProperty_String(userType);		// 部门
PProperty_String(custGender);	// 性别
PProperty_String(custPosition);// 职位


@end
