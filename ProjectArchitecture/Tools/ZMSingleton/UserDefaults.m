//
//  UserDefaults.m
//  ZMSingleton
//
//  Created by ZM on 15/11/4.
//  Copyright © 2015年 ZM. All rights reserved.
//

#import "UserDefaults.h"
#import "NSObject+ZMAdd.h"
#define  NNSUserDefaults    [NSUserDefaults standardUserDefaults]

@interface UserDefaults ()
@property (strong, nonatomic) NSMutableDictionary *mapping;
@end


@implementation UserDefaults
//实例化
Singleton_Instance_method_Impl(UserDefaults)

// @dynamic 设置能够调用set 方法
@dynamic userId;
@dynamic userName;
@dynamic userPwd;
@dynamic userPhone;
@dynamic userEmail;
@dynamic userHeadportrait;
@dynamic userType;
@dynamic nick;
@dynamic userSignature;
@dynamic inviteCode;
@dynamic isLogin;
@dynamic tokenId;
@dynamic imgURLStr;


@dynamic userLasttime;
@dynamic userCreatetime;
@dynamic userSex;
//@dynamic netWorkStatus; 退出进程不保存

/**
 *  --------------  NNSUserDefaults --------------
 */
#pragma mark 存入本地信息: Object
+ (void)zm_setObject:(id)object forKey:(NSString*)mykey{
    [[NSUserDefaults standardUserDefaults] setObject:object forKey:mykey];
    [[NSUserDefaults standardUserDefaults] synchronize]; //同步保存数据
}
#pragma mark 读取一个本地信息: Object
+ (id)zm_getObjectForKey:(NSString *)mykey{
    return [[NSUserDefaults standardUserDefaults] objectForKey:mykey];
}

// 1.存入、读取: NSString
+ (void)zm_setNSString:(NSString *)myMessage forKey:(NSString*)mykey{
    [NNSUserDefaults setObject:myMessage forKey:mykey];
    [NNSUserDefaults synchronize];
}
+ (NSString *)zm_getNSStringForKey:(NSString *)mykey{
    return [NNSUserDefaults objectForKey:mykey];
}

// 2.存入、读取: NSInteger
+ (void)zm_setInteger:(NSInteger)myMessage forKey:(NSString*)mykey{
    [NNSUserDefaults setInteger:myMessage forKey:mykey];
    [NNSUserDefaults synchronize];
}
+ (NSInteger)zm_getIntegerForKey:(NSString *)mykey{
    return [NNSUserDefaults integerForKey:mykey];
}

// 3.存入、读取: Float
+ (void)zm_setFloat:(float)myMessage forKey:(NSString*)mykey{
    [NNSUserDefaults setFloat:myMessage forKey:mykey];
    [NNSUserDefaults synchronize];
}
+ (float)zm_getFloatForKey:(NSString *)mykey{
    return [NNSUserDefaults floatForKey:mykey];
}

// 4.存入、读取: BOOL
+ (void)zm_setBool:(BOOL)myMessage forKey:(NSString*)mykey{
    [NNSUserDefaults setBool:myMessage forKey:mykey];
    [NNSUserDefaults synchronize];
}
+ (BOOL)zm_getBoolForKey:(NSString *)mykey{
    return [NNSUserDefaults boolForKey:mykey];
}


// 5.读取NSDictionary一个key的信息
+ (id)zm_getDicStorageObject:(NSString *)dicKey dictionaryForKey:(NSString *)dicObjectKey{
    
    NSDictionary* myDic = [NNSUserDefaults dictionaryForKey:dicKey];
    id object= [myDic objectForKey:dicObjectKey];
    return object;
}
// 存入本地信息: mutArray
+ (void)zm_storageObjectMutArray:(id)myMessage forKey:(NSString*)mykey {
    //读取数据：
    NSMutableArray *mutArray= [[NSMutableArray alloc]init];
    [[NNSUserDefaults objectForKey:mykey] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [mutArray addObject:obj];
    }];
    //添加新内容
    [mutArray addObject:(NSString *)myMessage];
    [NNSUserDefaults setObject:mutArray forKey:mykey] ;
    [NNSUserDefaults synchronize];//保存数据
}

// 存入本地信息: Array
+ (void)zm_storageObjectArray:(NSArray *)myArray forKey:(NSString*)mykey{
    [NNSUserDefaults setObject:myArray forKey:mykey] ;
    [NNSUserDefaults synchronize];//保存数据
}

