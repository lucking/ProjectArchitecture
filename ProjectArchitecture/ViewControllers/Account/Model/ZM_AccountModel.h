//
//  AccountModel.h
//  ProjectArchitecture
//
//  Created by ZM on 2017/2/8.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "ZMBaseObject.h"

@class AccounTDataModel;

@interface ZM_AccountModel : ZMBaseObject
{
}
@property (nonatomic, copy) NSString*(title);
@property (nonatomic, copy) NSString*(placeholder);
@property (nonatomic, copy) NSString*(key);           // 表单对应的字段
@end



@interface AccounTDataModel : ZMBaseObject
{
}
@property (nonatomic, copy) NSString*(str1);
@property (nonatomic, copy) NSString*(str2);
@property (nonatomic, copy) NSString*(str3);
@property (nonatomic, copy) NSString*(str4);
@property (nonatomic, copy) NSString*(str5);

@property (nonatomic, copy) NSString*(str6);
@property (nonatomic, copy) NSString*(str7);
@property (nonatomic, copy) NSString*(str8);
@property (nonatomic, copy) NSString*(str9);
@property (nonatomic, copy) NSString*(str10);

@property (nonatomic, copy) NSString*(str11);
@property (nonatomic, copy) NSString*(str12);
@property (nonatomic, copy) NSString*(str13);
@property (nonatomic, copy) NSString*(str14);
@property (nonatomic, copy) NSString*(str15);

//_titleArray = @[@"姓名：",@"年龄：",@"性别：",@"家庭地址：",@"暂居地址：",@"职业："
//,@"数学：",@"语文：",@"英语：",@"物理：",@"化学：",@"生物：",@"历史：",@"政治：",@"地理："
//,@"幼儿园：",@"小学：",@"初中：",@"高中：",@"大学："];

//+ (AccounTDataModel *)formModelFromDict:(NSDictionary *)dict;
//-(BOOL)submitCheck:(NSArray*)dataArr;


@end

