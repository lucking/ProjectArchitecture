//
//  ZMKeyChainTool.m
//  ZM_APP
//
//  Created by ZM on 2017/11/21.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "ZMKeyChainTool.h"

@implementation ZMKeyChainTool

- (void)test {
    //Get search dictionary：得到搜索字典
    //Delete old item before add new item：在添加新项之前删除旧项
    //Add new object to search dictionary(Attention:the data format)：向搜索字典中添加新对象(注意:数据格式)
    //Add item to keychain with the search dictionary：使用搜索字典将条目添加到keychain
    
    //Configure the search setting：配置搜索设置
    //Since in our simple case we are expecting only a single attribute to be returned (the password) we can set the attribute kSecReturnData to kCFBooleanTrue：因为在我们的简单情况下，我们只期望返回一个单一的属性(密码)，我们可以将属性k分泌数据集设置为kcf布尔true

}

+ (NSMutableDictionary *)zm_getKeychainQuery:(NSString *)service {
    return [NSMutableDictionary dictionaryWithObjectsAndKeys:
            (id)kSecClassGenericPassword,(id)kSecClass,
            service, (id)kSecAttrService,
            service, (id)kSecAttrAccount,
            (id)kSecAttrAccessibleAfterFirstUnlock,(id)kSecAttrAccessible,
            nil];
}

+ (void)zm_save:(NSString *)service data:(id)data {
    // 得到搜索字典
    NSMutableDictionary *keychainQuery = [self zm_getKeychainQuery:service];
    // 在添加新项之前删除旧项
    SecItemDelete((CFDictionaryRef)keychainQuery);
    // 向搜索字典中添加新对象(注意:数据格式)
    [keychainQuery setObject:[NSKeyedArchiver archivedDataWithRootObject:data] forKey:(id)kSecValueData];
    // 使用搜索字典将条目添加到keychain
    SecItemAdd((CFDictionaryRef)keychainQuery, NULL);
}

+ (id)zm_load:(NSString *)service {
    id ret = nil;
    NSMutableDictionary *keychainQuery = [self zm_getKeychainQuery:service];
    // 配置搜索设置
    // 因为在我们的简单情况下，我们只期望返回一个单一的属性(密码)，我们可以将属性k分泌数据集设置为kcf布尔true
    [keychainQuery setObject:(id)kCFBooleanTrue forKey:(id)kSecReturnData];
    [keychainQuery setObject:(id)kSecMatchLimitOne forKey:(id)kSecMatchLimit];
    CFDataRef keyData = NULL;
    if (SecItemCopyMatching((CFDictionaryRef)keychainQuery, (CFTypeRef *)&keyData) == noErr) {
        @try {
            ret = [NSKeyedUnarchiver unarchiveObjectWithData:(__bridge NSData *)keyData];
        } @catch (NSException *e) {
            NSLog(@"Unarchive of %@ failed: %@", service, e);
        } @finally {
        }
    }
    if (keyData)
        CFRelease(keyData);
    return ret;
}

+ (void)zm_deleteKeyData:(NSString *)service {
    NSMutableDictionary *keychainQuery = [self zm_getKeychainQuery:service];
    SecItemDelete((CFDictionaryRef)keychainQuery);
}


@end