// 6.删除本地保存的信息: removeKey
+ (void)zm_removeObjectForKey:(NSString *)myKey{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:myKey];
}

/// 7.移除所有本类 存储在本地的属性值
- (void)zm_removeAllObject {
    
    NSInteger networkType = UUserDefaults.netWorkStatus;
    [UserDefaults zm_removeObjectForKey:@"UserInfo"];
    [[self zm_propertyNameList] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"---删除：remove_obj= %@",obj);
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:obj];
    }];
    //保留原状态
    UUserDefaults.netWorkStatus = networkType;
    [self testUserInfo];
}
//8.获取所有属性
- (void)getAllpropertyList {
    [[self zm_propertyNameList] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        //NSLog(@"---> %@ = %@ \n ",obj,[obj class]);
        //NSLog(@"---> class= %@",[obj class]);
        NSLog(@"---> %@ = %@",obj, [UserDefaults zm_getObjectForKey:obj]);
    }];
}

- (void)testUserInfo {
    NSLog(@"isLogin    = %d",UUserDefaults.isLogin);
    NSLog(@"userName   = %@",UUserDefaults.userName);
    NSLog(@"userPwd    = %@",UUserDefaults.userPwd);
    NSLog(@"userSex    = %@",UUserDefaults.userSex);
    NSLog(@"userHeadportrait   = %@",UUserDefaults.userHeadportrait);
    NSLog(@"userSignature      = %@",UUserDefaults.userSignature);
    NSLog(@"userId             = %d \n ",UUserDefaults.userId);  
}

enum TypeEncodings {
    Char                = 'c',
    Bool                = 'B',
    Short               = 's',
    Int                 = 'i',
    Long                = 'l',
    LongLong            = 'q',
    UnsignedChar        = 'C',
    UnsignedShort       = 'S',
    UnsignedInt         = 'I',
    UnsignedLong        = 'L',
    UnsignedLongLong    = 'Q',
    Float               = 'f',
    Double              = 'd',
    Object              = '@'
};


- (NSString *)defaultsKeyForPropertyNamed:(char const *)propertyName
{
    NSString *key = [NSString stringWithFormat:@"%s", propertyName];
    return [self _transformKey:key];
}

- (NSString *)defaultsKeyForSelector:(SEL)selector
{
    return [self.mapping objectForKey:NSStringFromSelector(selector)];
}

static long long longLongGetter(UserDefaults *self, SEL _cmd)
{
    NSString *key = [self defaultsKeyForSelector:_cmd];
    return [[[NSUserDefaults standardUserDefaults] objectForKey:key] longLongValue];
}

static void longLongSetter(UserDefaults *self, SEL _cmd, long long value)
{
    NSString *key = [self defaultsKeyForSelector:_cmd];
    NSNumber *object = [NSNumber numberWithLongLong:value];
    [[NSUserDefaults standardUserDefaults] setObject:object forKey:key];
}

static bool boolGetter(UserDefaults *self, SEL _cmd)
{
    NSString *key = [self defaultsKeyForSelector:_cmd];
    return [[NSUserDefaults standardUserDefaults] boolForKey:key];
}

static void boolSetter(UserDefaults *self, SEL _cmd, bool value)
{
    NSString *key = [self defaultsKeyForSelector:_cmd];
    [[NSUserDefaults standardUserDefaults] setBool:value forKey:key];
}

static int integerGetter(UserDefaults *self, SEL _cmd)
{
    NSString *key = [self defaultsKeyForSelector:_cmd];
    return (int)[[NSUserDefaults standardUserDefaults] integerForKey:key];
}

static void integerSetter(UserDefaults *self, SEL _cmd, int value)
{
    NSString *key = [self defaultsKeyForSelector:_cmd];
    [[NSUserDefaults standardUserDefaults] setInteger:value forKey:key];
}

static float floatGetter(UserDefaults *self, SEL _cmd)
{
    NSString *key = [self defaultsKeyForSelector:_cmd];
    return [[NSUserDefaults standardUserDefaults] floatForKey:key];
}

static void floatSetter(UserDefaults *self, SEL _cmd, float value)
{
    NSString *key = [self defaultsKeyForSelector:_cmd];
    [[NSUserDefaults standardUserDefaults] setFloat:value forKey:key];
}

static double doubleGetter(UserDefaults *self, SEL _cmd)
{
    NSString *key = [self defaultsKeyForSelector:_cmd];
    return [[NSUserDefaults standardUserDefaults] doubleForKey:key];
}

