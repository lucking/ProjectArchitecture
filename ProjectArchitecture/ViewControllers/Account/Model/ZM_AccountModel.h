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
PProperty_String(title);
PProperty_String(placeholder);
PProperty_String(key);           // 表单对应的字段
@end



@interface AccounTDataModel : ZMBaseObject
{
}
PProperty_String(str1);
PProperty_String(str2);
PProperty_String(str3);
PProperty_String(str4);
PProperty_String(str5);

PProperty_String(str6);
PProperty_String(str7);
PProperty_String(str8);
PProperty_String(str9);
PProperty_String(str10);

PProperty_String(str11);
PProperty_String(str12);
PProperty_String(str13);
PProperty_String(str14);
PProperty_String(str15);

//_titleArray = @[@"姓名：",@"年龄：",@"性别：",@"家庭地址：",@"暂居地址：",@"职业："
//,@"数学：",@"语文：",@"英语：",@"物理：",@"化学：",@"生物：",@"历史：",@"政治：",@"地理："
//,@"幼儿园：",@"小学：",@"初中：",@"高中：",@"大学："];

//+ (AccounTDataModel *)formModelFromDict:(NSDictionary *)dict;
//-(BOOL)submitCheck:(NSArray*)dataArr;


@end