static void doubleSetter(UserDefaults *self, SEL _cmd, double value)
{
    NSString *key = [self defaultsKeyForSelector:_cmd];
    [[NSUserDefaults standardUserDefaults] setDouble:value forKey:key];
}

static id objectGetter(UserDefaults *self, SEL _cmd)
{
    NSString *key = [self defaultsKeyForSelector:_cmd];
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}

static void objectSetter(UserDefaults *self, SEL _cmd, id object)
{
    NSString *key = [self defaultsKeyForSelector:_cmd];
    if (object) {
        [[NSUserDefaults standardUserDefaults] setObject:object forKey:key];
    } else {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
    }
}

#pragma mark - Begin

#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wundeclared-selector"
#pragma GCC diagnostic ignored "-Warc-performSelector-leaks"

- (id)init
{
    self = [super init];
    if (self) {
        SEL setupDefaultSEL = NSSelectorFromString([NSString stringWithFormat:@"%@pDefaults", @"setu"]);
        if ([self respondsToSelector:setupDefaultSEL]) {
            NSDictionary *defaults = [self performSelector:setupDefaultSEL];
            NSMutableDictionary *mutableDefaults = [NSMutableDictionary dictionaryWithCapacity:[defaults count]];
            for (NSString *key in defaults) {
                id value = [defaults objectForKey:key];
                NSString *transformedKey = [self _transformKey:key];
                [mutableDefaults setObject:value forKey:transformedKey];
            }
            [[NSUserDefaults standardUserDefaults] registerDefaults:mutableDefaults];
        }
        
        [self generateAccessorMethods];
    }
    
    return self;
}

- (NSString *)_transformKey:(NSString *)key
{
    if ([self respondsToSelector:@selector(transformKey:)]) {
        return [self performSelector:@selector(transformKey:) withObject:key];
    }
    
    return key;
}

#pragma GCC diagnostic pop

- (void)generateAccessorMethods
{
    unsigned int count = 0;
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    
    self.mapping = [NSMutableDictionary dictionary];
    
    for (int i = 0; i < count; ++i) {
        objc_property_t property = properties[i];
        const char *name = property_getName(property);
        const char *attributes = property_getAttributes(property);
        
        char *getter = strstr(attributes, ",G");
        if (getter) {
            getter = strdup(getter + 2);
            getter = strsep(&getter, ",");
        } else {
            getter = strdup(name);
        }
        SEL getterSel = sel_registerName(getter);
        free(getter);
        
        char *setter = strstr(attributes, ",S");
        if (setter) {
            setter = strdup(setter + 2);
            setter = strsep(&setter, ",");
        } else {
            asprintf(&setter, "set%c%s:", toupper(name[0]), name + 1);
        }
        SEL setterSel = sel_registerName(setter);
        free(setter);
        
        NSString *key = [self defaultsKeyForPropertyNamed:name];
        [self.mapping setValue:key forKey:NSStringFromSelector(getterSel)];
        [self.mapping setValue:key forKey:NSStringFromSelector(setterSel)];
        
        IMP getterImp = NULL;
        IMP setterImp = NULL;
        char type = attributes[1];
        switch (type) {
            case Short:
            case Long:
            case LongLong:
            case UnsignedChar:
            case UnsignedShort:
            case UnsignedInt:
            case UnsignedLong:
            case UnsignedLongLong:
                getterImp = (IMP)longLongGetter;
                setterImp = (IMP)longLongSetter;
                break;
                
            case Bool:
            case Char:
                getterImp = (IMP)boolGetter;
                setterImp = (IMP)boolSetter;
                break;
                
            case Int:
                getterImp = (IMP)integerGetter;
                setterImp = (IMP)integerSetter;
                break;
                
            case Float:
                getterImp = (IMP)floatGetter;
                setterImp = (IMP)floatSetter;
                break;
                
            case Double:
                getterImp = (IMP)doubleGetter;
                setterImp = (IMP)doubleSetter;
                break;
                
            case Object:
                getterImp = (IMP)objectGetter;
                setterImp = (IMP)objectSetter;
                break;
                
            default:
                free(properties);
                [NSException raise:NSInternalInconsistencyException format:@"Unsupported type of property \"%s\" in class %@", name, self];
                break;
        }
        
        char types[5];
        
        snprintf(types, 4, "%c@:", type);
        class_addMethod([self class], getterSel, getterImp, types);
        
        snprintf(types, 5, "v@:%c", type);
        class_addMethod([self class], setterSel, setterImp, types);
    }
    
    free(properties);
}


@end
